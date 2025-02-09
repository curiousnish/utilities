<%*
let noteTitle = tp.file.title;
let formattedTitle = noteTitle.replace(/^\d{4}-\d{2}-\d{2}_/, "");
-%>
---
created on: <% tp.date.now("YYYY-MM-DD") %>
title: <% formattedTitle %>
aliases: 
tags: 
hubs: 
related notes:
url:
---

# <% formattedTitle %>
