# SendAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1MessagesGet**](SendAPI.md#v1messagesget) | **GET** /v1/messages | List outbound messages
[**v1MessagesIdDelete**](SendAPI.md#v1messagesiddelete) | **DELETE** /v1/messages/{id} | Cancel a scheduled send
[**v1MessagesIdGet**](SendAPI.md#v1messagesidget) | **GET** /v1/messages/{id} | Get message status
[**v1MessagesStatsGet**](SendAPI.md#v1messagesstatsget) | **GET** /v1/messages/stats | Aggregate delivery stats
[**v1SendBatchPost**](SendAPI.md#v1sendbatchpost) | **POST** /v1/send/batch | Send a batch of emails
[**v1SendPost**](SendAPI.md#v1sendpost) | **POST** /v1/send | Send an email


# **v1MessagesGet**
```swift
    open class func v1MessagesGet(status: Status_v1MessagesGet? = nil, sender: String? = nil, q: String? = nil, since: Date? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: V1MessagesGet200Response?, _ error: Error?) -> Void)
```

List outbound messages

Returns recent outbound messages for the calling tenant, sorted newest first. Backs the send-status pill in the SvelteKit /sends view and the outbound search box. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let status = "status_example" // String |  (optional)
let sender = "sender_example" // String | Exact match against the `from` mailbox. (optional)
let q = "q_example" // String | Free-text search across subject + sender. (optional)
let since = Date() // Date | Only messages queued at or after this RFC 3339 instant. (optional)
let cursor = "cursor_example" // String | queued_at of the prior page boundary. Pass back the `next_cursor` returned by the previous call. (optional)
let limit = 987 // Int |  (optional) (default to 50)

// List outbound messages
SendAPI.v1MessagesGet(status: status, sender: sender, q: q, since: since, cursor: cursor, limit: limit) { (response, error) in
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
 **sender** | **String** | Exact match against the &#x60;from&#x60; mailbox. | [optional] 
 **q** | **String** | Free-text search across subject + sender. | [optional] 
 **since** | **Date** | Only messages queued at or after this RFC 3339 instant. | [optional] 
 **cursor** | **String** | queued_at of the prior page boundary. Pass back the &#x60;next_cursor&#x60; returned by the previous call. | [optional] 
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

[**V1MessagesGet200Response**](V1MessagesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MessagesIdDelete**
```swift
    open class func v1MessagesIdDelete(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancel a scheduled send

Cancels a still-scheduled message (future queued_at). Already sending/sent → 409.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Cancel a scheduled send
SendAPI.v1MessagesIdDelete(id: id) { (response, error) in
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
 **id** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MessagesIdGet**
```swift
    open class func v1MessagesIdGet(id: UUID, completion: @escaping (_ data: MessageDetail?, _ error: Error?) -> Void)
```

Get message status

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get message status
SendAPI.v1MessagesIdGet(id: id) { (response, error) in
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
 **id** | **UUID** |  | 

### Return type

[**MessageDetail**](MessageDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MessagesStatsGet**
```swift
    open class func v1MessagesStatsGet(from: Date? = nil, to: Date? = nil, domain: String? = nil, completion: @escaping (_ data: MessageStats?, _ error: Error?) -> Void)
```

Aggregate delivery stats

Counts by delivery outcome (delivered/bounced/deferred/complaint) plus rates over a window, from the delivery-event store. Privacy-first: this reflects what receiving servers reported, NOT whether a human opened the mail — Lockally does no open/click tracking. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let from = Date() // Date | Window start (default 7 days ago). (optional)
let to = Date() // Date | Window end (default now). (optional)
let domain = "domain_example" // String | Filter by sender domain. (optional)

// Aggregate delivery stats
SendAPI.v1MessagesStatsGet(from: from, to: to, domain: domain) { (response, error) in
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
 **from** | **Date** | Window start (default 7 days ago). | [optional] 
 **to** | **Date** | Window end (default now). | [optional] 
 **domain** | **String** | Filter by sender domain. | [optional] 

### Return type

[**MessageStats**](MessageStats.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1SendBatchPost**
```swift
    open class func v1SendBatchPost(idempotencyKey: String, v1SendBatchPostRequest: V1SendBatchPostRequest, completion: @escaping (_ data: V1SendBatchPost200Response?, _ error: Error?) -> Void)
```

Send a batch of emails

Sends up to 500 messages in one call. Each is validated and enqueued independently — a bad message fails only its own slot (partial success, HTTP 200). One `Idempotency-Key` header covers the batch; per-message keys are derived as `<key>:<index>`. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let idempotencyKey = "idempotencyKey_example" // String | 
let v1SendBatchPostRequest = _v1_send_batch_post_request(messages: [SendMessage(from: "from_example", to: ["to_example"], cc: ["cc_example"], bcc: ["bcc_example"], subject: "subject_example", text: "text_example", html: "html_example", headers: "TODO", unsubscribe: false, templateId: 123, variables: "TODO", sendAt: Date(), attachments: [_v1_send_post_request_attachments_inner(filename: "filename_example", contentType: "contentType_example", contentBase64: "contentBase64_example")])]) // V1SendBatchPostRequest | 

// Send a batch of emails
SendAPI.v1SendBatchPost(idempotencyKey: idempotencyKey, v1SendBatchPostRequest: v1SendBatchPostRequest) { (response, error) in
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
 **idempotencyKey** | **String** |  | 
 **v1SendBatchPostRequest** | [**V1SendBatchPostRequest**](V1SendBatchPostRequest.md) |  | 

### Return type

[**V1SendBatchPost200Response**](V1SendBatchPost200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1SendPost**
```swift
    open class func v1SendPost(idempotencyKey: String, v1SendPostRequest: V1SendPostRequest, completion: @escaping (_ data: V1SendPost202Response?, _ error: Error?) -> Void)
```

Send an email

Submits an email for delivery via lockally. Returns 202 immediately once the message is accepted into lockally's queue; the actual SMTP submission to the recipient is async. Track delivery via `GET /v1/messages/{id}` or webhook subscriptions for `delivery.delivered` / `delivery.bounced` / `delivery.complaint`.  **Idempotency-Key required.** Per design L7 — any unique string per send, 24-hour dedupe window. Repeated calls with the same key return byte-exact the original response and do NOT create a duplicate message.  **Sender authorisation.** `from` must be a non-disabled mailbox owned by the calling tenant on a verified domain. Sending from aliases is not yet supported.  **Rate cap.** Per-tenant `rate_cap_per_min` (returned on `/v1/tenant`) is enforced — 429 with `Retry-After: 60` once tripped.  **Recipient warning.** Over 25 total recipients (To+Cc+Bcc) sets a `warning` field in the response — large fan-outs queue noticeably at scale. Hard cap is 100/send. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let idempotencyKey = "idempotencyKey_example" // String | 
let v1SendPostRequest = _v1_send_post_request(from: "from_example", to: ["to_example"], cc: ["cc_example"], bcc: ["bcc_example"], subject: "subject_example", text: "text_example", html: "html_example", headers: "TODO", unsubscribe: false, templateId: 123, variables: "TODO", sendAt: Date(), attachments: [_v1_send_post_request_attachments_inner(filename: "filename_example", contentType: "contentType_example", contentBase64: "contentBase64_example")]) // V1SendPostRequest | 

// Send an email
SendAPI.v1SendPost(idempotencyKey: idempotencyKey, v1SendPostRequest: v1SendPostRequest) { (response, error) in
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
 **idempotencyKey** | **String** |  | 
 **v1SendPostRequest** | [**V1SendPostRequest**](V1SendPostRequest.md) |  | 

### Return type

[**V1SendPost202Response**](V1SendPost202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

