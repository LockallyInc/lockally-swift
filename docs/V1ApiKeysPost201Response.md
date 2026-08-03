# V1ApiKeysPost201Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **UUID** |  | 
**tenantId** | **UUID** |  | 
**_prefix** | **String** | 8-char public prefix; safe to store and display. | 
**scopes** | **[String]** |  | 
**label** | **String** |  | 
**lastUsedAt** | **Date** |  | [optional] 
**revokedAt** | **Date** |  | [optional] 
**createdAt** | **Date** |  | 
**secret** | **String** | The full &#x60;lk_live_&lt;prefix&gt;_&lt;secret&gt;&#x60; token. Shown ONCE. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


