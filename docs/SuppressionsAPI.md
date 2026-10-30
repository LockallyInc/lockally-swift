# SuppressionsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSuppression**](SuppressionsAPI.md#createsuppression) | **POST** /v1/suppressions | Add a suppression
[**deleteSuppression**](SuppressionsAPI.md#deletesuppression) | **DELETE** /v1/suppressions/{email} | Remove a suppression
[**getSuppression**](SuppressionsAPI.md#getsuppression) | **GET** /v1/suppressions/{email} | Check whether an address is suppressed
[**listSuppressions**](SuppressionsAPI.md#listsuppressions) | **GET** /v1/suppressions | List suppressed recipients


# **createSuppression**
```swift
    open class func createSuppression(createSuppressionRequest: CreateSuppressionRequest, completion: @escaping (_ data: Suppression?, _ error: Error?) -> Void)
```

Add a suppression

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createSuppressionRequest = createSuppression_request(email: "email_example", reason: "reason_example") // CreateSuppressionRequest | 

// Add a suppression
SuppressionsAPI.createSuppression(createSuppressionRequest: createSuppressionRequest) { (response, error) in
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
 **createSuppressionRequest** | [**CreateSuppressionRequest**](CreateSuppressionRequest.md) |  | 

### Return type

[**Suppression**](Suppression.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteSuppression**
```swift
    open class func deleteSuppression(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a suppression

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Remove a suppression
SuppressionsAPI.deleteSuppression(email: email) { (response, error) in
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

# **getSuppression**
```swift
    open class func getSuppression(email: String, completion: @escaping (_ data: Suppression?, _ error: Error?) -> Void)
```

Check whether an address is suppressed

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Check whether an address is suppressed
SuppressionsAPI.getSuppression(email: email) { (response, error) in
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

# **listSuppressions**
```swift
    open class func listSuppressions(reason: Reason_listSuppressions? = nil, cursor: String? = nil, limit: Int? = nil, completion: @escaping (_ data: ListSuppressions200Response?, _ error: Error?) -> Void)
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
SuppressionsAPI.listSuppressions(reason: reason, cursor: cursor, limit: limit) { (response, error) in
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

[**ListSuppressions200Response**](ListSuppressions200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

