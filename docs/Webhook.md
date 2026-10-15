# Webhook

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **UUID** |  | 
**tenantId** | **UUID** |  | 
**url** | **String** |  | 
**events** | **[String]** |  | 
**paused** | **Bool** |  | 
**pausedAt** | **Date** |  | [optional] 
**lastSuccessAt** | **Date** |  | [optional] 
**lastFailureAt** | **Date** |  | [optional] 
**consecutiveFailures** | **Int** |  | 
**createdAt** | **Date** |  | 
**signingSecret** | **String** | Hex-encoded HMAC-SHA256 key. Present ONLY on POST response. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


