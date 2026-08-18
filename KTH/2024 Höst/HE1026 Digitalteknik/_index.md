---
tags: [index, HE1026, KTH, year2024]
---
# 📚 HE1026 Digitalteknik

> [!info] Kursinformation
> - **Kurskod:** HE1026
> - **Termin:** 2024 Höst
> - **KTH kursplan:** https://www.kth.se/student/kurser/kurs/HE1026

## 📅 Föreläsningar & Lektioner
```dataview
LIST
FROM "KTH/2024 Höst/HE1026 Digitalteknik"
WHERE contains(tags, "föreläsning") OR contains(tags, "lektion")
SORT file.name ASC
```

## 🧠 Begrepp
```dataview
LIST
FROM "KTH/2024 Höst/HE1026 Digitalteknik"
WHERE contains(tags, "begrepp")
SORT file.name ASC
```

## 📝 Anteckningar, studieguider & tenta
```dataview
LIST
FROM "KTH/2024 Höst/HE1026 Digitalteknik"
WHERE contains(tags, "studieguide") OR contains(tags, "tenta") OR contains(tags, "seminarium") OR contains(tags, "övrigt")
SORT file.name ASC
```

## 🧪 Labb, projekt & övningar
```dataview
LIST
FROM "KTH/2024 Höst/HE1026 Digitalteknik"
WHERE contains(tags, "labb") OR contains(tags, "övning")
SORT file.name ASC
```

## 🗂️ Alla anteckningar i kursen
```dataview
LIST
FROM "KTH/2024 Höst/HE1026 Digitalteknik"
WHERE file.name != this.file.name
SORT file.folder ASC, file.name ASC
```
