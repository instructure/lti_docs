---
layout: post
title:  "Getting Started"
date:   2015-06-09 09:54:57
categories: content-item
---

Content Item provides a way for a tool to return a variety of data back to the LMS. Common types of data returned back are:
custom LTI links, images, videos, and other file types.

A Content-Item Launch looks a little different than the regular LTI launch.  The "lti_message_type" post param for a 
content-item launch is [ContentItemSelectionRequest]({% post_url 2015-06-12-content-item-selection-request-message %}), 