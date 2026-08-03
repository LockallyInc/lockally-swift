import Foundation

/// Supplies the bearer credential for each request. Made async so it can refresh
/// an expiring token (OAuth) or fetch a fresh short-lived one from your backend
/// without blocking the caller.
///
/// ## Choosing an implementation
/// - **Sending mail / OTP / verification / contacts** → `BackendTokenProvider`.
///   The `messages:send` and `contacts:*` scopes must never live in a shipped
///   binary; mint a short-lived, narrowly-scoped token on your server instead.
/// - **Inbox / agent flows (a signed-in user reading their own mail)** →
///   `OAuthPKCEProvider` (the only user-token flow the API issues today:
///   `inboxes:read` / `inboxes:write`).
/// - **Server-side / internal tools only** → `StaticTokenProvider`.
public protocol TokenProvider: Sendable {
    /// Return a valid bearer token, refreshing if needed.
    func token() async throws -> String
}

/// A fixed key. **Do not embed a `lk_live_*` key in a distributed app** — it is
/// trivially extracted from the binary. Allowed for server-side/internal use and
/// for `lk_test_*` keys; emits a one-time warning otherwise.
public final class StaticTokenProvider: TokenProvider, @unchecked Sendable {
    private let value: String
    private static let warned = WarnOnce()

    public init(_ token: String) {
        self.value = token
        if token.hasPrefix("lk_live_") {
            Self.warned.warn("""
            [Lockally] A live API key was passed to StaticTokenProvider. If this \
            code runs inside a distributed mobile app, the key is extractable and \
            can be abused. Use BackendTokenProvider (backend-minted short-lived \
            token) or OAuthPKCEProvider instead. See the SDK README security note.
            """)
        }
    }

    public func token() async throws -> String { value }
}

/// The recommended provider for send/OTP/verification/contacts.
///
/// Calls **your** backend, which authenticates the user/session however it likes
/// and returns a short-lived, narrowly-scoped Lockally token. The token is cached
/// until shortly before `expires_at`, then re-fetched. The `lk_live_` key stays
/// on your server and never touches the device.
///
/// Your endpoint must return JSON: `{ "token": "...", "expires_at": "<RFC3339>" }`
/// (or `{ "token": "...", "expires_in": <seconds> }`).
public final class BackendTokenProvider: TokenProvider, @unchecked Sendable {
    public struct Grant: Sendable {
        public let token: String
        public let expiresAt: Date
    }

    private let fetch: @Sendable () async throws -> Grant
    private let skew: TimeInterval
    private let lock = NSLock()
    private var cached: Grant?

    /// Provide a custom fetch (e.g. to attach your own session cookie/header).
    public init(skew: TimeInterval = 30, fetch: @escaping @Sendable () async throws -> Grant) {
        self.fetch = fetch
        self.skew = skew
    }

    /// Convenience: GET/POST a URL on your backend that returns the grant JSON.
    public convenience init(endpoint: URL, method: String = "POST", headers: [String: String] = [:], session: URLSession = .shared, skew: TimeInterval = 30) {
        self.init(skew: skew) {
            var req = URLRequest(url: endpoint)
            req.httpMethod = method
            for (k, v) in headers { req.setValue(v, forHTTPHeaderField: k) }
            let (data, resp) = try await session.data(for: req)
            guard let http = resp as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
                throw LockallyError.transport(message: "Backend token endpoint returned a non-2xx response")
            }
            return try Self.parseGrant(data)
        }
    }

    public func token() async throws -> String {
        if let c = current(), c.expiresAt.timeIntervalSinceNow > skew {
            return c.token
        }
        let grant = try await fetch()
        setCached(grant)
        return grant.token
    }

    private func current() -> Grant? {
        lock.lock(); defer { lock.unlock() }
        return cached
    }

    private func setCached(_ grant: Grant) {
        lock.lock(); defer { lock.unlock() }
        cached = grant
    }

    static func parseGrant(_ data: Data) throws -> Grant {
        guard let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let token = obj["token"] as? String else {
            throw LockallyError.transport(message: "Backend token response missing 'token'")
        }
        if let iso = obj["expires_at"] as? String,
           let date = ISO8601DateFormatter().date(from: iso) {
            return Grant(token: token, expiresAt: date)
        }
        if let secs = obj["expires_in"] as? Double {
            return Grant(token: token, expiresAt: Date(timeIntervalSinceNow: secs))
        }
        // No expiry hint → treat as short-lived (60s) to force periodic refresh.
        return Grant(token: token, expiresAt: Date(timeIntervalSinceNow: 60))
    }
}

/// Emits a warning message at most once per process.
final class WarnOnce: @unchecked Sendable {
    private let lock = NSLock()
    private var done = false
    func warn(_ message: String) {
        lock.lock(); defer { lock.unlock() }
        guard !done else { return }
        done = true
        FileHandle.standardError.write(Data((message + "\n").utf8))
    }
}
