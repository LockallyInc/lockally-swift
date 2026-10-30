import Foundation
import CryptoKit

/// RFC 7636 Proof Key for Code Exchange (S256).
///
/// Mobile apps are public OAuth clients — they cannot hold a client secret — so
/// PKCE is mandatory. `PKCE.generate()` produces a high-entropy `verifier` (kept
/// on-device) and the `challenge` that is sent to `/oauth/authorize`. The server
/// verifies `SHA256(verifier) == challenge` at the token exchange, proving the
/// same app that started the flow is finishing it.
public struct PKCE: Sendable, Equatable {
    /// The secret held on-device and sent to `/oauth/token`.
    public let verifier: String
    /// `BASE64URL(SHA256(verifier))` — sent to `/oauth/authorize`.
    public let challenge: String
    /// Always `S256`; `plain` is intentionally unsupported.
    public let method = "S256"

    /// Build a pair from an existing verifier (used by tests with RFC vectors).
    public init(verifier: String) {
        self.verifier = verifier
        self.challenge = PKCE.challenge(for: verifier)
    }

    /// Generate a fresh, cryptographically-random verifier + challenge.
    public static func generate() -> PKCE {
        PKCE(verifier: randomVerifier())
    }

    /// `BASE64URL-ENCODE(SHA256(ASCII(verifier)))`, no padding.
    public static func challenge(for verifier: String) -> String {
        let digest = SHA256.hash(data: Data(verifier.utf8))
        return base64URLEncode(Data(digest))
    }

    /// 32 random bytes → 43-char base64url verifier (within the 43–128 range).
    static func randomVerifier() -> String {
        var bytes = [UInt8](repeating: 0, count: 32)
        for i in bytes.indices { bytes[i] = UInt8.random(in: 0...255) }
        return base64URLEncode(Data(bytes))
    }

    /// Base64url without padding, per RFC 7636 §A.
    static func base64URLEncode(_ data: Data) -> String {
        data.base64EncodedString()
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}
