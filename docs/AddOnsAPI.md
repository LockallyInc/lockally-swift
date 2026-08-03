# AddOnsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activateAddOn**](AddOnsAPI.md#activateaddon) | **POST** /v1/add-ons/{name}/activate | Activate an add-on
[**cancelAddOn**](AddOnsAPI.md#canceladdon) | **POST** /v1/add-ons/{name}/cancel | Cancel an add-on
[**getAddOnStatus**](AddOnsAPI.md#getaddonstatus) | **GET** /v1/add-ons/{name} | Get add-on status
[**listAddOns**](AddOnsAPI.md#listaddons) | **GET** /v1/add-ons | List add-ons


# **activateAddOn**
```swift
    open class func activateAddOn(name: String, completion: @escaping (_ data: ActivateAddOn200Response?, _ error: Error?) -> Void)
```

Activate an add-on

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let name = "name_example" // String | Add-on key

// Activate an add-on
AddOnsAPI.activateAddOn(name: name) { (response, error) in
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
 **name** | **String** | Add-on key | 

### Return type

[**ActivateAddOn200Response**](ActivateAddOn200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **cancelAddOn**
```swift
    open class func cancelAddOn(name: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Cancel an add-on

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let name = "name_example" // String | Add-on key

// Cancel an add-on
AddOnsAPI.cancelAddOn(name: name) { (response, error) in
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
 **name** | **String** | Add-on key | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAddOnStatus**
```swift
    open class func getAddOnStatus(name: String, completion: @escaping (_ data: GetAddOnStatus200Response?, _ error: Error?) -> Void)
```

Get add-on status

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let name = "name_example" // String | Add-on key

// Get add-on status
AddOnsAPI.getAddOnStatus(name: name) { (response, error) in
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
 **name** | **String** | Add-on key | 

### Return type

[**GetAddOnStatus200Response**](GetAddOnStatus200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAddOns**
```swift
    open class func listAddOns(completion: @escaping (_ data: ListAddOns200Response?, _ error: Error?) -> Void)
```

List add-ons

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List add-ons
AddOnsAPI.listAddOns() { (response, error) in
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

[**ListAddOns200Response**](ListAddOns200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

