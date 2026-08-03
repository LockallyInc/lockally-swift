# V1UsageGet200Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mailboxesActive** | **Int** | Mailboxes that are neither disabled nor soft-deleted. | 
**mailboxesTotal** | **Int** | All mailboxes for this tenant, including disabled/soft-deleted. | [optional] 
**domainsVerified** | **Int** | Domains that have passed DNS verification. | [optional] 
**domainsTotal** | **Int** |  | [optional] 
**messagesSentLast60s** | **Int** | Sends in the 60-second window ending now. Used by the rate-cap check. | [optional] 
**messagesSentTodayUtc** | **Int** | Sends since 00:00 UTC. Compared against &#x60;daily_msg_quota&#x60;. | [optional] 
**messagesSentLast30d** | **Int** | Rolling 30-day send count (not calendar month). | [optional] 
**bytesStored** | **Int64** | Lifetime sum of &#x60;messages.size_bytes&#x60; for this tenant. | [optional] 
**rateCapPerMin** | **Int** | Per-tenant outbound rate cap (sends per minute). | [optional] 
**dailyMsgQuota** | **Int** | Per-tenant daily send quota (UTC day boundary). | [optional] 
**webhooksTotal** | **Int** |  | [optional] 
**webhooksPaused** | **Int** | Webhook subscriptions auto-paused after 50 consecutive failures (LT2). | [optional] 
**generatedAt** | **Date** | When this snapshot was generated, RFC 3339 UTC. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


