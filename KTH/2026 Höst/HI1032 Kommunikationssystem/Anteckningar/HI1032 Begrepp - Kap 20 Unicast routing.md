---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 20 – unicast routing: distansvektor/länktillstånd/vägvektor, RIP/OSPF/BGP samt autonoma system (IGP/EGP)."
---
# HI1032 Begrepp - Kap 20 Unicast routing

Vad är målet med de flesta routingalgoritmer (least-cost routing)?::Att hitta den ==billigaste (kortaste) vägen== mellan källa och destination genom nätet.

Vilka tre typer av routingalgoritmer finns? (3)
||
- **Distansvektor** (distance-vector) – dela hela din tabell med grannarna (t.ex. RIP)
- **Länktillstånd** (link-state) – dela dina länkars tillstånd med alla (t.ex. OSPF)
- **Vägvektor** (path-vector) – dela hela vägar; för policy mellan AS (t.ex. BGP)

Vad skiljer distansvektor- från länktillståndsrouting?
||
- **Distansvektor:** varje router delar ==hela sin routingtabell med grannarna== och saknar helhetsbild.
- **Länktillstånd:** varje router delar ==sina länkars tillstånd med alla== och bygger en *komplett karta* av nätet.

**RIP** (Routing Information Protocol);;Ett *distansvektor*-protokoll inom ett AS som mäter väg i ==antal hopp== (max 15).

**OSPF** (Open Shortest Path First);;Ett *länktillstånds*-protokoll inom ett AS där varje router bygger en ==komplett karta av nätet== och räknar ut kortaste vägen.

**BGP** (Border Gateway Protocol);;Internets *vägvektor*-protokoll som routar ==mellan autonoma system (AS)== och kan väga in policy, inte bara kostnad.

**Autonomt system** (AS);;En ==samling nät under en gemensam administration== som kör sitt eget interna routingprotokoll; internet knyts ihop av protokoll *mellan* AS.

Vad är skillnaden mellan intern (IGP) och extern (EGP) routing?
||
- **IGP** (interior, t.ex. RIP/OSPF): routing *inom* ett AS.
- **EGP** (exterior, t.ex. BGP): routing ==mellan== olika AS.
