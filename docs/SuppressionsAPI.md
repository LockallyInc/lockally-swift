# SuppressionsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1SuppressionsEmailDelete**](SuppressionsAPI.md#v1suppressionsemaildelete) | **DELETE** /v1/suppressions/{email} | Remove a suppression
[**v1SuppressionsEmailGet**](SuppressionsAPI.md#v1suppressionsemailget) | **GET** /v1/suppressions/{email} | Check whether an address is suppressed
[**v1SuppressionsGet**](SuppressionsAPI.md#v1suppressionsget) | **GET** /v1/suppressions | List suppressed recipients
[**v1SuppressionsPost**](SuppressionsAPI.md#v1suppressionspost) | **POST** /v1/suppressions | Add a suppression


# **v1SuppressionsEmailDelete**
```swift
    open class func v1SuppressionsEmailDelete(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a suppression

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Remove a suppression
SuppressionsAPI.v1SuppressionsEmailDelete(email: email) { (response, error) in
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

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1SuppressionsEmailGet**
```swift
    open class func v1SuppressionsEmailGet(email: String, completion: @escaping (_ data: Suppression?, _ error: Error?) -> Void)
```

Check whether an address is suppressed

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Check whether an address is suppressed
SuppressionsAPI.v1SuppressionsEmailGet(email: email) { (response, error) in
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

[**Suppression**](Suppression.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1SuppressionsGet**
```swift
    open class func v1SuppressionsGet(reason: Reason_v1SuppressionsGet? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: V1SuppressionsGet200Response?, _ error: Error?) -> Void)
```

List suppressed recipients

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let reason = "reason_example" // String |  (optional)
let cursor = "cursor_example" // String |  (optional)
let limit = 987 // Int |  (optional) (default to 50)

// List suppressed recipients
SuppressionsAPI.v1SuppressionsGet(reason: reason, cursor: cursor, limit: limit) { (response, error) in
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
 **reason** | **String** |  | [optional] 
 **cursor** | **String** |  | [optional] 
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

[**V1SuppressionsGet200Response**](V1SuppressionsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1SuppressionsPost**
```swift
    open class func v1SuppressionsPost(v1SuppressionsPostRequest: V1SuppressionsPostRequest, completion: @escaping (_ data: Suppression?, _ error: Error?) -> Void)
```

Add a suppression

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1SuppressionsPostRequest = _v1_suppressions_post_request(email: "email_example", reason: "reason_example") // V1SuppressionsPostRequest | 

// Add a suppression
SuppressionsAPI.v1SuppressionsPost(v1SuppressionsPostRequest: v1SuppressionsPostRequest) { (response, error) in
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
 **v1SuppressionsPostRequest** | [**V1SuppressionsPostRequest**](V1SuppressionsPostRequest.md) |  | 

### Return type

[**Suppression**](Suppression.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

