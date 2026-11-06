# ContactsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bulkUpsertExternalContacts**](ContactsAPI.md#bulkupsertexternalcontacts) | **PUT** /v1/contacts/external/{system} | Create or update up to 500 contacts by their ids in another system
[**createContact**](ContactsAPI.md#createcontact) | **POST** /v1/contacts | Create a contact
[**deleteContact**](ContactsAPI.md#deletecontact) | **DELETE** /v1/contacts/{id} | Delete a contact
[**deleteExternalContact**](ContactsAPI.md#deleteexternalcontact) | **DELETE** /v1/contacts/external/{system}/{external_id} | Delete a contact by its id in another system
[**getContact**](ContactsAPI.md#getcontact) | **GET** /v1/contacts/{id} | Get a contact
[**getContactLists**](ContactsAPI.md#getcontactlists) | **GET** /v1/contacts/{id}/lists | Get lists a contact belongs to
[**getExternalContact**](ContactsAPI.md#getexternalcontact) | **GET** /v1/contacts/external/{system}/{external_id} | Get a contact by its id in another system
[**listContacts**](ContactsAPI.md#listcontacts) | **GET** /v1/contacts | List contacts
[**updateContact**](ContactsAPI.md#updatecontact) | **PATCH** /v1/contacts/{id} | Update a contact
[**upsertExternalContact**](ContactsAPI.md#upsertexternalcontact) | **PUT** /v1/contacts/external/{system}/{external_id} | Create or update a contact by its id in another system


# **bulkUpsertExternalContacts**
```swift
    open class func bulkUpsertExternalContacts(system: String, bulkUpsertExternalContactsRequest: BulkUpsertExternalContactsRequest, completion: @escaping (_ data: BulkUpsertExternalContacts200Response?, _ error: Error?) -> Void)
```

Create or update up to 500 contacts by their ids in another system

For a sync. Each row stands alone: a bad row is reported in `results` with its index and the rest are stored, so the response is 200 whenever the request itself is well formed. Read `failed` and `results`. Two rows with the same `external_id` in one request are refused (the later one), because which is current cannot be known. Rerunning the same payload updates rather than duplicates.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let system = "system_example" // String | 
let bulkUpsertExternalContactsRequest = bulkUpsertExternalContacts_request(contacts: [bulkUpsertExternalContacts_request_contacts_inner(email: "email_example", name: "name_example", phone: "phone_example", company: "company_example", notes: "notes_example", contactType: "contactType_example", department: "department_example", role: "role_example", status: "status_example", externalId: "externalId_example")]) // BulkUpsertExternalContactsRequest | 

// Create or update up to 500 contacts by their ids in another system
ContactsAPI.bulkUpsertExternalContacts(system: system, bulkUpsertExternalContactsRequest: bulkUpsertExternalContactsRequest) { (response, error) in
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
 **system** | **String** |  | 
 **bulkUpsertExternalContactsRequest** | [**BulkUpsertExternalContactsRequest**](BulkUpsertExternalContactsRequest.md) |  | 

### Return type

[**BulkUpsertExternalContacts200Response**](BulkUpsertExternalContacts200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createContact**
```swift
    open class func createContact(createContactRequest: CreateContactRequest, completion: @escaping (_ data: Contact?, _ error: Error?) -> Void)
```

Create a contact

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createContactRequest = createContact_request(name: "name_example", email: "email_example", phone: "phone_example", company: "company_example", notes: "notes_example", contactType: "contactType_example", department: "department_example", role: "role_example") // CreateContactRequest | 

// Create a contact
ContactsAPI.createContact(createContactRequest: createContactRequest) { (response, error) in
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
 **createContactRequest** | [**CreateContactRequest**](CreateContactRequest.md) |  | 

### Return type

[**Contact**](Contact.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteContact**
```swift
    open class func deleteContact(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a contact

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a contact
ContactsAPI.deleteContact(id: id) { (response, error) in
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
 **id** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteExternalContact**
```swift
    open class func deleteExternalContact(system: String, externalId: String, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a contact by its id in another system

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let system = "system_example" // String | Your label for the system the record comes from, for example `salesforce`, `hubspot` or `odoo`. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded).
let externalId = "externalId_example" // String | The record's id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it.

// Delete a contact by its id in another system
ContactsAPI.deleteExternalContact(system: system, externalId: externalId) { (response, error) in
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
 **system** | **String** | Your label for the system the record comes from, for example &#x60;salesforce&#x60;, &#x60;hubspot&#x60; or &#x60;odoo&#x60;. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded). | 
 **externalId** | **String** | The record&#39;s id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it. | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContact**
```swift
    open class func getContact(id: UUID, completion: @escaping (_ data: Contact?, _ error: Error?) -> Void)
```

Get a contact

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a contact
ContactsAPI.getContact(id: id) { (response, error) in
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
 **id** | **UUID** |  | 

### Return type

[**Contact**](Contact.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getContactLists**
```swift
    open class func getContactLists(id: UUID, completion: @escaping (_ data: GetContactLists200Response?, _ error: Error?) -> Void)
```

Get lists a contact belongs to

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get lists a contact belongs to
ContactsAPI.getContactLists(id: id) { (response, error) in
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
 **id** | **UUID** |  | 

### Return type

[**GetContactLists200Response**](GetContactLists200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getExternalContact**
```swift
    open class func getExternalContact(system: String, externalId: String, completion: @escaping (_ data: Contact?, _ error: Error?) -> Void)
```

Get a contact by its id in another system

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let system = "system_example" // String | Your label for the system the record comes from, for example `salesforce`, `hubspot` or `odoo`. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded).
let externalId = "externalId_example" // String | The record's id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it.

// Get a contact by its id in another system
ContactsAPI.getExternalContact(system: system, externalId: externalId) { (response, error) in
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
 **system** | **String** | Your label for the system the record comes from, for example &#x60;salesforce&#x60;, &#x60;hubspot&#x60; or &#x60;odoo&#x60;. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded). | 
 **externalId** | **String** | The record&#39;s id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it. | 

### Return type

[**Contact**](Contact.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listContacts**
```swift
    open class func listContacts(q: String? = nil, type: String? = nil, department: String? = nil, status: String? = nil, source: String? = nil, completion: @escaping (_ data: ListContacts200Response?, _ error: Error?) -> Void)
```

List contacts

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let q = "q_example" // String | Free-text search across name, email, company (optional)
let type = "type_example" // String | Filter by contact_type (optional)
let department = "department_example" // String | Filter by department (optional)
let status = "status_example" // String | Filter by status (optional)
let source = "source_example" // String | Filter by source (optional)

// List contacts
ContactsAPI.listContacts(q: q, type: type, department: department, status: status, source: source) { (response, error) in
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
 **q** | **String** | Free-text search across name, email, company | [optional] 
 **type** | **String** | Filter by contact_type | [optional] 
 **department** | **String** | Filter by department | [optional] 
 **status** | **String** | Filter by status | [optional] 
 **source** | **String** | Filter by source | [optional] 

### Return type

[**ListContacts200Response**](ListContacts200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateContact**
```swift
    open class func updateContact(id: UUID, updateContactRequest: UpdateContactRequest, completion: @escaping (_ data: Contact?, _ error: Error?) -> Void)
```

Update a contact

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateContactRequest = updateContact_request(name: "name_example", email: "email_example", phone: "phone_example", company: "company_example", notes: "notes_example", contactType: "contactType_example", department: "department_example", role: "role_example", status: "status_example") // UpdateContactRequest | 

// Update a contact
ContactsAPI.updateContact(id: id, updateContactRequest: updateContactRequest) { (response, error) in
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
 **id** | **UUID** |  | 
 **updateContactRequest** | [**UpdateContactRequest**](UpdateContactRequest.md) |  | 

### Return type

[**Contact**](Contact.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **upsertExternalContact**
```swift
    open class func upsertExternalContact(system: String, externalId: String, externalContactInput: ExternalContactInput, completion: @escaping (_ data: Contact?, _ error: Error?) -> Void)
```

Create or update a contact by its id in another system

Idempotent: the path is the identity, so sending the same request twice cannot create a second contact, and you never need to store our id. Returns 201 when the contact was created and 200 when it already existed. The body is the full representation: a field you leave out is cleared. Email is an ordinary attribute, not a key, so changing it updates the same contact. `mailboxes:write` is also accepted.

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let system = "system_example" // String | Your label for the system the record comes from, for example `salesforce`, `hubspot` or `odoo`. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded).
let externalId = "externalId_example" // String | The record's id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it.
let externalContactInput = ExternalContactInput(email: "email_example", name: "name_example", phone: "phone_example", company: "company_example", notes: "notes_example", contactType: "contactType_example", department: "department_example", role: "role_example", status: "status_example") // ExternalContactInput | 

// Create or update a contact by its id in another system
ContactsAPI.upsertExternalContact(system: system, externalId: externalId, externalContactInput: externalContactInput) { (response, error) in
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
 **system** | **String** | Your label for the system the record comes from, for example &#x60;salesforce&#x60;, &#x60;hubspot&#x60; or &#x60;odoo&#x60;. 1 to 64 characters: lowercase letters, digits, dot, underscore or hyphen (upper case is folded). | 
 **externalId** | **String** | The record&#39;s id in that system, kept exactly as given (case matters). 1 to 255 characters, no spaces. URL-encode it. | 
 **externalContactInput** | [**ExternalContactInput**](ExternalContactInput.md) |  | 

### Return type

[**Contact**](Contact.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

