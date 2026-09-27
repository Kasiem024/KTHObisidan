---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 5, ordnade efter kursens fyra tentafrågor: hur distribuerade objekt och RMI fungerar, sockets mot distribuerade objekt, jämförelsen av sockets, RPC, RMI och webbtjänster, samt distribuerade objekt mot webbtjänster."
---
# HI1031 Begrepp - Kap 05 Fjärranrop

## Fråga 1 – Hur distribuerade objekt och RMI fungerar

Vad är ett fjärrobjekt (remote object)?::Ett objekt vars metoder ==går att anropa från en annan process==, inte bara lokalt.

Vad är RMI (fjärrmetodanrop)?::Att ==anropa en metod på ett objekt i en annan process== som om det vore ett vanligt lokalt anrop.

**Fjärrobjektreferens** (remote object reference);;Ett id som ==pekar ut ett bestämt fjärrobjekt i hela systemet==. Kan skickas som parameter.

**Fjärrgränssnitt** (remote interface);;Talar om ==vilka av ett fjärrobjekts metoder som får anropas på distans==. Lokala objekt kan anropa alla.

Vilka fyra delar sköter ett RMI-anrop, och vad gör de? (4)
||
- **Proxy** (hos klienten) – ser ut som ett lokalt objekt och packar ihop anropet till ett meddelande
- **Dispatcher** (hos servern) – väljer rätt metod i skelettet
- **Skelett** (hos servern) – packar upp anropet och anropar servanten
- **Servant** – själva objektet med koden som körs

Hur skickas parametrar vid ett fjärranrop (RMI)?::==Fjärrobjekt skickas som referens==, allt annat kopieras och skickas som värde.

Hur skapar en server nya fjärrobjekt?::Med en ==factory-metod== som skapar objektet och skickar tillbaka en referens – en konstruktor går inte att anropa på distans.

## Fråga 2 – Sockets mot distribuerade objekt

När kan enkel request-reply (sockets) vara bättre än distribuerade objekt?::När man vill ha något ==lättviktigt och minimalt== och slippa onödiga omkostnader – boken nämner inbyggda system.

När är distribuerade objekt bättre än rena sockets?::När programmet är stort och krångligt – då kan man ==skicka en referens till ett objekt== i stället för att koda och skicka allt själv.

Varför är ett fjärranrop alltid känsligare för fel än ett lokalt anrop?::Ett nätverk och en annan dator är inblandade, och man kan ==inte skilja ett nätverksfel från att servern har kraschat==.

Hur mycket långsammare är ett fjärranrop än ett lokalt?::==Flera storleksordningar== långsammare, så man bör göra så få fjärranrop som möjligt.

## Fråga 3 – Sockets, RPC, RMI och webbtjänster

Hur förhåller sig sockets, RPC, RMI och webbtjänster till varandra?::De är ==lager, inte alternativ==. RPC och RMI byggs ovanpå sockets, webbtjänster ovanpå HTTP.

Vilken abstraktion ger de fyra? (4)
||
- **Sockets** – strömmar av bytes
- **RPC** – ett anrop av en procedur, som om den vore lokal
- **RMI** – ett anrop av en metod på ett objekt
- **Webbtjänst** – en operation på en resurs (en URI)

Hur pekas målet ut i de fyra? (4)
||
- **Sockets** – adress och port
- **RPC** – ett programnummer
- **RMI** – en fjärrobjektreferens
- **Webbtjänst** – en URI (oftast en URL)

Vad menas med att en operation är idempotent?::Att den kan ==köras flera gånger med samma resultat som en enda gång==.

Vad ger **maybe**-semantik?::Anropet körs ==en gång eller inte alls==. Inga åtgärder mot fel, så det duger bara när enstaka missade anrop är okej.

Vad ger **at-least-once**-semantik?::Man får ett svar eller ett fel, men proceduren kan ha ==körts mer än en gång==. Kräver därför idempotenta operationer.

Vad ger **at-most-once**-semantik?::Ett svar betyder att proceduren körts ==exakt en gång==; ett fel betyder en gång eller inte alls.

Vad är den stora praktiska skillnaden mellan RMI och webbtjänster?::==Brandväggar.== RMI:s protokoll kommer oftast inte igenom, men webbtjänsternas HTTP gör det.

## Fråga 4 – Distribuerade objekt mot webbtjänster

Vad har distribuerade objekt och webbtjänster gemensamt?::Båda ==programmerar mot gränssnitt==, så klienten slipper veta vilket språk eller vilken plattform servern använder.

På vilket sätt liknar en webbtjänst ett RMI-anrop?::Klienten anropar en operation via en ==URI==, ungefär som RMI anropar ett objekt via en fjärrobjektreferens.

Vad är den stora skillnaden mellan distribuerade objekt och webbtjänster?::En webbtjänst ==kan inte skapa nya fjärrobjekt== och lämna tillbaka referenser – den är i praktiken ett enda objekt.

Hur skiljer sig de två i synen på programmering?::En webbtjänst ==bryr sig inte om hur du programmerar==, medan distribuerade objekt vill att du gör det på ett ganska bestämt sätt.

Vad ger en webbtjänst inte, som annan middleware brukar ge?::==Transparens.== I enklaste fallet läser och skriver klienten och servern direkt i SOAP och XML.
