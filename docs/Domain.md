# Domain

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **UUID** |  | 
**tenantId** | **UUID** |  | 
**domain** | **String** |  | 
**verificationToken** | **String** |  | 
**verified** | **Bool** |  | 
**verifiedAt** | **Date** |  | [optional] 
**dkimSelector** | **String** |  | 
**dkimPublicRecord** | **String** |  | 
**createdAt** | **Date** |  | 
**records** | [DNSRecord] | DNS records the tenant must publish under their own DNS. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


