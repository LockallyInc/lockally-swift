# DirectoryAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getDirectoryActivity**](DirectoryAPI.md#getdirectoryactivity) | **GET** /v1/directory-activity | Get recent directory activity
[**getDirectoryPermissions**](DirectoryAPI.md#getdirectorypermissions) | **GET** /v1/directory-permissions | Get directory permission settings
[**getDirectoryStats**](DirectoryAPI.md#getdirectorystats) | **GET** /v1/directory-stats | Get directory statistics
[**getGALSettings**](DirectoryAPI.md#getgalsettings) | **GET** /v1/gal-settings | Get Global Address List settings
[**rebuildGALIndex**](DirectoryAPI.md#rebuildgalindex) | **POST** /v1/gal-settings/rebuild-index | Rebuild the GAL search index
[**syncGAL**](DirectoryAPI.md#syncgal) | **POST** /v1/gal-settings/sync | Sync GAL with external directory sources
[**updateDirectoryPermissions**](DirectoryAPI.md#updatedirectorypermissions) | **PATCH** /v1/directory-permissions | Update directory permission settings
[**updateGALSettings**](DirectoryAPI.md#updategalsettings) | **PATCH** /v1/gal-settings | Update GAL settings


# **getDirectoryActivity**
```swift
    open class func getDirectoryActivity(completion: @escaping (_ data: GetDirectoryActivity200Response?, _ error: Error?) -> Void)
```

Get recent directory activity

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get recent directory activity
DirectoryAPI.getDirectoryActivity() { (response, error) in
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

[**GetDirectoryActivity200Response**](GetDirectoryActivity200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDirectoryPermissions**
```swift
    open class func getDirectoryPermissions(completion: @escaping (_ data: DirectoryPermissions?, _ error: Error?) -> Void)
```

Get directory permission settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get directory permission settings
DirectoryAPI.getDirectoryPermissions() { (response, error) in
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

[**DirectoryPermissions**](DirectoryPermissions.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDirectoryStats**
```swift
    open class func getDirectoryStats(completion: @escaping (_ data: GetDirectoryStats200Response?, _ error: Error?) -> Void)
```

Get directory statistics

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get directory statistics
DirectoryAPI.getDirectoryStats() { (response, error) in
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

[**GetDirectoryStats200Response**](GetDirectoryStats200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGALSettings**
```swift
    open class func getGALSettings(completion: @escaping (_ data: GALSettings?, _ error: Error?) -> Void)
```

Get Global Address List settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get Global Address List settings
DirectoryAPI.getGALSettings() { (response, error) in
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

[**GALSettings**](GALSettings.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rebuildGALIndex**
```swift
    open class func rebuildGALIndex(completion: @escaping (_ data: GALSettings?, _ error: Error?) -> Void)
```

Rebuild the GAL search index

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Rebuild the GAL search index
DirectoryAPI.rebuildGALIndex() { (response, error) in
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

[**GALSettings**](GALSettings.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncGAL**
```swift
    open class func syncGAL(completion: @escaping (_ data: GALSettings?, _ error: Error?) -> Void)
```

Sync GAL with external directory sources

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Sync GAL with external directory sources
DirectoryAPI.syncGAL() { (response, error) in
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

[**GALSettings**](GALSettings.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateDirectoryPermissions**
```swift
    open class func updateDirectoryPermissions(updateDirectoryPermissionsRequest: UpdateDirectoryPermissionsRequest, completion: @escaping (_ data: DirectoryPermissions?, _ error: Error?) -> Void)
```

Update directory permission settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let updateDirectoryPermissionsRequest = updateDirectoryPermissions_request(contactViewAccess: "contactViewAccess_example", contactEditAccess: "contactEditAccess_example", listManageAccess: "listManageAccess_example", externalSharing: "externalSharing_example") // UpdateDirectoryPermissionsRequest | 

// Update directory permission settings
DirectoryAPI.updateDirectoryPermissions(updateDirectoryPermissionsRequest: updateDirectoryPermissionsRequest) { (response, error) in
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
 **updateDirectoryPermissionsRequest** | [**UpdateDirectoryPermissionsRequest**](UpdateDirectoryPermissionsRequest.md) |  | 

### Return type

[**DirectoryPermissions**](DirectoryPermissions.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateGALSettings**
```swift
    open class func updateGALSettings(updateGALSettingsRequest: UpdateGALSettingsRequest, completion: @escaping (_ data: GALSettings?, _ error: Error?) -> Void)
```

Update GAL settings

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let updateGALSettingsRequest = updateGALSettings_request(galEnabled: false, hideFromDirectory: false, departmentGrouping: false, searchVisibility: "searchVisibility_example", includeExternalContacts: false) // UpdateGALSettingsRequest | 

// Update GAL settings
DirectoryAPI.updateGALSettings(updateGALSettingsRequest: updateGALSettingsRequest) { (response, error) in
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
 **updateGALSettingsRequest** | [**UpdateGALSettingsRequest**](UpdateGALSettingsRequest.md) |  | 

### Return type

[**GALSettings**](GALSettings.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

