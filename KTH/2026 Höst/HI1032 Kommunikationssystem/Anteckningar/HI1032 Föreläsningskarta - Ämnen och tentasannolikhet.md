---
tags:
  - tenta
  - HI1032
  - nätverk
  - KTH
  - year2026
created: 2026-10-19
updated: 2026-10-19
description: "En karta över HI1032:s sju föreläsningar, ordnade per föreläsning och del, med en bedömd tentasannolikhet för varje ämne i fyra nivåer från Säker till Osannolik. Nivån bygger på hur ofta ämnet förekommit i fyra gamla tentor och på hur mycket examinatorn tagit upp det, och beläggen står bredvid så att ett mönster går att skilja från ett sammanträffande."
---

# HI1032 Föreläsningskarta - Ämnen och tentasannolikhet

Den här filen säger **vad** examinatorns föreläsningar tar upp och **hur troligt** varje ämne är på
tentan. Teorin står i [[HI1032 Tentasvar - Del A Transportnivån]] och
[[HI1032 Tentasvar - Del B Applikationsnivån]], korten i de två `Tentaplugg`-filerna, alla ordnade
efter samma ämnen och med samma nivå i rubriken.

## Så är nivåerna satta

Nivån sätts per **delämne**, inte per föreläsning, eftersom en 1-poängsfråga träffar ett delämne.

- **Säker** — tentat i minst 3 av 4 gamla tentor. Kommer nästan säkert, i någon form.
- **Trolig** — tentat i 1-2 av 4; eller aldrig tentat men med minst två signaler från föreläsningarna.
- **Möjlig** — inte tentat, högst en signal, men examinatorn har en egen bild om det. Kan dyka upp som
  en 1-poängsfråga.
- **Osannolik** — kursadministration, historik, verktygs- och koddemon, produktnamn, och allt som
  tentan själv delar ut (TCP/IP/UDP-huvudena, de sex ACK-reglerna, tillståndsmaskinerna). Läses inte.

Signalerna är: examinatorn ställer en fråga på bilden; ämnet står bland de rekommenderade
övningsuppgifterna; det har minst tre egna bilder; det återkommer i minst två föreläsningar.
**Frekvensen i gamla tentor går före kategorin** — FTP:s kommandon och "nämn en annan congestion
control-algoritm" ser ut som Osannolikt men är tentade, och blir därför Säker respektive Trolig.
Underlaget för "tentat" är delfrågeinventeringen i [[HI1032 Tentaanalys - AI-kontext]] avsnitt 3.

**Fyra tentor är fyra observationer.** Nivåerna är bedömningar, inte sannolikheter, och "2 av 4" kan
vara en slump. Därför står beläggen med.

## Held-out-kontroll av regeln

Regeln testades så som en gammal tenta skulle ha mött den: för varje tenta kontrollerades, delfråga för
delfråga mot inventeringen i [[HI1032 Tentaanalys - AI-kontext]] avsnitt 3, om ämnet fanns i
föreläsningarna och i så fall på vilken nivå. Utfallet: **varje tentad delfråga i alla fyra tentorna
hörde till ett ämne som föreläsningarna tar upp**, och alla utom en låg i Säker eller Trolig. Undantaget
var en delfråga om teckenkodning i oktober 2024, ett ämne som bara den tentan hade på den poängnivån, och
som ligger i Trolig.

Det här säger att **föreläsningarna täcker tentans ämnen** — inte att du får alla poäng, för att ett ämne
är täckt betyder inte att du svarat rätt. Och kontrollen är med på ett hörn, eftersom nivåerna delvis
bygger på just de fyra tentorna. Ett ämne i Säker är alltså en säkrare satsning än ett i Trolig, men
ingen nivå är en garanti.

## Del A — Transportnivån (föreläsning 1 till 3)

### Säker

- **Portar och multiplexing** (F1) — 4 av 4 tentor. Socketadress, well-known mot efemär, multiplexing.
- **MSS och MTU** (F1) — MTU 3 av 4. Varför fragmentering undviks, hur MSS hittas.
- **ACK-reglerna** (F2) — 17 poäng, 4 av 4. De sex reglerna delas ut; du tränar att tillämpa dem.
- **RTO** (F2) — 11 poäng, 3 av 4. $\text{RTT}_\text{S}$, $\text{RTT}_\text{D}$ och formeln $\text{RTO} = \text{RTT}_\text{S} + 4 \cdot \text{RTT}_\text{D}$, med genomräknat exempel.
- **Flödeskontroll och fönster** (F3) — 3 av 4 (congestion 3 av 4, flöde 3 av 4). Send/receive window,
  pull och push, min(cwnd, rwnd).
- **Congestion control** (F3) — 16 poäng, 3 av 4. AIMD, slow start, congestion avoidance, Tahoe och Reno,
  med genomgång av cwnd-grafen (som delas ut).
- **SCTP** (F3) — 3 av 4. Multi-homing, strömmar, chunks, TSN mot SSN.

### Trolig

