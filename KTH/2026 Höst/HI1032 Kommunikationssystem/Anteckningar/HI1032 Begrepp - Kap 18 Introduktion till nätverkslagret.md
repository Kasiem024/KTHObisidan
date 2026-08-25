---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 18 – nätverkslagret: tjänster (packetizing, routing/forwarding), IPv4-adressering (classful/CIDR), subnätmask och NAT."
---
# HI1032 Begrepp - Kap 18 Introduktion till nätverkslagret

Vilken leveransomfattning har nätverkslagret?::==Värd-till-värd== (host-to-host) – det levererar datagram från källvärden till destinationsvärden genom internät.

Vad är skillnaden mellan routing och forwarding?
||
- **Routing:** processen att ==bestämma vägen== genom nätet (bygga routingtabeller).
- **Forwarding:** den lokala handlingen att ==skicka ett paket vidare== till rätt utgående gränssnitt enligt tabellen.

**Packetizing**;;Nätverkslagrets uppgift att ==kapsla in transportlagrets segment i datagram== hos källan och packa upp dem hos destinationen.

Vilka mått beskriver nätverkslagrets prestanda? (3)
||
- **Fördröjning** (delay)
- **Genomströmning** (throughput)
- **Paketförlust** (packet loss)

## IPv4-adressering

Vad skiljer klassbaserad (classful) från klasslös (classless) IPv4-adressering?
||
- **Classful:** adressrymden delas i *fasta* klasser (A/B/C) – slösaktigt och föråldrat.
- **Classless (CIDR):** adressrymden delas i ==block av variabel storlek== efter behov, med en prefixlängd (t.ex. /24).

**CIDR** (Classless Inter-Domain Routing);;Klasslös adressering där ett adressblock anges med en ==prefixlängd== (t.ex. 192.168.0.0/24) i stället för fasta klasser.

**Subnätmask** (subnet mask);;Anger ==hur många bitar av en IP-adress som är nät-del== kontra värd-del (t.ex. /24 = 255.255.255.0).

**NAT** (Network Address Translation);;Teknik som låter många enheter dela på ==en enda (eller få) publik IP-adress== genom att översätta mellan privata och publika adresser; lindrar IPv4-adressbristen.
