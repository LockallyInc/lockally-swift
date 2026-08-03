import Foundation

/// Pure retry/backoff decisions — no timing, no I/O, so it unit-tests cleanly.
///
/// Same behavior as the other Lockally SDKs: retry network errors, `429`, and
/// `5xx` with exponential backoff + full jitter, honoring `Retry-After`.
public struct RetryPolicy: Sendable {
    public let maxRetries: Int
    public let baseDelay: TimeInterval
    public let maxDelay: TimeInterval

    public init(maxRetries: Int = 3, baseDelay: TimeInterval = 0.5, maxDelay: TimeInterval = 20) {
        self.maxRetries = maxRetries
        self.baseDelay = baseDelay
        self.maxDelay = maxDelay
    }

    /// Whether a request that produced this outcome should be retried.
    /// `attempt` is 1-based (1 = the first try that just failed).
    public func shouldRetry(attempt: Int, statusCode: Int?, isNetworkError: Bool) -> Bool {
        guard attempt <= maxRetries else { return false }
        if isNetworkError { return true }
        guard let statusCode else { return false }
        return statusCode == 429 || (500...599).contains(statusCode)
    }

    /// Deterministic exponential ceiling for a given attempt (before jitter):
    /// `min(maxDelay, baseDelay * 2^(attempt-1))`.
    public func backoffCeiling(forAttempt attempt: Int) -> TimeInterval {
        let exp = pow(2.0, Double(max(0, attempt - 1)))
        return min(maxDelay, baseDelay * exp)
    }

    /// Final delay to wait. Honors `Retry-After` (seconds) when present and
    /// larger; otherwise applies full jitter in `[0, ceiling]`.
    /// `jitter` is injectable (0…1) so tests are deterministic.
    public func delay(forAttempt attempt: Int, retryAfter: TimeInterval? = nil, jitter: Double = Double.random(in: 0...1)) -> TimeInterval {
        let ceiling = backoffCeiling(forAttempt: attempt)
        let jittered = ceiling * min(1, max(0, jitter))
        if let retryAfter, retryAfter > jittered {
            return min(maxDelay, retryAfter)
        }
        return jittered
    }

    /// Parse a `Retry-After` header value (delta-seconds only; HTTP-date ignored).
    public static func parseRetryAfter(_ value: String?) -> TimeInterval? {
        guard let value, let seconds = TimeInterval(value.trimmingCharacters(in: .whitespaces)) else { return nil }
        return seconds >= 0 ? seconds : nil
    }
}
