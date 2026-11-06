# SendEmailRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**from** | **String** |  | 
**to** | **[String]** |  | 
**cc** | **[String]** |  | [optional] 
**bcc** | **[String]** |  | [optional] 
**subject** | **String** |  | [optional] 
**text** | **String** | Plain-text body. Required if &#x60;html&#x60; is absent. | [optional] 
**html** | **String** | HTML body. Required if &#x60;text&#x60; is absent. | [optional] 
**headers** | **[String: String]** |  | [optional] 
**replyTo** | **String** | Where replies go. REQUIRED when &#x60;from&#x60; has no mailbox behind it, since a reply there would be delivered nowhere. A &#x60;Reply-To&#x60; entry in &#x60;headers&#x60; satisfies the same rule. The named form &#x60;Acme Support &lt;a@b.com&gt;&#x60; is also accepted. | [optional] 
**replyToName** | **String** | Display name shown on &#x60;Reply-To&#x60;, e.g. &#x60;Acme Support&#x60;. Ignored without &#x60;reply_to&#x60;. Encoded and quoted for you, so accents, commas and quotes are all safe. | [optional] 
**unsubscribe** | **Bool** | Mark as opt-in/broadcast: skips suppressed recipients and adds a managed one-click List-Unsubscribe header. | [optional] 
**templateId** | **UUID** | Render subject/text/html from a stored template (GET /v1/templates). Mutually exclusive with inline subject/text/html. | [optional] 
**variables** | **[String: String]** | Values substituted into the template&#39;s {{variable}} placeholders. | [optional] 
**sendAt** | **Date** | Schedule delivery for a future RFC3339 time (≤ 30 days out). Omit or past &#x3D; send now. Cancel with DELETE /v1/messages/{id} while scheduled. | [optional] 
**metadata** | **[String: String]** | Arbitrary key/value you attach to this message and get back on every delivery webhook for it, so a send can be matched to your own records without a lookup table.  **It never leaves Lockally.** A custom entry in &#x60;headers&#x60; goes out on the wire to the recipient, which is why that is not a substitute: order ids and internal identifiers do not belong in a header the recipient can read.  At most 20 keys, keys at most 64 characters, values at most 512. **Over a limit is refused with a &#x60;400&#x60;, never truncated**: a silently shortened order id succeeds and then fails to match weeks later.  Not indexed and not filterable.  | [optional] 
**tags** | **[String]** | Labels that group this send for filtering and analytics: campaign, template, environment.  **Lowercased, trimmed and deduplicated on write**, so the grouping does not depend on every caller spelling them identically. &#x60;Campaign-X&#x60; is stored as &#x60;campaign-x&#x60;, and either spelling matches it in a filter.  At most 10 per message after deduplication, each at most 32 characters. Over either is a &#x60;400&#x60; rather than a trimmed list: a send missing the tag it was tagged for is worse than a refusal.  Unlike &#x60;metadata&#x60;, tags ARE queryable: filter with &#x60;GET /v1/messages?tag&#x3D;&#x60; and group with &#x60;GET /v1/messages/stats?tag&#x3D;&#x60;.  | [optional] 
**trackOpens** | **Bool** | Override the account&#39;s open-tracking setting for this one send. Omit to inherit it.  Three states matter here: &#x60;true&#x60;, &#x60;false&#x60;, and absent. A transactional receipt can set &#x60;false&#x60; without the account turning tracking off for its marketing.  | [optional] 
**trackClicks** | **Bool** | As &#x60;track_opens&#x60;, for click tracking. Click tracking rewrites &#x60;http(s)&#x60; links in the **HTML** part only: the plain-text part is never rewritten, because a visible redirect URL is what recipients complain about. A text-only send is therefore not click-tracked.  | [optional] 
**attachments** | [SendEmailRequestAttachmentsInner] |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


