# DomainsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDomain**](DomainsAPI.md#createdomain) | **POST** /v1/domains | Register a domain
[**deleteDomain**](DomainsAPI.md#deletedomain) | **DELETE** /v1/domains/{domain} | Delete a domain
[**disableReturnPath**](DomainsAPI.md#disablereturnpath) | **DELETE** /v1/domains/{domain}/return-path | Turn off the custom Return-Path
[**enableReturnPath**](DomainsAPI.md#enablereturnpath) | **POST** /v1/domains/{domain}/return-path | Turn on the custom Return-Path
[**getDomain**](DomainsAPI.md#getdomain) | **GET** /v1/domains/{domain} | Get a domain
[**getReturnPath**](DomainsAPI.md#getreturnpath) | **GET** /v1/domains/{domain}/return-path | Get the custom Return-Path
[**listDomains**](DomainsAPI.md#listdomains) | **GET** /v1/domains | List domains
[**verifyDomain**](DomainsAPI.md#verifydomain) | **POST** /v1/domains/{domain}/verify | Force-poll DNS verification
[**verifyReturnPath**](DomainsAPI.md#verifyreturnpath) | **POST** /v1/domains/{domain}/return-path/verify | Check the custom Return-Path records


# **createDomain**
```swift
    open class func createDomain(createDomainRequest: CreateDomainRequest, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Register a domain

Registers a new domain for the calling tenant. Generates a DKIM keypair and verification token. Returns DNS instructions the tenant must publish under their own DNS (verification TXT, SPF include, DKIM TXT, MX records to `mx1`/`mx2.lockally.com`, DMARC seed).  **Idempotent** — re-posting the same domain returns the existing record with the same DKIM keys and token (regenerating would break the tenant's published DNS). Returns 200 on idempotent hit, 201 on first create.  Returns 409 if the domain is already claimed by a different tenant. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createDomainRequest = createDomain_request(domain: "domain_example") // CreateDomainRequest | 

// Register a domain
DomainsAPI.createDomain(createDomainRequest: createDomainRequest) { (response, error) in
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
 **createDomainRequest** | [**CreateDomainRequest**](CreateDomainRequest.md) |  | 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDomain**
```swift
    open class func deleteDomain(domain: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a domain

Removes the domain registration. Refuses with 409 if any mailbox is still attached — delete the mailboxes first. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Delete a domain
DomainsAPI.deleteDomain(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **disableReturnPath**
```swift
    open class func disableReturnPath(domain: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Turn off the custom Return-Path

API mail uses the sender's own address as the envelope sender again, from the next message. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Turn off the custom Return-Path
DomainsAPI.disableReturnPath(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enableReturnPath**
```swift
    open class func enableReturnPath(domain: String, completion: @escaping (_ data: ReturnPath?, _ error: Error?) -> Void)
```

Turn on the custom Return-Path

Moves it to `pending` and returns the two records to publish on `bounces.<domain>`. Nothing changes for mail until they are confirmed with the verify call. The domain must be verified. Available on every plan except Free. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Turn on the custom Return-Path
DomainsAPI.enableReturnPath(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

[**ReturnPath**](ReturnPath.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDomain**
```swift
    open class func getDomain(domain: String, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Get a domain

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Get a domain
DomainsAPI.getDomain(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getReturnPath**
```swift
    open class func getReturnPath(domain: String, completion: @escaping (_ data: ReturnPath?, _ error: Error?) -> Void)
```

Get the custom Return-Path

A custom Return-Path moves the envelope sender of mail sent through the API from this domain onto `bounces.<domain>`. Bounce reports then come back to Lockally instead of the sending mailbox, and a bounce that arrives after delivery marks the message bounced, suppresses the address and fires `delivery.bounced`. Mail sent from webmail or mail apps is not affected. DKIM stays signed by the domain itself. `status` is `off`, `pending` (records not confirmed yet) or `active`. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Get the custom Return-Path
DomainsAPI.getReturnPath(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

[**ReturnPath**](ReturnPath.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listDomains**
```swift
    open class func listDomains(completion: @escaping (_ data: ListDomains200Response?, _ error: Error?) -> Void)
```

List domains

Returns every domain registered under the calling tenant.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List domains
DomainsAPI.listDomains() { (response, error) in
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

[**ListDomains200Response**](ListDomains200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyDomain**
```swift
    open class func verifyDomain(domain: String, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Force-poll DNS verification

Synchronously checks the `_lockally-verify.<domain>` TXT record against the stored verification token. Returns 200 either way: the returned `verified` boolean tells you whether DNS now confirms. Caller polls until `verified: true`. In v2 a background worker auto-polls and fires a `domain.verified` webhook. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Force-poll DNS verification
DomainsAPI.verifyDomain(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifyReturnPath**
```swift
    open class func verifyReturnPath(domain: String, completion: @escaping (_ data: ReturnPath?, _ error: Error?) -> Void)
```

Check the custom Return-Path records

Looks up the MX and SPF records on `bounces.<domain>`. Returns 200 either way: while a record is missing the status stays `pending` and `check` says which one. Once both are found the Return-Path becomes `active` and the send path starts using it. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Check the custom Return-Path records
DomainsAPI.verifyReturnPath(domain: domain) { (response, error) in
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
 **domain** | **String** |  | 

### Return type

[**ReturnPath**](ReturnPath.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

