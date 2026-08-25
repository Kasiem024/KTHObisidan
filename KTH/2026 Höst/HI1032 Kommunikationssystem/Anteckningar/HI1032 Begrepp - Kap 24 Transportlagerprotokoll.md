---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
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
