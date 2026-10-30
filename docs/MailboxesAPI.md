# MailboxesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSharedMember**](MailboxesAPI.md#addsharedmember) | **POST** /v1/mailboxes/{email}/members | Add a shared mailbox member
[**createMailbox**](MailboxesAPI.md#createmailbox) | **POST** /v1/mailboxes | Create a mailbox
[**deleteMailbox**](MailboxesAPI.md#deletemailbox) | **DELETE** /v1/mailboxes/{email} | Soft-delete a mailbox
[**deleteVacationResponder**](MailboxesAPI.md#deletevacationresponder) | **DELETE** /v1/mailboxes/{email}/vacation | Remove the vacation responder
[**downloadMailboxExport**](MailboxesAPI.md#downloadmailboxexport) | **GET** /v1/mailboxes/{email}/export/download | Download a previously-issued mailbox export
[**exportMailbox**](MailboxesAPI.md#exportmailbox) | **POST** /v1/mailboxes/{email}/export | Request a mailbox export
[**getMailbox**](MailboxesAPI.md#getmailbox) | **GET** /v1/mailboxes/{email} | Get a mailbox
[**getVacationResponder**](MailboxesAPI.md#getvacationresponder) | **GET** /v1/mailboxes/{email}/vacation | Get the vacation responder
[**listMailboxes**](MailboxesAPI.md#listmailboxes) | **GET** /v1/mailboxes | List mailboxes
[**listSharedMembers**](MailboxesAPI.md#listsharedmembers) | **GET** /v1/mailboxes/{email}/members | List shared mailbox members
[**listVacationResponders**](MailboxesAPI.md#listvacationresponders) | **GET** /v1/vacation | List all vacation responders
[**removeSharedMember**](MailboxesAPI.md#removesharedmember) | **DELETE** /v1/mailboxes/{email}/members/{memberEmail} | Remove a shared mailbox member
[**setVacationResponder**](MailboxesAPI.md#setvacationresponder) | **PUT** /v1/mailboxes/{email}/vacation | Set the vacation responder
[**updateMailbox**](MailboxesAPI.md#updatemailbox) | **PATCH** /v1/mailboxes/{email} | Update a mailbox


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

# **createMailbox**
```swift
    open class func createMailbox(createMailboxRequest: CreateMailboxRequest, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Create a mailbox

Creates a mailbox on a tenant-verified domain. If `password` is omitted, lockally generates a 16-char password and returns it in the response, shown once.  **Gate.** The mailbox's domain must already be registered AND verified for this tenant (via `/v1/domains` + `/v1/domains/{domain}/verify`).  **Idempotent.** Re-posting the same email returns the existing mailbox UNTOUCHED, password is NOT regenerated. To change a password, use PATCH instead. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createMailboxRequest = createMailbox_request(email: "email_example", password: "password_example", quotaBytes: 123) // CreateMailboxRequest | 

// Create a mailbox
MailboxesAPI.createMailbox(createMailboxRequest: createMailboxRequest) { (response, error) in
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
 **createMailboxRequest** | [**CreateMailboxRequest**](CreateMailboxRequest.md) |  | 

### Return type

[**Mailbox**](Mailbox.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMailbox**
```swift
    open class func deleteMailbox(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Soft-delete a mailbox

Sets `soft_deleted_at = now()` and `hard_delete_after = now() + 90d` per design D25. A background sweep (planned) will hard-delete after the window. The mailbox is also disabled immediately. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Soft-delete a mailbox
MailboxesAPI.deleteMailbox(email: email) { (response, error) in
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

# **deleteVacationResponder**
```swift
    open class func deleteVacationResponder(email: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove the vacation responder

Idempotent, 204 whether or not a row existed.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Remove the vacation responder
MailboxesAPI.deleteVacationResponder(email: email) { (response, error) in
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

# **downloadMailboxExport**
```swift
    open class func downloadMailboxExport(email: String, token: String, completion: @escaping (_ data: URL?, _ error: Error?) -> Void)
```

Download a previously-issued mailbox export

Public endpoint (no Authorization header). Validates the one-shot token from the URL, marks it used, and streams an mbox file. Second GET with the same token returns 404, tokens are single-use. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let token = "token_example" // String | 

// Download a previously-issued mailbox export
MailboxesAPI.downloadMailboxExport(email: email, token: token) { (response, error) in
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

# **exportMailbox**
```swift
    open class func exportMailbox(email: String, completion: @escaping (_ data: ExportMailbox201Response?, _ error: Error?) -> Void)
```

Request a mailbox export

Issues a one-shot \"presigned\" download URL for the mailbox's content in mbox format. The URL works without an Authorization header, the token in the query string is the authz. TTL is 5 minutes; the token is consumed on first GET.  **v1 caveat:** the synthesized mbox only contains outbound mail (sent mail only). A later version will cover received mail for full inbox + folder structure + flags. The endpoint contract stays unchanged.  **Scope changed:** this used to accept `mailboxes:read`. It takes any mailbox in the tenant and returns that mailbox's mail, so it now requires `tenant:admin`, matching `POST /v1/ediscovery/export`. A key scoped `mailboxes:read` gets 403 and has to be reissued; admin console sessions are unaffected. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Request a mailbox export
MailboxesAPI.exportMailbox(email: email) { (response, error) in
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

[**ExportMailbox201Response**](ExportMailbox201Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMailbox**
```swift
    open class func getMailbox(email: String, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Get a mailbox

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Get a mailbox
MailboxesAPI.getMailbox(email: email) { (response, error) in
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

# **getVacationResponder**
```swift
    open class func getVacationResponder(email: String, completion: @escaping (_ data: VacationResponder?, _ error: Error?) -> Void)
```

Get the vacation responder

Returns the stored vacation rule or 404 if none is set.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 

// Get the vacation responder
MailboxesAPI.getVacationResponder(email: email) { (response, error) in
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

# **listMailboxes**
```swift
    open class func listMailboxes(limit: Int? = nil, completion: @escaping (_ data: ListMailboxes200Response?, _ error: Error?) -> Void)
```

List mailboxes

Returns mailboxes under the calling tenant, active and soft-deleted. `?limit=N` between 1 and 200 (default 50). 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let limit = 987 // Int |  (optional) (default to 50)

// List mailboxes
MailboxesAPI.listMailboxes(limit: limit) { (response, error) in
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

[**ListMailboxes200Response**](ListMailboxes200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
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

# **listVacationResponders**
```swift
    open class func listVacationResponders(completion: @escaping (_ data: ListVacationResponders200Response?, _ error: Error?) -> Void)
```

List all vacation responders

Returns every vacation responder for the calling tenant.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List all vacation responders
MailboxesAPI.listVacationResponders() { (response, error) in
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

[**ListVacationResponders200Response**](ListVacationResponders200Response.md)

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

# **setVacationResponder**
```swift
    open class func setVacationResponder(email: String, setVacationResponderRequest: SetVacationResponderRequest, completion: @escaping (_ data: VacationResponder?, _ error: Error?) -> Void)
```

Set the vacation responder

Upsert, same endpoint creates or replaces the rule. Clears `synced_at`; the rule is staged until a later sync pushes it to the mail server. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let setVacationResponderRequest = setVacationResponder_request(enabled: false, params: VacationParams(subject: "subject_example", body: "body_example", startsAt: Date(), endsAt: Date())) // SetVacationResponderRequest | 

// Set the vacation responder
MailboxesAPI.setVacationResponder(email: email, setVacationResponderRequest: setVacationResponderRequest) { (response, error) in
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
 **setVacationResponderRequest** | [**SetVacationResponderRequest**](SetVacationResponderRequest.md) |  | 

### Return type

[**VacationResponder**](VacationResponder.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMailbox**
```swift
    open class func updateMailbox(email: String, updateMailboxRequest: UpdateMailboxRequest, completion: @escaping (_ data: Mailbox?, _ error: Error?) -> Void)
```

Update a mailbox

Supply at least one of `password`, `quota_bytes`, `disabled`. Returns the updated mailbox. 

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let email = "email_example" // String | 
let updateMailboxRequest = updateMailbox_request(password: "password_example", quotaBytes: 123, disabled: false) // UpdateMailboxRequest | 

// Update a mailbox
MailboxesAPI.updateMailbox(email: email, updateMailboxRequest: updateMailboxRequest) { (response, error) in
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
 **updateMailboxRequest** | [**UpdateMailboxRequest**](UpdateMailboxRequest.md) |  | 

### Return type

[**Mailbox**](Mailbox.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

