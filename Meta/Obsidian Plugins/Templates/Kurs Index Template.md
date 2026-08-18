---
title: "<% tp.file.folder() %>"
tags: [index, <% tp.file.folder(true).split("/")[2].split(" ")[0] %>, KTH, year<% tp.file.folder(true).split("/")[1].slice(0,4) %>]
---
# 📚 <% tp.file.folder() %>

> [!info] Kursinformation
> - **Kurskod:** <% tp.file.folder(true).split("/")[2].split(" ")[0] %>
> - **Termin:** <% tp.file.folder(true).split("/")[1] %>
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/<% tp.file.folder(true).split("/")[2].split(" ")[0] %>

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "<% tp.file.folder(true) %>"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
