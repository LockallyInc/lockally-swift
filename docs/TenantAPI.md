# TenantAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1TenantGet**](TenantAPI.md#v1tenantget) | **GET** /v1/tenant | Get the calling tenant
[**v1UsageGet**](TenantAPI.md#v1usageget) | **GET** /v1/usage | Usage snapshot


# **v1TenantGet**
```swift
    open class func v1TenantGet(completion: @escaping (_ data: Tenant?, _ error: Error?) -> Void)
```

Get the calling tenant

Returns the tenant the presented API key belongs to.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get the calling tenant
TenantAPI.v1TenantGet() { (response, error) in
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

[**Tenant**](Tenant.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1UsageGet**
```swift
    open class func v1UsageGet(completion: @escaping (_ data: V1UsageGet200Response?, _ error: Error?) -> Void)
```

Usage snapshot

Returns the tenant's current usage + cap consumption. Designed for poll-based alerting on the integrator side (e.g. \"warn when daily quota is 80% used\"). Refreshed live from Postgres — there is no cache, so callers should poll at most once per minute. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Usage snapshot
TenantAPI.v1UsageGet() { (response, error) in
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

[**V1UsageGet200Response**](V1UsageGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

