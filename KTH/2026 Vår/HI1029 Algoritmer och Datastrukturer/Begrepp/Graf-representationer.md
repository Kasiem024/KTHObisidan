---
tags: [begrepp, HI1029, KTH, programmering, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Graf-representationer

> **Mål:** Spara noder och bågar i minnet.
> **Viktigt:** Glesa vs Täta grafer.

---

## Definition
Grafer består av noder (vertices) och bågar (edges). Det finns två huvudsakliga sätt att representera dem:

### 1. Grannmatris (Adjacency Matrix)
En 2D-array `A[i][j]` där 1 (eller vikten) betyder att det finns en båge från $i$ till $j$.
- **Fördel:** Mycket snabbt att kolla om en specifik båge finns ($O(1)$).
- **Nackdel:** Tar mycket minne ($O(V^2)$), även om det finns få bågar.

### 2. Grannlista (Adjacency List)
En array av listor. Varje nod har en lista på sina grannar.
- **Fördel:** Sparar minne ($O(V+E)$), bäst för **glesa** grafer (få bågar).
- **Nackdel:** Långsammare att kolla om en specifik båge finns.

## Tenta-fokus
- **Viktad graf:** I en grannlista sparas vikten oftast som ett objekt i listan. I en matris sparas vikten direkt i cellen.
- **Riktad vs Oriktad:** I en oriktad graf är matrisen symmetrisk.

## Kopplat till
- **Strukturer:** [[Länkad lista]], [[Array-lista]]
- **Algoritmer:** [[Minsta uppspännande träd (MST)]]

## Flashcards

Vad betyder värdet på rad 3, kolumn 5 i en grannmatris?(Definition):: Vikten på bågen från nod 3 till nod 5 (eller om en båge finns).

Vilken representation är bäst för en gles graf (en graf med få bågar)?:: Grannlista.
