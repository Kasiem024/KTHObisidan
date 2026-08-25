---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 28 – multimedia: förlustfri/förstörande kompression, strömning samt RTP, RTCP och SIP."
---
# HI1032 Begrepp - Kap 28 Multimedia

**Kompression** (i multimedia);;Att ==minska datamängden== som ska lagras eller skickas – nödvändigt eftersom ljud och video annars är väldigt stora.

Vad skiljer förlustfri (lossless) från förstörande (lossy) kompression?
||
- **Förlustfri:** ==ingen data går förlorad== – originalet kan återskapas exakt (t.ex. text/program; RLE, Huffman).
- **Förstörande:** ==kastar detaljer man knappt märker== för högre kompression (t.ex. JPEG, MPEG).

På vilka tre sätt kan multimedia levereras över internet? (3)
||
- **Strömmande lagrad** (streaming stored) – förinspelat, spelas medan det laddas (t.ex. YouTube)
- **Strömmande live** – sänds i realtid till många
- **Realtidsinteraktivt** – tvåvägs i realtid (t.ex. videosamtal)

**RTP** (Real-time Transport Protocol);;Protokoll som bär ==realtidsljud och -video ovanpå UDP== och ger varje chunk ett *sekvensnummer* och en *tidsstämpel* för jämn uppspelning.

**RTCP** (RTP Control Protocol);;RTP:s följeslagare som ==skickar återkoppling om kvaliteten== (t.ex. paketförlust) så att sändaren kan anpassa sig.

**SIP** (Session Initiation Protocol);;Ett ==signaleringsprotokoll för att upprätta, styra och avsluta== realtidssessioner (t.ex. ringa upp deltagare i IP-telefoni).
