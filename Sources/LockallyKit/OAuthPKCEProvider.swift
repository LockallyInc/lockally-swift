import Foundation

/// OAuth 2.1 authorization-code + PKCE for a signed-in *user*.
///
/// This is the mobile-correct interactive flow. It opens the system browser
/// (`ASWebAuthenticationSession`), exchanges the returned code at `/oauth/token`,
/// persists the refresh token in a `TokenStore` (Keychain by default), and hands
/// out fresh access tokens — refreshing transparently.
///
/// The Lockally server currently issues user tokens only for the inbox/agent
/// surface (`inboxes:read` / `inboxes:write`). For sending mail or syncing
/// contacts, use `BackendTokenProvider` instead.
public struct OAuthConfig: Sendable {
    public var authorizationEndpoint: URL
    public var tokenEndpoint: URL
    public var clientID: String
    public var redirectURI: String
    public var scopes: [String]

    public init(
        authorizationEndpoint: URL = URL(string: "https://api.lockally.com/oauth/authorize")!,
        tokenEndpoint: URL = URL(string: "https://api.lockally.com/oauth/token")!,
        clientID: String,
        redirectURI: String,
        scopes: [String] = ["inboxes:read", "inboxes:write"]
    ) {
        self.authorizationEndpoint = authorizationEndpoint
        self.tokenEndpoint = tokenEndpoint
        self.clientID = clientID
        self.redirectURI = redirectURI
        self.scopes = scopes
    }
}

public final class OAuthPKCEProvider: TokenProvider, @unchecked Sendable {
    private let config: OAuthConfig
    private let store: TokenStore
    private let session: URLSession
    private let lock = NSLock()
    private var accessToken: String?
    private var accessExpiry: Date?

    private var refreshKey: String { "oauth.refresh.\(config.clientID)" }

    public init(config: OAuthConfig, store: TokenStore = defaultStore(), session: URLSession = .shared) {
        self.config = config
        self.store = store
        self.session = session
    }

    public static func defaultStore() -> TokenStore {
        #if canImport(Security)
        return KeychainTokenStore()
        #else
        return InMemoryTokenStore()
        #endif
    }

    /// Build the `/oauth/authorize` URL for a fresh PKCE pair.
    func authorizationURL(pkce: PKCE, state: String) -> URL {
        var comps = URLComponents(url: config.authorizationEndpoint, resolvingAgainstBaseURL: false)!
        comps.queryItems = [
            .init(name: "response_type", value: "code"),
            .init(name: "client_id", value: config.clientID),
            .init(name: "redirect_uri", value: config.redirectURI),
            .init(name: "scope", value: config.scopes.joined(separator: " ")),
            .init(name: "state", value: state),
            .init(name: "code_challenge", value: pkce.challenge),
            .init(name: "code_challenge_method", value: pkce.method),
        ]
        return comps.url!
    }

    // MARK: TokenProvider

    public func token() async throws -> String {
        if let t = validAccess() { return t }
        if let refresh = try store.read(refreshKey) {
            return try await refreshAccess(using: refresh)
        }
        throw LockallyError.transport(message: "Not signed in — call signIn(...) first.")
    }

    private func validAccess() -> String? {
        lock.lock(); defer { lock.unlock() }
        if let t = accessToken, let e = accessExpiry, e.timeIntervalSinceNow > 30 { return t }
        return nil
    }

    private func setAccess(_ token: String, expiresIn: TimeInterval) {
        lock.lock(); defer { lock.unlock() }
        accessToken = token
        accessExpiry = Date(timeIntervalSinceNow: expiresIn)
    }

    /// Exchange an authorization code (from the browser redirect) for tokens.
    public func exchange(code: String, verifier: String) async throws {
        var req = URLRequest(url: config.tokenEndpoint)
        req.httpMethod = "POST"
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.httpBody = form([
            "grant_type": "authorization_code",
            "code": code,
            "redirect_uri": config.redirectURI,
            "client_id": config.clientID,
            "code_verifier": verifier,
        ])
        try await consume(req)
    }

    private func refreshAccess(using refresh: String) async throws -> String {
        var req = URLRequest(url: config.tokenEndpoint)
        req.httpMethod = "POST"
        req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        req.httpBody = form([
            "grant_type": "refresh_token",
            "refresh_token": refresh,
            "client_id": config.clientID,
        ])
        return try await consume(req)
    }

