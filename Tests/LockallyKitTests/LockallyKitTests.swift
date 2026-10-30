import XCTest
import Foundation
@testable import LockallyKit
import Lockally

final class PKCETests: XCTestCase {
    // RFC 7636 Appendix B known-answer vector.
    func testKnownVector() {
        let verifier = "dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk"
        XCTAssertEqual(PKCE.challenge(for: verifier), "E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM")
    }

    func testGenerateProducesUrlSafeVerifier() {
        let p = PKCE.generate()
        XCTAssertGreaterThanOrEqual(p.verifier.count, 43)
        XCTAssertLessThanOrEqual(p.verifier.count, 128)
        XCTAssertFalse(p.verifier.contains("+"))
        XCTAssertFalse(p.verifier.contains("/"))
        XCTAssertFalse(p.verifier.contains("="))
        XCTAssertEqual(p.challenge, PKCE.challenge(for: p.verifier))
        XCTAssertEqual(p.method, "S256")
    }
}

final class RetryPolicyTests: XCTestCase {
    let policy = RetryPolicy(maxRetries: 3, baseDelay: 0.5, maxDelay: 20)

    func testRetriesOn429And5xxAndNetwork() {
        XCTAssertTrue(policy.shouldRetry(attempt: 1, statusCode: 429, isNetworkError: false))
        XCTAssertTrue(policy.shouldRetry(attempt: 1, statusCode: 503, isNetworkError: false))
        XCTAssertTrue(policy.shouldRetry(attempt: 1, statusCode: nil, isNetworkError: true))
    }

    func testNoRetryOn4xxOr2xx() {
        XCTAssertFalse(policy.shouldRetry(attempt: 1, statusCode: 400, isNetworkError: false))
        XCTAssertFalse(policy.shouldRetry(attempt: 1, statusCode: 404, isNetworkError: false))
        XCTAssertFalse(policy.shouldRetry(attempt: 1, statusCode: 200, isNetworkError: false))
    }

    func testStopsAfterMaxRetries() {
        XCTAssertTrue(policy.shouldRetry(attempt: 3, statusCode: 500, isNetworkError: false))
        XCTAssertFalse(policy.shouldRetry(attempt: 4, statusCode: 500, isNetworkError: false))
    }

    func testBackoffCeilingGrowsAndCaps() {
        XCTAssertEqual(policy.backoffCeiling(forAttempt: 1), 0.5, accuracy: 0.0001)
        XCTAssertEqual(policy.backoffCeiling(forAttempt: 2), 1.0, accuracy: 0.0001)
        XCTAssertEqual(policy.backoffCeiling(forAttempt: 3), 2.0, accuracy: 0.0001)
        XCTAssertEqual(policy.backoffCeiling(forAttempt: 20), 20.0, accuracy: 0.0001) // capped
    }

    func testFullJitterBounds() {
        XCTAssertEqual(policy.delay(forAttempt: 3, retryAfter: nil, jitter: 0), 0, accuracy: 0.0001)
        XCTAssertEqual(policy.delay(forAttempt: 3, retryAfter: nil, jitter: 1), 2.0, accuracy: 0.0001)
    }

    func testRetryAfterWinsWhenLarger() {
        XCTAssertEqual(policy.delay(forAttempt: 1, retryAfter: 5, jitter: 0), 5, accuracy: 0.0001)
        // capped at maxDelay
        XCTAssertEqual(policy.delay(forAttempt: 1, retryAfter: 999, jitter: 0), 20, accuracy: 0.0001)
    }

    func testParseRetryAfter() {
        XCTAssertEqual(RetryPolicy.parseRetryAfter("3"), 3)
        XCTAssertNil(RetryPolicy.parseRetryAfter("Wed, 21 Oct 2099 07:28:00 GMT"))
        XCTAssertNil(RetryPolicy.parseRetryAfter(nil))
    }
}

