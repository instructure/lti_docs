---
layout: post
title:  "ContentItem Model"
position: 1
categories: content-item
---

###Types of ContentItems
 
The three different ContentItem Models are: **ContentItem**, **LtiLinkItem**, **FileItem**.  

####ContentItem

This is the basic type of ContentItem, both **LtiLinkItem** and **FileItem** inherit from this.  The general use case 
for this is returning back websites.
 
**@id**: A unique identifier for this instance

**icon**: a json object that specifies the an image to use as an icon 

**mediaType**: the MIME type for this item 

**placementAdvice**: a json object that describes how this item should be displayed in the Tool Consumer

**text**: a description for this item

**thumbnail**: a json object that specifies 

**title**: the title for this item

**url**: the URL where this item is located

{% highlight json %}
  { 
    "@type" : "ContentItem",
    "@id" : ":my_id",
    "icon" : {
      "@id" : "http://example.com/icons/small.png",
      "width" : 50,
      "height" : 50
    },
    "thumbnail" : {
      "@id" : "http://example.com/images/thumb.jpg",
      "width" : 100,
      "height" : 150
    },
    "url" : "http://example.com",
    "title" : "An example website",
    "mediaType" : "text/html",
    "placementAdvice" : {
      "presentationDocumentTarget" : "window",
      "windowTarget" : "anLTIApp"
    }
  }
{% endhighlight %}


####LtiLinkItem

Inherits all the properties of **ContentItem**

**custom**: A json object of custom params for this launch

{% highlight json %}
  { 
    "@type" : "LtiLinkItem",
    "@id" : ":my_lti_link_id",
    "title" : "An Lti Launch",
    "text" : "An lti application",
    "mediaType" : "application/vnd.ims.lti.v1.ltilink",
    "placementAdvice" : {
      "presentationDocumentTarget" : "window",
      "windowTarget" : "anLTIApp"
    },
    "custom" : {
      "level" : "novice",
      "mode" : "interactive"
    }
  }
{% endhighlight %}

**FileItem**

Inherits all the properties of **ContentItem**

**copyAdvice**: used to suggest if the Tool Consumer should make a local copy of this item

**expiresAt**:: the time when this item is no longer available at the provided URL

{% highlight json %}
  { "@type" : "FileItem",
    "@id" : ":my_file_id",
    "url" : "http://example.com/book.pdf",    
    "text" : "Read this book",
    "mediaType" : "application/pdf",
    "copyAdvice" : false,
    "placementAdvice" : {
      "displayWidth" : 800,
      "presentationDocumentTarget" : "iframe",
      "displayHeight" : 600
    }
  }
{% endhighlight %}