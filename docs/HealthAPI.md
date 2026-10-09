# HealthAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**healthzGet**](HealthAPI.md#healthzget) | **GET** /healthz | Liveness check


# **healthzGet**
```swift
    open class func healthzGet(completion: @escaping (_ data: HealthzGet200Response?, _ error: Error?) -> Void)
```

Liveness check

Returns 200 if the process is up and the database pings cleanly. No authentication required.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Liveness check
HealthAPI.healthzGet() { (response, error) in
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

[**HealthzGet200Response**](HealthzGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