final class ErrorTests: XCTestCase {
    func testParsesProblemJSON() {
        let body = #"{"title":"Forbidden","detail":"missing scope: messages:send","code":"insufficient_scope","request_id":"req_123"}"#
        let err = LockallyError.fromResponse(status: 403, data: Data(body.utf8), requestId: nil)
        guard case let .api(status, code, message, rid) = err else { return XCTFail("expected .api") }
        XCTAssertEqual(status, 403)
        XCTAssertEqual(code, "insufficient_scope")
        XCTAssertEqual(message, "missing scope: messages:send")
        XCTAssertEqual(rid, "req_123")
    }

    func testFallsBackWithoutBody() {
        let err = LockallyError.fromResponse(status: 500, data: nil, requestId: "req_x")
        guard case let .api(status, _, message, rid) = err else { return XCTFail("expected .api") }
        XCTAssertEqual(status, 500)
        XCTAssertEqual(message, "HTTP 500")
        XCTAssertEqual(rid, "req_x")
    }

    func testRetryableClassification() {
        XCTAssertTrue(LockallyError.api(status: 429, code: nil, message: "", requestId: nil).isRetryable)
        XCTAssertTrue(LockallyError.transport(message: "").isRetryable)
        XCTAssertFalse(LockallyError.api(status: 400, code: nil, message: "", requestId: nil).isRetryable)
    }
}

final class TokenProviderTests: XCTestCase {
    func testStaticReturnsValue() async throws {
        let p = StaticTokenProvider("lk_test_abc")
        let t = try await p.token()
        XCTAssertEqual(t, "lk_test_abc")
    }

    func testBackendParseGrantExpiresAt() throws {
        let body = #"{"token":"tok_1","expires_at":"2099-01-01T00:00:00Z"}"#
        let g = try BackendTokenProvider.parseGrant(Data(body.utf8))
        XCTAssertEqual(g.token, "tok_1")
        XCTAssertGreaterThan(g.expiresAt.timeIntervalSinceNow, 0)
    }

    func testBackendParseGrantExpiresIn() throws {
        let body = #"{"token":"tok_2","expires_in":300}"#
        let g = try BackendTokenProvider.parseGrant(Data(body.utf8))
        XCTAssertEqual(g.token, "tok_2")
        XCTAssertEqual(g.expiresAt.timeIntervalSinceNow, 300, accuracy: 5)
    }

    func testBackendCachesUntilExpiry() async throws {
        let counter = Counter()
        let p = BackendTokenProvider {
            await counter.inc()
            return .init(token: "tok_\(await counter.value)", expiresAt: Date(timeIntervalSinceNow: 3600))
        }
        let a = try await p.token()
        let b = try await p.token()
        XCTAssertEqual(a, b)
        let calls = await counter.value
        XCTAssertEqual(calls, 1, "second call should hit the cache")
    }
}

final class OAuthTests: XCTestCase {
    func testAuthorizationURLIncludesPKCE() {
        let cfg = OAuthConfig(clientID: "app_1", redirectURI: "myapp://cb", scopes: ["inboxes:read"])
        let p = OAuthPKCEProvider(config: cfg, store: InMemoryTokenStore())
        let pkce = PKCE(verifier: "dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk")
        let url = p.authorizationURL(pkce: pkce, state: "xyz")
        let items = URLComponents(url: url, resolvingAgainstBaseURL: false)!.queryItems!
        func v(_ n: String) -> String? { items.first { $0.name == n }?.value }
        XCTAssertEqual(v("response_type"), "code")
        XCTAssertEqual(v("client_id"), "app_1")
        XCTAssertEqual(v("code_challenge_method"), "S256")
        XCTAssertEqual(v("code_challenge"), pkce.challenge)
        XCTAssertEqual(v("scope"), "inboxes:read")
    }

    func testParseTokenResponse() throws {
        let body = #"{"access_token":"at","refresh_token":"rt","expires_in":1800}"#
        let r = try OAuthPKCEProvider.parseTokenResponse(Data(body.utf8))
        XCTAssertEqual(r.access, "at")
        XCTAssertEqual(r.refresh, "rt")
        XCTAssertEqual(r.expiresIn, 1800)
    }
}

final class TokenStoreTests: XCTestCase {
    func testInMemoryRoundTrip() throws {
        let s = InMemoryTokenStore()
        XCTAssertNil(try s.read("k"))
        try s.write("k", value: "v")
        XCTAssertEqual(try s.read("k"), "v")
        try s.delete("k")
        XCTAssertNil(try s.read("k"))
    }
}

