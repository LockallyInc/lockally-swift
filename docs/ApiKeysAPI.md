# ApiKeysAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createApiKey**](ApiKeysAPI.md#createapikey) | **POST** /v1/api-keys | Create an API key
[**listApiKeys**](ApiKeysAPI.md#listapikeys) | **GET** /v1/api-keys | List API keys
[**revokeApiKey**](ApiKeysAPI.md#revokeapikey) | **DELETE** /v1/api-keys/{id} | Revoke an API key


# **createApiKey**
```swift
    open class func createApiKey(createApiKeyRequest: CreateApiKeyRequest, completion: @escaping (_ data: CreateApiKey201Response?, _ error: Error?) -> Void)
```

Create an API key

Provisions a fresh API key for the calling tenant.  **The full `secret` is included in this response ONLY** — store it immediately. The cleartext secret is not recoverable from the argon2id hash kept server-side; rotate by creating a new key and revoking the old one. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createApiKeyRequest = createApiKey_request(label: "label_example", scopes: ["scopes_example"], test: false) // CreateApiKeyRequest | 

// Create an API key
ApiKeysAPI.createApiKey(createApiKeyRequest: createApiKeyRequest) { (response, error) in
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
 **createApiKeyRequest** | [**CreateApiKeyRequest**](CreateApiKeyRequest.md) |  | 

### Return type

[**CreateApiKey201Response**](CreateApiKey201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listApiKeys**
```swift
    open class func listApiKeys(completion: @escaping (_ data: ListApiKeys200Response?, _ error: Error?) -> Void)
```

List API keys

Returns all API keys (active and revoked) belonging to the calling tenant. The `secret` is **never** returned — only prefix + metadata. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List API keys
ApiKeysAPI.listApiKeys() { (response, error) in
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

[**ListApiKeys200Response**](ListApiKeys200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeApiKey**
```swift
    open class func revokeApiKey(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Revoke an API key

Soft-deletes (sets `revoked_at`) on the named key. The row stays for audit purposes; the key no longer authenticates.  You **cannot revoke the key currently being used** to make this call — that would lock you out. Use a different `tenant:admin` key. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Revoke an API key
ApiKeysAPI.revokeApiKey(id: id) { (response, error) in
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

