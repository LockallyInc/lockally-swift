# SendEmailBatchRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**messages** | [SendMessage] |  | 
**variables** | **[String: String]** | Template variables every message in the batch inherits. Each message&#39;s own &#x60;variables&#x60; override these key by key, so shared values are written once and per-recipient ones stay per-recipient.  Without this, a 500-message batch repeats every shared variable 500 times: most of the payload, and 500 places for one of them to differ by a typo.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


