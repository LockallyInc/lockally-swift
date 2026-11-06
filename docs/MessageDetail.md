# MessageDetail

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **UUID** |  | 
**tenantId** | **UUID** |  | 
**messageId** | **String** | RFC 5322 Message-ID header, including angle brackets. | 
**sender** | **String** |  | 
**recipients** | **[String]** |  | 
**subject** | **String** |  | [optional] 
**status** | **String** |  | 
**queuedAt** | **Date** |  | 
**updatedAt** | **Date** |  | 
**bounceReason** | **String** |  | [optional] 
**sizeBytes** | **Int** |  | [optional] 
**metadata** | **[String: String]** | The sender&#39;s own key/value from the send request. Always present; &#x60;{}&#x60; when none was set. | [optional] 
**tags** | **[String]** | Grouping labels, lowercased and deduplicated. Always present; &#x60;[]&#x60; when none were set. | [optional] 
**from** | **String** |  | [optional] 
**to** | **[String]** |  | [optional] 
**cc** | **[String]** |  | [optional] 
**bcc** | **[String]** |  | [optional] 
**text** | **String** |  | [optional] 
**html** | **String** |  | [optional] 
**headers** | **[String: String]** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


