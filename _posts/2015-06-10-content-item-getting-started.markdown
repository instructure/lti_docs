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

 
##Content-Item Process

The first step in the content-item process is the sending of the `ContentItemSelectionRequest` message from the Tool 
Consumer to the Tool Provider.  An example message is included below: 

###ContentItemRequest: Tool Consumer -> Tool Provider

{% highlight text %}
lti_message_type: ContentItemSelectionRequest
lti_version: LTI-1p0
accept_media_types: application/vnd.ims.lti.v1.ltilink
accept_presentation_document_targets: frame,window
content_item_return_url: http://lms.example/courses/5/external_content/success/external_tool_dialog
{% endhighlight %}

Some of the important paramaters are: **accept_media_types**, **accept_presentation_document_targets**, and 
**content_item_return_url**. 

**accept_media_types** is a comma separated list of MIME types the Tool Consumer supports.

**accept_presentation_document_targets** is a comma separated list of presentation formats the Tool Consumer supports.

**content_item_return_url** is where the tool provider should redirect to at the end of the content-item process.


After the Tool Provider receives the `ContentItemSelectionRequest` message it will need to send back a 
`ContentItemSelection` message that includes the `content-items` they wish to send back. An example of this message is 
shown below: 

###ContentItemSelection: Tool Consumer <- Tool Provider

{% highlight text %}
lti_message_type: ContentItemSelection
lti_version: LTI-1p0
content_items: {
                 "@context": "http://purl.imsglobal.org/ctx/lti/v1/ContentItem",
                 "@graph": [
                   {
                     "@type": "LtiLinkItem",
                     "@id": "http://example.com/messages/launch",
                     "url": "http://example.com/messages/launch",
                     "title": "test",
                     "text": "text",
                     "mediaType": "application/vnd.ims.lti.v1.ltilink",
                     "placementAdvice": {                       
                       "presentationDocumentTarget": "frame"
                     }
                   }
                 ]
               }
{% endhighlight %}

The main points of interest here is the `content_items` parameter. It contains a json object that includes an array of 
content-item objects.  Inside the json object, the `@graph` object contains an array that holds all of the content-item 
objects.
 
The content-item object in this example is sending back a single LTI link that is to be launched in the current frame. 
the `url` specifies the lti launch point, and the `mediaType` specifies that it is an lti launch.


###Links###
[IMS Documentation](http://www.imsglobal.org/lti/) 
