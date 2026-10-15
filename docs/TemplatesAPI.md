# TemplatesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createTemplate**](TemplatesAPI.md#createtemplate) | **POST** /v1/templates | Create a template
[**deleteTemplate**](TemplatesAPI.md#deletetemplate) | **DELETE** /v1/templates/{id} | Delete a template
[**getTemplate**](TemplatesAPI.md#gettemplate) | **GET** /v1/templates/{id} | Get a template
[**listTemplates**](TemplatesAPI.md#listtemplates) | **GET** /v1/templates | List templates
[**updateTemplate**](TemplatesAPI.md#updatetemplate) | **PUT** /v1/templates/{id} | Update a template


# **createTemplate**
```swift
    open class func createTemplate(templateInput: TemplateInput, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Create a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let templateInput = TemplateInput(name: "name_example", subject: "subject_example", html: "html_example", text: "text_example") // TemplateInput | 

// Create a template
TemplatesAPI.createTemplate(templateInput: templateInput) { (response, error) in
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
 **templateInput** | [**TemplateInput**](TemplateInput.md) |  | 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTemplate**
```swift
    open class func deleteTemplate(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a template
TemplatesAPI.deleteTemplate(id: id) { (response, error) in
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

# **getTemplate**
```swift
    open class func getTemplate(id: UUID, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Get a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a template
TemplatesAPI.getTemplate(id: id) { (response, error) in
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

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTemplates**
```swift
    open class func listTemplates(completion: @escaping (_ data: ListTemplates200Response?, _ error: Error?) -> Void)
```

List templates

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List templates
TemplatesAPI.listTemplates() { (response, error) in
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

[**ListTemplates200Response**](ListTemplates200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTemplate**
```swift
    open class func updateTemplate(id: UUID, templateInput: TemplateInput, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Update a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let templateInput = TemplateInput(name: "name_example", subject: "subject_example", html: "html_example", text: "text_example") // TemplateInput | 

// Update a template
TemplatesAPI.updateTemplate(id: id, templateInput: templateInput) { (response, error) in
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
 **templateInput** | [**TemplateInput**](TemplateInput.md) |  | 

### Return type

[**Template**](Template.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

