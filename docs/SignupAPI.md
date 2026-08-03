# SignupAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**signup**](SignupAPI.md#signup) | **POST** /v1/signup | Sign up a new tenant


# **signup**
```swift
    open class func signup(signupRequest: SignupRequest, completion: @escaping (_ data: V1AdminLoginPost200Response?, _ error: Error?) -> Void)
```

Sign up a new tenant

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let signupRequest = signup_request(slug: "slug_example", displayName: "displayName_example", adminEmail: "adminEmail_example", password: "password_example", mode: "mode_example") // SignupRequest | 

// Sign up a new tenant
SignupAPI.signup(signupRequest: signupRequest) { (response, error) in
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
 **signupRequest** | [**SignupRequest**](SignupRequest.md) |  | 

### Return type

[**V1AdminLoginPost200Response**](V1AdminLoginPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

