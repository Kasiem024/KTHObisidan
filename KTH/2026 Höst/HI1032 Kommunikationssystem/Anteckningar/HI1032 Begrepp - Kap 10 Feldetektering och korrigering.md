---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 10 – feldetektering och korrigering: fel­typer, redundans, paritet, CRC, checksumma, Hammingavstånd och FEC."
---
# HI1032 Begrepp - Kap 10 Feldetektering och korrigering

Vad skiljer ett enbitsfel från ett skurfel (burst error)?
||
- **Enbitsfel:** *en enda* bit ändras.
- **Skurfel:** ==flera på varandra följande bitar== ändras; vanligare, eftersom brus oftast varar längre än en bit.

**Redundans** (redundancy);;Att ==skicka extra bitar utöver datan== så att mottagaren kan upptäcka eller rätta fel; grundidén bakom all felkontroll.

Vad är skillnaden mellan feldetektering och felkorrigering?
||
- **Detektering:** svara bara *ja/nej* på om ett fel finns – enklare.
- **Korrigering:** måste dessutom veta ==exakt vilka bitar som är fel== för att laga dem – kräver mer redundans.

**Paritetsbit** (parity);;En extra bit som gör ==antalet ettor jämnt (eller udda)==; enklaste feldetekteringen, men missar fel som ändrar ett jämnt antal bitar.

**CRC** (Cyclic Redundancy Check);;Kraftfull feldetektering där data ==divideras med ett generatorpolynom== och resten skickas med; fångar de flesta fel och används i ramar.

**Checksumma** (checksum);;Feldetektering där man ==summerar datablocken och skickar med summan==; mottagaren räknar om och jämför. Används i IP, TCP och UDP.

**Hammingavstånd** (Hamming distance);;==Antalet bitpositioner där två kodord skiljer sig==; ett större minsta hammingavstånd gör att fler fel kan upptäckas eller rättas.

Vad innebär framåtriktad felkorrigering (FEC)?::Att mottagaren kan ==rätta fel själv med hjälp av redundansen==, utan att begära omsändning – viktigt när omsändning är för dyr (t.ex. realtid).
