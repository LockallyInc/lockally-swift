# DraftsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1DraftsDraftIDApprovePost**](DraftsAPI.md#v1draftsdraftidapprovepost) | **POST** /v1/drafts/{draftID}/approve | Approve a pending draft (human)
[**v1DraftsDraftIDCancelPost**](DraftsAPI.md#v1draftsdraftidcancelpost) | **POST** /v1/drafts/{draftID}/cancel | Withdraw a pending draft
[**v1DraftsDraftIDGet**](DraftsAPI.md#v1draftsdraftidget) | **GET** /v1/drafts/{draftID} | Get a draft
[**v1DraftsDraftIDRejectPost**](DraftsAPI.md#v1draftsdraftidrejectpost) | **POST** /v1/drafts/{draftID}/reject | Reject a pending draft (human)
[**v1DraftsGet**](DraftsAPI.md#v1draftsget) | **GET** /v1/drafts | List drafts
[**v1InboxesMailboxDraftsPost**](DraftsAPI.md#v1inboxesmailboxdraftspost) | **POST** /v1/inboxes/{mailbox}/drafts | Propose a new conversation as a draft
[**v1ThreadsThreadIDDraftsPost**](DraftsAPI.md#v1threadsthreadiddraftspost) | **POST** /v1/threads/{threadID}/drafts | Propose a reply as a draft


# **v1DraftsDraftIDApprovePost**
```swift
    open class func v1DraftsDraftIDApprovePost(draftID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Approve a pending draft (human)

Sends the draft exactly as reviewed, through the agent stream (loop detector included). Fires draft.approved.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Approve a pending draft (human)
DraftsAPI.v1DraftsDraftIDApprovePost(draftID: draftID) { (response, error) in
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
 **draftID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1DraftsDraftIDCancelPost**
```swift
    open class func v1DraftsDraftIDCancelPost(draftID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Withdraw a pending draft

Only the API key that created the draft may cancel it.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Withdraw a pending draft
DraftsAPI.v1DraftsDraftIDCancelPost(draftID: draftID) { (response, error) in
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
 **draftID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1DraftsDraftIDGet**
```swift
    open class func v1DraftsDraftIDGet(draftID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Get a draft

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Get a draft
DraftsAPI.v1DraftsDraftIDGet(draftID: draftID) { (response, error) in
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
 **draftID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1DraftsDraftIDRejectPost**
```swift
    open class func v1DraftsDraftIDRejectPost(draftID: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Reject a pending draft (human)

Body: {\"reason\": \"...\"} (optional). Fires draft.rejected.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Reject a pending draft (human)
DraftsAPI.v1DraftsDraftIDRejectPost(draftID: draftID) { (response, error) in
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
 **draftID** | **UUID** |  | 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1DraftsGet**
```swift
    open class func v1DraftsGet(status: String? = nil, limit: Int? = nil, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

List drafts

Filter with ?status=pending_approval|sent|rejected|cancelled. Keys see drafts of granted mailboxes; admin sessions see all.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let status = "status_example" // String |  (optional)
let limit = 987 // Int |  (optional) (default to 50)

// List drafts
DraftsAPI.v1DraftsGet(status: status, limit: limit) { (response, error) in
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
 **status** | **String** |  | [optional] 
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1InboxesMailboxDraftsPost**
```swift
    open class func v1InboxesMailboxDraftsPost(mailbox: String, idempotencyKey: String, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Propose a new conversation as a draft

New-conversation drafts ALWAYS require human approval (policy flag new_thread). Idempotency-Key required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let mailbox = "mailbox_example" // String | 
let idempotencyKey = "idempotencyKey_example" // String | 

// Propose a new conversation as a draft
DraftsAPI.v1InboxesMailboxDraftsPost(mailbox: mailbox, idempotencyKey: idempotencyKey) { (response, error) in
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

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ThreadsThreadIDDraftsPost**
```swift
    open class func v1ThreadsThreadIDDraftsPost(threadID: UUID, idempotencyKey: String, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Propose a reply as a draft

The safe default over /reply: the deterministic policy engine auto-sends clean in-thread replies and holds anything risky (PII, new recipients, injection-flagged threads, always-approve mailboxes) for human approval. Fires draft.pending_approval when held. Idempotency-Key required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let idempotencyKey = "idempotencyKey_example" // String | 

// Propose a reply as a draft
DraftsAPI.v1ThreadsThreadIDDraftsPost(threadID: threadID, idempotencyKey: idempotencyKey) { (response, error) in
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

