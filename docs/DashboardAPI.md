# DashboardAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAuditSummary**](DashboardAPI.md#getauditsummary) | **GET** /v1/audit-summary | Audit summary for the dashboard
[**getDomainsStatus**](DashboardAPI.md#getdomainsstatus) | **GET** /v1/domains/status | Domain health status for the dashboard
[**getIntegrationsSummary**](DashboardAPI.md#getintegrationssummary) | **GET** /v1/integrations-summary | Integrations summary for the dashboard
[**getSecurity**](DashboardAPI.md#getsecurity) | **GET** /v1/security | Security overview for the dashboard
[**getStorage**](DashboardAPI.md#getstorage) | **GET** /v1/storage | Storage usage for the dashboard
[**getTenantHealth**](DashboardAPI.md#gettenanthealth) | **GET** /v1/health | Full tenant health report
[**getUserInsights**](DashboardAPI.md#getuserinsights) | **GET** /v1/user-insights | User insights for the dashboard


# **getAuditSummary**
```swift
    open class func getAuditSummary(completion: @escaping (_ data: GetAuditSummary200Response?, _ error: Error?) -> Void)
```

Audit summary for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Audit summary for the dashboard
DashboardAPI.getAuditSummary() { (response, error) in
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

[**GetAuditSummary200Response**](GetAuditSummary200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDomainsStatus**
```swift
    open class func getDomainsStatus(completion: @escaping (_ data: GetDomainsStatus200Response?, _ error: Error?) -> Void)
```

Domain health status for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Domain health status for the dashboard
DashboardAPI.getDomainsStatus() { (response, error) in
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

[**GetDomainsStatus200Response**](GetDomainsStatus200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIntegrationsSummary**
```swift
    open class func getIntegrationsSummary(completion: @escaping (_ data: GetIntegrationsSummary200Response?, _ error: Error?) -> Void)
```

Integrations summary for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Integrations summary for the dashboard
DashboardAPI.getIntegrationsSummary() { (response, error) in
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

[**GetIntegrationsSummary200Response**](GetIntegrationsSummary200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSecurity**
```swift
    open class func getSecurity(completion: @escaping (_ data: GetSecurity200Response?, _ error: Error?) -> Void)
```

Security overview for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Security overview for the dashboard
DashboardAPI.getSecurity() { (response, error) in
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

[**GetSecurity200Response**](GetSecurity200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStorage**
```swift
    open class func getStorage(completion: @escaping (_ data: GetStorage200Response?, _ error: Error?) -> Void)
```

Storage usage for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Storage usage for the dashboard
DashboardAPI.getStorage() { (response, error) in
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

[**GetStorage200Response**](GetStorage200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTenantHealth**
```swift
    open class func getTenantHealth(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Full tenant health report

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Full tenant health report
DashboardAPI.getTenantHealth() { (response, error) in
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

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserInsights**
```swift
    open class func getUserInsights(completion: @escaping (_ data: GetUserInsights200Response?, _ error: Error?) -> Void)
```

User insights for the dashboard

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// User insights for the dashboard
DashboardAPI.getUserInsights() { (response, error) in
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

[**GetUserInsights200Response**](GetUserInsights200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

