<%*
const k = tp.user.kursinfo(tp);
const datum = tp.date.now("YYYY-MM-DD");
const n = tp.user.nastaNummer(tp, "Föreläsning");
const titel = `${datum} Föreläsning ${n}`;
const amneArr = k.hasSubjects ? k.subjects : [await tp.system.prompt("Ämne (t.ex. programmering / nätverk)")];
const taggar = ["föreläsning", k.kurskod, ...amneArr, "KTH", "year" + k.year].filter(Boolean);
const beskrivning = [k.kurskod, k.kursnamn, "Föreläsning " + n].filter(Boolean).join(" ");
await tp.file.rename(titel);
-%>
---
tags: [<% taggar.join(", ") %>]
description: "<% beskrivning %>"
created: <% datum %>
updated: <% datum %>
---
# <% titel %>

> [!info] Kurs
> [[<% k.courseFolderPath %>/_index|<% k.courseSegment %>]]

## Sammanfattning

## Anteckningar

## Kopplat till

## Flashcards
