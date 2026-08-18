---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# OSPF

> **Typ:** IGP (Internal Gateway Protocol)
> **Metod:** Link State.

---

## Definition
**OSPF (Open Shortest Path First)** är ett routingprotokoll som används inom ett företag eller ett universitet.

- **Link State:** Varje router bygger en karta över hela nätverkets topologi (inte bara nästa hopp).
- **Dijkstra:** Använder [[Dijkstras algoritm]] för att räkna ut den bästa vägen baserat på kostnad (oftast baserat på bandbredd).

## Tenta-fokus
- **Hello-paket:** Routers skickar "Hello" med jämna mellanrum för att veta att grannarna lever.
- **Areas:** Stora nätverk delas in i områden för att minska mängden routingdata varje router behöver hantera.

## Kopplat till
- **Algoritm:** [[Dijkstras algoritm]]
- **Relaterat:** [[BGP]] (externt), [[RIP]] (gammalt)

## Flashcards

Vilken algoritm använder OSPF för att beräkna kortaste vägen?:: Dijkstras algoritm.

Vad är en fördel med OSPF jämfört med distansvektor-protokoll som RIP?:: Det konvergerar (uppdateras) mycket snabbare vid nätverksfel.
