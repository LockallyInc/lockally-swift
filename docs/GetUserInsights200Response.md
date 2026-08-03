# GetUserInsights200Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**recentlyAdded** | [UserEvent] |  | [optional] 
**recentlySuspended** | [UserEvent] |  | [optional] 
**inactive30d** | [UserEvent] |  | [optional] 
**seatsUsed** | **Int** |  | [optional] 
**seatsAlloc** | **Int** |  | [optional] 
**seatsCapped** | **Bool** | True only on tiers with a hard seat cap (Free, Founder). On unlimited/per-seat tiers seats_alloc merely tracks the live mailbox count, so seats_used &#x3D;&#x3D; seats_alloc is normal and must not be read as &#39;at capacity&#39;. | [optional] 
**generatedAt** | **Date** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


