---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
---
# Routing-principer
> **Lager:** OSI 3 (Nätverk)
> **Viktigt:** Beslutsfattande i routern.

---

## Definition
Hur en router väljer vilken port ett paket ska skickas ut på baserat på destinations-IP.

### Centrala regler
- **Longest Prefix Match:** Om flera rader i tabellen matchar IP-adressen väljs den med den mest specifika (längsta) masken.
- **Default Route (0.0.0.0/0):** Används om ingen annan rad matchar. "Sista utvägen".
- **Directly Connected:** Nätverk som routern själv sitter på har lägst kostnad/metrik.

## Tenta-fokus
- **Metrik:** Ett värde som anger hur "dyr" en väg är (t.ex. antal hopp eller bandbredd).
- **Loopback:** `127.0.0.1` - används för att skicka trafik till sig själv (interntest).

## Kopplat till
- **Algoritm:** [[Dijkstras algoritm]]
- **Protokoll:** [[OSPF]], [[BGP]], [[RIP]]

## Flashcards

Vilken regel prioriterar en mer specifik nätmask i routingtabellen?:: Longest Prefix Match.

Vad är syftet med en Default Route?:: Att ge routern en väg att skicka paket även om det inte finns en specifik matchning i routingtabellen.
