# AdminsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteAdmin**](AdminsAPI.md#deleteadmin) | **DELETE** /v1/admins/{id} | Delete an admin
[**inviteAdmin**](AdminsAPI.md#inviteadmin) | **POST** /v1/admins | Invite a new admin
[**listAdmins**](AdminsAPI.md#listadmins) | **GET** /v1/admins | List tenant admins
[**updateAdmin**](AdminsAPI.md#updateadmin) | **PATCH** /v1/admins/{id} | Update an admin


# **deleteAdmin**
```swift
    open class func deleteAdmin(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete an admin

Hard-delete. Cascade-drops the admin's sessions (immediate revocation). Same safety rails as PATCH disabled=true. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete an admin
AdminsAPI.deleteAdmin(id: id) { (response, error) in
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

# **inviteAdmin**
```swift
    open class func inviteAdmin(inviteAdminRequest: InviteAdminRequest, completion: @escaping (_ data: AdminFull?, _ error: Error?) -> Void)
```

Invite a new admin

Creates a new tenant admin. If `password` is omitted, lockally generates a 16-char password and returns it ONCE in the response. Email is case-insensitive and unique per tenant. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let inviteAdminRequest = inviteAdmin_request(email: "email_example", password: "password_example", displayName: "displayName_example", role: "role_example") // InviteAdminRequest | 

// Invite a new admin
AdminsAPI.inviteAdmin(inviteAdminRequest: inviteAdminRequest) { (response, error) in
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
 **inviteAdminRequest** | [**InviteAdminRequest**](InviteAdminRequest.md) |  | 

### Return type

[**AdminFull**](AdminFull.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAdmins**
```swift
    open class func listAdmins(completion: @escaping (_ data: ListAdmins200Response?, _ error: Error?) -> Void)
```

List tenant admins

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List tenant admins
AdminsAPI.listAdmins() { (response, error) in
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

[**ListAdmins200Response**](ListAdmins200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateAdmin**
```swift
    open class func updateAdmin(id: UUID, updateAdminRequest: UpdateAdminRequest, completion: @escaping (_ data: AdminFull?, _ error: Error?) -> Void)
```

Update an admin

Supply at least one of `password`, `display_name`, `role`, `disabled`.  **Safety rails.** A session bearer (adm_sess_*) cannot disable itself, use another admin or an API key (which bypasses the self-rail). Disabling the last active admin returns 409 to prevent orphaning the tenant from its console. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateAdminRequest = updateAdmin_request(password: "password_example", displayName: "displayName_example", role: "role_example", disabled: false) // UpdateAdminRequest | 

// Update an admin
AdminsAPI.updateAdmin(id: id, updateAdminRequest: updateAdminRequest) { (response, error) in
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
 **updateAdminRequest** | [**UpdateAdminRequest**](UpdateAdminRequest.md) |  | 

### Return type

[**AdminFull**](AdminFull.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

