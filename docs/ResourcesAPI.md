# ResourcesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createResource**](ResourcesAPI.md#createresource) | **POST** /v1/resources | Create a resource
[**deleteResource**](ResourcesAPI.md#deleteresource) | **DELETE** /v1/resources/{id} | Delete a resource
[**getResource**](ResourcesAPI.md#getresource) | **GET** /v1/resources/{id} | Get a resource
[**listResources**](ResourcesAPI.md#listresources) | **GET** /v1/resources | List resources
[**updateResource**](ResourcesAPI.md#updateresource) | **PATCH** /v1/resources/{id} | Update a resource


# **createResource**
```swift
    open class func createResource(createResourceRequest: CreateResourceRequest, completion: @escaping (_ data: Resource?, _ error: Error?) -> Void)
```

Create a resource

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createResourceRequest = createResource_request(name: "name_example", type: "type_example", capacity: 123) // CreateResourceRequest | 

// Create a resource
ResourcesAPI.createResource(createResourceRequest: createResourceRequest) { (response, error) in
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
 **createResourceRequest** | [**CreateResourceRequest**](CreateResourceRequest.md) |  | 

### Return type

[**Resource**](Resource.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteResource**
```swift
    open class func deleteResource(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a resource

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a resource
ResourcesAPI.deleteResource(id: id) { (response, error) in
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

# **getResource**
```swift
    open class func getResource(id: UUID, completion: @escaping (_ data: Resource?, _ error: Error?) -> Void)
```

Get a resource

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a resource
ResourcesAPI.getResource(id: id) { (response, error) in
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

[**Resource**](Resource.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listResources**
```swift
    open class func listResources(completion: @escaping (_ data: ListResources200Response?, _ error: Error?) -> Void)
```

List resources

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List resources
ResourcesAPI.listResources() { (response, error) in
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

[**ListResources200Response**](ListResources200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateResource**
```swift
    open class func updateResource(id: UUID, updateResourceRequest: UpdateResourceRequest, completion: @escaping (_ data: Resource?, _ error: Error?) -> Void)
```

Update a resource

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateResourceRequest = updateResource_request(name: "name_example", type: "type_example", capacity: 123, status: "status_example") // UpdateResourceRequest | 

// Update a resource
ResourcesAPI.updateResource(id: id, updateResourceRequest: updateResourceRequest) { (response, error) in
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
 **updateResourceRequest** | [**UpdateResourceRequest**](UpdateResourceRequest.md) |  | 

### Return type

[**Resource**](Resource.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

