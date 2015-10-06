---
layout: post
title:  "Configuring Content-item"
date:   2015-08-04 10:18:00
position: 1
categories: content-item
---
To use content-item, the tool provider must be configured correctly. The following is an overview of how to configure the tool provider to use content-item.

##LTI Tool XML Configuration
Below is an example of a bare-bones tool provider LTI configuration that *does not* use content-item:
{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?><cartridge_basiclti_link xmlns="http://www.imsglobal.org/xsd/imslticc_v1p0" xmlns:blti="http://www.imsglobal.org/xsd/imsbasiclti_v1p0" xmlns:lticm="http://www.imsglobal.org/xsd/imslticm_v1p0" xmlns:lticp="http://www.imsglobal.org/xsd/imslticp_v1p0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imslticc_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticc_v1p0.xsd http://www.imsglobal.org/xsd/imsbasiclti_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imsbasiclti_v1p0p1.xsd http://www.imsglobal.org/xsd/imslticm_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticm_v1p0.xsd http://www.imsglobal.org/xsd/imslticp_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticp_v1p0.xsd">
  <blti:title>Example Tool Provider</blti:title>
  <blti:description>This is a Sample Tool Provider.</blti:description>
  <blti:launch_url>http://localhost:4040/messages/blti</blti:launch_url>
  <blti:extensions platform="canvas.instructure.com">
    <lticm:property name="selection_height">500</lticm:property>
    <lticm:property name="selection_width">500</lticm:property>
  </blti:extensions>
</cartridge_basiclti_link>
{% endhighlight %}
**Note:** for more on the basics of LTI tool configuration see [external tools documentation](https://canvas.instructure.com/doc/api/file.tools_xml.html).

To begin using content-item we need to specify at least one valid placement for Canvas to use. Placements are used to help the tool consumer (Canvas in this case) know where the tool should be placed within the LMS. For example, adding the following node as a child of the **blti:extensions** element in the above XML would tell Canvas to add a link in the course navigation to the LTI tool:
{% highlight xml %}
<lticm:options name="course_navigation">
  <lticm:property name="url">http://localhost:4040/messages/blti</lticm:property>
</lticm:options>
{% endhighlight %}

Content-item is not applicable to all placements in Canvas, but can be used with the following placements:

**editor_button**

**homework_submission**

**migration_selection**

**assignment_selection**

**link_selection**

For our example we will use **assignment_selection**.

To enable content-item with the **assignment_selection** placement, we add lines 6-9 to the example from above:
{% highlight xml linenos %}
<?xml version="1.0" encoding="UTF-8"?><cartridge_basiclti_link xmlns="http://www.imsglobal.org/xsd/imslticc_v1p0" xmlns:blti="http://www.imsglobal.org/xsd/imsbasiclti_v1p0" xmlns:lticm="http://www.imsglobal.org/xsd/imslticm_v1p0" xmlns:lticp="http://www.imsglobal.org/xsd/imslticp_v1p0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.imsglobal.org/xsd/imslticc_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticc_v1p0.xsd http://www.imsglobal.org/xsd/imsbasiclti_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imsbasiclti_v1p0p1.xsd http://www.imsglobal.org/xsd/imslticm_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticm_v1p0.xsd http://www.imsglobal.org/xsd/imslticp_v1p0 http://www.imsglobal.org/xsd/lti/ltiv1p0/imslticp_v1p0.xsd">
  <blti:title>Example Tool Provider</blti:title>
  <blti:description>This is a Sample Tool Provider.</blti:description>
  <blti:launch_url>http://localhost:4040/messages/blti</blti:launch_url>
  <blti:extensions platform="canvas.instructure.com">
    <lticm:options name="assignment_selection">
      <lticm:property name="message_type">ContentItemSelectionRequest</lticm:property>
      <lticm:property name="url">http://localhost:4040/messages/blti</lticm:property>
    </lticm:options>
    <lticm:property name="icon_url">http://localhost:4040/selector.png</lticm:property>
    <lticm:property name="selection_height">500</lticm:property>
    <lticm:property name="selection_width">500</lticm:property>
  </blti:extensions>
</cartridge_basiclti_link>
{% endhighlight %}
Adding the element on line 6 lets Canvas know the tool should be placed in the assignments menu. Line 7 tells Canvas the tool is using content-item, and line 8 provides Canvas the launch URL.
