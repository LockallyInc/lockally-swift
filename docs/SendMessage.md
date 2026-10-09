# SendMessage

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**from** | **String** |  | 
**to** | **[String]** |  | 
**cc** | **[String]** |  | [optional] 
**bcc** | **[String]** |  | [optional] 
**subject** | **String** |  | [optional] 
**text** | **String** |  | [optional] 
**html** | **String** |  | [optional] 
**headers** | **[String: String]** |  | [optional] 
**replyTo** | **String** | Where replies go. Required when &#x60;from&#x60; has no mailbox behind it. The named form &#x60;Acme Support &lt;a@b.com&gt;&#x60; is also accepted. | [optional] 
**replyToName** | **String** | Display name shown on &#x60;Reply-To&#x60;. Ignored without &#x60;reply_to&#x60;. | [optional] 
**unsubscribe** | **Bool** |  | [optional] 
**templateId** | **UUID** |  | [optional] 
**variables** | **[String: String]** |  | [optional] 
**sendAt** | **Date** |  | [optional] 
**attachments** | [V1SendPostRequestAttachmentsInner] |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


