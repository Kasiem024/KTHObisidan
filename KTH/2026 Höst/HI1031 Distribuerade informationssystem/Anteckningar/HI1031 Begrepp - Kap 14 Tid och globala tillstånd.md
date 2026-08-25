---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 14 – tid och globala tillstånd: klocksynkronisering, logiska klockor, vektorklockor och globala tillstånd."
---
# HI1031 Begrepp - Kap 14 Tid och globala tillstånd

## Fysisk tid

**Klockdrift** (clock drift);;Att två fysiska klockor ==tickar i något olika takt== och därför gradvis går isär, även om de ställts lika från början.

**Klockskew** (clock skew);;Den ==momentana skillnaden i tid== mellan två klockor vid en given tidpunkt.

**NTP** (Network Time Protocol);;Ett protokoll för att ==synkronisera datorers klockor== mot pålitliga tidskällor över internet.

Varför kan man inte lita på fysisk tid för att ordna händelser i ett distribuerat system?::Eftersom klockor ==inte går att synkronisera perfekt== (de driver isär) och meddelanden tar olika lång tid – det finns ingen exakt gemensam tid.

## Logisk tid

**Happened-before-relationen** (→);;En *partiell ordning* av händelser byggd på ==orsakssamband==: händelser i samma process ordnas, och en sändning sker alltid före sin mottagning.

**Logisk klocka** (Lamport-klocka);;En räknare som ==ökar vid varje händelse och skickas med meddelanden==, så att händelser kan ordnas efter orsak–verkan *utan* fysisk tid.

**Vektorklocka** (vector clock);;En vektor med en räknare per process som gör att man kan ==avgöra om två händelser är orsaksberoende eller samtidiga==.

Vad kan en vektorklocka som en enkel Lamport-klocka inte kan?
||
- **Lamport:** om A → B så är L(A) < L(B), men ==omvänt gäller inte== – ett lägre tal betyder inte säkert "hände före".
- **Vektorklocka:** kan avgöra *exakt* om A hände före B, tvärtom, eller om de är ==samtidiga (concurrent)==.

## Globala tillstånd

**Globalt tillstånd** (global state);;En ==ögonblicksbild av alla processers tillstånd== (och meddelanden i farten) samtidigt – svårt att fånga då gemensam tid saknas.

Vad menas med ett *konsistent snitt* (consistent cut)?::Ett globalt tillstånd där det ==för varje mottaget meddelande också finns med en sändning== – alltså inga effekter utan sin orsak.
