# SendAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelMessage**](SendAPI.md#cancelmessage) | **DELETE** /v1/messages/{id} | Cancel a scheduled send
[**getMessage**](SendAPI.md#getmessage) | **GET** /v1/messages/{id} | Get message status
[**getMessageStats**](SendAPI.md#getmessagestats) | **GET** /v1/messages/stats | Aggregate delivery stats
[**listMessages**](SendAPI.md#listmessages) | **GET** /v1/messages | List outbound messages
[**sendEmail**](SendAPI.md#sendemail) | **POST** /v1/send | Send an email
[**sendEmailBatch**](SendAPI.md#sendemailbatch) | **POST** /v1/send/batch | Send a batch of emails


# **cancelMessage**
```swift
    open class func cancelMessage(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancel a scheduled send

Cancels a still-scheduled message (future queued_at). Already sending/sent → 409.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Cancel a scheduled send
SendAPI.cancelMessage(id: id) { (response, error) in
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

# **getMessage**
```swift
    open class func getMessage(id: UUID, completion: @escaping (_ data: MessageDetail?, _ error: Error?) -> Void)
```

Get message status

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get message status
SendAPI.getMessage(id: id) { (response, error) in
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

# **getMessageStats**
```swift
    open class func getMessageStats(from: Date? = nil, to: Date? = nil, domain: String? = nil, completion: @escaping (_ data: MessageStats?, _ error: Error?) -> Void)
```

Aggregate delivery stats

Counts by delivery outcome (delivered/bounced/deferred/complaint) plus rates over a window, from the delivery-event store. Privacy-first: this reflects what receiving servers reported, NOT whether a human opened the mail, Lockally does no open/click tracking. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let from = Date() // Date | Window start (default 7 days ago). (optional)
let to = Date() // Date | Window end (default now). (optional)
let domain = "domain_example" // String | Filter by sender domain. (optional)

// Aggregate delivery stats
SendAPI.getMessageStats(from: from, to: to, domain: domain) { (response, error) in
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

# **listMessages**
```swift
    open class func listMessages(status: Status_listMessages? = nil, sender: String? = nil, q: String? = nil, since: Date? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: ListMessages200Response?, _ error: Error?) -> Void)
```

List outbound messages

Returns recent outbound messages for the calling tenant, sorted newest first. 

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
SendAPI.listMessages(status: status, sender: sender, q: q, since: since, cursor: cursor, limit: limit) { (response, error) in
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

[**ListMessages200Response**](ListMessages200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendEmail**
```swift
    open class func sendEmail(idempotencyKey: String, sendEmailRequest: SendEmailRequest, completion: @escaping (_ data: SendEmail200Response?, _ error: Error?) -> Void)
```

Send an email

Submits an email for delivery via lockally. Returns 202 immediately once the message is accepted into lockally's queue; the actual SMTP submission to the recipient is async. Track delivery via `GET /v1/messages/{id}` or webhook subscriptions for `delivery.delivered` / `delivery.bounced` / `delivery.complaint`.  **Idempotency-Key required.** Any unique string per send, 24-hour dedupe window. Repeated calls with the same key return byte-exact the original response and do NOT create a duplicate message.  **Sender authorisation.** `from` must be an address the calling tenant owns on a verified domain. A mailbox always qualifies. On business and combined accounts an **alias** qualifies too, so a send-only address such as `no-reply@` need not be a billed seat. An alias on an unverified domain, or one belonging to another account, is refused with `403`. A catch-all creates no aliases and so grants no sending rights.  **Rate cap.** Per-tenant `rate_cap_per_min` (returned on `/v1/tenant`) is enforced, 429 with `Retry-After: 60` once tripped.  **Recipient warning.** Over 25 total recipients (To+Cc+Bcc) sets a `warning` field in the response, large fan-outs queue noticeably at scale. Hard cap is 100/send.  **Not every success is a 202.** Check the status code, not just the body. A `200` means nothing was queued: either every recipient was already suppressed, or the call used a test key and the send was simulated. Both are successes, and neither produces a real delivery. See the `200` response below.  **Warm-up headers.** While the platform is in its outbound warm-up ramp, accepted sends carry `X-Warmup-Day`, `X-Warmup-Daily-Cap` and `X-Warmup-Used-Today`. They describe a platform-wide cap shared by every tenant, not your own allowance, and they disappear once the ramp finishes. Hitting the cap returns 429. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let idempotencyKey = "idempotencyKey_example" // String | 
let sendEmailRequest = sendEmail_request(from: "from_example", to: ["to_example"], cc: ["cc_example"], bcc: ["bcc_example"], subject: "subject_example", text: "text_example", html: "html_example", headers: "TODO", replyTo: "replyTo_example", replyToName: "replyToName_example", unsubscribe: false, templateId: 123, variables: "TODO", sendAt: Date(), attachments: [sendEmail_request_attachments_inner(filename: "filename_example", contentType: "contentType_example", contentBase64: "contentBase64_example")]) // SendEmailRequest | 

// Send an email
SendAPI.sendEmail(idempotencyKey: idempotencyKey, sendEmailRequest: sendEmailRequest) { (response, error) in
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
 **sendEmailRequest** | [**SendEmailRequest**](SendEmailRequest.md) |  | 

### Return type

[**SendEmail200Response**](SendEmail200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **sendEmailBatch**
```swift
    open class func sendEmailBatch(idempotencyKey: String, sendEmailBatchRequest: SendEmailBatchRequest, completion: @escaping (_ data: SendEmailBatch200Response?, _ error: Error?) -> Void)
```

Send a batch of emails

Sends up to 500 messages in one call. Each is validated and enqueued independently, a bad message fails only its own slot (partial success, HTTP 200). One `Idempotency-Key` header covers the batch; per-message keys are derived as `<key>:<index>`. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let idempotencyKey = "idempotencyKey_example" // String | 
let sendEmailBatchRequest = sendEmailBatch_request(messages: [SendMessage(from: "from_example", to: ["to_example"], cc: ["cc_example"], bcc: ["bcc_example"], subject: "subject_example", text: "text_example", html: "html_example", headers: "TODO", replyTo: "replyTo_example", replyToName: "replyToName_example", unsubscribe: false, templateId: 123, variables: "TODO", sendAt: Date(), attachments: [sendEmail_request_attachments_inner(filename: "filename_example", contentType: "contentType_example", contentBase64: "contentBase64_example")])]) // SendEmailBatchRequest | 

// Send a batch of emails
SendAPI.sendEmailBatch(idempotencyKey: idempotencyKey, sendEmailBatchRequest: sendEmailBatchRequest) { (response, error) in
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
 **sendEmailBatchRequest** | [**SendEmailBatchRequest**](SendEmailBatchRequest.md) |  | 

### Return type

[**SendEmailBatch200Response**](SendEmailBatch200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

