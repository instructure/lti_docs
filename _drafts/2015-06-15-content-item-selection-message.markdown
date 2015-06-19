---
layout: post
title:  "ContentItemSelection"
position: 1
categories: content-item
---

### Post Params

* **lti_message_type** (*required*): Constant value of: ```ContentItemSelection```

* **lti_version** (*required*): The lti version for the launch

* **content_items**: JSON document containing an array of content-items

* **data**: The value in the data parameter that was specified in the ContentItemSelectionRequest message 

* **lti_msg**: A message the tool consumer should display to the end user. (only valid if there where no errors) 

* **lti_log**: A message the tool consumer can log. (only valid if there where no errors)

* **lti_errormsg**: A message the tool consumer should display to the user explaing the reason for the error. (only 
valid if there was an error)

* **lti_errorlog**: A message the tool consumer can log. (only valid if there was an error)


### **content_items**

The content-items field is set to a serialized JSON string. The JSON contains an array of content-item objects, wrapped 
inside a JSON-LD graph.


The JSON-LD graph looks like this:

{% highlight json %}
{
  "@context" : "http://purl.imsglobal.org/ctx/lti/v1/ContentItem",
  "@graph" : [
              (Content-Item objects go here)
              ]
}
{% endhighlight %}


There are 3 types of Content-Item 