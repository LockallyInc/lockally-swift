# CalendarsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addCalendarMember**](CalendarsAPI.md#addcalendarmember) | **POST** /v1/calendars/{id}/members | Add a member to a calendar
[**createCalendar**](CalendarsAPI.md#createcalendar) | **POST** /v1/calendars | Create a calendar
[**createCalendarEvent**](CalendarsAPI.md#createcalendarevent) | **POST** /v1/calendars/{id}/events | Create an event in a calendar
[**createCalendarIntegration**](CalendarsAPI.md#createcalendarintegration) | **POST** /v1/calendar-integrations | Create a calendar integration
[**deleteCalendar**](CalendarsAPI.md#deletecalendar) | **DELETE** /v1/calendars/{id} | Delete a calendar
[**deleteCalendarEvent**](CalendarsAPI.md#deletecalendarevent) | **DELETE** /v1/calendars/{id}/events/{eventId} | Delete a calendar event
[**deleteCalendarIntegration**](CalendarsAPI.md#deletecalendarintegration) | **DELETE** /v1/calendar-integrations/{id} | Delete a calendar integration
[**getCalendar**](CalendarsAPI.md#getcalendar) | **GET** /v1/calendars/{id} | Get a calendar
[**getCalendarPolicies**](CalendarsAPI.md#getcalendarpolicies) | **GET** /v1/calendar-policies | Get calendar policies
[**getCalendarSecurity**](CalendarsAPI.md#getcalendarsecurity) | **GET** /v1/calendar-security | Get calendar security overview
[**listCalendarEvents**](CalendarsAPI.md#listcalendarevents) | **GET** /v1/calendars/{id}/events | List events in a calendar
[**listCalendarIntegrations**](CalendarsAPI.md#listcalendarintegrations) | **GET** /v1/calendar-integrations | List calendar integrations
[**listCalendarMembers**](CalendarsAPI.md#listcalendarmembers) | **GET** /v1/calendars/{id}/members | List calendar members
[**listCalendars**](CalendarsAPI.md#listcalendars) | **GET** /v1/calendars | List calendars
[**removeCalendarMember**](CalendarsAPI.md#removecalendarmember) | **DELETE** /v1/calendars/{id}/members/{memberId} | Remove a member from a calendar
[**syncCalendarIntegration**](CalendarsAPI.md#synccalendarintegration) | **POST** /v1/calendar-integrations/{id}/sync | Trigger sync for a calendar integration
[**updateCalendar**](CalendarsAPI.md#updatecalendar) | **PATCH** /v1/calendars/{id} | Update a calendar
[**updateCalendarEvent**](CalendarsAPI.md#updatecalendarevent) | **PATCH** /v1/calendars/{id}/events/{eventId} | Update a calendar event
[**updateCalendarIntegration**](CalendarsAPI.md#updatecalendarintegration) | **PATCH** /v1/calendar-integrations/{id} | Update a calendar integration
[**updateCalendarMember**](CalendarsAPI.md#updatecalendarmember) | **PATCH** /v1/calendars/{id}/members/{memberId} | Update a calendar member&#39;s role
[**updateCalendarPolicies**](CalendarsAPI.md#updatecalendarpolicies) | **PATCH** /v1/calendar-policies | Update calendar policies


# **addCalendarMember**
```swift
    open class func addCalendarMember(id: UUID, addCalendarMemberRequest: AddCalendarMemberRequest, completion: @escaping (_ data: CalendarMember?, _ error: Error?) -> Void)
```

Add a member to a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let addCalendarMemberRequest = addCalendarMember_request(userEmail: "userEmail_example", role: "role_example") // AddCalendarMemberRequest | 

// Add a member to a calendar
CalendarsAPI.addCalendarMember(id: id, addCalendarMemberRequest: addCalendarMemberRequest) { (response, error) in
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
 **addCalendarMemberRequest** | [**AddCalendarMemberRequest**](AddCalendarMemberRequest.md) |  | 

### Return type

[**CalendarMember**](CalendarMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCalendar**
```swift
    open class func createCalendar(createCalendarRequest: CreateCalendarRequest, completion: @escaping (_ data: LockallyCalendar?, _ error: Error?) -> Void)
```

Create a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createCalendarRequest = createCalendar_request(name: "name_example", color: "color_example", ownerEmail: "ownerEmail_example", description: "description_example", visibility: "visibility_example") // CreateCalendarRequest | 

// Create a calendar
CalendarsAPI.createCalendar(createCalendarRequest: createCalendarRequest) { (response, error) in
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
 **createCalendarRequest** | [**CreateCalendarRequest**](CreateCalendarRequest.md) |  | 

### Return type

[**LockallyCalendar**](LockallyCalendar.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCalendarEvent**
```swift
    open class func createCalendarEvent(id: UUID, createCalendarEventRequest: CreateCalendarEventRequest, completion: @escaping (_ data: CalendarEvent?, _ error: Error?) -> Void)
```

Create an event in a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let createCalendarEventRequest = createCalendarEvent_request(title: "title_example", description: "description_example", location: "location_example", startsAt: Date(), endsAt: Date(), allDay: false) // CreateCalendarEventRequest | 

// Create an event in a calendar
CalendarsAPI.createCalendarEvent(id: id, createCalendarEventRequest: createCalendarEventRequest) { (response, error) in
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
 **createCalendarEventRequest** | [**CreateCalendarEventRequest**](CreateCalendarEventRequest.md) |  | 

### Return type

[**CalendarEvent**](CalendarEvent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCalendarIntegration**
```swift
    open class func createCalendarIntegration(createCalendarIntegrationRequest: CreateCalendarIntegrationRequest, completion: @escaping (_ data: CalendarIntegration?, _ error: Error?) -> Void)
```

Create a calendar integration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createCalendarIntegrationRequest = createCalendarIntegration_request(provider: "provider_example", label: "label_example") // CreateCalendarIntegrationRequest | 

// Create a calendar integration
CalendarsAPI.createCalendarIntegration(createCalendarIntegrationRequest: createCalendarIntegrationRequest) { (response, error) in
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
 **createCalendarIntegrationRequest** | [**CreateCalendarIntegrationRequest**](CreateCalendarIntegrationRequest.md) |  | 

### Return type

[**CalendarIntegration**](CalendarIntegration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCalendar**
```swift
    open class func deleteCalendar(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a calendar
CalendarsAPI.deleteCalendar(id: id) { (response, error) in
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

# **deleteCalendarEvent**
```swift
    open class func deleteCalendarEvent(id: UUID, eventId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a calendar event

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let eventId = 987 // UUID | 

// Delete a calendar event
CalendarsAPI.deleteCalendarEvent(id: id, eventId: eventId) { (response, error) in
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
 **eventId** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCalendarIntegration**
```swift
    open class func deleteCalendarIntegration(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a calendar integration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a calendar integration
CalendarsAPI.deleteCalendarIntegration(id: id) { (response, error) in
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

# **getCalendar**
```swift
    open class func getCalendar(id: UUID, completion: @escaping (_ data: LockallyCalendar?, _ error: Error?) -> Void)
```

Get a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a calendar
CalendarsAPI.getCalendar(id: id) { (response, error) in
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

[**LockallyCalendar**](LockallyCalendar.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCalendarPolicies**
```swift
    open class func getCalendarPolicies(completion: @escaping (_ data: CalendarPolicies?, _ error: Error?) -> Void)
```

Get calendar policies

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get calendar policies
CalendarsAPI.getCalendarPolicies() { (response, error) in
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

[**CalendarPolicies**](CalendarPolicies.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCalendarSecurity**
```swift
    open class func getCalendarSecurity(completion: @escaping (_ data: GetCalendarSecurity200Response?, _ error: Error?) -> Void)
```

Get calendar security overview

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// Get calendar security overview
CalendarsAPI.getCalendarSecurity() { (response, error) in
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

[**GetCalendarSecurity200Response**](GetCalendarSecurity200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCalendarEvents**
```swift
    open class func listCalendarEvents(id: UUID, from: Date? = nil, to: Date? = nil, completion: @escaping (_ data: ListCalendarEvents200Response?, _ error: Error?) -> Void)
```

List events in a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let from = Date() // Date |  (optional)
let to = Date() // Date |  (optional)

// List events in a calendar
CalendarsAPI.listCalendarEvents(id: id, from: from, to: to) { (response, error) in
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
 **from** | **Date** |  | [optional] 
 **to** | **Date** |  | [optional] 

### Return type

[**ListCalendarEvents200Response**](ListCalendarEvents200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCalendarIntegrations**
```swift
    open class func listCalendarIntegrations(completion: @escaping (_ data: ListCalendarIntegrations200Response?, _ error: Error?) -> Void)
```

List calendar integrations

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List calendar integrations
CalendarsAPI.listCalendarIntegrations() { (response, error) in
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

[**ListCalendarIntegrations200Response**](ListCalendarIntegrations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCalendarMembers**
```swift
    open class func listCalendarMembers(id: UUID, completion: @escaping (_ data: ListCalendarMembers200Response?, _ error: Error?) -> Void)
```

List calendar members

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// List calendar members
CalendarsAPI.listCalendarMembers(id: id) { (response, error) in
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

[**ListCalendarMembers200Response**](ListCalendarMembers200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCalendars**
```swift
    open class func listCalendars(completion: @escaping (_ data: ListCalendars200Response?, _ error: Error?) -> Void)
```

List calendars

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List calendars
CalendarsAPI.listCalendars() { (response, error) in
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

[**ListCalendars200Response**](ListCalendars200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeCalendarMember**
```swift
    open class func removeCalendarMember(id: UUID, memberId: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Remove a member from a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let memberId = 987 // UUID | 

// Remove a member from a calendar
CalendarsAPI.removeCalendarMember(id: id, memberId: memberId) { (response, error) in
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
 **memberId** | **UUID** |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **syncCalendarIntegration**
```swift
    open class func syncCalendarIntegration(id: UUID, completion: @escaping (_ data: CalendarIntegration?, _ error: Error?) -> Void)
```

Trigger sync for a calendar integration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Trigger sync for a calendar integration
CalendarsAPI.syncCalendarIntegration(id: id) { (response, error) in
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

[**CalendarIntegration**](CalendarIntegration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCalendar**
```swift
    open class func updateCalendar(id: UUID, updateCalendarRequest: UpdateCalendarRequest, completion: @escaping (_ data: LockallyCalendar?, _ error: Error?) -> Void)
```

Update a calendar

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateCalendarRequest = updateCalendar_request(name: "name_example", color: "color_example", ownerEmail: "ownerEmail_example", description: "description_example", visibility: "visibility_example") // UpdateCalendarRequest | 

// Update a calendar
CalendarsAPI.updateCalendar(id: id, updateCalendarRequest: updateCalendarRequest) { (response, error) in
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
 **updateCalendarRequest** | [**UpdateCalendarRequest**](UpdateCalendarRequest.md) |  | 

### Return type

[**LockallyCalendar**](LockallyCalendar.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCalendarEvent**
```swift
    open class func updateCalendarEvent(id: UUID, eventId: UUID, updateCalendarEventRequest: UpdateCalendarEventRequest, completion: @escaping (_ data: CalendarEvent?, _ error: Error?) -> Void)
```

Update a calendar event

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let eventId = 987 // UUID | 
let updateCalendarEventRequest = updateCalendarEvent_request(title: "title_example", description: "description_example", location: "location_example", startsAt: Date(), endsAt: Date(), allDay: false) // UpdateCalendarEventRequest | 

// Update a calendar event
CalendarsAPI.updateCalendarEvent(id: id, eventId: eventId, updateCalendarEventRequest: updateCalendarEventRequest) { (response, error) in
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
 **eventId** | **UUID** |  | 
 **updateCalendarEventRequest** | [**UpdateCalendarEventRequest**](UpdateCalendarEventRequest.md) |  | 

### Return type

[**CalendarEvent**](CalendarEvent.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCalendarIntegration**
```swift
    open class func updateCalendarIntegration(id: UUID, updateCalendarIntegrationRequest: UpdateCalendarIntegrationRequest, completion: @escaping (_ data: CalendarIntegration?, _ error: Error?) -> Void)
```

Update a calendar integration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateCalendarIntegrationRequest = updateCalendarIntegration_request(label: "label_example", status: "status_example", errorMessage: "errorMessage_example") // UpdateCalendarIntegrationRequest | 

// Update a calendar integration
CalendarsAPI.updateCalendarIntegration(id: id, updateCalendarIntegrationRequest: updateCalendarIntegrationRequest) { (response, error) in
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
 **updateCalendarIntegrationRequest** | [**UpdateCalendarIntegrationRequest**](UpdateCalendarIntegrationRequest.md) |  | 

### Return type

[**CalendarIntegration**](CalendarIntegration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCalendarMember**
```swift
    open class func updateCalendarMember(id: UUID, memberId: UUID, updateCalendarMemberRequest: UpdateCalendarMemberRequest, completion: @escaping (_ data: CalendarMember?, _ error: Error?) -> Void)
```

Update a calendar member's role

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let memberId = 987 // UUID | 
let updateCalendarMemberRequest = updateCalendarMember_request(role: "role_example") // UpdateCalendarMemberRequest | 

// Update a calendar member's role
CalendarsAPI.updateCalendarMember(id: id, memberId: memberId, updateCalendarMemberRequest: updateCalendarMemberRequest) { (response, error) in
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
 **memberId** | **UUID** |  | 
 **updateCalendarMemberRequest** | [**UpdateCalendarMemberRequest**](UpdateCalendarMemberRequest.md) |  | 

### Return type

[**CalendarMember**](CalendarMember.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCalendarPolicies**
```swift
    open class func updateCalendarPolicies(updateCalendarPoliciesRequest: UpdateCalendarPoliciesRequest, completion: @escaping (_ data: CalendarPolicies?, _ error: Error?) -> Void)
```

Update calendar policies

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let updateCalendarPoliciesRequest = updateCalendarPolicies_request(maxMeetingDurationMins: 123, workingHoursStart: "workingHoursStart_example", workingHoursEnd: "workingHoursEnd_example", bookingWindowDays: 123, recurringMeetingLimit: 123, resourceApprovalMode: "resourceApprovalMode_example", externalInvitesAllowed: false, externalSharingAllowed: false, publicLinksEnabled: false) // UpdateCalendarPoliciesRequest | 

// Update calendar policies
CalendarsAPI.updateCalendarPolicies(updateCalendarPoliciesRequest: updateCalendarPoliciesRequest) { (response, error) in
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
 **updateCalendarPoliciesRequest** | [**UpdateCalendarPoliciesRequest**](UpdateCalendarPoliciesRequest.md) |  | 

### Return type

[**CalendarPolicies**](CalendarPolicies.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

