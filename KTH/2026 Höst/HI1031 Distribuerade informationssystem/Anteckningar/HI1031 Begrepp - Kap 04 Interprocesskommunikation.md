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
description: "Flashcards HI1031 kap 4, ordnade efter kursens sex tentafrågor: karakterisering av IPC-anrop, XML, UDP/TCP/multicast, portar och multicast, IPC mot distribuerade objekt, samt nätverks- och systemvirtualisering."
---
# HI1031 Begrepp - Kap 04 Interprocesskommunikation

## Fråga 1 – Karakterisera ett IPC-anrop

På vilka fyra sätt kan man karakterisera ett IPC-anrop? (4)
||
- **Synkront eller asynkront**
- **Hur destinationen anges**
- **Tillförlitlighet**
- **Ordning**
<!--SR:!fsrs,2026-10-22T19:48:14.439Z,1,0.10820054,9.44205284,2,4,0,0,2026-10-21T19:48:14.439Z-->

Vad gäller vid synkron kommunikation?::Både send och receive ==blockerar== – send väntar på receive, och receive väntar på ett meddelande.
<!--SR:!fsrs,2026-10-22T16:59:09.298Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T16:59:09.298Z-->

Vad gäller vid asynkron kommunikation?::send ==blockerar inte== – sändaren kör vidare så fort meddelandet lagts i en lokal buffert.
<!--SR:!fsrs,2026-10-26T16:47:52.919Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T16:47:52.919Z-->

Hur anges destinationen för ett meddelande i IPC?::Med paret ==(internetadress, port)==.
<!--SR:!fsrs,2026-10-26T16:27:30.806Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T16:27:30.806Z-->

Vad menas med att ett meddelande är tillförlitligt? (2)
||
- **Giltighet** – meddelandet kommer fram
- **Integritet** – det kommer fram helt och utan dubbletter
<!--SR:!fsrs,2026-10-30T19:56:38.082Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T19:56:38.082Z-->

## Fråga 2 – XML

Vad är XML för slags språk?::Ett ==märkspråk== – text där taggar visar innehållet och hur det är strukturerat.
<!--SR:!fsrs,2026-10-26T16:27:24.014Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T16:27:24.014Z-->

Vad skiljer XML:s taggar från HTML:s?::XML:s taggar beskriver ==strukturen== på innehållet, medan HTML:s säger hur det ska visas.
<!--SR:!fsrs,2026-10-30T16:42:52.785Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:42:52.785Z-->

Vad kan man använda XML till? (4)
||
- **Webbtjänster** – klienter och tjänster pratar i XML
- **Arkivering** av data
- **Användargränssnitt**
- **Konfigurationsfiler**
<!--SR:!fsrs,2026-10-23T00:04:41.567Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-20T00:04:41.567Z-->

Vad kostar det att XML är text med taggar?::Meddelandena blir ==större och långsammare att tolka== än binära format.
<!--SR:!fsrs,2026-10-26T08:27:59.688Z,8,8.2956,1,2,1,0,0,2026-10-18T08:27:59.688Z-->

## Fråga 3 – Tre typer av IPC

Vilka tre typer av IPC tar boken upp? (3)
||
- **Datagram** (UDP)
- **Ström** (TCP)
- **Multicast**
<!--SR:!fsrs,2026-10-22T19:57:10.402Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T19:57:10.402Z-->

Vad är typiskt för ett UDP-datagram?::Det skickas ==utan bekräftelse och omsändning==, så meddelandet kan tappas.
<!--SR:!fsrs,2026-10-26T14:23:01.940Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T14:23:01.940Z-->

Vilken abstraktion ger en TCP-ström?::En ==tvåvägs ström av bytes== utan meddelandegränser.
<!--SR:!fsrs,2026-10-30T15:15:24.081Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T15:15:24.081Z-->

Vad döljer TCP-strömmen för programmeraren? (4)
||
- **Meddelandestorlekar**
- **Tappade meddelanden** – skickas om
- **Flödeskontroll** – bromsar en för snabb sändare
- **Dubbletter och ordning**
<!--SR:!fsrs,2026-10-21T16:52:19.921Z,0,0.09191054,9.46178698,3,4,1,0,2026-10-21T16:42:19.921Z-->

Vad gör en multicast-operation?::Skickar ==ett enda meddelande till alla medlemmar i en grupp==.
<!--SR:!fsrs,2026-10-24T13:39:33.074Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-20T13:39:33.074Z-->

När väljer man UDP framför TCP? (2)
||
- **UDP** – när snabbhet väger mer än att allt kommer fram
- **TCP** – när allt måste komma fram i rätt ordning
<!--SR:!fsrs,2026-10-30T20:04:32.766Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T20:04:32.766Z-->

Garanterar TCP att allt kommer fram?::Nej – ==bryts anslutningen ger TCP upp==, och programmet vet inte hur mycket som hann fram.
<!--SR:!fsrs,2026-10-22T16:28:05.510Z,1,1.26217005,8.39265542,2,3,0,0,2026-10-21T16:28:05.510Z-->

