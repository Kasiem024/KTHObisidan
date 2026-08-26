---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 5 – fjärranrop: request-reply, RPC, RMI, anropssemantik och proxy/skeleton."
---
# HI1031 Begrepp - Kap 05 Fjärranrop

## Grundmönster

**Request-reply-protokoll**;;Ett enkelt mönster ovanpå meddelanden där en klient ==skickar en förfrågan och blockerar tills svaret kommer==; grunden för klient-server och för RPC/RMI.

**RPC** (Remote Procedure Call);;Att anropa en ==procedur i en annan process eller dator som om den vore lokal== – systemet döljer att anropet går över nätet.

**RMI** (Remote Method Invocation);;Att ett objekt i en process ==anropar en metod på ett objekt i en annan process==; en objektorienterad utökning av RPC.

Vad är skillnaden mellan RPC och RMI?
||
- **RPC:** anropar en *procedur/funktion* på distans (proceduellt).
- **RMI:** anropar en *metod på ett objekt* och kan skicka ==objektreferenser== som parametrar (objektorienterat).

## Anropssemantik

Vilka anropssemantiker (invocation semantics) finns för fjärranrop? (3)
||
- **Maybe** – inga garantier; anropet kan ha skett 0 eller 1 gång
- **At-least-once** – upprepas tills svar fås; kan utföras *flera* gånger
- **At-most-once** – utförs *högst en gång* (inget resultat eller exakt ett)

**Maybe-semantik**;;Den svagaste garantin: vid fel vet man ==inte om anropet utfördes över huvud taget== (0 eller 1 gång). Duger bara när det inte spelar roll.

**At-most-once-semantik**;;Garantin att en operation ==utförs högst en gång== – klienten får antingen ett resultat eller ett fel, men servern kör aldrig anropet dubbelt.

**Idempotent operation**;;En operation som ==ger samma resultat hur många gånger den än upprepas== (t.ex. "sätt x = 5"); gör det ofarligt att skicka om vid at-least-once.

## Middleware-komponenter

Vilka komponenter döljer detaljerna vid ett fjärranrop? (3)
||
- **Proxy** – hos klienten; ser ut som fjärrobjektet och ==marshallar== anropet
- **Skeleton** – hos servern; ==unmarshallar== och anropar det riktiga objektet
- **Dispatcher** – tar emot förfrågan och väljer rätt metod

**Proxy** (i fjärranrop);;En *ställföreträdare* hos klienten som ==ser ut precis som fjärrobjektet==; den fångar anropet, packar ihop det och skickar det över nätet.

**Remote interface** (fjärrgränssnitt);;En specifikation av ==vilka metoder på ett objekt som får anropas på distans==; beskrivs ofta i ett *IDL*.

**IDL** (Interface Definition Language);;Ett språk för att ==beskriva ett gränssnitt (metoder och parametrar) oberoende av programmeringsspråk==, så att klient och server kan samverka.

Varför bör man *inte* få fjärranrop att bete sig exakt som lokala anrop?::För att de har ==andra fel- och prestandaegenskaper== – nätet kan fela och anropet är långsammare – så programmeraren behöver kunna hantera det.
