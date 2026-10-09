# WebhooksAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1WebhooksGet**](WebhooksAPI.md#v1webhooksget) | **GET** /v1/webhooks | List webhooks
[**v1WebhooksIdDelete**](WebhooksAPI.md#v1webhooksiddelete) | **DELETE** /v1/webhooks/{id} | Delete a webhook
[**v1WebhooksIdPatch**](WebhooksAPI.md#v1webhooksidpatch) | **PATCH** /v1/webhooks/{id} | Update a webhook
[**v1WebhooksPost**](WebhooksAPI.md#v1webhookspost) | **POST** /v1/webhooks | Create a webhook


# **v1WebhooksGet**
```swift
    open class func v1WebhooksGet(completion: @escaping (_ data: V1WebhooksGet200Response?, _ error: Error?) -> Void)
```

List webhooks

Returns the calling tenant's webhook subscriptions. Never returns the signing secret — only metadata. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List webhooks
WebhooksAPI.v1WebhooksGet() { (response, error) in
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

[**V1WebhooksGet200Response**](V1WebhooksGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1WebhooksIdDelete**
```swift
    open class func v1WebhooksIdDelete(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a webhook

Hard-delete; cascades to `webhook_deliveries` history.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a webhook
WebhooksAPI.v1WebhooksIdDelete(id: id) { (response, error) in
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

# **v1WebhooksIdPatch**
```swift
    open class func v1WebhooksIdPatch(id: UUID, v1WebhooksIdPatchRequest: V1WebhooksIdPatchRequest, completion: @escaping (_ data: Webhook?, _ error: Error?) -> Void)
```

Update a webhook

Supply at least one of `url`, `events`, `paused`. Setting `paused` to `false` ALSO resets `consecutive_failures` to 0 — re-arms the 50-failure auto-pause counter. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let v1WebhooksIdPatchRequest = _v1_webhooks__id__patch_request(url: "url_example", events: ["events_example"], paused: false) // V1WebhooksIdPatchRequest | 

// Update a webhook
WebhooksAPI.v1WebhooksIdPatch(id: id, v1WebhooksIdPatchRequest: v1WebhooksIdPatchRequest) { (response, error) in
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
 **v1WebhooksIdPatchRequest** | [**V1WebhooksIdPatchRequest**](V1WebhooksIdPatchRequest.md) |  | 

### Return type

[**Webhook**](Webhook.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1WebhooksPost**
```swift
    open class func v1WebhooksPost(v1WebhooksPostRequest: V1WebhooksPostRequest, completion: @escaping (_ data: Webhook?, _ error: Error?) -> Void)
```

Create a webhook

Subscribes a URL to one or more event types. Returns the `signing_secret` ONCE in the response — store it immediately. The dispatcher signs every outbound POST per design L3:      X-Lockally-Signature: t=<unix>,v1=<hex(hmac_sha256(secret, t + \".\" + body))>  Verify on your end using HMAC-SHA256 with a 5-minute timestamp window (replay protection). A reference verifier ships in [internal/webhook](https://github.com/ucheigwedinma/lockally/blob/main/internal/webhook/sign.go).  Event names: see the [event catalogue](https://github.com/ucheigwedinma/lockally/blob/main/docs/v1-design.md#64-webhook-event-catalogue-v1). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1WebhooksPostRequest = _v1_webhooks_post_request(url: "url_example", events: ["events_example"]) // V1WebhooksPostRequest | 

// Create a webhook
WebhooksAPI.v1WebhooksPost(v1WebhooksPostRequest: v1WebhooksPostRequest) { (response, error) in
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
 **v1WebhooksPostRequest** | [**V1WebhooksPostRequest**](V1WebhooksPostRequest.md) |  | 

### Return type

[**Webhook**](Webhook.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

