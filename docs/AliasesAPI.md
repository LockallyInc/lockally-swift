# AliasesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1AliasesAddressDelete**](AliasesAPI.md#v1aliasesaddressdelete) | **DELETE** /v1/aliases/{address} | Delete an alias
[**v1AliasesGet**](AliasesAPI.md#v1aliasesget) | **GET** /v1/aliases | List aliases
[**v1AliasesPost**](AliasesAPI.md#v1aliasespost) | **POST** /v1/aliases | Create an alias


# **v1AliasesAddressDelete**
```swift
    open class func v1AliasesAddressDelete(address: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an alias

Hard-delete (no soft-delete window — aliases are cheap to recreate).

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let address = "address_example" // String | 

// Delete an alias
AliasesAPI.v1AliasesAddressDelete(address: address) { (response, error) in
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
 **address** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1AliasesGet**
```swift
    open class func v1AliasesGet(completion: @escaping (_ data: V1AliasesGet200Response?, _ error: Error?) -> Void)
```

List aliases

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List aliases
AliasesAPI.v1AliasesGet() { (response, error) in
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

[**V1AliasesGet200Response**](V1AliasesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1AliasesPost**
```swift
    open class func v1AliasesPost(v1AliasesPostRequest: V1AliasesPostRequest, completion: @escaping (_ data: Alias?, _ error: Error?) -> Void)
```

Create an alias

Creates an email alias. `alias_address` must be on a verified tenant-owned domain. `alias_target` can be any email — intra-tenant or external (forwarding to a Gmail account is a legitimate use). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1AliasesPostRequest = _v1_aliases_post_request(aliasAddress: "aliasAddress_example", aliasTarget: "aliasTarget_example") // V1AliasesPostRequest | 

// Create an alias
AliasesAPI.v1AliasesPost(v1AliasesPostRequest: v1AliasesPostRequest) { (response, error) in
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
 **v1AliasesPostRequest** | [**V1AliasesPostRequest**](V1AliasesPostRequest.md) |  | 

### Return type

[**Alias**](Alias.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

