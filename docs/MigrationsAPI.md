# MigrationsAPI

All URIs are relative to *https://api.lockally.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelMigration**](MigrationsAPI.md#cancelmigration) | **POST** /v1/migrations/{id}/cancel | Cancel a running migration
[**checkMigrationDNS**](MigrationsAPI.md#checkmigrationdns) | **GET** /v1/migrations/{id}/dns-check | Check DNS readiness for cutover
[**createMigration**](MigrationsAPI.md#createmigration) | **POST** /v1/migrations | Create a migration
[**createMigrationCredential**](MigrationsAPI.md#createmigrationcredential) | **POST** /v1/migrations/credentials | Store a migration credential
[**deleteMigration**](MigrationsAPI.md#deletemigration) | **DELETE** /v1/migrations/{id} | Delete a migration
[**deleteMigrationCredential**](MigrationsAPI.md#deletemigrationcredential) | **DELETE** /v1/migrations/credentials/{id} | Delete a migration credential
[**deltaSyncMigration**](MigrationsAPI.md#deltasyncmigration) | **POST** /v1/migrations/{id}/delta-sync | Run a delta sync
[**discoverMigration**](MigrationsAPI.md#discovermigration) | **POST** /v1/migrations/{id}/discover | Discover source mailboxes
[**finalSyncMigration**](MigrationsAPI.md#finalsyncmigration) | **POST** /v1/migrations/{id}/final-sync | Run the final sync before cutover
[**getMigration**](MigrationsAPI.md#getmigration) | **GET** /v1/migrations/{id} | Get a migration
[**getMigrationProgress**](MigrationsAPI.md#getmigrationprogress) | **GET** /v1/migrations/{id}/progress | Get migration progress
[**listMigrationCredentials**](MigrationsAPI.md#listmigrationcredentials) | **GET** /v1/migrations/credentials | List migration credentials
[**listMigrationEvents**](MigrationsAPI.md#listmigrationevents) | **GET** /v1/migrations/{id}/events | List migration events
[**listMigrationMailboxes**](MigrationsAPI.md#listmigrationmailboxes) | **GET** /v1/migrations/{id}/mailboxes | List migration mailboxes
[**listMigrations**](MigrationsAPI.md#listmigrations) | **GET** /v1/migrations | List migrations
[**mapMigration**](MigrationsAPI.md#mapmigration) | **POST** /v1/migrations/{id}/map | Map source to destination mailboxes
[**retryMigration**](MigrationsAPI.md#retrymigration) | **POST** /v1/migrations/{id}/retry | Retry a failed or cancelled migration
[**startMigration**](MigrationsAPI.md#startmigration) | **POST** /v1/migrations/{id}/start | Start the migration
[**updateMigration**](MigrationsAPI.md#updatemigration) | **PATCH** /v1/migrations/{id} | Update a migration
[**updateMigrationMailbox**](MigrationsAPI.md#updatemigrationmailbox) | **PATCH** /v1/migrations/{id}/mailboxes/{mbxId} | Update a migration mailbox
[**validateMigration**](MigrationsAPI.md#validatemigration) | **POST** /v1/migrations/{id}/validate | Validate migrated data


# **cancelMigration**
```swift
    open class func cancelMigration(id: UUID, completion: @escaping (_ data: DiscoverMigration202Response?, _ error: Error?) -> Void)
```

Cancel a running migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Cancel a running migration
MigrationsAPI.cancelMigration(id: id) { (response, error) in
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

[**DiscoverMigration202Response**](DiscoverMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **checkMigrationDNS**
```swift
    open class func checkMigrationDNS(id: UUID, completion: @escaping (_ data: JSONValue?, _ error: Error?) -> Void)
```

Check DNS readiness for cutover

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Check DNS readiness for cutover
MigrationsAPI.checkMigrationDNS(id: id) { (response, error) in
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

**JSONValue**

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMigration**
```swift
    open class func createMigration(createMigrationRequest: CreateMigrationRequest, completion: @escaping (_ data: Migration?, _ error: Error?) -> Void)
```

Create a migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createMigrationRequest = createMigration_request(name: "name_example", credentialId: 123, sourceProvider: "sourceProvider_example", settings: MigrationSettings(maxConcurrentMailboxes: 123, maxConcurrentMessages: 123, sourceRateLimit: 123, batchSize: 123, skipFolders: ["skipFolders_example"])) // CreateMigrationRequest | 

// Create a migration
MigrationsAPI.createMigration(createMigrationRequest: createMigrationRequest) { (response, error) in
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
 **createMigrationRequest** | [**CreateMigrationRequest**](CreateMigrationRequest.md) |  | 

### Return type

[**Migration**](Migration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMigrationCredential**
```swift
    open class func createMigrationCredential(createMigrationCredentialRequest: CreateMigrationCredentialRequest, completion: @escaping (_ data: MigrationCredential?, _ error: Error?) -> Void)
```

Store a migration credential

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let createMigrationCredentialRequest = createMigrationCredential_request(provider: "provider_example", label: "label_example", credentials: createMigrationCredential_request_credentials(host: "host_example", port: 123, username: "username_example", password: "password_example", oauthToken: "oauthToken_example")) // CreateMigrationCredentialRequest | 

// Store a migration credential
MigrationsAPI.createMigrationCredential(createMigrationCredentialRequest: createMigrationCredentialRequest) { (response, error) in
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
 **createMigrationCredentialRequest** | [**CreateMigrationCredentialRequest**](CreateMigrationCredentialRequest.md) |  | 

### Return type

[**MigrationCredential**](MigrationCredential.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMigration**
```swift
    open class func deleteMigration(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a migration
MigrationsAPI.deleteMigration(id: id) { (response, error) in
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

# **deleteMigrationCredential**
```swift
    open class func deleteMigrationCredential(id: UUID, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Delete a migration credential

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Delete a migration credential
MigrationsAPI.deleteMigrationCredential(id: id) { (response, error) in
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

# **deltaSyncMigration**
```swift
    open class func deltaSyncMigration(id: UUID, completion: @escaping (_ data: StartMigration202Response?, _ error: Error?) -> Void)
```

Run a delta sync

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Run a delta sync
MigrationsAPI.deltaSyncMigration(id: id) { (response, error) in
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

[**StartMigration202Response**](StartMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **discoverMigration**
```swift
    open class func discoverMigration(id: UUID, completion: @escaping (_ data: DiscoverMigration202Response?, _ error: Error?) -> Void)
```

Discover source mailboxes

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Discover source mailboxes
MigrationsAPI.discoverMigration(id: id) { (response, error) in
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

[**DiscoverMigration202Response**](DiscoverMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **finalSyncMigration**
```swift
    open class func finalSyncMigration(id: UUID, completion: @escaping (_ data: StartMigration202Response?, _ error: Error?) -> Void)
```

Run the final sync before cutover

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Run the final sync before cutover
MigrationsAPI.finalSyncMigration(id: id) { (response, error) in
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

[**StartMigration202Response**](StartMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMigration**
```swift
    open class func getMigration(id: UUID, completion: @escaping (_ data: Migration?, _ error: Error?) -> Void)
```

Get a migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get a migration
MigrationsAPI.getMigration(id: id) { (response, error) in
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

[**Migration**](Migration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMigrationProgress**
```swift
    open class func getMigrationProgress(id: UUID, completion: @escaping (_ data: MigrationProgress?, _ error: Error?) -> Void)
```

Get migration progress

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Get migration progress
MigrationsAPI.getMigrationProgress(id: id) { (response, error) in
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

[**MigrationProgress**](MigrationProgress.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMigrationCredentials**
```swift
    open class func listMigrationCredentials(completion: @escaping (_ data: ListMigrationCredentials200Response?, _ error: Error?) -> Void)
```

List migration credentials

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List migration credentials
MigrationsAPI.listMigrationCredentials() { (response, error) in
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

[**ListMigrationCredentials200Response**](ListMigrationCredentials200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMigrationEvents**
```swift
    open class func listMigrationEvents(id: UUID, completion: @escaping (_ data: ListMigrationEvents200Response?, _ error: Error?) -> Void)
```

List migration events

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// List migration events
MigrationsAPI.listMigrationEvents(id: id) { (response, error) in
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

[**ListMigrationEvents200Response**](ListMigrationEvents200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMigrationMailboxes**
```swift
    open class func listMigrationMailboxes(id: UUID, completion: @escaping (_ data: ListMigrationMailboxes200Response?, _ error: Error?) -> Void)
```

List migration mailboxes

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// List migration mailboxes
MigrationsAPI.listMigrationMailboxes(id: id) { (response, error) in
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

[**ListMigrationMailboxes200Response**](ListMigrationMailboxes200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMigrations**
```swift
    open class func listMigrations(completion: @escaping (_ data: ListMigrations200Response?, _ error: Error?) -> Void)
```

List migrations

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally


// List migrations
MigrationsAPI.listMigrations() { (response, error) in
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

[**ListMigrations200Response**](ListMigrations200Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **mapMigration**
```swift
    open class func mapMigration(id: UUID, mapMigrationRequest: MapMigrationRequest, completion: @escaping (_ data: DiscoverMigration202Response?, _ error: Error?) -> Void)
```

Map source to destination mailboxes

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let mapMigrationRequest = mapMigration_request(mappings: [mapMigration_request_mappings_inner(sourceEmail: "sourceEmail_example", destEmail: "destEmail_example")]) // MapMigrationRequest | 

// Map source to destination mailboxes
MigrationsAPI.mapMigration(id: id, mapMigrationRequest: mapMigrationRequest) { (response, error) in
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
 **mapMigrationRequest** | [**MapMigrationRequest**](MapMigrationRequest.md) |  | 

### Return type

[**DiscoverMigration202Response**](DiscoverMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **retryMigration**
```swift
    open class func retryMigration(id: UUID, completion: @escaping (_ data: DiscoverMigration202Response?, _ error: Error?) -> Void)
```

Retry a failed or cancelled migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Retry a failed or cancelled migration
MigrationsAPI.retryMigration(id: id) { (response, error) in
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

[**DiscoverMigration202Response**](DiscoverMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **startMigration**
```swift
    open class func startMigration(id: UUID, completion: @escaping (_ data: StartMigration202Response?, _ error: Error?) -> Void)
```

Start the migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Start the migration
MigrationsAPI.startMigration(id: id) { (response, error) in
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

[**StartMigration202Response**](StartMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMigration**
```swift
    open class func updateMigration(id: UUID, updateMigrationRequest: UpdateMigrationRequest, completion: @escaping (_ data: Migration?, _ error: Error?) -> Void)
```

Update a migration

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let updateMigrationRequest = updateMigration_request(name: "name_example", settings: MigrationSettings(maxConcurrentMailboxes: 123, maxConcurrentMessages: 123, sourceRateLimit: 123, batchSize: 123, skipFolders: ["skipFolders_example"])) // UpdateMigrationRequest | 

// Update a migration
MigrationsAPI.updateMigration(id: id, updateMigrationRequest: updateMigrationRequest) { (response, error) in
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
 **updateMigrationRequest** | [**UpdateMigrationRequest**](UpdateMigrationRequest.md) |  | 

### Return type

[**Migration**](Migration.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMigrationMailbox**
```swift
    open class func updateMigrationMailbox(id: UUID, mbxId: UUID, updateMigrationMailboxRequest: UpdateMigrationMailboxRequest, completion: @escaping (_ data: Void?, _ error: Error?) -> Void)
```

Update a migration mailbox

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 
let mbxId = 987 // UUID | 
let updateMigrationMailboxRequest = updateMigrationMailbox_request(destEmail: "destEmail_example", status: "status_example") // UpdateMigrationMailboxRequest | 

// Update a migration mailbox
MigrationsAPI.updateMigrationMailbox(id: id, mbxId: mbxId, updateMigrationMailboxRequest: updateMigrationMailboxRequest) { (response, error) in
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
 **mbxId** | **UUID** |  | 
 **updateMigrationMailboxRequest** | [**UpdateMigrationMailboxRequest**](UpdateMigrationMailboxRequest.md) |  | 

### Return type

Void (empty response body)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **validateMigration**
```swift
    open class func validateMigration(id: UUID, completion: @escaping (_ data: StartMigration202Response?, _ error: Error?) -> Void)
```

Validate migrated data

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import Lockally

let id = 987 // UUID | 

// Validate migrated data
MigrationsAPI.validateMigration(id: id) { (response, error) in
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

[**StartMigration202Response**](StartMigration202Response.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/problem+json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

