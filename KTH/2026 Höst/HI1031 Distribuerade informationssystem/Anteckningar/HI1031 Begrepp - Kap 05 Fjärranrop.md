---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 5, ordnade efter kursens fyra tentafrågor: hur distribuerade objekt och RMI fungerar, sockets mot distribuerade objekt, jämförelsen av sockets, RPC, RMI och webbtjänster, samt distribuerade objekt mot webbtjänster."
---
# HI1031 Begrepp - Kap 05 Fjärranrop

## Fråga 1 – Hur distribuerade objekt och RMI fungerar

Vad är ett fjärrobjekt (remote object)?::Ett objekt vars metoder ==går att anropa från en annan process==, inte bara lokalt.
<!--SR:!fsrs,2026-10-30T19:55:52.570Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T19:55:52.570Z-->

Vad är RMI (fjärrmetodanrop)?::Att ==anropa en metod på ett objekt i en annan process== som om det vore ett vanligt lokalt anrop.
<!--SR:!fsrs,2026-10-30T16:37:23.259Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:37:23.259Z-->

**Fjärrobjektreferens** (remote object reference);;Ett id som ==pekar ut ett bestämt fjärrobjekt i hela systemet==. Kan skickas som parameter.
<!--SR:!fsrs,2026-10-30T16:40:59.729Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:40:59.729Z!fsrs,2026-10-26T14:22:18.588Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T14:22:18.588Z-->

**Fjärrgränssnitt** (remote interface);;Talar om ==vilka av ett fjärrobjekts metoder som får anropas på distans==. Lokala objekt kan anropa alla.
<!--SR:!fsrs,2026-10-30T14:19:20.774Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T14:19:20.774Z!fsrs,2026-10-27T13:40:12.873Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-20T13:40:12.873Z-->

Vilka fyra delar sköter ett RMI-anrop, och vad gör de? (4)
||
- **Proxy** (hos klienten) – ser ut som ett lokalt objekt och packar ihop anropet till ett meddelande
- **Dispatcher** (hos servern) – väljer rätt metod i skelettet
- **Skelett** (hos servern) – packar upp anropet och anropar servanten
- **Servant** – själva objektet med koden som körs
<!--SR:!fsrs,2026-10-30T16:59:57.306Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:59:57.306Z-->

Hur skickas parametrar vid ett fjärranrop (RMI)?::==Fjärrobjekt skickas som referens==, allt annat kopieras och skickas som värde.
<!--SR:!fsrs,2026-10-22T20:05:22.957Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T20:05:22.957Z-->

Hur skapar en server nya fjärrobjekt?::Med en ==factory-metod== som skapar objektet och skickar tillbaka en referens – en konstruktor går inte att anropa på distans.
<!--SR:!fsrs,2026-10-30T17:01:06.809Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T17:01:06.809Z-->

## Fråga 2 – Sockets mot distribuerade objekt

När kan enkel request-reply (sockets) vara bättre än distribuerade objekt?::När man vill ha något ==lättviktigt och minimalt== och slippa onödiga omkostnader – boken nämner inbyggda system.
<!--SR:!fsrs,2026-10-30T16:40:16.114Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:40:16.114Z-->

När är distribuerade objekt bättre än rena sockets?::När programmet är stort och krångligt – då kan man ==skicka en referens till ett objekt== i stället för att koda och skicka allt själv.
<!--SR:!fsrs,2026-10-30T14:15:22.773Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T14:15:22.773Z-->

Varför är ett fjärranrop alltid känsligare för fel än ett lokalt anrop?::Ett nätverk och en annan dator är inblandade, och man kan ==inte skilja ett nätverksfel från att servern har kraschat==.
<!--SR:!fsrs,2026-10-30T16:42:59.225Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:42:59.225Z-->

Hur mycket långsammare är ett fjärranrop än ett lokalt?::==Flera storleksordningar== långsammare, så man bör göra så få fjärranrop som möjligt.
<!--SR:!fsrs,2026-10-22T19:54:45.259Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T19:54:45.259Z-->

## Fråga 3 – Sockets, RPC, RMI och webbtjänster

