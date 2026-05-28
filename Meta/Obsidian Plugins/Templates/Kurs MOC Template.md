---
tags:
  - KTH
  - year<% tp.date.now("YYYY") %>
  - <% tp.file.title %>
  - index
---
# 📚 <% tp.file.title %>

## 📌 Kursinformation
- **Kurskod:** 
- **Lärare:** 
- **Examination:** 

## 📝 Föreläsningar
```dataview
LIST FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "föreläsning")
SORT file.name ASC
```

## 🧠 Begrepp & Instuderingsfrågor
```dataview
LIST FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```
