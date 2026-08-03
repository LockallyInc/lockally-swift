import Foundation
import Lockally

/// Wires the ergonomics layer into the generated client via the generator's
/// `OpenAPIInterceptor` hook:
///  - `intercept`  → inject `Authorization: Bearer` (from the `TokenProvider`)
///                   and a stable `Idempotency-Key` on mutating verbs.
///  - `retry`      → exponential backoff + full jitter on network/429/5xx,
///                   honoring `Retry-After`.
///
/// The same `RequestBuilder` instance is reused across the generator's retry
/// loop, so per-request state (attempt count + the idempotency key that must stay
/// constant across retries) is keyed by its `ObjectIdentifier`.
public final class LockallyInterceptor: OpenAPIInterceptor, @unchecked Sendable {
    private let provider: TokenProvider
    private let policy: RetryPolicy

    private let lock = NSLock()
    private var attempts: [ObjectIdentifier: Int] = [:]
    private var idempotencyKeys: [ObjectIdentifier: String] = [:]

    public init(provider: TokenProvider, policy: RetryPolicy = RetryPolicy()) {
        self.provider = provider
        self.policy = policy
    }

    private static let mutatingMethods: Set<String> = ["POST", "PUT", "PATCH", "DELETE"]

    public func intercept<T>(urlRequest: URLRequest, urlSession: URLSessionProtocol, requestBuilder: RequestBuilder<T>, completion: @Sendable @escaping (Result<URLRequest, any Error>) -> Void) {
        let key = ObjectIdentifier(requestBuilder)
        var req = urlRequest

        // Stable idempotency key for mutating verbs without a caller-supplied one.
        if let method = req.httpMethod, Self.mutatingMethods.contains(method),
           req.value(forHTTPHeaderField: "Idempotency-Key") == nil {
            req.setValue(idempotencyKey(for: key), forHTTPHeaderField: "Idempotency-Key")
        }

        Task {
            do {
                let token = try await provider.token()
                req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                completion(.success(req))
            } catch {
                completion(.failure(error))
            }
        }
    }

    public func retry<T>(urlRequest: URLRequest, urlSession: URLSessionProtocol, requestBuilder: RequestBuilder<T>, data: Data?, response: URLResponse?, error: Error, completion: @Sendable @escaping (OpenAPIInterceptorRetry) -> Void) {
        let key = ObjectIdentifier(requestBuilder)
        let attempt = bumpAttempt(for: key)

        let http = response as? HTTPURLResponse
        let status = http?.statusCode
        let isNetworkError = (http == nil)

        guard policy.shouldRetry(attempt: attempt, statusCode: status, isNetworkError: isNetworkError) else {
            clear(key)
            completion(.dontRetry)
            return
        }

        let retryAfter = RetryPolicy.parseRetryAfter(http?.value(forHTTPHeaderField: "Retry-After"))
        let delay = policy.delay(forAttempt: attempt, retryAfter: retryAfter)
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
            completion(.retry)
        }
    }

    public func didComplete<T>(urlRequest: URLRequest, urlSession: URLSessionProtocol, requestBuilder: RequestBuilder<T>, data: Data?, response: URLResponse?, result: Result<T, Error>) {
        clear(ObjectIdentifier(requestBuilder))
    }

    // MARK: - per-request state

    private func idempotencyKey(for key: ObjectIdentifier) -> String {
        lock.lock(); defer { lock.unlock() }
        if let existing = idempotencyKeys[key] { return existing }
        let value = UUID().uuidString
        idempotencyKeys[key] = value
        return value
    }

    private func bumpAttempt(for key: ObjectIdentifier) -> Int {
        lock.lock(); defer { lock.unlock() }
        let next = (attempts[key] ?? 0) + 1
        attempts[key] = next
        return next
    }

    private func clear(_ key: ObjectIdentifier) {
        lock.lock(); defer { lock.unlock() }
        attempts[key] = nil
        idempotencyKeys[key] = nil
    }
}

public extension LockallyAPIConfiguration {
    /// Build a configuration wired with the ergonomics interceptor and a token
    /// provider. This is the entry point most apps use.
    static func lockally(
        provider: TokenProvider,
        basePath: String = "https://api.lockally.com",
        policy: RetryPolicy = RetryPolicy()
    ) -> LockallyAPIConfiguration {
        LockallyAPIConfiguration(
            basePath: basePath,
            interceptor: LockallyInterceptor(provider: provider, policy: policy)
        )
    }
}
