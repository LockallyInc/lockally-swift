# TemplatesAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**v1TemplatesGet**](TemplatesAPI.md#v1templatesget) | **GET** /v1/templates | List templates
[**v1TemplatesIdDelete**](TemplatesAPI.md#v1templatesiddelete) | **DELETE** /v1/templates/{id} | Delete a template
[**v1TemplatesIdGet**](TemplatesAPI.md#v1templatesidget) | **GET** /v1/templates/{id} | Get a template
[**v1TemplatesIdPut**](TemplatesAPI.md#v1templatesidput) | **PUT** /v1/templates/{id} | Update a template
[**v1TemplatesPost**](TemplatesAPI.md#v1templatespost) | **POST** /v1/templates | Create a template


# **v1TemplatesGet**
```swift
    open class func v1TemplatesGet(completion: @escaping (_ data: V1TemplatesGet200Response?, _ error: Error?) -> Void)
```

List templates

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List templates
TemplatesAPI.v1TemplatesGet() { (response, error) in
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

[**V1TemplatesGet200Response**](V1TemplatesGet200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **v1TemplatesIdDelete**
```swift
    open class func v1TemplatesIdDelete(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a template
TemplatesAPI.v1TemplatesIdDelete(id: id) { (response, error) in
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

# **v1TemplatesIdGet**
```swift
    open class func v1TemplatesIdGet(id: UUID, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Get a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a template
TemplatesAPI.v1TemplatesIdGet(id: id) { (response, error) in
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

# **v1TemplatesIdPut**
```swift
    open class func v1TemplatesIdPut(id: UUID, templateInput: TemplateInput, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Update a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let templateInput = TemplateInput(name: "name_example", subject: "subject_example", html: "html_example", text: "text_example") // TemplateInput | 

// Update a template
TemplatesAPI.v1TemplatesIdPut(id: id, templateInput: templateInput) { (response, error) in
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

# **v1TemplatesPost**
```swift
    open class func v1TemplatesPost(templateInput: TemplateInput, completion: @escaping (_ data: Template?, _ error: Error?) -> Void)
```

Create a template

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let templateInput = TemplateInput(name: "name_example", subject: "subject_example", html: "html_example", text: "text_example") // TemplateInput | 

// Create a template
TemplatesAPI.v1TemplatesPost(templateInput: templateInput) { (response, error) in
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

