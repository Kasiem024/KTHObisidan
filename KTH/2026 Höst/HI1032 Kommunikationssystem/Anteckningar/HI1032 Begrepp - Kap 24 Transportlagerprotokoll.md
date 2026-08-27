---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-26
description: "Flashcards HI1032 kap 24 – transportlagerprotokoll: UDP, TCP (trevägshandskakning, flödes-/fel-/trängselkontroll) och SCTP."
---
# HI1032 Begrepp - Kap 24 Transportlagerprotokoll

Vad skiljer UDP från TCP?
||
- **UDP:** *förbindelselös, otillförlitlig, meddelandeorienterad* – enkel och snabb, låg overhead.
- **TCP:** ==förbindelseorienterad, tillförlitlig, byteström== med flödes-, fel- och trängselkontroll.

**UDP** (User Datagram Protocol);;Ett ==förbindelselöst, otillförlitligt== transportprotokoll med minimal overhead; passar korta meddelanden och realtid där enkelhet väger tyngre än tillförlitlighet.

**TCP** (Transmission Control Protocol);;Ett ==förbindelseorienterat, tillförlitligt== transportprotokoll som levererar en ordnad byteström med flödes-, fel- och trängselkontroll.

**Trevägshandskakning** (three-way handshake);;Sättet TCP ==upprättar en förbindelse== på, i tre steg: SYN → SYN+ACK → ACK.

Vilka tre typer av kontroll erbjuder TCP? (3)
||
- **Flödeskontroll** – matcha sändar- mot mottagartakt (glidande fönster)
- **Felkontroll** – checksummor, ACK, timeout och omsändning
- **Trängselkontroll** (congestion) – t.ex. slow-start, för att undvika överbelastning

**Trängselkontroll** (congestion control);;TCP:s sätt att ==anpassa sändningstakten efter nätets belastning== (t.ex. slow-start) för att undvika och hantera överbelastning.

**SCTP** (Stream Control Transmission Protocol);;Ett nyare transportprotokoll som ==kombinerar TCP:s tillförlitlighet med UDP:s meddelandeorientering==, plus *multistream* och *multihoming*.

Vad innebär SCTP:s multihoming?::Att en förbindelse (association) kan ==använda flera IP-adresser/nätverksvägar== samtidigt, så att den överlever att en väg fallerar.

**MSS** (Maximum Segment Size);;Den största datamängd ett TCP-segment får bära, satt så att segmentet ryms i ett IP-paket ==utan fragmentering==. Utgår från länkens MTU och finjusteras med *Path MTU Discovery*.

Hur fungerar Path MTU Discovery?::Sändaren skickar paket med flaggan ==Don't Fragment (DF)== satt; klarar en länk inte storleken kastas paketet och en *ICMP*-varning ("Fragmentation Needed", typ 3 kod 4) skickas tillbaka med länkens MTU – då sänks MSS.

Vad skiljer slow start från congestion avoidance i TCP?
||
- **Slow start:** cwnd börjar på 1 MSS och ==ökar 1 per ACK== → *exponentiell* tillväxt, tills cwnd når tröskeln *ssthresh*.
- **Congestion avoidance:** därefter ökar cwnd ==additivt, ca 1 MSS per RTT== (linjärt).

Vad gör TCP när trängsel upptäcks, och hur skiljer sig Tahoe och Reno?
||
- Båda: ==ssthresh sätts till cwnd/2== (multiplicative decrease).
- **Tahoe:** cwnd → *1 MSS* och slow start, vid *både* timeout och 3 dup-ACK.
- **Reno:** vid *3 dup-ACK* görs fast retransmit + ==fast recovery== (cwnd = ssthresh+3, inte 1); bara timeout ger cwnd=1.

Hur beräknar TCP sin retransmission timeout (RTO)?::Ur den *utjämnade* RTT:n **RTTS** och dess avvikelse **RTTD**: ==RTO = RTTS + 4 × RTTD==. Vid en omsändning fördubblas RTO (*exponential backoff*).

Vad säger Karns algoritm?::==Räkna inte med RTT för ett omsänt segment== när RTTS/RTTD uppdateras – annars vet man inte om ACK:en gäller originalet eller omsändningen. RTO uppdateras först när ett segment bekräftas utan omsändning.
