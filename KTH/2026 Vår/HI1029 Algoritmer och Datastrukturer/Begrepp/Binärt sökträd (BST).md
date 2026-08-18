---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Binärt sökträd (BST)

> **Komplexitet:** $O(\log n)$ (medel), $O(n)$ (värsta fall)
> **Viktigt:** Ordning och balansering.

---

## Definition
Ett **Binärt sökträd (BST)** är en trädstruktur där varje nod har max två barn. För varje nod gäller:
- Allt i **vänster** subträd är **mindre** än noden.
- Allt i **höger** subträd är **större** än noden.

## Tenta-fokus
- **Balansering:** Om element sätts in i sorterad ordning blir trädet en lång kedja (som en länkad lista) och prestandan sjunker till $O(n)$.
- **Traversering:** *In-order* traversering av ett BST ger elementen i sorterad ordning.
- **Definitioner:** Ha koll på skillnaden mellan *Fullt*, *Komplett* och *Balanserat* träd (ofta korta teorifrågor).

## Java-tips
- `TreeSet` och `TreeMap` i Java använder balanserade binära sökträd (Röd-svarta träd) för att garantera $O(\log n)$.

## Kopplat till
- **Relaterat:** [[Heap]] (liknande form, annan ordning)
- **Alternativ:** [[Hashtabell]] (snabbare men saknar ordning)

## Flashcards

Binärt sökträd (BST) (Definition):: Ett binärt träd där vänster sub träd endast innehåller mindre värden och höger sub träd endast innehåller större värden än noden själv.

Vad är tidskomplexiteten för sökning i ett balanserat binärt sökträd?(Definition):: $O(\log n)$.

Vad ger en In-order traversering av ett BST?:: Alla element i sorterad ordning.