- **Transportlagret, UDP, TCP-egenskaper, TCP-huvudet** (F1) — grunden; UDP-hex 2 av 4, TCP-flaggor 1 av 4.
- **Etablering och terminering** (F1, F2) — 2 av 4 var. Three-way och four-way, ISN, TIME-WAIT, half-close.
- **Tillståndsdiagrammet** (F1) — binder ihop etablering och terminering; diagrammet delas ut.
- **Numreringssystem, felkontroll, omsändning, timers** (F2) — mekaniken bakom ACK och RTO.
- **SACK, ARQ, Path MTU Discovery** (F1, F3) — SACK 2 av 4; ARQ och Path MTU från bilderna.

### Möjlig

- **Inkapsling** (F1), **Karns algoritm** (F2), **TCP-versioner och CUBIC** (F3) — egna bilder men inte
  tentat; ett kort stycke och på sin höjd ett kort var.

### Osannolik (läses inte)

Kursadministration och labbinfo, Python-kodexemplen, Wireshark-övningarna, `/etc/services`-listan och
IANA-formuläret, de råa bitlayouterna för IP-, UDP- och TCP-huvudena, och själva de utdelade cwnd-graferna
och tillståndsmaskinerna.

## Del B — Applikationsnivån (föreläsning 4 till 7)

### Säker

- **SNMP** (F4) — 13 poäng, 4 av 4. Manager och agent, meddelandetyperna och deras riktning, OID som
  begrepp, SMI/MIB/BER/ASN.1 som delar.
- **DNS** (F6, F7) — 13 poäng, 4 av 4. Namnträdet, posttyperna A/AAAA/TXT/MX/CNAME, resolver mot
  auktoritativ, iterativ mot rekursiv uppslagning.
- **FTP** (F6) — 11 poäng, 3 av 4. Två förbindelser (21 och 20), aktivt mot passivt läge, ASCII mot image.
- **E-post** (F6) — 3 av 4. SMTP, IMAP/POP, vägen avsändare → MTA → MTA → mottagare.
- **MIME** (F6) — 6 poäng, 4 av 4. Content-Type, multipart, varför MIME behövs.
- **JPEG** (F5) — 6 poäng, 3 av 4. De tre stegen, att kvantiseringen är det förstörande, zigzag.
- **RTP** (F5) — 6 poäng, 3 av 4. Ovanpå UDP, sekvensnummer och tidsstämpel, RTCP bredvid.
- **Klient-server** (F6) — 3 av 4. Rollerna, och peer-to-peer som alternativ.
- **Webben och HTTP** (F6) — HTTP 3 av 4. URL, HTTP, HTML; HTTP-svarets delar.

### Trolig

- **FCAPS** (F4) — 2 av 4. De fem områdena, reaktiv mot proaktiv felhantering.
- **ASN.1/TLV, SMI, MIB-2, BER** (F4) — delarna i SNMP, som är Säker.
- **Teckenkodning, PCM, µ-law/A-law, färg** (F5) — teckenkodning 2 av 4, PCM 2 av 4, färg 1 av 4.
- **Kompression: förlustfri, Huffman, lossy, predictive/perceptual, DCT, MPEG** (F5) — Huffman och MPEG
  1 av 4; Huffman med genomräknat träd.
- **Streaming, isokron ström, multimedia och TCP, RTCP, SIP** (F5) — streaming 1 av 4, SIP 1 av 4.
- **SMTP, brevets utformning, Quoted-Printable, Base64** (F6) — Base64 1 av 4; QP och Base64 med
  genomräknade exempel.
- **SSH, HTTP/2, representation, TCP/UDP för appar** (F6) — SSH 1 av 4; HTTP/2:s fyra förbättringar.

### Möjlig

- **Deltamodulering, paketering** (F5), **NETCONF/YANG, prestandahantering** (F4), **OSI/TCP-IP-modellen,
  egna protokoll, host name database** (F6) — egna bilder men inte tentat; kort stycke, få eller inga kort.

### Osannolik (läses inte)

Kursadministration, Young-Helmholtz årtal, bitrate-exempel och produktnamn, Fourier-formeln och DCT:s
matrisräkning (utdelad), RTP-huvudets fältlayout och payload-tabell (utdelad), host-filens rader,
telnet/SMTP-listningarna, FTP- och MIME-kommandotabellerna och Base64-tabellen (utdelade), samt
`dig`-demon och DNS-paketformatet ur gästföreläsningen. OSPF, HSRP, STP och EtherChannel står i
kurs-PM:et men har aldrig tentats och examineras i labbarna — plugga dem inte för tentan.

## Källor

Examinatorns sju föreläsningar i `Filer/Canvas/Föreläsningar och artiklar/`, lästa både som bilder och
textlager. Tentafrekvensen kommer ur [[HI1032 Tentaanalys - AI-kontext]] avsnitt 3 och
[[HI1032 Tentaanalys - Ranking och poängstrategi]]. De rekommenderade övningsuppgifterna ur kapitel 9-12
av kursboken (6:e upplagan) gav signaler men inga tentapoäng.
