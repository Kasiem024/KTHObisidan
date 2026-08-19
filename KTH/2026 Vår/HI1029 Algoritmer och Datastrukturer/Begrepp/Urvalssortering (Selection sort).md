---
tags: [begrepp, HI1029, KTH, programmering, year2026]
description: "Algoritmen letar upp det minsta elementet i den osorterade delen och byter plats på det med det första elementet i den osorterade delen."
created: 2026-05-28
updated: 2026-05-28
---
# Urvalssortering (Selection sort)

> **Komplexitet:** $O(n^2)$ (jämförelser), $O(n)$ (byten)
> **Stabil:** Nej

---

## Definition

Algoritmen letar upp det minsta elementet i den osorterade delen och byter plats på det med det första elementet i den osorterade delen.

## Tenta-fokus

- **Prestanda:** Alltid $O(n^2)$, även om listan redan är sorterad (eftersom den alltid måste leta igenom hela den osorterade delen).
- **Byten:** Dess stora fördel är att den bara gör $O(n)$ byten. Det är bra om det är "dyrt" att flytta data i minnet.

## Kopplat till

- **Egenskap:** [[Stabilitet (Sortering)]]
- **Alternativ:** [[Instickssortering (Insertion sort)]]

## Flashcards

Ange ordo för antal jämförelser vid urvalssortering (selection sort).:: $O(n^2)$.

Ange ordo för antal platsbyten vid urvalssortering.:: $O(n)$.
