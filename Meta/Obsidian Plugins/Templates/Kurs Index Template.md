<%*
const k = tp.user.kursinfo(tp);
const datum = tp.date.now("YYYY-MM-DD");
const amneInput = await tp.system.prompt("Ämne(n) för kursen, kommaseparerat (t.ex. nätverk, programmering)", k.subjectTags);
const amnen = amneInput ? amneInput.split(",").map((s) => s.trim()).filter(Boolean) : [];
const taggar = ["index", k.kurskod, "KTH", ...amnen, "year" + k.year].filter(Boolean);
-%>
---
title: "<% k.courseSegment %>"
tags: [<% taggar.join(", ") %>]
description: "Kursindex för <% k.courseSegment %> med föreläsningar, begrepp, anteckningar och kursmaterial."
created: <% datum %>
updated: <% datum %>
---
# 📚 <% k.courseSegment %>

> [!info] Kursinformation
> - **Kurskod:** <% k.kurskod %>
> - **Termin:** <% k.termin %>
> - **KTH kursplan:** <https://www.kth.se/student/kurser/kurs/<% k.kurskod %>>

## 📚 Litteratur

-

## 🔗 Länkar

- [[Atlas/<% k.year %> MOC|<% k.year %> MOC]]

## 📅 Föreläsningar & Lektioner

```dataview
LIST
FROM "<% k.courseFolderPath %>"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp

```dataview
LIST
FROM "<% k.courseFolderPath %>"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta

```dataview
LIST
FROM "<% k.courseFolderPath %>"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar

```dataview
LIST
FROM "<% k.courseFolderPath %>"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen

```dataview
LIST
FROM "<% k.courseFolderPath %>"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
