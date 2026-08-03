# BillingAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createBillingCheckout**](BillingAPI.md#createbillingcheckout) | **POST** /v1/billing/checkout | Create a plan checkout session
[**createUnitsCheckout**](BillingAPI.md#createunitscheckout) | **POST** /v1/billing/units/checkout | Create a send-units checkout session
[**getBilling**](BillingAPI.md#getbilling) | **GET** /v1/billing | Get billing status


# **createBillingCheckout**
```swift
    open class func createBillingCheckout(createBillingCheckoutRequest: CreateBillingCheckoutRequest, completion: @escaping (_ data: CreateBillingCheckout200Response?, _ error: Error?) -> Void)
```

Create a plan checkout session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createBillingCheckoutRequest = createBillingCheckout_request(plan: "plan_example") // CreateBillingCheckoutRequest | 

// Create a plan checkout session
BillingAPI.createBillingCheckout(createBillingCheckoutRequest: createBillingCheckoutRequest) { (response, error) in
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
 **createBillingCheckoutRequest** | [**CreateBillingCheckoutRequest**](CreateBillingCheckoutRequest.md) |  | 

### Return type

[**CreateBillingCheckout200Response**](CreateBillingCheckout200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createUnitsCheckout**
```swift
    open class func createUnitsCheckout(createUnitsCheckoutRequest: CreateUnitsCheckoutRequest, completion: @escaping (_ data: CreateUnitsCheckout200Response?, _ error: Error?) -> Void)
```

Create a send-units checkout session

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createUnitsCheckoutRequest = createUnitsCheckout_request(bundle: "bundle_example") // CreateUnitsCheckoutRequest | 

// Create a send-units checkout session
BillingAPI.createUnitsCheckout(createUnitsCheckoutRequest: createUnitsCheckoutRequest) { (response, error) in
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
 **createUnitsCheckoutRequest** | [**CreateUnitsCheckoutRequest**](CreateUnitsCheckoutRequest.md) |  | 

### Return type

[**CreateUnitsCheckout200Response**](CreateUnitsCheckout200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBilling**
```swift
    open class func getBilling(completion: @escaping (_ data: BillingStatus?, _ error: Error?) -> Void)
```

Get billing status

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get billing status
BillingAPI.getBilling() { (response, error) in
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

[**BillingStatus**](BillingStatus.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