## Fråga 4 – Portar med flera mottagare

Hur kan en port få flera mottagare, när den normalt bara har en?::Genom ==IP multicast== – flera processer går med i en grupp och delar då porten.
<!--SR:!fsrs,2026-10-27T14:44:31.702Z,7,7.49448566,3.58131923,2,3,0,0,2026-10-20T14:44:31.702Z-->

Vad är multicast (en port med flera mottagare) bra för? (4)
||
- **Feltolerans** – flera servrar gör samma sak
- **Hitta tjänster** i nätet
- **Bättre prestanda** med kopierad data
- **Sprida notiser** till många
<!--SR:!fsrs,2026-10-21T17:04:47.788Z,0,0.20502975,8.40750771,3,3,1,0,2026-10-21T16:54:47.788Z-->

Vad kostar det att låta en port ha flera mottagare via IP multicast?::Det är ==otillförlitligt== – ett meddelande kan tappas så att bara några i gruppen får det.
<!--SR:!fsrs,2026-10-22T17:00:17.018Z,1,0.41133081,7.86059937,2,4,1,0,2026-10-21T17:00:17.018Z-->

Vilka två ordningsproblem har multicast? (2)
||
- Samma sändares meddelanden kan nå **olika medlemmar i olika ordning**
- Meddelanden från **två sändare** kommer inte i samma ordning hos alla
<!--SR:!fsrs,2026-10-24T19:59:00.824Z,3,3.0070832,7.13093975,2,5,1,0,2026-10-21T19:59:00.824Z-->

## Fråga 5 – IPC mot distribuerade objekt

Vilken relation har IPC och distribuerade objekt?::De är ==lager, inte alternativ== – IPC är det undre lagret och distribuerade objekt byggs ovanpå.
<!--SR:!fsrs,2026-10-24T13:36:51.204Z,4,4.37161444,5.20002037,2,2,0,0,2026-10-20T13:36:51.204Z-->

Vad har IPC och distribuerade objekt gemensamt?::Båda låter ==processer på skilda datorer samarbeta== över nätet, och ett anrop på ett distribuerat objekt blir meddelanden i botten.
<!--SR:!fsrs,2026-10-26T16:29:41.677Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T16:29:41.677Z-->

Vad är skillnaden i abstraktion mellan IPC och distribuerade objekt?::IPC skickar ==meddelanden== (send och receive på bytes); distribuerade objekt gör metodanrop där detaljerna göms.
<!--SR:!fsrs,2026-10-24T14:39:34.372Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-20T14:39:34.372Z-->

Hur skiljer sig adresseringen mellan IPC och distribuerade objekt?::IPC använder (internetadress, port); ett distribuerat objekt använder en ==unik objektreferens==.
<!--SR:!fsrs,2026-10-30T16:48:01.719Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:48:01.719Z-->

Vad ger distribuerade objekt som ren meddelandeöverföring inte ger?::==Inkapsling== – tillståndet nås bara via objektets metoder.
<!--SR:!fsrs,2026-10-22T16:50:31.022Z,1,0.19438726,9.26716964,2,5,1,0,2026-10-21T16:50:31.022Z-->

## Fråga 6 – Virtualisering

Vad är nätverksvirtualisering?::Att bygga ==flera virtuella nät ovanpå ett enda riktigt nät==, ett anpassat per tillämpning.
<!--SR:!fsrs,2026-10-30T16:47:08.599Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T16:47:08.599Z-->

Vad vinner man på nätverksvirtualisering (overlay-nät)? (3)
||
- **Nya nättjänster** utan att ändra nätet under
- **Uppmuntrar experiment** och anpassning
- **Flera nät kan samsas** – öppnare arkitektur
<!--SR:!fsrs,2026-10-29T20:07:33.628Z,8,8.2956,1,2,1,0,0,2026-10-21T20:07:33.628Z-->

Vad är systemvirtualisering?::Att köra ==flera virtuella maskiner på en fysisk dator==, var och en med eget operativsystem.
<!--SR:!fsrs,2026-10-30T14:16:52.399Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T14:16:52.399Z-->

Vad vinner man på systemvirtualisering, jämfört med processer? (4)
||
- **Säkerhet**
- **Renare uppdelning** av uppgifter
- **Exaktare debitering** per användare
- **Lätt att flytta VM:er** – färre servrar och mindre energi
<!--SR:!fsrs,2026-10-26T14:24:33.312Z,5,4.98595744,5.20002037,2,2,0,0,2026-10-21T14:24:33.312Z-->

Vad kostar ett overlay-nät?::Ett ==extra lager att gå igenom==, så det blir långsammare än att prata direkt över nätet.
<!--SR:!fsrs,2026-10-30T17:00:06.106Z,9,8.82903555,3.58131923,2,3,0,0,2026-10-21T17:00:06.106Z-->
