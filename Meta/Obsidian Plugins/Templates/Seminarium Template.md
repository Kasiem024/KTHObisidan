<%*
const k = tp.user.kursinfo(tp);
const datum = tp.date.now("YYYY-MM-DD");
const n = tp.user.nastaNummer(tp, "Seminarium");
const titel = `${datum} Seminarium ${n}`;
const amneArr = k.hasSubjects ? k.subjects : [await tp.system.prompt("Ämne (t.ex. programmering / nätverk)")];
const taggar = ["seminarium", k.kurskod, ...amneArr, "KTH", "year" + k.year].filter(Boolean);
const beskrivning = [k.kurskod, k.kursnamn, "Seminarium " + n].filter(Boolean).join(" ");
await tp.file.rename(titel);
-%>
---
tags: [<% taggar.join(", ") %>]
description: "<% beskrivning %>"
created: <% datum %>
updated: <% datum %>
---
# Seminarium: <% titel %>

> [!info] Kurs
> [[<% k.courseFolderPath %>/_index|<% k.courseSegment %>]]

## Förberedelser

## Diskussion

## Slutsatser

## Kopplat till
