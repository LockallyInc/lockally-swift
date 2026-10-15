# EncryptionAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**batchLookupPublicKeys**](EncryptionAPI.md#batchlookuppublickeys) | **GET** /v1/encryption/keys/lookup | Batch-lookup public keys by email
[**createEncryptionKey**](EncryptionAPI.md#createencryptionkey) | **POST** /v1/encryption/keys | Upload an encryption key pair
[**createEncryptionRecovery**](EncryptionAPI.md#createencryptionrecovery) | **POST** /v1/encryption/recovery | Store an encryption recovery blob
[**getEncryptionKey**](EncryptionAPI.md#getencryptionkey) | **GET** /v1/encryption/keys/{email} | Get encryption key for a mailbox
[**rotateEncryptionKey**](EncryptionAPI.md#rotateencryptionkey) | **POST** /v1/encryption/keys/rotate | Rotate an encryption key


# **batchLookupPublicKeys**
```swift
    open class func batchLookupPublicKeys(emails: String, completion: @escaping (_ data: BatchLookupPublicKeys200Response?, _ error: Error?) -> Void)
```

Batch-lookup public keys by email

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let emails = "emails_example" // String | Comma-separated list of email addresses

// Batch-lookup public keys by email
EncryptionAPI.batchLookupPublicKeys(emails: emails) { (response, error) in
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
 **emails** | **String** | Comma-separated list of email addresses | 

### Return type

[**BatchLookupPublicKeys200Response**](BatchLookupPublicKeys200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEncryptionKey**
```swift
    open class func createEncryptionKey(createEncryptionKeyRequest: CreateEncryptionKeyRequest, completion: @escaping (_ data: CreateEncryptionKey201Response?, _ error: Error?) -> Void)
```

Upload an encryption key pair

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createEncryptionKeyRequest = createEncryptionKey_request(mailboxEmail: "mailboxEmail_example", publicKey: "publicKey_example", encryptedPrivateKey: "encryptedPrivateKey_example", kdfParams: 123) // CreateEncryptionKeyRequest | 

// Upload an encryption key pair
EncryptionAPI.createEncryptionKey(createEncryptionKeyRequest: createEncryptionKeyRequest) { (response, error) in
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
 **createEncryptionKeyRequest** | [**CreateEncryptionKeyRequest**](CreateEncryptionKeyRequest.md) |  | 

### Return type

[**CreateEncryptionKey201Response**](CreateEncryptionKey201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createEncryptionRecovery**
```swift
    open class func createEncryptionRecovery(createEncryptionRecoveryRequest: CreateEncryptionRecoveryRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Store an encryption recovery blob

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createEncryptionRecoveryRequest = createEncryptionRecovery_request(mailboxEmail: "mailboxEmail_example", recoveryBlob: "recoveryBlob_example") // CreateEncryptionRecoveryRequest | 

// Store an encryption recovery blob
EncryptionAPI.createEncryptionRecovery(createEncryptionRecoveryRequest: createEncryptionRecoveryRequest) { (response, error) in
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
 **createEncryptionRecoveryRequest** | [**CreateEncryptionRecoveryRequest**](CreateEncryptionRecoveryRequest.md) |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEncryptionKey**
```swift
    open class func getEncryptionKey(email: String, completion: @escaping (_ data: GetEncryptionKey200Response?, _ error: Error?) -> Void)
```

Get encryption key for a mailbox

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Get encryption key for a mailbox
EncryptionAPI.getEncryptionKey(email: email) { (response, error) in
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
 **email** | **String** |  | 

### Return type

[**GetEncryptionKey200Response**](GetEncryptionKey200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **rotateEncryptionKey**
```swift
    open class func rotateEncryptionKey(rotateEncryptionKeyRequest: RotateEncryptionKeyRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Rotate an encryption key

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let rotateEncryptionKeyRequest = rotateEncryptionKey_request(mailboxEmail: "mailboxEmail_example", encryptedPrivateKey: "encryptedPrivateKey_example", kdfParams: 123) // RotateEncryptionKeyRequest | 

// Rotate an encryption key
EncryptionAPI.rotateEncryptionKey(rotateEncryptionKeyRequest: rotateEncryptionKeyRequest) { (response, error) in
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
 **rotateEncryptionKeyRequest** | [**RotateEncryptionKeyRequest**](RotateEncryptionKeyRequest.md) |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

