---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
description: "Binär sökning är en 'söndra och härska'-algoritm som hittar ett element genom att hela tiden titta i mitten och halvera sökrymden."
---
# Binär sökning

> **Komplexitet:** $O(\log n)$
> **Krav:** Sorterad indata.

---

## Definition

**Binär sökning** är en "söndra och härska"-algoritm som hittar ett element genom att hela tiden titta i mitten och halvera sökrymden.

## Tenta-fokus

- **Varför logaritmisk tid?** Eftersom man halverar antalet element i varje steg ($n \to n/2 \to n/4 \dots$).
- **Viktigt villkor:** Algoritmen fungerar **endast** på sorterad data. Om listan är osorterad måste man använda linjär sökning ($O(n)$) eller sortera först.

## Kopplat till

- **Prestanda:** [[Tidskomplexitet (Big O)]]
- **Metod:** [[Rekursion]]
- **Strukturer:** [[Binärt sökträd (BST)]]

## Flashcards

Vad är tidskomplexiteten för binär sökning?:: $O(\log n)$.

Vad är det viktigaste kravet för att kunna utföra en binär sökning?:: Att samlingen som genomsöks är sorterad.
