---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "Ett Minsta uppspännande träd (MST) är en delmängd av bågarna i en graf som kopplar samman alla noder utan att bilda cykler, där den totala vikten av bågarna är så liten som möjligt."
created: 2026-05-28
updated: 2026-05-28
---
# Minsta uppspännande träd (MST)

> **Mål:** Koppla ihop alla noder med lägsta totala kostnad.
> **Viktigt:** Inga cykler!

---

## Definition

Ett **Minsta uppspännande träd (MST)** är en delmängd av bågarna i en graf som kopplar samman alla noder utan att bilda cykler, där den totala vikten av bågarna är så liten som möjligt.

### Algoritmer

- **Prims algoritm:** Börjar i en nod och lägger hela tiden till den billigaste bågen som kopplar till en ny nod.
- **Kruskals algoritm:** Sorterar alla bågar efter vikt och lägger till dem en efter en, så länge de inte skapar en cykel.

## Tenta-fokus

- **Krav:** Grafen måste vara sammanhängande och viktad.
- **Unikhet:** Om alla bågar har olika vikter finns det bara ett unikt MST. Om vikter är samma kan det finnas flera olika.

## Kopplat till

- **Bas:** [[Graf-representationer]]
- **Strukturer:** [[Heap]] (används i Prims för att hitta billigaste bågen)

## Flashcards

Vad är ett minsta uppspännande träd (MST)?(Definition):: Ett träd som förbinder alla noder i en graf med minsta möjliga totala kantvikt.

Nämn två algoritmer för att hitta MST.:: Prims algoritm och Kruskals algoritm.
