<!-- lockally-brand-header -->
<p align="center">
  <a href="https://lockally.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/LockallyInc/community/main/brand/lockup-dark.png">
      <img alt="Lockally" src="https://raw.githubusercontent.com/LockallyInc/community/main/brand/lockup-light.png" width="260">
    </picture>
  </a>
</p>
<!-- /lockally-brand-header -->

# Lockally for iOS (Swift)

Official Swift SDK for the [Lockally](https://lockally.com) API — transactional
email, contacts, and agent inboxes — for iOS, macOS, tvOS, and watchOS.

- `Lockally` — the generated, fully-typed API client (async/await, URLSession).
- `LockallyKit` — the secure auth + ergonomics layer: `TokenProvider`, OAuth 2.1
  PKCE, Keychain storage, automatic retries, idempotency keys, and cursor
  pagination.

## Install

**Swift Package Manager**
```swift
.package(url: "https://github.com/lockallyinc/lockally-swift.git", from: "0.1.0")
```
**CocoaPods**
```ruby
pod 'Lockally', '~> 0.1'
```

---

## 🔐 Security: never ship a live API key in your app

A mobile app is a distributed binary — anything compiled in, including a
`lk_live_…` key, can be extracted. A leaked key with `messages:send` scope is an
open spam relay billed to you.

**Rules of thumb**
- **Sending mail (OTP, verification, notifications) and contact sync** →
  `BackendTokenProvider`. Keep the `lk_live_` key on *your* server; hand the app
  short-lived, narrowly-scoped tokens.
- **A signed-in user reading their own mail (inbox/agent)** → `OAuthPKCEProvider`.
- **`StaticTokenProvider` is for server-side / internal tools only.** It warns if
  you pass a `lk_live_` key.

---

## Quick start

```swift
import Lockally
import LockallyKit

// Recommended: your backend mints a short-lived token.
let provider = BackendTokenProvider(
    endpoint: URL(string: "https://api.yourapp.com/lockally/token")!,
    headers: ["Authorization": "Bearer \(yourUserSession)"]
)
let config = LockallyAPIConfiguration.lockally(provider: provider)
```

The returned `config` already has retries, idempotency, and auth wired in — pass
it to any generated API, e.g. `MessagesAPI`, `ContactsAPI`, `InboxesAPI`.

## Cookbook

### OTP email / user verification
Send from **your backend**, not the device. Your token endpoint returns a token
scoped to `messages:send` only; the app then triggers the send:

```swift
let api = SendAPI(apiConfiguration: config)
let body = V1SendPostRequest(
    from: "no-reply@yourapp.com",
    to: ["user@example.com"],
    templateId: "otp-code",                 // manage templates in the console
    variables: ["code": otp, "ttl": "10"]
)
// A stable Idempotency-Key is attached automatically, so a retry never
// double-sends the same code.
_ = try await api.v1SendPost(v1SendPostRequest: body)
```

### Contact syncing
Use a backend-minted token scoped to `contacts:read`/`contacts:write`, then walk
every page with the paginator:

```swift
let contactsAPI = ContactsAPI(apiConfiguration: config)
let all = try await Paginator<Contact> { cursor in
    let page = try await contactsAPI.v1ContactsGet(cursor: cursor)
    return Page(items: page.data ?? [], nextCursor: page.nextCursor)
}.collect()
```

### Push + email workflows
Register the device's APNs token with your backend; your backend decides per
event whether to push, email (via Lockally), or both. The SDK drives the email
leg — delivery orchestration stays server-side where the key lives.

### Inbox / agent (OAuth PKCE — user tokens)
The one interactive user-token flow the API issues today (`inboxes:read` /
`inboxes:write`):

```swift
let oauth = OAuthPKCEProvider(config: OAuthConfig(
    clientID: "your-registered-client-id",
    redirectURI: "yourapp://oauth/callback"
))
try await oauth.signIn(anchor: view.window!)          // opens the system browser
let inboxCfg = LockallyAPIConfiguration.lockally(provider: oauth)
let inbox = InboxesAPI(apiConfiguration: inboxCfg)
```

## Errors

Failures surface as `LockallyError` with `status` / `code` / `message` /
`requestId` parsed from the API's `problem+json`, so you can branch without
string-matching and log `requestId` for support.

## License

MIT — see [LICENSE](./LICENSE).
