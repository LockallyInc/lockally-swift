# ContactsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createContact**](ContactsAPI.md#createcontact) | **POST** /v1/contacts | Create a contact
[**deleteContact**](ContactsAPI.md#deletecontact) | **DELETE** /v1/contacts/{id} | Delete a contact
[**getContact**](ContactsAPI.md#getcontact) | **GET** /v1/contacts/{id} | Get a contact
[**getContactLists**](ContactsAPI.md#getcontactlists) | **GET** /v1/contacts/{id}/lists | Get lists a contact belongs to
[**listContacts**](ContactsAPI.md#listcontacts) | **GET** /v1/contacts | List contacts
[**updateContact**](ContactsAPI.md#updatecontact) | **PATCH** /v1/contacts/{id} | Update a contact


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

