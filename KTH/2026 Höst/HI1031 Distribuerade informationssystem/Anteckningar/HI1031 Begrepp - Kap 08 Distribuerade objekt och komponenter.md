---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 8 – distribuerade objekt och komponenter: fjärrobjektsreferens, CORBA/ORB, komponenter och containers."
---
# HI1031 Begrepp - Kap 08 Distribuerade objekt och komponenter

## Distribuerade objekt

**Distribuerat objekt**;;Ett objekt som ==kan anropas från andra processer== via fjärrmetodanrop; det kapslar in sitt eget tillstånd och har en global referens och ett fjärrgränssnitt.

**Fjärrobjektsreferens** (remote object reference);;En ==globalt unik identifierare== som används i hela systemet för att peka ut ett visst fjärrobjekt; kan skickas som parameter.

**CORBA**;;En *standard/middleware* för ==språkoberoende fjärranrop mellan objekt== – klient och objekt kan skrivas i olika språk och samverka via ett gemensamt IDL.

**ORB** (Object Request Broker);;Kärnan i CORBA som ==förmedlar anrop mellan klient- och fjärrobjekt== och döljer nätverks- och platsdetaljer.

## Från objekt till komponenter

Vilka huvudproblem med rena distribuerade objekt ledde fram till komponenter? (2)
||
- **Implicita beroenden** – ett objekts gränssnitt visar inte vad det självt beror på
- **Exponering för lågnivådetaljer** – programmeraren tvingas skriva mycket middleware-specifik kod

**Komponent** (i middleware);;En återanvändbar mjukvarudel som ==specificerar både vad den erbjuder och vad den kräver== (sina beroenden), vilket gör den lätt att byta ut och kombinera.

**Container** (i komponentmiddleware);;En ==körmiljö som omger komponenter== och sköter deras icke-funktionella egenskaper (säkerhet, transaktioner, persistens).

Vad är den stora vinsten med containers och komponentmodeller?::==Separation of concerns== – utvecklaren fokuserar på applikationslogiken medan containern sköter middleware-detaljerna åt den.

**EJB** (Enterprise JavaBeans);;En *komponentmodell för serversidan* i Java, där en container ==tillhandahåller tjänster som transaktioner och säkerhet== åt komponenterna.