final class PaginatorTests: XCTestCase {
    func testWalksAllPages() async throws {
        let pages: [Page<Int>] = [
            Page(items: [1, 2], nextCursor: "c1"),
            Page(items: [3, 4], nextCursor: "c2"),
            Page(items: [5], nextCursor: nil),
        ]
        let idx = Counter()
        let pager = Paginator<Int> { _ in
            let i = await idx.value
            await idx.inc()
            return pages[i]
        }
        let all = try await pager.collect()
        XCTAssertEqual(all, [1, 2, 3, 4, 5])
    }

    func testLoopGuard() async {
        let pager = Paginator<Int>(maxPages: 3) { _ in Page(items: [0], nextCursor: "always") }
        do {
            _ = try await pager.collect()
            XCTFail("expected loop guard to throw")
        } catch {
            // expected
        }
    }
}

// MARK: - integration: interceptor against the generated client types

final class InterceptorTests: XCTestCase {
    func testInjectsAuthAndStableIdempotencyKey() throws {
        let interceptor = LockallyInterceptor(provider: StaticTokenProvider("lk_test_key"))
        let builder = RequestBuilder<Void>(method: "POST", URLString: "https://api.lockally.com/v1/send", parameters: nil, requiresAuthentication: true)
        let base = URLRequest(url: URL(string: "https://api.lockally.com/v1/send")!)

        func run() throws -> URLRequest {
            let exp = expectation(description: "intercept")
            let out = Holder<URLRequest?>(nil)
            var req = base; req.httpMethod = "POST"
            interceptor.intercept(urlRequest: req, urlSession: URLSession.shared, requestBuilder: builder) { result in
                if case let .success(r) = result { out.value = r }
                exp.fulfill()
            }
            wait(for: [exp], timeout: 2)
            return try XCTUnwrap(out.value)
        }

        let first = try run()
        XCTAssertEqual(first.value(forHTTPHeaderField: "Authorization"), "Bearer lk_test_key")
        let key1 = try XCTUnwrap(first.value(forHTTPHeaderField: "Idempotency-Key"))
        let second = try run() // same builder → same idempotency key across the retry loop
        XCTAssertEqual(second.value(forHTTPHeaderField: "Idempotency-Key"), key1)
    }

    func testRetryDecisionHonorsPolicy() throws {
        let interceptor = LockallyInterceptor(provider: StaticTokenProvider("lk_test_key"),
                                              policy: RetryPolicy(maxRetries: 2, baseDelay: 0, maxDelay: 0))
        let builder = RequestBuilder<Void>(method: "GET", URLString: "https://api.lockally.com/v1/usage", parameters: nil, requiresAuthentication: true)
        let req = URLRequest(url: URL(string: "https://api.lockally.com/v1/usage")!)
        let resp = HTTPURLResponse(url: req.url!, statusCode: 500, httpVersion: nil, headerFields: nil)!

        func willRetry() -> Bool {
            let exp = expectation(description: "retry")
            let isRetry = Holder<Bool>(false)
            interceptor.retry(urlRequest: req, urlSession: URLSession.shared, requestBuilder: builder,
                              data: nil, response: resp, error: NSError(domain: "t", code: 1)) { d in
                if case .retry = d { isRetry.value = true }
                exp.fulfill()
            }
            wait(for: [exp], timeout: 2)
            return isRetry.value
        }

        XCTAssertTrue(willRetry(), "attempt 1 should retry")
        XCTAssertTrue(willRetry(), "attempt 2 should retry")
        XCTAssertFalse(willRetry(), "attempt 3 exceeds maxRetries → stop")
    }
}

// MARK: - test helpers

actor Counter {
    private(set) var value = 0
    func inc() { value += 1 }
}

/// Thread-safe mutable box so results can be captured out of `@Sendable` completions.
final class Holder<T>: @unchecked Sendable {
    private let lock = NSLock()
    private var _v: T
    init(_ v: T) { _v = v }
    var value: T {
        get { lock.lock(); defer { lock.unlock() }; return _v }
        set { lock.lock(); _v = newValue; lock.unlock() }
    }
}
