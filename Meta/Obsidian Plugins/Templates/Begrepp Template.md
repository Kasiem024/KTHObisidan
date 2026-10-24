<%*
const k = tp.user.kursinfo(tp);
const datum = tp.date.now("YYYY-MM-DD");
const amneArr = k.hasSubjects ? k.subjects : [await tp.system.prompt("Ämne (t.ex. programmering / nätverk)")];
const taggar = ["begrepp", k.kurskod, ...amneArr, "KTH", "year" + k.year].filter(Boolean);
const bas = [k.kurskod, k.kursnamn].filter(Boolean).join(" ");
const beskrivning = (bas ? bas + " – " : "") + "begrepp: " + tp.file.title;
-%>
---
tags:
<% taggar.flatMap((t) => String(t).split(",")).map((t) => t.trim()).filter(Boolean).map((t) => "  - " + t).join("\n") %>
description: "<% beskrivning %>"
created: <% datum %>
updated: <% datum %>
---
# <% tp.file.title %>

## Definition

## Kopplat till

## Flashcards

