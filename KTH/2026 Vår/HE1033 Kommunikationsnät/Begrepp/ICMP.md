---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "### Vanliga verktyg - Ping: Skickar *Echo Request* och väntar på *Echo Reply*. - Traceroute: Skickar paket med successivt högre TTL för att se vilka routers paketet passerar."
created: 2026-05-28
updated: 2026-05-28
---
# ICMP

> **Lager:** OSI 3 (Nätverk)
> **Mål:** Diagnostik och felhantering.

---

## Definition
**ICMP (Internet Control Message Protocol)** används för att skicka kontrollmeddelanden mellan nätverksenheter.

### Vanliga verktyg
- **Ping:** Skickar *Echo Request* och väntar på *Echo Reply*.
- **Traceroute:** Skickar paket med successivt högre TTL för att se vilka routers paketet passerar.

## Tenta-fokus
- **Felmeddelanden:** 
	- *Destination Unreachable:* Vägen finns inte eller är blockerad.
	- *Time Exceeded:* TTL nådde 0 i en router.
- **IPv6:** I IPv6 är ICMPv6 mycket viktigare och sköter även funktioner som i IPv4 sköts av [[ARP]].

## Kopplat till
- **Bas:** [[IPv4 och IPv6]]
- **Verktyg:** Traceroute (använder TTL)

## Flashcards

Vilket protokoll används av verktyget Ping?:: ICMP.

Vad skickas tillbaka till källan om ett paket kastas pga för låg TTL?:: ICMP Time Exceeded.
