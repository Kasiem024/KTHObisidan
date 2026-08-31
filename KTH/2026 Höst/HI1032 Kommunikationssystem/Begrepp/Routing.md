---
tags: [begrepp, HI1032, nätverk, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Begrepp: routing (HI1032)."
---
# Routing

## Definition

Att ==välja väg för paket== genom ett nät. Tre algoritmtyper: **distansvektor** (dela hela tabellen med grannar, t.ex. RIP), **länktillstånd** (dela länktillstånd med alla → komplett karta, t.ex. OSPF) och **vägvektor** (dela vägar, för policy mellan AS, t.ex. BGP). Routing *inom* ett AS = IGP; *mellan* AS = EGP.

## Kopplat till

- [[Router]]

## Flashcards

Vilka tre typer av routingalgoritmer finns? (3)
||
- **Distansvektor** (RIP) – dela hela tabellen med grannarna
- **Länktillstånd** (OSPF) – dela länktillstånd med alla; komplett karta
- **Vägvektor** (BGP) – dela vägar; policy mellan AS

Vad är skillnaden mellan IGP och EGP?::==IGP== routar *inom* ett AS (RIP/OSPF); ==EGP== routar *mellan* AS (BGP).
