---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "### Versioner - RIPv1: Classful, skickar med broadcast, stöder inte VLSM. - RIPv2: Classless, stöder VLSM och nätmask i uppdateringarna, skickar med multicast till 224.0.0.9. - RIPng: Varianten för…"
created: 2026-08-18
updated: 2026-08-18
---
# RIP

> **Typ:** IGP (Internal Gateway Protocol)
> **Metod:** Distance Vector.

---

## Definition
**RIP (Routing Information Protocol)** är ett av de äldsta routingprotokollen och används inom ett enskilt nätverk (AS). Det är enkelt att konfigurera men konvergerar långsamt, och har därför i praktiken ersatts av [[OSPF]].

- **Distance Vector:** Varje router känner bara till sina direkta grannar och delar hela sin routingtabell med dem. Kallas därför "routing by rumor".
- **Metrik:** Antal hopp (hop count). Lägst antal hopp vinner — bandbredd ignoreras helt.
- **Max 15 hopp:** 16 hopp betyder "oändligt", alltså onåbart. Detta begränsar RIP till små nätverk.
- **Uppdateringar:** Hela tabellen skickas till grannarna var 30:e sekund.
- **Algoritm:** Bygger på Bellman-Ford.

### Versioner
- **RIPv1:** Classful, skickar med broadcast, stöder inte VLSM.
- **RIPv2:** Classless, stöder VLSM och nätmask i uppdateringarna, skickar med multicast till `224.0.0.9`.
- **RIPng:** Varianten för IPv6.

## Tenta-fokus
- **Varför max 15 hopp?** För att begränsa *count-to-infinity*-problemet: vid ett avbrott kan routrar annars räkna upp metriken i oändlighet medan de "skvallrar" fel information till varandra.
- **Motmedel mot loopar:** Split horizon (annonsera inte en rutt tillbaka på samma gränssnitt den kom in), route poisoning (annonsera metrik 16), hold-down timers och triggered updates.
- **RIP vs OSPF:** RIP = distance vector, hop count, långsam konvergens. OSPF = link state, kostnad baserad på bandbredd, snabb konvergens.
- **Transport:** RIP skickas över UDP, port 520.

## Kopplat till
- **Alternativ:** [[OSPF]] (link state, internt), [[BGP]] (externt)
- **Koncept:** [[Routing-principer]]

## Flashcards

Vilken metrik använder RIP för att välja väg?:: Antal hopp (hop count).

Vad är det maximala antalet hopp i RIP?(Definition):: 15 hopp — 16 tolkas som oändligt, alltså onåbart.

Varför kallas Distance Vector-protokoll som RIP för "routing by rumor"?:: Eftersom en router bara känner till sina grannar och litar helt på den routingtabell grannarna skickar vidare.

Vilka tre motmedel används mot routingloopar i RIP?(3):: Split horizon, route poisoning och hold-down timers.

Vad är den största nackdelen med RIP jämfört med OSPF?:: RIP konvergerar långsamt och ignorerar bandbredd, eftersom den bara räknar hopp.
