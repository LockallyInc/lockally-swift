# ApiKeysAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createApiKey**](ApiKeysAPI.md#createapikey) | **POST** /v1/api-keys | Create an API key
[**listApiKeys**](ApiKeysAPI.md#listapikeys) | **GET** /v1/api-keys | List API keys
[**revokeApiKey**](ApiKeysAPI.md#revokeapikey) | **DELETE** /v1/api-keys/{id} | Revoke an API key
[**rotateApiKey**](ApiKeysAPI.md#rotateapikey) | **POST** /v1/api-keys/{id}/rotate | Rotate an API key
[**updateApiKey**](ApiKeysAPI.md#updateapikey) | **PATCH** /v1/api-keys/{id} | Update an API key


# **createApiKey**
```swift
    open class func createApiKey(createApiKeyRequest: CreateApiKeyRequest, completion: @escaping (_ data: CreateApiKey201Response?, _ error: Error?) -> Void)
```

Create an API key

Provisions a fresh API key for the calling tenant.  **The full `secret` is included in this response ONLY**, store it immediately. The cleartext secret is not recoverable from the argon2id hash kept server-side; rotate by creating a new key and revoking the old one. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createApiKeyRequest = createApiKey_request(label: "label_example", scopes: ["scopes_example"], test: false, expiresAt: Date()) // CreateApiKeyRequest | 

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
    open class func listApiKeys(sort: Sort_listApiKeys? = nil, order: Order_listApiKeys? = nil, completion: @escaping (_ data: ListApiKeys200Response?, _ error: Error?) -> Void)
```

List API keys

Returns all API keys (active and revoked) belonging to the calling tenant. The `secret` is **never** returned, only prefix + metadata. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let sort = "sort_example" // String | Field to order by. This list holds tens of rows per account, so every column is offered and none needs an index. (optional) (default to .createdAt)
let order = "order_example" // String | Defaults to desc for the default field and asc for any other. Always tie-broken on id, so the order is total. (optional)

// List API keys
ApiKeysAPI.listApiKeys(sort: sort, order: order) { (response, error) in
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
 **sort** | **String** | Field to order by. This list holds tens of rows per account, so every column is offered and none needs an index. | [optional] [default to .createdAt]
 **order** | **String** | Defaults to desc for the default field and asc for any other. Always tie-broken on id, so the order is total. | [optional] 

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

Soft-deletes (sets `revoked_at`) on the named key. The row stays for audit purposes; the key no longer authenticates.  You **cannot revoke the key currently being used** to make this call, that would lock you out. Use a different `tenant:admin` key. 

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

# **rotateApiKey**
```swift
    open class func rotateApiKey(id: UUID, rotateApiKeyRequest: RotateApiKeyRequest? = nil, completion: @escaping (_ data: CreateApiKey201Response?, _ error: Error?) -> Void)
```

Rotate an API key

Issues a successor key and puts a short expiry on this one, so **both work until the overlap ends**. That window is the point: without it, rotation is revocation with extra steps and every caller has to swap credentials in the same instant.  The successor inherits this key's scopes, its label (the label names the integration, and the integration has not changed) and its test flag. Its full `secret` is in this response and nowhere else.  The response's `expires_at` is the **predecessor's** deadline, so you can see from the rotation itself how long you have to cut over.  A key that has already been rotated cannot be rotated again: chaining overlaps would leave several live keys for one integration, which is the opposite of the intent. Rotate the successor instead. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let rotateApiKeyRequest = rotateApiKey_request(graceSeconds: 123) // RotateApiKeyRequest |  (optional)

// Rotate an API key
ApiKeysAPI.rotateApiKey(id: id, rotateApiKeyRequest: rotateApiKeyRequest) { (response, error) in
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
 **rotateApiKeyRequest** | [**RotateApiKeyRequest**](RotateApiKeyRequest.md) |  | [optional] 

### Return type

[**CreateApiKey201Response**](CreateApiKey201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateApiKey**
```swift
    open class func updateApiKey(id: UUID, updateApiKeyRequest: UpdateApiKeyRequest, completion: @escaping (_ data: APIKey?, _ error: Error?) -> Void)
```

Update an API key

Changes a key's label, scopes or expiry in place, without reissuing the secret.  **Every field is optional and absent means unchanged.** Renaming a key does not clear its expiry. For `expires_at` there are three distinct requests: omit the field to leave the expiry alone, send a timestamp to set one, and send an explicit `null` to remove one.  Scopes are replaced wholesale, not merged. This endpoint does not restrict which scopes you may grant, because `POST /v1/api-keys` never has either: a key with `tenant:admin` can already mint a key with any scope, so `tenant:admin` is root-equivalent for key management.  A revoked key cannot be updated. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateApiKeyRequest = updateApiKey_request(label: "label_example", scopes: ["scopes_example"], expiresAt: Date()) // UpdateApiKeyRequest | 

// Update an API key
ApiKeysAPI.updateApiKey(id: id, updateApiKeyRequest: updateApiKeyRequest) { (response, error) in
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
 **updateApiKeyRequest** | [**UpdateApiKeyRequest**](UpdateApiKeyRequest.md) |  | 

### Return type

[**APIKey**](APIKey.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

