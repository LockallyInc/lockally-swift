# BatchResult

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**index** | **Int** |  | [optional] 
**id** | **UUID** |  | [optional] 
**messageId** | **String** |  | [optional] 
**status** | **String** | \&quot;suppressed\&quot; means every recipient of that slot was on your suppression list, and it carries no id or message_id. \&quot;delivered\&quot; only appears on a test key: the send was simulated, not transmitted. | [optional] 
**error** | **String** | Present when this message failed; the others are then absent. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


