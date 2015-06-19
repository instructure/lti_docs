---
layout: post
title:  "ContentItemSelectionRequest"
position: 1
categories: content-item
---

### Post Params

* **lti_message_type** (*required*): Constant value of: ```ContentItemsSelectionRequest```

* **lti_version** (*required*): The lti version for the launch

* **accept_media_types** (*required*): Comma separated list of MIME types that are valid for return in the ContentItemSelection 
message  

* **accept_presentation_document_targets** (*required*): Comma separated list of the supported display formats. 
[(List of possible values)](#head_accept_presentation_document_targets)

* **content_item_return_url** (*required*): The URL that the tool provider should redirect back to using the ContentItemSelection message

* **accept_unsigned**: boolean value that indicates if the tool consumer accepts an usnigned ContentItemSelection message

* **accept_multiple**: boolean value that indicates if the tool consumer accepts multiple content-items in the ContentItemSelection message

* **accept_copy_advice**: boolean value that indicates if the tool consumer allows making a local copy of a content item

* **auto_create**: boolean value that indicates if the tool consumer will require user feedback before accepting content-items

* **title**: default title that will be used for content returned via the ContentItemSelection message

* **text**: default text that will be used for content returned via the ContentItemSelection message

* **data**: an opaque value that should be returned unaltered via the ContentItemSelection message



#### <a name="head_accept_presentation_document_targets"></a>**accept_presentation_document_targets**

* **embed**: insert at the current insertion point

* **frame**: open the item in the same frame

* **iframe**: open the item in an iframe 
 
* **window**: open the item in a new window or tab

* **popup**: open the item using a popup

* **overlay**: open the item using an overlay, (i.e. lightbox or modal)

* **none**: item won't be displayed. ( used for things like homework submission )
