---
layout: post
title:  "Getting Started"
date:   2015-06-09 09:54:57
position: 0
categories: content-item
---

##Introduction

Content-Item is an extension to LTI that allows data to be passed back to the Tool Consumer in context of an LTI Launch.
 A few common use cases are: 
 
* Providing a teacher the ability to select a customized LTI launch link from the tool provider 
to be placed in the the tool consumer.
   
* Allowing a student to submit an attachment for an assignment that is provided by a tool provider.
 
* Embedding custom content into a rich text editor from a tool provider.

 
##Content-Item Flow

The content-item flow looks from a high level looks like this:

> insert swim lane diagram here to show flow of content-item

##Content-Item Sample Messages

###ContentItemRequest: Tool Consumer -> Tool Provider

{% highlight text %}
lti_message_type: ContentItemSelectionRequest
lti_version: LTI-1p0
accept_media_types: application/vnd.ims.lti.v1.ltilink
accept_presentation_document_targets: frame,window
content_item_return_url: http://lms.example/courses/5/external_content/success/external_tool_dialog
{% endhighlight %}

###ContentItemSelection: Tool Consumer <- Tool Provider

{% highlight text %}
lti_message_type: ContentItemSelection
lti_version: LTI-1p0
content_items: {
                 "@context": "http://purl.imsglobal.org/ctx/lti/v1/ContentItem",
                 "@graph": [
                   {
                     "@type": "LtiLink",
                     "@id": "http://example.com/messages/launch",
                     "url": "http://example.com/messages/launch",
                     "title": "test",
                     "text": "text",
                     "mediaType": "application/vnd.ims.lti.v1.ltilink",
                     "placementAdvice": {
                       "displayWidth": 800,
                       "presentationDocumentTarget": "frame",
                       "displayHeight": 600
                     }
                   }
                 ]
               }
{% endhighlight %}
