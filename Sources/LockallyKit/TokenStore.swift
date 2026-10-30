import Foundation

/// Where OAuth refresh tokens are persisted between launches.
public protocol TokenStore: Sendable {
    func read(_ key: String) throws -> String?
    func write(_ key: String, value: String) throws
    func delete(_ key: String) throws
}

/// Non-persistent store — the default for tests and for `BackendTokenProvider`
/// (which keeps everything in memory anyway).
public final class InMemoryTokenStore: TokenStore, @unchecked Sendable {
    private let lock = NSLock()
    private var storage: [String: String] = [:]

    public init() {}

    public func read(_ key: String) throws -> String? {
        lock.lock(); defer { lock.unlock() }
        return storage[key]
    }
    public func write(_ key: String, value: String) throws {
        lock.lock(); defer { lock.unlock() }
        storage[key] = value
    }
    public func delete(_ key: String) throws {
        lock.lock(); defer { lock.unlock() }
        storage[key] = nil
    }
}

#if canImport(Security)
import Security

/// Keychain-backed store — the recommended production store for refresh tokens.
/// Items are written with `kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly`
/// so they never sync to iCloud or leave the device.
public final class KeychainTokenStore: TokenStore, @unchecked Sendable {
    private let service: String

    public init(service: String = "com.lockally.sdk") {
        self.service = service
    }

    private func query(_ account: String) -> [String: Any] {
        [kSecClass as String: kSecClassGenericPassword,
         kSecAttrService as String: service,
         kSecAttrAccount as String: account]
    }

    public func read(_ key: String) throws -> String? {
        var q = query(key)
        q[kSecReturnData as String] = true
        q[kSecMatchLimit as String] = kSecMatchLimitOne
        var out: CFTypeRef?
        let status = SecItemCopyMatching(q as CFDictionary, &out)
        if status == errSecItemNotFound { return nil }
        guard status == errSecSuccess, let data = out as? Data else {
            throw LockallyError.transport(message: "Keychain read failed (\(status))")
        }
        return String(data: data, encoding: .utf8)
    }

    public func write(_ key: String, value: String) throws {
        try? delete(key)
        var q = query(key)
        q[kSecValueData as String] = Data(value.utf8)
        q[kSecAttrAccessible as String] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
        let status = SecItemAdd(q as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw LockallyError.transport(message: "Keychain write failed (\(status))")
        }
    }

    public func delete(_ key: String) throws {
        let status = SecItemDelete(query(key) as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw LockallyError.transport(message: "Keychain delete failed (\(status))")
        }
    }
}
#endif
