<%*
let noteTitle = await tp.system.prompt("Enter Note Title");
let formattedTitle = noteTitle.replace(/\s+/g, "-");
await tp.file.rename(tp.date.now("YYYY-MM-DD") + "_" + formattedTitle);
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
