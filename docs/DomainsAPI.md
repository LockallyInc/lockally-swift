# DomainsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1DomainsDomainDelete**](DomainsAPI.md#v1domainsdomaindelete) | **DELETE** /v1/domains/{domain} | Delete a domain
[**v1DomainsDomainGet**](DomainsAPI.md#v1domainsdomainget) | **GET** /v1/domains/{domain} | Get a domain
[**v1DomainsDomainVerifyPost**](DomainsAPI.md#v1domainsdomainverifypost) | **POST** /v1/domains/{domain}/verify | Force-poll DNS verification
[**v1DomainsGet**](DomainsAPI.md#v1domainsget) | **GET** /v1/domains | List domains
[**v1DomainsPost**](DomainsAPI.md#v1domainspost) | **POST** /v1/domains | Register a domain


# **v1DomainsDomainDelete**
```swift
    open class func v1DomainsDomainDelete(domain: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a domain

Removes the domain registration. Refuses with 409 if any mailbox is still attached — delete the mailboxes first. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Delete a domain
DomainsAPI.v1DomainsDomainDelete(domain: domain) { (response, error) in
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

# **v1DomainsDomainGet**
```swift
    open class func v1DomainsDomainGet(domain: String, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Get a domain

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Get a domain
DomainsAPI.v1DomainsDomainGet(domain: domain) { (response, error) in
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

# **v1DomainsDomainVerifyPost**
```swift
    open class func v1DomainsDomainVerifyPost(domain: String, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Force-poll DNS verification

Synchronously checks the `_lockally-verify.<domain>` TXT record against the stored verification token. Returns 200 either way: the returned `verified` boolean tells you whether DNS now confirms. Caller polls until `verified: true`. In v2 a background worker auto-polls and fires a `domain.verified` webhook. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let domain = "domain_example" // String | 

// Force-poll DNS verification
DomainsAPI.v1DomainsDomainVerifyPost(domain: domain) { (response, error) in
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

# **v1DomainsGet**
```swift
    open class func v1DomainsGet(completion: @escaping (_ data: V1DomainsGet200Response?, _ error: Error?) -> Void)
```

List domains

Returns every domain registered under the calling tenant.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List domains
DomainsAPI.v1DomainsGet() { (response, error) in
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

[**V1DomainsGet200Response**](V1DomainsGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1DomainsPost**
```swift
    open class func v1DomainsPost(v1DomainsPostRequest: V1DomainsPostRequest, completion: @escaping (_ data: Domain?, _ error: Error?) -> Void)
```

Register a domain

Registers a new domain for the calling tenant. Generates a DKIM keypair and verification token. Returns DNS instructions the tenant must publish under their own DNS (verification TXT, SPF include, DKIM TXT, MX records to `mx1`/`mx2.lockally.com`, DMARC seed).  **Idempotent** — re-posting the same domain returns the existing record with the same DKIM keys and token (regenerating would break the tenant's published DNS). Returns 200 on idempotent hit, 201 on first create.  Returns 409 if the domain is already claimed by a different tenant. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1DomainsPostRequest = _v1_domains_post_request(domain: "domain_example") // V1DomainsPostRequest | 

// Register a domain
DomainsAPI.v1DomainsPost(v1DomainsPostRequest: v1DomainsPostRequest) { (response, error) in
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
 **v1DomainsPostRequest** | [**V1DomainsPostRequest**](V1DomainsPostRequest.md) |  | 

### Return type

[**Domain**](Domain.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

