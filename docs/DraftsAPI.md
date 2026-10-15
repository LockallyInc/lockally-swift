# DraftsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approveDraft**](DraftsAPI.md#approvedraft) | **POST** /v1/drafts/{draftID}/approve | Approve a pending draft (human)
[**cancelDraft**](DraftsAPI.md#canceldraft) | **POST** /v1/drafts/{draftID}/cancel | Withdraw a pending draft
[**createConversationDraft**](DraftsAPI.md#createconversationdraft) | **POST** /v1/inboxes/{mailbox}/drafts | Propose a new conversation as a draft
[**createReplyDraft**](DraftsAPI.md#createreplydraft) | **POST** /v1/threads/{threadID}/drafts | Propose a reply as a draft
[**getDraft**](DraftsAPI.md#getdraft) | **GET** /v1/drafts/{draftID} | Get a draft
[**listDrafts**](DraftsAPI.md#listdrafts) | **GET** /v1/drafts | List drafts
[**rejectDraft**](DraftsAPI.md#rejectdraft) | **POST** /v1/drafts/{draftID}/reject | Reject a pending draft (human)


# **approveDraft**
```swift
    open class func approveDraft(draftID: UUID, completion: @escaping (_ data: DraftResult?, _ error: Error?) -> Void)
```

Approve a pending draft (human)

Sends the draft exactly as reviewed, through the agent stream (loop detector included). Fires draft.approved.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Approve a pending draft (human)
DraftsAPI.approveDraft(draftID: draftID) { (response, error) in
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

[**DraftResult**](DraftResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelDraft**
```swift
    open class func cancelDraft(draftID: UUID, completion: @escaping (_ data: Draft?, _ error: Error?) -> Void)
```

Withdraw a pending draft

Only the API key that created the draft may cancel it.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Withdraw a pending draft
DraftsAPI.cancelDraft(draftID: draftID) { (response, error) in
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

[**Draft**](Draft.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createConversationDraft**
```swift
    open class func createConversationDraft(mailbox: String, idempotencyKey: String, completion: @escaping (_ data: DraftResult?, _ error: Error?) -> Void)
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
DraftsAPI.createConversationDraft(mailbox: mailbox, idempotencyKey: idempotencyKey) { (response, error) in
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

[**DraftResult**](DraftResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createReplyDraft**
```swift
    open class func createReplyDraft(threadID: UUID, idempotencyKey: String, completion: @escaping (_ data: DraftResult?, _ error: Error?) -> Void)
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
DraftsAPI.createReplyDraft(threadID: threadID, idempotencyKey: idempotencyKey) { (response, error) in
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

[**DraftResult**](DraftResult.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDraft**
```swift
    open class func getDraft(draftID: UUID, completion: @escaping (_ data: Draft?, _ error: Error?) -> Void)
```

Get a draft

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Get a draft
DraftsAPI.getDraft(draftID: draftID) { (response, error) in
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

[**Draft**](Draft.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDrafts**
```swift
    open class func listDrafts(status: String? = nil, limit: Int? = nil, completion: @escaping (_ data: DraftList?, _ error: Error?) -> Void)
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
DraftsAPI.listDrafts(status: status, limit: limit) { (response, error) in
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

[**DraftList**](DraftList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rejectDraft**
```swift
    open class func rejectDraft(draftID: UUID, completion: @escaping (_ data: Draft?, _ error: Error?) -> Void)
```

Reject a pending draft (human)

Body: {\"reason\": \"...\"} (optional). Fires draft.rejected.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let draftID = 987 // UUID | 

// Reject a pending draft (human)
DraftsAPI.rejectDraft(draftID: draftID) { (response, error) in
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

[**Draft**](Draft.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

