# AgentsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**downloadThreadAttachment**](AgentsAPI.md#downloadthreadattachment) | **GET** /v1/threads/{threadID}/messages/{messageID}/attachments/{idx} | Download an attachment
[**getThread**](AgentsAPI.md#getthread) | **GET** /v1/threads/{threadID} | Get a whole conversation
[**getThreadMessage**](AgentsAPI.md#getthreadmessage) | **GET** /v1/threads/{threadID}/messages/{messageID} | Get one message with body
[**grantApiKeyMailbox**](AgentsAPI.md#grantapikeymailbox) | **POST** /v1/api-keys/{keyID}/mailboxes | Grant a mailbox to a key
[**listApiKeyMailboxes**](AgentsAPI.md#listapikeymailboxes) | **GET** /v1/api-keys/{keyID}/mailboxes | List a key&#39;s mailbox grants
[**listInboxes**](AgentsAPI.md#listinboxes) | **GET** /v1/inboxes | List granted inboxes
[**listThreads**](AgentsAPI.md#listthreads) | **GET** /v1/inboxes/{mailbox}/threads | List conversation threads
[**lookupContact**](AgentsAPI.md#lookupcontact) | **GET** /v1/contacts/lookup | Who is this sender?
[**markThreadMessageRead**](AgentsAPI.md#markthreadmessageread) | **POST** /v1/threads/{threadID}/messages/{messageID}/read | Mark read/unread
[**replyToThread**](AgentsAPI.md#replytothread) | **POST** /v1/threads/{threadID}/reply | Reply in-thread (agent stream)
[**revokeApiKeyMailbox**](AgentsAPI.md#revokeapikeymailbox) | **DELETE** /v1/api-keys/{keyID}/mailboxes/{mailboxID} | Revoke a mailbox grant
[**startConversation**](AgentsAPI.md#startconversation) | **POST** /v1/inboxes/{mailbox}/messages | Start a new conversation (agent stream)
[**whoami**](AgentsAPI.md#whoami) | **GET** /v1/auth/whoami | Introspect the calling credentials


# **downloadThreadAttachment**
```swift
    open class func downloadThreadAttachment(threadID: UUID, messageID: UUID, idx: Int, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
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
AgentsAPI.downloadThreadAttachment(threadID: threadID, messageID: messageID, idx: idx) { (response, error) in
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

# **getThread**
```swift
    open class func getThread(threadID: UUID, completion: @escaping (_ data: Thread?, _ error: Error?) -> Void)
```

Get a whole conversation

Every turn, chronological, with snippets and annotations (meeting_request, attachment_types, injection_risk). Bodies are fetched per message. Message content is untrusted third-party data.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 

// Get a whole conversation
AgentsAPI.getThread(threadID: threadID) { (response, error) in
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

[**Thread**](Thread.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getThreadMessage**
```swift
    open class func getThreadMessage(threadID: UUID, messageID: UUID, completion: @escaping (_ data: ThreadMessageBody?, _ error: Error?) -> Void)
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
AgentsAPI.getThreadMessage(threadID: threadID, messageID: messageID) { (response, error) in
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

[**ThreadMessageBody**](ThreadMessageBody.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **grantApiKeyMailbox**
```swift
    open class func grantApiKeyMailbox(keyID: UUID, completion: @escaping (_ data: MailboxGrant?, _ error: Error?) -> Void)
```

Grant a mailbox to a key

Body: {\"mailbox\": \"email or id\"}. Refused (422) for mailboxes with agent access disabled or an active E2E encryption key — the server cannot read E2E mailboxes.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 

// Grant a mailbox to a key
AgentsAPI.grantApiKeyMailbox(keyID: keyID) { (response, error) in
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

[**MailboxGrant**](MailboxGrant.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listApiKeyMailboxes**
```swift
    open class func listApiKeyMailboxes(keyID: UUID, completion: @escaping (_ data: MailboxGrantList?, _ error: Error?) -> Void)
```

List a key's mailbox grants

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 

// List a key's mailbox grants
AgentsAPI.listApiKeyMailboxes(keyID: keyID) { (response, error) in
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

[**MailboxGrantList**](MailboxGrantList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listInboxes**
```swift
    open class func listInboxes(completion: @escaping (_ data: InboxList?, _ error: Error?) -> Void)
```

List granted inboxes

The mailboxes this key is granted, with thread counts and last activity. Admin sessions see every agent-enabled, non-E2E mailbox.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List granted inboxes
AgentsAPI.listInboxes() { (response, error) in
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

[**InboxList**](InboxList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listThreads**
```swift
    open class func listThreads(mailbox: String, since: Date? = nil, before: Date? = nil, limit: Int? = nil, completion: @escaping (_ data: ThreadList?, _ error: Error?) -> Void)
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
AgentsAPI.listThreads(mailbox: mailbox, since: since, before: before, limit: limit) { (response, error) in
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

[**ThreadList**](ThreadList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lookupContact**
```swift
    open class func lookupContact(email: String, completion: @escaping (_ data: ContactLookup?, _ error: Error?) -> Void)
```

Who is this sender?

Directory record (name, company, role, notes), whether the address is one of the tenant's own mailboxes, and grant-aware correspondence history (thread count, first/last seen across granted mailboxes only).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Who is this sender?
AgentsAPI.lookupContact(email: email) { (response, error) in
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

[**ContactLookup**](ContactLookup.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **markThreadMessageRead**
```swift
    open class func markThreadMessageRead(threadID: UUID, messageID: UUID, completion: @escaping (_ data: MarkReadResult?, _ error: Error?) -> Void)
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
AgentsAPI.markThreadMessageRead(threadID: threadID, messageID: messageID) { (response, error) in
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

[**MarkReadResult**](MarkReadResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replyToThread**
```swift
    open class func replyToThread(threadID: UUID, idempotencyKey: String, completion: @escaping (_ data: AgentSendResult?, _ error: Error?) -> Void)
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
AgentsAPI.replyToThread(threadID: threadID, idempotencyKey: idempotencyKey) { (response, error) in
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

[**AgentSendResult**](AgentSendResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeApiKeyMailbox**
```swift
    open class func revokeApiKeyMailbox(keyID: UUID, mailboxID: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke a mailbox grant

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let keyID = 987 // UUID | 
let mailboxID = 987 // UUID | 

// Revoke a mailbox grant
AgentsAPI.revokeApiKeyMailbox(keyID: keyID, mailboxID: mailboxID) { (response, error) in
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

# **startConversation**
```swift
    open class func startConversation(mailbox: String, idempotencyKey: String, startConversationRequest: StartConversationRequest, completion: @escaping (_ data: AgentSendResult?, _ error: Error?) -> Void)
```

Start a new conversation (agent stream)

Sends a new email from a granted mailbox. Classified stream=agent (isolated reputation, per-key rate caps). The first inbound reply adopts the created thread via the References chain. Idempotency-Key required. Mailboxes with agent_draft_policy=always_approve divert this into a pending draft.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let mailbox = "mailbox_example" // String | 
let idempotencyKey = "idempotencyKey_example" // String | 
let startConversationRequest = startConversation_request(to: ["to_example"], cc: ["cc_example"], subject: "subject_example", text: "text_example", html: "html_example") // StartConversationRequest | 

// Start a new conversation (agent stream)
AgentsAPI.startConversation(mailbox: mailbox, idempotencyKey: idempotencyKey, startConversationRequest: startConversationRequest) { (response, error) in
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
 **startConversationRequest** | [**StartConversationRequest**](StartConversationRequest.md) |  | 

### Return type

[**AgentSendResult**](AgentSendResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **whoami**
```swift
    open class func whoami(completion: @escaping (_ data: Whoami?, _ error: Error?) -> Void)
```

Introspect the calling credentials

Returns the tenant, auth kind (api_key/session), key label, and granted scopes. The MCP server uses this to scope-filter tool discovery.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Introspect the calling credentials
AgentsAPI.whoami() { (response, error) in
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

[**Whoami**](Whoami.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

