# TestAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1TestInboundPost**](TestAPI.md#v1testinboundpost) | **POST** /v1/test/inbound | Simulate an inbound email (test keys only)


# **v1TestInboundPost**
```swift
    open class func v1TestInboundPost(completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Simulate an inbound email (test keys only)

Runs a synthetic message through the REAL indexing pipeline — thread adoption, deterministic extraction (incl. injection_risk), and the message.received webhook — so the whole agent loop is testable without a real domain or MTA. Requires an lk_test_* key (create with {\"test\": true} on POST /v1/api-keys). Body: {mailbox, from, subject, text, in_reply_to?, references?}.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Simulate an inbound email (test keys only)
TestAPI.v1TestInboundPost() { (response, error) in
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
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

