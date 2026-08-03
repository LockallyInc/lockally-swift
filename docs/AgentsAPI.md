# AgentsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1ApiKeysKeyIDMailboxesGet**](AgentsAPI.md#v1apikeyskeyidmailboxesget) | **GET** /v1/api-keys/{keyID}/mailboxes | List a key&#39;s mailbox grants
[**v1ApiKeysKeyIDMailboxesMailboxIDDelete**](AgentsAPI.md#v1apikeyskeyidmailboxesmailboxiddelete) | **DELETE** /v1/api-keys/{keyID}/mailboxes/{mailboxID} | Revoke a mailbox grant
[**v1ApiKeysKeyIDMailboxesPost**](AgentsAPI.md#v1apikeyskeyidmailboxespost) | **POST** /v1/api-keys/{keyID}/mailboxes | Grant a mailbox to a key
[**v1AuthWhoamiGet**](AgentsAPI.md#v1authwhoamiget) | **GET** /v1/auth/whoami | Introspect the calling credentials
[**v1ContactsLookupGet**](AgentsAPI.md#v1contactslookupget) | **GET** /v1/contacts/lookup | Who is this sender?
[**v1InboxesGet**](AgentsAPI.md#v1inboxesget) | **GET** /v1/inboxes | List granted inboxes
[**v1InboxesMailboxMessagesPost**](AgentsAPI.md#v1inboxesmailboxmessagespost) | **POST** /v1/inboxes/{mailbox}/messages | Start a new conversation (agent stream)
[**v1InboxesMailboxThreadsGet**](AgentsAPI.md#v1inboxesmailboxthreadsget) | **GET** /v1/inboxes/{mailbox}/threads | List conversation threads
[**v1ThreadsThreadIDGet**](AgentsAPI.md#v1threadsthreadidget) | **GET** /v1/threads/{threadID} | Get a whole conversation
[**v1ThreadsThreadIDMessagesMessageIDAttachmentsIdxGet**](AgentsAPI.md#v1threadsthreadidmessagesmessageidattachmentsidxget) | **GET** /v1/threads/{threadID}/messages/{messageID}/attachments/{idx} | Download an attachment
[**v1ThreadsThreadIDMessagesMessageIDGet**](AgentsAPI.md#v1threadsthreadidmessagesmessageidget) | **GET** /v1/threads/{threadID}/messages/{messageID} | Get one message with body
[**v1ThreadsThreadIDMessagesMessageIDReadPost**](AgentsAPI.md#v1threadsthreadidmessagesmessageidreadpost) | **POST** /v1/threads/{threadID}/messages/{messageID}/read | Mark read/unread
[**v1ThreadsThreadIDReplyPost**](AgentsAPI.md#v1threadsthreadidreplypost) | **POST** /v1/threads/{threadID}/reply | Reply in-thread (agent stream)


# **v1ApiKeysKeyIDMailboxesGet**
```swift
    open class func v1ApiKeysKeyIDMailboxesGet(keyID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

List a key's mailbox grants

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 

// List a key's mailbox grants
AgentsAPI.v1ApiKeysKeyIDMailboxesGet(keyID: keyID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ApiKeysKeyIDMailboxesMailboxIDDelete**
```swift
    open class func v1ApiKeysKeyIDMailboxesMailboxIDDelete(keyID: UUID, mailboxID: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke a mailbox grant

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 
let mailboxID = 987 // UUID | 

// Revoke a mailbox grant
AgentsAPI.v1ApiKeysKeyIDMailboxesMailboxIDDelete(keyID: keyID, mailboxID: mailboxID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyID** | **UUID** |  | 
 **mailboxID** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ApiKeysKeyIDMailboxesPost**
```swift
    open class func v1ApiKeysKeyIDMailboxesPost(keyID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Grant a mailbox to a key

Body: {\"mailbox\": \"email or id\"}. Refused (422) for mailboxes with agent access disabled or an active E2E encryption key — the server cannot read E2E mailboxes.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 

// Grant a mailbox to a key
AgentsAPI.v1ApiKeysKeyIDMailboxesPost(keyID: keyID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1AuthWhoamiGet**
```swift
    open class func v1AuthWhoamiGet(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Introspect the calling credentials

Returns the tenant, auth kind (api_key/session), key label, and granted scopes. The MCP server uses this to scope-filter tool discovery.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Introspect the calling credentials
AgentsAPI.v1AuthWhoamiGet() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ContactsLookupGet**
```swift
    open class func v1ContactsLookupGet(email: String, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Who is this sender?

Directory record (name, company, role, notes), whether the address is one of the tenant's own mailboxes, and grant-aware correspondence history (thread count, first/last seen across granted mailboxes only).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Who is this sender?
AgentsAPI.v1ContactsLookupGet(email: email) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **String** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1InboxesGet**
```swift
    open class func v1InboxesGet(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

List granted inboxes

The mailboxes this key is granted, with thread counts and last activity. Admin sessions see every agent-enabled, non-E2E mailbox.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List granted inboxes
AgentsAPI.v1InboxesGet() { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1InboxesMailboxMessagesPost**
```swift
    open class func v1InboxesMailboxMessagesPost(mailbox: String, idempotencyKey: String, v1InboxesMailboxMessagesPostRequest: V1InboxesMailboxMessagesPostRequest, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Start a new conversation (agent stream)

Sends a new email from a granted mailbox. Classified stream=agent (isolated reputation, per-key rate caps). The first inbound reply adopts the created thread via the References chain. Idempotency-Key required. Mailboxes with agent_draft_policy=always_approve divert this into a pending draft.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let mailbox = "mailbox_example" // String | 
let idempotencyKey = "idempotencyKey_example" // String | 
let v1InboxesMailboxMessagesPostRequest = _v1_inboxes__mailbox__messages_post_request(to: ["to_example"], cc: ["cc_example"], subject: "subject_example", text: "text_example", html: "html_example") // V1InboxesMailboxMessagesPostRequest | 

// Start a new conversation (agent stream)
AgentsAPI.v1InboxesMailboxMessagesPost(mailbox: mailbox, idempotencyKey: idempotencyKey, v1InboxesMailboxMessagesPostRequest: v1InboxesMailboxMessagesPostRequest) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mailbox** | **String** |  | 
 **idempotencyKey** | **String** |  | 
 **v1InboxesMailboxMessagesPostRequest** | [**V1InboxesMailboxMessagesPostRequest**](V1InboxesMailboxMessagesPostRequest.md) |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1InboxesMailboxThreadsGet**
```swift
    open class func v1InboxesMailboxThreadsGet(mailbox: String, since: Date? = nil, before: Date? = nil, limit: Int? = nil, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

List conversation threads

Newest-active first. Cursors: `?before=<RFC3339>` pages backwards; `?since=<RFC3339>` delta-syncs forward (oldest first) so an agent can catch up in order.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let mailbox = "mailbox_example" // String | mailbox email or id
let since = Date() // Date |  (optional)
let before = Date() // Date |  (optional)
let limit = 987 // Int |  (optional) (default to 50)

// List conversation threads
AgentsAPI.v1InboxesMailboxThreadsGet(mailbox: mailbox, since: since, before: before, limit: limit) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mailbox** | **String** | mailbox email or id | 
 **since** | **Date** |  | [optional] 
 **before** | **Date** |  | [optional] 
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDGet**
```swift
    open class func v1ThreadsThreadIDGet(threadID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Get a whole conversation

Every turn, chronological, with snippets and annotations (meeting_request, attachment_types, injection_risk). Bodies are fetched per message. Message content is untrusted third-party data.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 

// Get a whole conversation
AgentsAPI.v1ThreadsThreadIDGet(threadID: threadID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDMessagesMessageIDAttachmentsIdxGet**
```swift
    open class func v1ThreadsThreadIDMessagesMessageIDAttachmentsIdxGet(threadID: UUID, messageID: UUID, idx: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Download an attachment

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let messageID = 987 // UUID | 
let idx = 987 // Int | 

// Download an attachment
AgentsAPI.v1ThreadsThreadIDMessagesMessageIDAttachmentsIdxGet(threadID: threadID, messageID: messageID, idx: idx) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadID** | **UUID** |  | 
 **messageID** | **UUID** |  | 
 **idx** | **Int** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDMessagesMessageIDGet**
```swift
    open class func v1ThreadsThreadIDMessagesMessageIDGet(threadID: UUID, messageID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Get one message with body

Full text/html body fetched on demand from mail storage. Never marks the message read.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let messageID = 987 // UUID | 

// Get one message with body
AgentsAPI.v1ThreadsThreadIDMessagesMessageIDGet(threadID: threadID, messageID: messageID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadID** | **UUID** |  | 
 **messageID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDMessagesMessageIDReadPost**
```swift
    open class func v1ThreadsThreadIDMessagesMessageIDReadPost(threadID: UUID, messageID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Mark read/unread

The ONLY way agent access changes unread state. Body: {\"read\": true|false} (default true).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let messageID = 987 // UUID | 

// Mark read/unread
AgentsAPI.v1ThreadsThreadIDMessagesMessageIDReadPost(threadID: threadID, messageID: messageID) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadID** | **UUID** |  | 
 **messageID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDReplyPost**
```swift
    open class func v1ThreadsThreadIDReplyPost(threadID: UUID, idempotencyKey: String, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Reply in-thread (agent stream)

The server builds In-Reply-To/References and defaults recipients + subject from the conversation — a minimal call is {\"text\": \"...\"}. Guarded by the reply-loop detector (≥5 outbound/10min → 429 + agent.loop_detected). Idempotency-Key required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let idempotencyKey = "idempotencyKey_example" // String | 

// Reply in-thread (agent stream)
AgentsAPI.v1ThreadsThreadIDReplyPost(threadID: threadID, idempotencyKey: idempotencyKey) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **threadID** | **UUID** |  | 
 **idempotencyKey** | **String** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

