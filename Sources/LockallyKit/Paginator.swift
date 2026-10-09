import Foundation

/// A page of results from a cursor-paginated endpoint.
public struct Page<Item: Sendable>: Sendable {
    public let items: [Item]
    public let nextCursor: String?
    public init(items: [Item], nextCursor: String?) {
        self.items = items
        self.nextCursor = nextCursor
    }
}

/// Iterate every item across all pages of a `cursor` / `next_cursor` endpoint.
///
/// You supply a `fetch` closure that takes an optional cursor and returns a
/// `Page`; the sequence walks pages until `nextCursor` is nil. A loop guard caps
/// the number of pages so a misbehaving server can't spin forever.
public struct Paginator<Item: Sendable>: AsyncSequence, Sendable {
    public typealias Element = Item
    let fetch: @Sendable (_ cursor: String?) async throws -> Page<Item>
    let maxPages: Int

    public init(maxPages: Int = 10_000, fetch: @escaping @Sendable (_ cursor: String?) async throws -> Page<Item>) {
        self.fetch = fetch
        self.maxPages = maxPages
    }

    public func makeAsyncIterator() -> AsyncIterator {
        AsyncIterator(fetch: fetch, maxPages: maxPages)
    }

    public struct AsyncIterator: AsyncIteratorProtocol {
        let fetch: @Sendable (_ cursor: String?) async throws -> Page<Item>
        let maxPages: Int
        var buffer: [Item] = []
        var cursor: String?
        var pagesFetched = 0
        var done = false

        public mutating func next() async throws -> Item? {
            while buffer.isEmpty {
                if done { return nil }
                guard pagesFetched < maxPages else {
                    throw LockallyError.transport(message: "Paginator exceeded maxPages (\(maxPages)) — possible cursor loop")
                }
                let page = try await fetch(cursor)
                pagesFetched += 1
                buffer = page.items
                cursor = page.nextCursor
                if page.nextCursor == nil { done = true }
                if buffer.isEmpty && done { return nil }
            }
            return buffer.removeFirst()
        }
    }

    /// Collect every item into an array (convenience for small result sets).
    public func collect() async throws -> [Item] {
        var out: [Item] = []
        for try await item in self { out.append(item) }
        return out
    }
}
