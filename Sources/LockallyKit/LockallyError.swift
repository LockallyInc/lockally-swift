import Foundation

/// A typed error surfaced by the ergonomics layer.
///
/// The Lockally API returns RFC 7807 `application/problem+json` on failures.
/// `LockallyError.api` carries the parsed fields so callers can branch on
/// `status` / `code` without string-matching, and log `requestId` for support.
public enum LockallyError: Error, Sendable, Equatable {
    /// A structured API error (non-2xx with a problem+json body).
    case api(status: Int, code: String?, message: String, requestId: String?)
    /// A transport failure (no HTTP response): DNS, timeout, offline, TLS.
    case transport(message: String)
    /// Retries were exhausted; `last` is the final underlying error.
    indirect case retriesExhausted(attempts: Int, last: LockallyError)

    public var isRetryable: Bool {
        switch self {
        case let .api(status, _, _, _): return status == 429 || (500...599).contains(status)
        case .transport: return true
        case .retriesExhausted: return false
        }
    }

    /// Parse a problem+json body (falls back to a generic message).
    public static func fromResponse(status: Int, data: Data?, requestId: String?) -> LockallyError {
        guard let data, !data.isEmpty,
              let obj = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return .api(status: status, code: nil, message: "HTTP \(status)", requestId: requestId)
        }
        // RFC 7807: `title`/`detail`/`type`; Lockally also sets `code` + `request_id`.
        let message = (obj["detail"] as? String)
            ?? (obj["title"] as? String)
            ?? "HTTP \(status)"
        let code = (obj["code"] as? String) ?? (obj["type"] as? String)
        let rid = requestId ?? (obj["request_id"] as? String)
        return .api(status: status, code: code, message: message, requestId: rid)
    }
}