    @discardableResult
    private func consume(_ req: URLRequest) async throws -> String {
        let (data, resp) = try await session.data(for: req)
        guard let http = resp as? HTTPURLResponse, (200...299).contains(http.statusCode) else {
            let status = (resp as? HTTPURLResponse)?.statusCode ?? -1
            throw LockallyError.fromResponse(status: status, data: data, requestId: nil)
        }
        let parsed = try Self.parseTokenResponse(data)
        setAccess(parsed.access, expiresIn: parsed.expiresIn)
        if let refresh = parsed.refresh {
            try? store.write(refreshKey, value: refresh)
        }
        return parsed.access
    }

    /// Forget the persisted refresh token (sign-out).
    public func signOut() throws {
        lock.lock(); accessToken = nil; accessExpiry = nil; lock.unlock()
        try store.delete(refreshKey)
    }

    struct TokenResponse { let access: String; let refresh: String?; let expiresIn: TimeInterval }

    static func parseTokenResponse(_ data: Data) throws -> TokenResponse {
        guard let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let access = obj["access_token"] as? String else {
            throw LockallyError.transport(message: "Token response missing 'access_token'")
        }
        let refresh = obj["refresh_token"] as? String
        let expiresIn = (obj["expires_in"] as? Double) ?? 3600
        return TokenResponse(access: access, refresh: refresh, expiresIn: expiresIn)
    }

    private func form(_ fields: [String: String]) -> Data {
        var comps = URLComponents()
        comps.queryItems = fields.map { URLQueryItem(name: $0.key, value: $0.value) }
        return Data((comps.percentEncodedQuery ?? "").utf8)
    }
}

// Interactive sign-in relies on ASWebAuthenticationSession's presentation-context
// APIs (ASPresentationAnchor / presentationContextProvider / prefersEphemeral),
// which exist only on iOS, macOS and Mac Catalyst — NOT tvOS or watchOS (where
// `canImport(AuthenticationServices)` is still true, so that guard doesn't
// exclude them and CocoaPods lint fails). The rest of the SDK stays cross-platform.
#if os(iOS) || os(macOS) || targetEnvironment(macCatalyst)
import AuthenticationServices

public extension OAuthPKCEProvider {
    /// Run the full interactive sign-in: open the system browser, capture the
    /// redirect, and exchange the code. `anchor` is the window to present from.
    @MainActor
    func signIn(anchor: ASPresentationAnchor) async throws {
        let pkce = PKCE.generate()
        let state = PKCE.randomVerifier()
        let url = authorizationURL(pkce: pkce, state: state)
        let scheme = URL(string: config.redirectURI)?.scheme

        let code: String = try await withCheckedThrowingContinuation { cont in
            let anchorProvider = AnchorProvider(anchor: anchor)
            let session = ASWebAuthenticationSession(url: url, callbackURLScheme: scheme) { callbackURL, error in
                if let error {
                    cont.resume(throwing: LockallyError.transport(message: "Sign-in cancelled: \(error.localizedDescription)"))
                    return
                }
                guard let callbackURL,
                      let items = URLComponents(url: callbackURL, resolvingAgainstBaseURL: false)?.queryItems,
                      let code = items.first(where: { $0.name == "code" })?.value else {
                    cont.resume(throwing: LockallyError.transport(message: "No authorization code in redirect"))
                    return
                }
                if items.first(where: { $0.name == "state" })?.value != state {
                    cont.resume(throwing: LockallyError.transport(message: "OAuth state mismatch"))
                    return
                }
                cont.resume(returning: code)
            }
            session.presentationContextProvider = anchorProvider
            session.prefersEphemeralWebBrowserSession = false
            _ = anchorProvider // retained by the session's delegate ref below
            session.start()
        }
        try await exchange(code: code, verifier: pkce.verifier)
    }
}

private final class AnchorProvider: NSObject, ASWebAuthenticationPresentationContextProviding {
    let anchor: ASPresentationAnchor
    init(anchor: ASPresentationAnchor) { self.anchor = anchor }
    func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor { anchor }
}
#endif
