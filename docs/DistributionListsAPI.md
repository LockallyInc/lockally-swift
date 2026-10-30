# DistributionListsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDistributionList**](DistributionListsAPI.md#createdistributionlist) | **POST** /v1/distribution-lists | Create a distribution list
[**deleteDistributionList**](DistributionListsAPI.md#deletedistributionlist) | **DELETE** /v1/distribution-lists/{address} | Delete a distribution list
[**getDistributionList**](DistributionListsAPI.md#getdistributionlist) | **GET** /v1/distribution-lists/{address} | Get a distribution list
[**listDistributionLists**](DistributionListsAPI.md#listdistributionlists) | **GET** /v1/distribution-lists | List distribution lists
[**replaceDistributionListMembers**](DistributionListsAPI.md#replacedistributionlistmembers) | **PUT** /v1/distribution-lists/{address}/members | Replace distribution list members


# **createDistributionList**
```swift
    open class func createDistributionList(createDistributionListRequest: CreateDistributionListRequest, completion: @escaping (_ data: DistributionListDetail?, _ error: Error?) -> Void)
```

Create a distribution list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createDistributionListRequest = createDistributionList_request(listAddress: "listAddress_example", name: "name_example", members: ["members_example"]) // CreateDistributionListRequest | 

// Create a distribution list
DistributionListsAPI.createDistributionList(createDistributionListRequest: createDistributionListRequest) { (response, error) in
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
 **createDistributionListRequest** | [**CreateDistributionListRequest**](CreateDistributionListRequest.md) |  | 

### Return type

[**DistributionListDetail**](DistributionListDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDistributionList**
```swift
    open class func deleteDistributionList(address: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a distribution list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let address = "address_example" // String | Distribution list email address

// Delete a distribution list
DistributionListsAPI.deleteDistributionList(address: address) { (response, error) in
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
 **address** | **String** | Distribution list email address | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDistributionList**
```swift
    open class func getDistributionList(address: String, completion: @escaping (_ data: DistributionListDetail?, _ error: Error?) -> Void)
```

Get a distribution list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let address = "address_example" // String | Distribution list email address

// Get a distribution list
DistributionListsAPI.getDistributionList(address: address) { (response, error) in
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
 **address** | **String** | Distribution list email address | 

### Return type

[**DistributionListDetail**](DistributionListDetail.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDistributionLists**
```swift
    open class func listDistributionLists(completion: @escaping (_ data: ListDistributionLists200Response?, _ error: Error?) -> Void)
```

List distribution lists

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List distribution lists
DistributionListsAPI.listDistributionLists() { (response, error) in
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

[**ListDistributionLists200Response**](ListDistributionLists200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceDistributionListMembers**
```swift
    open class func replaceDistributionListMembers(address: String, replaceDistributionListMembersRequest: ReplaceDistributionListMembersRequest, completion: @escaping (_ data: ReplaceDistributionListMembers200Response?, _ error: Error?) -> Void)
```

Replace distribution list members

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let address = "address_example" // String | Distribution list email address
let replaceDistributionListMembersRequest = replaceDistributionListMembers_request(members: ["members_example"]) // ReplaceDistributionListMembersRequest | 

// Replace distribution list members
DistributionListsAPI.replaceDistributionListMembers(address: address, replaceDistributionListMembersRequest: replaceDistributionListMembersRequest) { (response, error) in
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
 **address** | **String** | Distribution list email address | 
 **replaceDistributionListMembersRequest** | [**ReplaceDistributionListMembersRequest**](ReplaceDistributionListMembersRequest.md) |  | 

### Return type

[**ReplaceDistributionListMembers200Response**](ReplaceDistributionListMembers200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

