# MailboxesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSharedMember**](MailboxesAPI.md#addsharedmember) | **POST** /v1/mailboxes/{email}/members | Add a shared mailbox member
[**listSharedMembers**](MailboxesAPI.md#listsharedmembers) | **GET** /v1/mailboxes/{email}/members | List shared mailbox members
[**removeSharedMember**](MailboxesAPI.md#removesharedmember) | **DELETE** /v1/mailboxes/{email}/members/{memberEmail} | Remove a shared mailbox member
[**v1MailboxesEmailDelete**](MailboxesAPI.md#v1mailboxesemaildelete) | **DELETE** /v1/mailboxes/{email} | Soft-delete a mailbox
[**v1MailboxesEmailExportDownloadGet**](MailboxesAPI.md#v1mailboxesemailexportdownloadget) | **GET** /v1/mailboxes/{email}/export/download | Download a previously-issued mailbox export
[**v1MailboxesEmailExportPost**](MailboxesAPI.md#v1mailboxesemailexportpost) | **POST** /v1/mailboxes/{email}/export | Request a mailbox export
[**v1MailboxesEmailGet**](MailboxesAPI.md#v1mailboxesemailget) | **GET** /v1/mailboxes/{email} | Get a mailbox
[**v1MailboxesEmailPatch**](MailboxesAPI.md#v1mailboxesemailpatch) | **PATCH** /v1/mailboxes/{email} | Update a mailbox
[**v1MailboxesEmailVacationDelete**](MailboxesAPI.md#v1mailboxesemailvacationdelete) | **DELETE** /v1/mailboxes/{email}/vacation | Remove the vacation responder
[**v1MailboxesEmailVacationGet**](MailboxesAPI.md#v1mailboxesemailvacationget) | **GET** /v1/mailboxes/{email}/vacation | Get the vacation responder
[**v1MailboxesEmailVacationPut**](MailboxesAPI.md#v1mailboxesemailvacationput) | **PUT** /v1/mailboxes/{email}/vacation | Set the vacation responder
[**v1MailboxesGet**](MailboxesAPI.md#v1mailboxesget) | **GET** /v1/mailboxes | List mailboxes
[**v1MailboxesPost**](MailboxesAPI.md#v1mailboxespost) | **POST** /v1/mailboxes | Create a mailbox
[**v1VacationGet**](MailboxesAPI.md#v1vacationget) | **GET** /v1/vacation | List all vacation responders


# **addSharedMember**
```swift
    open class func addSharedMember(email: String, addSharedMemberRequest: AddSharedMemberRequest, completion: @escaping (_ data: SharedMember?, _ error: Error?) -> Void)
```

Add a shared mailbox member

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let addSharedMemberRequest = addSharedMember_request(memberEmail: "memberEmail_example", role: "role_example") // AddSharedMemberRequest | 

// Add a shared mailbox member
MailboxesAPI.addSharedMember(email: email, addSharedMemberRequest: addSharedMemberRequest) { (response, error) in
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
 **addSharedMemberRequest** | [**AddSharedMemberRequest**](AddSharedMemberRequest.md) |  | 

### Return type

[**SharedMember**](SharedMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listSharedMembers**
```swift
    open class func listSharedMembers(email: String, completion: @escaping (_ data: ListSharedMembers200Response?, _ error: Error?) -> Void)
```

List shared mailbox members

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// List shared mailbox members
MailboxesAPI.listSharedMembers(email: email) { (response, error) in
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

[**ListSharedMembers200Response**](ListSharedMembers200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeSharedMember**
```swift
    open class func removeSharedMember(email: String, memberEmail: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a shared mailbox member

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let memberEmail = "memberEmail_example" // String | 

// Remove a shared mailbox member
MailboxesAPI.removeSharedMember(email: email, memberEmail: memberEmail) { (response, error) in
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
 **memberEmail** | **String** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailDelete**
```swift
    open class func v1MailboxesEmailDelete(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Soft-delete a mailbox

Sets `soft_deleted_at = now()` and `hard_delete_after = now() + 90d` per design D25. A background sweep (planned) will hard-delete after the window. The mailbox is also disabled immediately. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Soft-delete a mailbox
MailboxesAPI.v1MailboxesEmailDelete(email: email) { (response, error) in
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

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailExportDownloadGet**
```swift
    open class func v1MailboxesEmailExportDownloadGet(email: String, token: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Download a previously-issued mailbox export

Public endpoint (no Authorization header). Validates the one-shot token from the URL, marks it used, and streams an mbox file. Second GET with the same token returns 404 — tokens are single-use. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let token = "token_example" // String | 

// Download a previously-issued mailbox export
MailboxesAPI.v1MailboxesEmailExportDownloadGet(email: email, token: token) { (response, error) in
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
 **token** | **String** |  | 

### Return type

**URL**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/mbox, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailExportPost**
```swift
    open class func v1MailboxesEmailExportPost(email: String, completion: @escaping (_ data: V1MailboxesEmailExportPost201Response?, _ error: Error?) -> Void)
```

Request a mailbox export

Issues a one-shot \"presigned\" download URL for the mailbox's content in mbox format. The URL works without an Authorization header — the token in the query string is the authz. TTL is 5 minutes; the token is consumed on first GET.  **v1 caveat:** the synthesized mbox only contains outbound mail (from `lockally.messages`). v2 swaps in Stalwart's export primitive for full inbox + folder structure + flags. The endpoint contract stays unchanged. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Request a mailbox export
MailboxesAPI.v1MailboxesEmailExportPost(email: email) { (response, error) in
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

[**V1MailboxesEmailExportPost201Response**](V1MailboxesEmailExportPost201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailGet**
```swift
    open class func v1MailboxesEmailGet(email: String, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Get a mailbox

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Get a mailbox
MailboxesAPI.v1MailboxesEmailGet(email: email) { (response, error) in
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

[**Mailbox**](Mailbox.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailPatch**
```swift
    open class func v1MailboxesEmailPatch(email: String, v1MailboxesEmailPatchRequest: V1MailboxesEmailPatchRequest, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Update a mailbox

Supply at least one of `password`, `quota_bytes`, `disabled`. Returns the updated mailbox. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let v1MailboxesEmailPatchRequest = _v1_mailboxes__email__patch_request(password: "password_example", quotaBytes: 123, disabled: false) // V1MailboxesEmailPatchRequest | 

// Update a mailbox
MailboxesAPI.v1MailboxesEmailPatch(email: email, v1MailboxesEmailPatchRequest: v1MailboxesEmailPatchRequest) { (response, error) in
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
 **v1MailboxesEmailPatchRequest** | [**V1MailboxesEmailPatchRequest**](V1MailboxesEmailPatchRequest.md) |  | 

### Return type

[**Mailbox**](Mailbox.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailVacationDelete**
```swift
    open class func v1MailboxesEmailVacationDelete(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove the vacation responder

Idempotent — 204 whether or not a row existed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Remove the vacation responder
MailboxesAPI.v1MailboxesEmailVacationDelete(email: email) { (response, error) in
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

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailVacationGet**
```swift
    open class func v1MailboxesEmailVacationGet(email: String, completion: @escaping (_ data: VacationResponder?, _ error: Error?) -> Void)
```

Get the vacation responder

Returns the stored vacation rule or 404 if none is set.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Get the vacation responder
MailboxesAPI.v1MailboxesEmailVacationGet(email: email) { (response, error) in
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

[**VacationResponder**](VacationResponder.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesEmailVacationPut**
```swift
    open class func v1MailboxesEmailVacationPut(email: String, v1MailboxesEmailVacationPutRequest: V1MailboxesEmailVacationPutRequest, completion: @escaping (_ data: VacationResponder?, _ error: Error?) -> Void)
```

Set the vacation responder

Upsert — same endpoint creates or replaces the rule. Clears `synced_at`; the rule is staged on lockally until a sync worker pushes it to the mail server. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let v1MailboxesEmailVacationPutRequest = _v1_mailboxes__email__vacation_put_request(enabled: false, params: VacationParams(subject: "subject_example", body: "body_example", startsAt: Date(), endsAt: Date())) // V1MailboxesEmailVacationPutRequest | 

// Set the vacation responder
MailboxesAPI.v1MailboxesEmailVacationPut(email: email, v1MailboxesEmailVacationPutRequest: v1MailboxesEmailVacationPutRequest) { (response, error) in
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
 **v1MailboxesEmailVacationPutRequest** | [**V1MailboxesEmailVacationPutRequest**](V1MailboxesEmailVacationPutRequest.md) |  | 

### Return type

[**VacationResponder**](VacationResponder.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesGet**
```swift
    open class func v1MailboxesGet(limit: Int? = nil, completion: @escaping (_ data: V1MailboxesGet200Response?, _ error: Error?) -> Void)
```

List mailboxes

Returns mailboxes under the calling tenant — active and soft-deleted. `?limit=N` between 1 and 200 (default 50). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let limit = 987 // Int |  (optional) (default to 50)

// List mailboxes
MailboxesAPI.v1MailboxesGet(limit: limit) { (response, error) in
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
 **limit** | **Int** |  | [optional] [default to 50]

### Return type

[**V1MailboxesGet200Response**](V1MailboxesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1MailboxesPost**
```swift
    open class func v1MailboxesPost(v1MailboxesPostRequest: V1MailboxesPostRequest, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Create a mailbox

Creates a mailbox on a tenant-verified domain. If `password` is omitted, lockally generates a 16-char password and returns it in the response — shown once.  **Gate.** The mailbox's domain must already be registered AND verified for this tenant (via `/v1/domains` + `/v1/domains/{domain}/verify`).  **Idempotent.** Re-posting the same email returns the existing mailbox UNTOUCHED — password is NOT regenerated. To change a password, use PATCH instead. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let v1MailboxesPostRequest = _v1_mailboxes_post_request(email: "email_example", password: "password_example", quotaBytes: 123) // V1MailboxesPostRequest | 

// Create a mailbox
MailboxesAPI.v1MailboxesPost(v1MailboxesPostRequest: v1MailboxesPostRequest) { (response, error) in
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
 **v1MailboxesPostRequest** | [**V1MailboxesPostRequest**](V1MailboxesPostRequest.md) |  | 

### Return type

[**Mailbox**](Mailbox.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1VacationGet**
```swift
    open class func v1VacationGet(completion: @escaping (_ data: V1VacationGet200Response?, _ error: Error?) -> Void)
```

List all vacation responders

Returns every vacation responder for the calling tenant.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List all vacation responders
MailboxesAPI.v1VacationGet() { (response, error) in
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

[**V1VacationGet200Response**](V1VacationGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