Hur förhåller sig sockets, RPC, RMI och webbtjänster till varandra?::De är ==lager, inte alternativ==. RPC och RMI byggs ovanpå sockets, webbtjänster ovanpå HTTP.
<!--SR:!fsrs,2026-10-24T13:40:38.619Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-20T13:40:38.619Z-->

Vilken abstraktion ger de fyra? (4)
||
- **Sockets** – strömmar av bytes
- **RPC** – ett anrop av en procedur, som om den vore lokal
- **RMI** – ett anrop av en metod på ett objekt
- **Webbtjänst** – en operation på en resurs (en URI)
<!--SR:!fsrs,2026-10-22T17:01:35.857Z,1,0.03413698,9.90035872,2,6,0,0,2026-10-21T17:01:35.857Z-->

Hur pekas målet ut i de fyra? (4)
||
- **Sockets** – adress och port
- **RPC** – ett programnummer
- **RMI** – en fjärrobjektreferens
- **Webbtjänst** – en URI (oftast en URL)
<!--SR:!fsrs,2026-10-22T19:56:04.266Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T19:56:04.266Z-->

Vad menas med att en operation är idempotent?::Att den kan ==köras flera gånger med samma resultat som en enda gång==.
<!--SR:!fsrs,2026-10-27T14:43:50.767Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-20T14:43:50.767Z-->

Vad ger **maybe**-semantik?::Anropet körs ==en gång eller inte alls==. Inga åtgärder mot fel, så det duger bara när enstaka missade anrop är okej.
<!--SR:!fsrs,2026-10-30T16:46:29.551Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:46:29.551Z-->

Vad ger **at-least-once**-semantik?::Man får ett svar eller ett fel, men proceduren kan ha ==körts mer än en gång==. Kräver därför idempotenta operationer.
<!--SR:!fsrs,2026-10-30T16:40:33.242Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:40:33.242Z-->

Vad ger **at-most-once**-semantik?::Ett svar betyder att proceduren körts ==exakt en gång==; ett fel betyder en gång eller inte alls.
<!--SR:!fsrs,2026-10-22T16:27:00.862Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T16:27:00.862Z-->

Vad är den stora praktiska skillnaden mellan RMI och webbtjänster?::==Brandväggar.== RMI:s protokoll kommer oftast inte igenom, men webbtjänsternas HTTP gör det.
<!--SR:!fsrs,2026-10-30T16:35:40.235Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:35:40.235Z-->

## Fråga 4 – Distribuerade objekt mot webbtjänster

Vad har distribuerade objekt och webbtjänster gemensamt?::Båda ==programmerar mot gränssnitt==, så klienten slipper veta vilket språk eller vilken plattform servern använder.
<!--SR:!fsrs,2026-10-22T16:55:37.108Z,1,0.17233102,9.26716964,2,5,1,0,2026-10-21T16:55:37.108Z-->

På vilket sätt liknar en webbtjänst ett RMI-anrop?::Klienten anropar en operation via en ==URI==, ungefär som RMI anropar ett objekt via en fjärrobjektreferens.
<!--SR:!fsrs,2026-10-30T14:19:50.134Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T14:19:50.134Z-->

Vad är den stora skillnaden mellan distribuerade objekt och webbtjänster?::En webbtjänst ==kan inte skapa nya fjärrobjekt== och lämna tillbaka referenser – den är i praktiken ett enda objekt.
<!--SR:!fsrs,2026-10-30T16:26:50.510Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:26:50.510Z-->

Hur skiljer sig de två i synen på programmering?::En webbtjänst ==bryr sig inte om hur du programmerar==, medan distribuerade objekt vill att du gör det på ett ganska bestämt sätt.
<!--SR:!fsrs,2026-10-26T14:14:49.377Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T14:14:49.377Z-->

Vad ger en webbtjänst inte, som annan middleware brukar ge?::==Transparens.== I enklaste fallet läser och skriver klienten och servern direkt i SOAP och XML.
<!--SR:!fsrs,2026-10-26T14:17:11.503Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T14:17:11.503Z-->
