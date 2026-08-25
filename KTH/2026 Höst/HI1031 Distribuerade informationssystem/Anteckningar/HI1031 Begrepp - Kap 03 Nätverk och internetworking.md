---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 3 – nätverkstyper, switching, protokoll och skiktning samt internet (IP, routrar, TCP/UDP)."
---
# HI1031 Begrepp - Kap 03 Nätverk och internetworking

## Nätverkstyper

**LAN** (Local Area Network);;Ett nätverk som binder samman datorer inom ett ==begränsat område== (t.ex. en byggnad) med hög hastighet, ofta över ett enda medium som Ethernet.

**WAN** (Wide Area Network);;Ett nätverk som kopplar samman datorer över ==stora geografiska avstånd== (städer, länder), med lägre hastighet och högre fördröjning än ett lokalt nät.

**Internät** (internetwork);;Ett nät som byggs genom att ==koppla ihop många olika nätverk== till *ett enda* sammanhängande kommunikationsmedium. Internet är det främsta exemplet.

Varför kan internet byggas av så många olika sorters nätverk?::Eftersom IP är ==oberoende av den underliggande tekniken== – IP-paket kan bäras av Ethernet, WiFi, fiber m.m., vilket ger användaren *ett enda virtuellt nät*.

## Switching (förmedling)

Vad är skillnaden mellan kretskoppling och paketförmedling?
||
- **Kretskoppling** (circuit switching): en *dedikerad väg* reserveras under hela kommunikationen (klassisk telefoni). Garanterad kapacitet, men slösar när det är tyst.
- **Paketförmedling** (packet switching): data delas i ==paket som skickas oberoende== och delar nätet med andra. Effektivare – grunden för internet.

**Paket** (packet);;En ==avgränsad databit med adressinformation== som skickas självständigt genom nätet; grundenheten i paketförmedlade nät.

## Protokoll och lager

**Protokoll** (i nätverk);;En uppsättning ==regler och format== som avgör hur två parter utbyter meddelanden – både *vad* som skickas och i *vilken ordning*.

**Protokollskiktning** (protocol layering);;Att bygga kommunikation i ==lager== där varje lager erbjuder tjänster till lagret ovanför och döljer detaljerna under sig.

**Inkapsling** (encapsulation);;Att varje lager ==lägger till sitt eget huvud== runt datan från lagret ovanför innan den skickas vidare nedåt i stacken.

## Internet

**IP** (Internet Protocol);;Det ==grundläggande nätverksprotokollet== som ger varje värd en adress och levererar paket (datagram) genom internät – *utan* leveransgaranti.

**Router**;;En enhet som ==vidarebefordrar paket mellan olika nätverk== och väljer väg mot destinationen utifrån paketets internät-adress.

**Routing**;;Att ==välja väg för ett paket== genom ett nät med flera möjliga vägar; sköts av routrar med hjälp av routingtabeller.

Vad menas med *adaptiv* routing?::Att routrarna ==anpassar vägvalet efter nätets tillstånd== (trafik, trasiga länkar) i stället för att alltid följa en fast väg.

Vad är skillnaden mellan TCP och UDP?
||
- **TCP:** *förbindelseorienterad* och ==tillförlitlig== – levererar en byteström i rätt ordning, med flödeskontroll.
- **UDP:** *förbindelselös* och ==otillförlitlig== – skickar enskilda datagram utan garanti, men med låg overhead.
