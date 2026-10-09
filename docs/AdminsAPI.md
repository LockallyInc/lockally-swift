# AdminsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1AdminsGet**](AdminsAPI.md#v1adminsget) | **GET** /v1/admins | List tenant admins
[**v1AdminsIdDelete**](AdminsAPI.md#v1adminsiddelete) | **DELETE** /v1/admins/{id} | Delete an admin
[**v1AdminsIdPatch**](AdminsAPI.md#v1adminsidpatch) | **PATCH** /v1/admins/{id} | Update an admin
[**v1AdminsPost**](AdminsAPI.md#v1adminspost) | **POST** /v1/admins | Invite a new admin


# **v1AdminsGet**
```swift
    open class func v1AdminsGet(completion: @escaping (_ data: V1AdminsGet200Response?, _ error: Error?) -> Void)
```

List tenant admins

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List tenant admins
AdminsAPI.v1AdminsGet() { (response, error) in
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

[**V1AdminsGet200Response**](V1AdminsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1AdminsIdDelete**
```swift
    open class func v1AdminsIdDelete(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an admin

Hard-delete. Cascade-drops the admin's sessions (immediate revocation). Same safety rails as PATCH disabled=true. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete an admin
AdminsAPI.v1AdminsIdDelete(id: id) { (response, error) in
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

# **v1AdminsIdPatch**
```swift
    open class func v1AdminsIdPatch(id: UUID, v1AdminsIdPatchRequest: V1AdminsIdPatchRequest, completion: @escaping (_ data: AdminFull?, _ error: Error?) -> Void)
```

Update an admin

Supply at least one of `password`, `display_name`, `role`, `disabled`.  **Safety rails.** A session bearer (adm_sess_*) cannot disable itself — use another admin or an API key (which bypasses the self-rail). Disabling the last active admin returns 409 to prevent orphaning the tenant from its console. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let v1AdminsIdPatchRequest = _v1_admins__id__patch_request(password: "password_example", displayName: "displayName_example", role: "role_example", disabled: false) // V1AdminsIdPatchRequest | 

// Update an admin
AdminsAPI.v1AdminsIdPatch(id: id, v1AdminsIdPatchRequest: v1AdminsIdPatchRequest) { (response, error) in
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
 **v1AdminsIdPatchRequest** | [**V1AdminsIdPatchRequest**](V1AdminsIdPatchRequest.md) |  | 

### Return type

[**AdminFull**](AdminFull.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1AdminsPost**
```swift
    open class func v1AdminsPost(v1AdminsPostRequest: V1AdminsPostRequest, completion: @escaping (_ data: AdminFull?, _ error: Error?) -> Void)
```

Invite a new admin

Creates a new tenant admin. If `password` is omitted, lockally generates a 16-char password and returns it ONCE in the response. Email is case-insensitive and unique per tenant. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1AdminsPostRequest = _v1_admins_post_request(email: "email_example", password: "password_example", displayName: "displayName_example", role: "role_example") // V1AdminsPostRequest | 

// Invite a new admin
AdminsAPI.v1AdminsPost(v1AdminsPostRequest: v1AdminsPostRequest) { (response, error) in
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
 **v1AdminsPostRequest** | [**V1AdminsPostRequest**](V1AdminsPostRequest.md) |  | 

### Return type

[**AdminFull**](AdminFull.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

