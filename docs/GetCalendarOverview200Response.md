# GetCalendarOverview200Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**totalCalendars** | **Int** |  | [optional] 
**activeCalendars** | **Int** | Calendars with an event created, edited or held in the last 30 days. | [optional] 
**sharedCalendars** | **Int** | Calendars visible to the whole organization. | [optional] 
**eventsThisMonth** | **Int** | Events on every calendar, in the account&#39;s own timezone. | [optional] 
**upcomingOrgEvents** | **Int** | Future events on organization-visible calendars. | [optional] 
**bookableResources** | **Int** | Resources that are not disabled. | [optional] 
**accessGranted** | **Int** | People who own a calendar or are named on one. | [optional] 
**accessOrgWide** | **Int** | Everyone who can see an organization calendar; 0 when none exists. | [optional] 
**activity** | [GetCalendarOverview200ResponseActivityInner] |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


