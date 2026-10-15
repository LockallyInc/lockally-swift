# HealthAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthCheck**](HealthAPI.md#healthcheck) | **GET** /healthz | Liveness check


# **healthCheck**
```swift
    open class func healthCheck(completion: @escaping (_ data: HealthCheck200Response?, _ error: Error?) -> Void)
```

Liveness check

Returns 200 if the process is up and the database pings cleanly. No authentication required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Liveness check
HealthAPI.healthCheck() { (response, error) in
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

[**HealthCheck200Response**](HealthCheck200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

