---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 19 – nätverkslagerprotokoll: IPv4-datagram, fragmentering, TTL, ICMP (fel/fråga, ping) och IGMP."
---
# HI1032 Begrepp - Kap 19 Nätverkslagerprotokoll

**IPv4-datagram**;;Nätverkslagrets paket i IPv4 – ett ==huvud med bl.a. käll- och destinations-IP, TTL och protokollfält== följt av data.

**Fragmentering** (fragmentation);;Att ett ==datagram delas i mindre delar== när det är större än länkens MTU, och sätts ihop igen (oftast hos destinationen).

**TTL** (Time To Live);;Ett fält i IP-huvudet som ==minskar med 1 vid varje router== och får paketet att kastas när det når 0 – hindrar paket från att cirkla för evigt.

**ICMP** (Internet Control Message Protocol);;Protokoll som ==rapporterar fel och skickar frågor om IP-nätet== (t.ex. "destination unreachable"); används av *ping* och *traceroute*.

Vilka två kategorier av ICMP-meddelanden finns?
||
- **Felmeddelanden** (error) – rapporterar problem (t.ex. destination unreachable, time exceeded).
- **Frågemeddelanden** (query) – testar nätet (t.ex. echo request/reply = ping).

Vilka verktyg bygger på ICMP?::==ping== (kollar om en värd svarar via echo request/reply) och ==traceroute== (spårar vägen ett paket tar).

**IGMP** (Internet Group Management Protocol);;Protokoll som ==hanterar medlemskap i multicast-grupper==, så att routrar vet vilka värdar som vill ta emot en viss multicast-ström.
