---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "En Länkad lista består av noder där varje nod innehåller ett dataelement och en referens (pekare) till nästa nod."
created: 2026-05-28
updated: 2026-05-28
---
# Länkad lista

> **Komplexitet:** $O(1)$ insättning (om referens finns), $O(n)$ sökning/indexering
> **Viktigt:** Noder och pekare.

---

## Definition
En **Länkad lista** består av noder där varje nod innehåller ett dataelement och en referens (pekare) till nästa nod.

- **Enkellänkad:** Pekare till nästa.
- **Dubbellänkad:** Pekare till både nästa och föregående.

## Tenta-fokus
- **Pekar-manipulation:** Vanliga tentauppgifter involverar att rita hur pekare flyttas vid `add` eller `remove`.
- **Prestanda:** Till skillnad från en array-lista kan man lägga till i början på $O(1)$. Dock tar det $O(n)$ att hitta ett element på ett specifikt index.
- **Minne:** Tar mer minne än en array per element eftersom pekarna också måste lagras.

## Java-tips
- Implementeras i Java som `LinkedList`. Denna är dubbellänkad.

## Kopplat till
- **ADT:** [[Abstrakt Datatyp (ADT)]]
- **Alternativ:** [[Array-lista]]
- **Hjälpmedel:** [[Iterator]]

## Flashcards

Tidskomplexitet för get(index) i en enkellänkad lista:: $O(n)$, då listan måste traverseras från början.

Vad skiljer en dubbellänkad lista från en enkellänkad?(Definition):: Varje nod har pekare till både föregående och nästa nod, vilket tillåter traversering bakåt.

När är en länkad lista bättre än en array-lista?:: När man ofta lägger till eller tar bort element i början av listan.
