# ContactListsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addContactListMember**](ContactListsAPI.md#addcontactlistmember) | **POST** /v1/contact-lists/{id}/members | Add a member to a contact list
[**createContactList**](ContactListsAPI.md#createcontactlist) | **POST** /v1/contact-lists | Create a contact list
[**deleteContactList**](ContactListsAPI.md#deletecontactlist) | **DELETE** /v1/contact-lists/{id} | Delete a contact list
[**getContactList**](ContactListsAPI.md#getcontactlist) | **GET** /v1/contact-lists/{id} | Get a contact list with members
[**listContactLists**](ContactListsAPI.md#listcontactlists) | **GET** /v1/contact-lists | List contact lists
[**removeContactListMember**](ContactListsAPI.md#removecontactlistmember) | **DELETE** /v1/contact-lists/{id}/members/{contactId} | Remove a member from a contact list
[**updateContactList**](ContactListsAPI.md#updatecontactlist) | **PATCH** /v1/contact-lists/{id} | Update a contact list


# **addContactListMember**
```swift
    open class func addContactListMember(id: UUID, addContactListMemberRequest: AddContactListMemberRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Add a member to a contact list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let addContactListMemberRequest = addContactListMember_request(contactId: 123) // AddContactListMemberRequest | 

// Add a member to a contact list
ContactListsAPI.addContactListMember(id: id, addContactListMemberRequest: addContactListMemberRequest) { (response, error) in
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
 **addContactListMemberRequest** | [**AddContactListMemberRequest**](AddContactListMemberRequest.md) |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createContactList**
```swift
    open class func createContactList(createContactListRequest: CreateContactListRequest, completion: @escaping (_ data: ContactList?, _ error: Error?) -> Void)
```

Create a contact list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createContactListRequest = createContactList_request(name: "name_example", description: "description_example", visibility: "visibility_example") // CreateContactListRequest | 

// Create a contact list
ContactListsAPI.createContactList(createContactListRequest: createContactListRequest) { (response, error) in
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
 **createContactListRequest** | [**CreateContactListRequest**](CreateContactListRequest.md) |  | 

### Return type

[**ContactList**](ContactList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteContactList**
```swift
    open class func deleteContactList(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a contact list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a contact list
ContactListsAPI.deleteContactList(id: id) { (response, error) in
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

# **getContactList**
```swift
    open class func getContactList(id: UUID, completion: @escaping (_ data: GetContactList200Response?, _ error: Error?) -> Void)
```

Get a contact list with members

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a contact list with members
ContactListsAPI.getContactList(id: id) { (response, error) in
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

[**GetContactList200Response**](GetContactList200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listContactLists**
```swift
    open class func listContactLists(completion: @escaping (_ data: ListContactLists200Response?, _ error: Error?) -> Void)
```

List contact lists

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List contact lists
ContactListsAPI.listContactLists() { (response, error) in
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

[**ListContactLists200Response**](ListContactLists200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeContactListMember**
```swift
    open class func removeContactListMember(id: UUID, contactId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a member from a contact list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let contactId = 987 // UUID | 

// Remove a member from a contact list
ContactListsAPI.removeContactListMember(id: id, contactId: contactId) { (response, error) in
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
 **contactId** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateContactList**
```swift
    open class func updateContactList(id: UUID, updateContactListRequest: UpdateContactListRequest, completion: @escaping (_ data: ContactList?, _ error: Error?) -> Void)
```

Update a contact list

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateContactListRequest = updateContactList_request(name: "name_example", description: "description_example", visibility: "visibility_example") // UpdateContactListRequest | 

// Update a contact list
ContactListsAPI.updateContactList(id: id, updateContactListRequest: updateContactListRequest) { (response, error) in
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
 **updateContactListRequest** | [**UpdateContactListRequest**](UpdateContactListRequest.md) |  | 

### Return type

[**ContactList**](ContactList.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

