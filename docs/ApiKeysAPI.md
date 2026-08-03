# ApiKeysAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1ApiKeysGet**](ApiKeysAPI.md#v1apikeysget) | **GET** /v1/api-keys | List API keys
[**v1ApiKeysIdDelete**](ApiKeysAPI.md#v1apikeysiddelete) | **DELETE** /v1/api-keys/{id} | Revoke an API key
[**v1ApiKeysPost**](ApiKeysAPI.md#v1apikeyspost) | **POST** /v1/api-keys | Create an API key


# **v1ApiKeysGet**
```swift
    open class func v1ApiKeysGet(completion: @escaping (_ data: V1ApiKeysGet200Response?, _ error: Error?) -> Void)
```

List API keys

Returns all API keys (active and revoked) belonging to the calling tenant. The `secret` is **never** returned — only prefix + metadata. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List API keys
ApiKeysAPI.v1ApiKeysGet() { (response, error) in
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

[**V1ApiKeysGet200Response**](V1ApiKeysGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1ApiKeysIdDelete**
```swift
    open class func v1ApiKeysIdDelete(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke an API key

Soft-deletes (sets `revoked_at`) on the named key. The row stays for audit purposes; the key no longer authenticates.  You **cannot revoke the key currently being used** to make this call — that would lock you out. Use a different `tenant:admin` key. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Revoke an API key
ApiKeysAPI.v1ApiKeysIdDelete(id: id) { (response, error) in
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

# **v1ApiKeysPost**
```swift
    open class func v1ApiKeysPost(v1ApiKeysPostRequest: V1ApiKeysPostRequest, completion: @escaping (_ data: V1ApiKeysPost201Response?, _ error: Error?) -> Void)
```

Create an API key

Provisions a fresh API key for the calling tenant.  **The full `secret` is included in this response ONLY** — store it immediately. The cleartext secret is not recoverable from the argon2id hash kept server-side; rotate by creating a new key and revoking the old one. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1ApiKeysPostRequest = _v1_api_keys_post_request(label: "label_example", scopes: ["scopes_example"]) // V1ApiKeysPostRequest | 

// Create an API key
ApiKeysAPI.v1ApiKeysPost(v1ApiKeysPostRequest: v1ApiKeysPostRequest) { (response, error) in
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
 **v1ApiKeysPostRequest** | [**V1ApiKeysPostRequest**](V1ApiKeysPostRequest.md) |  | 

### Return type

[**V1ApiKeysPost201Response**](V1ApiKeysPost201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

