# AiAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1AiConfigGet**](AiAPI.md#v1aiconfigget) | **GET** /v1/ai-config | Read the tenant&#39;s AI configuration
[**v1AiConfigPut**](AiAPI.md#v1aiconfigput) | **PUT** /v1/ai-config | Configure the AI tier
[**v1BillingAiUnitsCheckoutPost**](AiAPI.md#v1billingaiunitscheckoutpost) | **POST** /v1/billing/ai-units/checkout | Buy prepaid AI units
[**v1ThreadsThreadIDClassifyPost**](AiAPI.md#v1threadsthreadidclassifypost) | **POST** /v1/threads/{threadID}/classify | LLM-classify a thread


# **v1AiConfigGet**
```swift
    open class func v1AiConfigGet(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Read the tenant's AI configuration

Mode (off/byok/units), model, masked key hint, AI-unit balance, whether the units tier is available on this deployment.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Read the tenant's AI configuration
AiAPI.v1AiConfigGet() { (response, error) in
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

# **v1AiConfigPut**
```swift
    open class func v1AiConfigPut(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Configure the AI tier

Body: {\"mode\": \"off|byok|units\", \"model\": \"...\", \"anthropic_key\": \"sk-ant-...\"}. BYOK keys are stored AES-256-GCM encrypted; the cleartext is never returned. Omit anthropic_key to keep the stored one.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Configure the AI tier
AiAPI.v1AiConfigPut() { (response, error) in
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

# **v1BillingAiUnitsCheckoutPost**
```swift
    open class func v1BillingAiUnitsCheckoutPost(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Buy prepaid AI units

Body: {\"bundle\": \"100|500|2000\"}. One classification = one unit; bundles expire after 6 months. Admin session required. 503 until Paystack billing is configured.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Buy prepaid AI units
AiAPI.v1BillingAiUnitsCheckoutPost() { (response, error) in
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

# **v1ThreadsThreadIDClassifyPost**
```swift
    open class func v1ThreadsThreadIDClassifyPost(threadID: UUID, refresh: Bool? = nil, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

LLM-classify a thread

Returns {intent, urgency, summary, suggested_action} via the tenant's AI tier (BYOK or prepaid units — see /v1/ai-config). Cached per thread state: unchanged threads return the cache free; ?refresh=true forces a re-run. A failed model call charges nothing. 402 when the AI tier is off.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let threadID = 987 // UUID | 
let refresh = true // Bool |  (optional)

// LLM-classify a thread
AiAPI.v1ThreadsThreadIDClassifyPost(threadID: threadID, refresh: refresh) { (response, error) in
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
 **refresh** | **Bool** |  | [optional] 

### Return type

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

