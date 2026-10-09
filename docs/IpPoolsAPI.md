# IpPoolsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDedicatedIPRequest**](IpPoolsAPI.md#creatededicatediprequest) | **POST** /v1/dedicated-ip-requests | Request a dedicated IP
[**getIPAssignment**](IpPoolsAPI.md#getipassignment) | **GET** /v1/ip-assignment | Get current IP assignment
[**listDedicatedIPRequests**](IpPoolsAPI.md#listdedicatediprequests) | **GET** /v1/dedicated-ip-requests | List dedicated IP requests


# **createDedicatedIPRequest**
```swift
    open class func createDedicatedIPRequest(createDedicatedIPRequestRequest: CreateDedicatedIPRequestRequest, completion: @escaping (_ data: DedicatedIPRequest?, _ error: Error?) -> Void)
```

Request a dedicated IP

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createDedicatedIPRequestRequest = createDedicatedIPRequest_request(note: "note_example") // CreateDedicatedIPRequestRequest | 

// Request a dedicated IP
IpPoolsAPI.createDedicatedIPRequest(createDedicatedIPRequestRequest: createDedicatedIPRequestRequest) { (response, error) in
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
 **createDedicatedIPRequestRequest** | [**CreateDedicatedIPRequestRequest**](CreateDedicatedIPRequestRequest.md) |  | 

### Return type

[**DedicatedIPRequest**](DedicatedIPRequest.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIPAssignment**
```swift
    open class func getIPAssignment(completion: @escaping (_ data: GetIPAssignment200Response?, _ error: Error?) -> Void)
```

Get current IP assignment

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get current IP assignment
IpPoolsAPI.getIPAssignment() { (response, error) in
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

[**GetIPAssignment200Response**](GetIPAssignment200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDedicatedIPRequests**
```swift
    open class func listDedicatedIPRequests(completion: @escaping (_ data: ListDedicatedIPRequests200Response?, _ error: Error?) -> Void)
```

List dedicated IP requests

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List dedicated IP requests
IpPoolsAPI.listDedicatedIPRequests() { (response, error) in
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

[**ListDedicatedIPRequests200Response**](ListDedicatedIPRequests200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

