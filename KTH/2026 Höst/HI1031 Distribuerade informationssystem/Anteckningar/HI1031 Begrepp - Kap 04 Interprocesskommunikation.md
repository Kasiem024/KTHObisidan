---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
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

Vad gäller vid synkron kommunikation?::Både send och receive ==blockerar== – send väntar på receive, och receive väntar på ett meddelande.

Vad gäller vid asynkron kommunikation?::send ==blockerar inte== – sändaren kör vidare så fort meddelandet lagts i en lokal buffert.

Hur anges destinationen för ett meddelande i IPC?::Med paret ==(internetadress, port)==.

Vad menas med att ett meddelande är tillförlitligt? (2)
||
- **Giltighet** – meddelandet kommer fram
- **Integritet** – det kommer fram helt och utan dubbletter

## Fråga 2 – XML

Vad är XML för slags språk?::Ett ==märkspråk== – text där taggar visar innehållet och hur det är strukturerat.

Vad skiljer XML:s taggar från HTML:s?::XML:s taggar beskriver ==strukturen== på innehållet, medan HTML:s säger hur det ska visas.

Vad kan man använda XML till? (4)
||
- **Webbtjänster** – klienter och tjänster pratar i XML
- **Arkivering** av data
- **Användargränssnitt**
- **Konfigurationsfiler**

## Fråga 3 – Tre typer av IPC

Vilka tre typer av IPC tar boken upp? (3)
||
- **Datagram** (UDP)
- **Ström** (TCP)
- **Multicast**

Vad är typiskt för ett UDP-datagram?::Det skickas ==utan bekräftelse och omsändning==, så meddelandet kan tappas.

Vilken abstraktion ger en TCP-ström?::En ==tvåvägs ström av bytes== utan meddelandegränser.

Vad döljer TCP-strömmen för programmeraren? (4)
||
- **Meddelandestorlekar**
- **Tappade meddelanden** – skickas om
- **Flödeskontroll** – bromsar en för snabb sändare
- **Dubbletter och ordning**

Vad gör en multicast-operation?::Skickar ==ett enda meddelande till alla medlemmar i en grupp==.

## Fråga 4 – Portar med flera mottagare

Hur kan en port få flera mottagare, när den normalt bara har en?::Genom ==IP multicast== – flera processer går med i en grupp och delar då porten.

Vad är multicast (en port med flera mottagare) bra för? (4)
||
- **Feltolerans** – flera servrar gör samma sak
- **Hitta tjänster** i nätet
- **Bättre prestanda** med kopierad data
- **Sprida notiser** till många

Vad kostar det att låta en port ha flera mottagare via IP multicast?::Det är ==otillförlitligt== – ett meddelande kan tappas så att bara några i gruppen får det.

Vilka två ordningsproblem har multicast? (2)
||
- Samma sändares meddelanden kan nå **olika medlemmar i olika ordning**
- Meddelanden från **två sändare** kommer inte i samma ordning hos alla

## Fråga 5 – IPC mot distribuerade objekt

Vilken relation har IPC och distribuerade objekt?::De är ==lager, inte alternativ== – IPC är det undre lagret och distribuerade objekt byggs ovanpå.

Vad är skillnaden i abstraktion mellan IPC och distribuerade objekt?::IPC skickar ==meddelanden== (send och receive på bytes); distribuerade objekt gör metodanrop där detaljerna göms.

Hur skiljer sig adresseringen mellan IPC och distribuerade objekt?::IPC använder (internetadress, port); ett distribuerat objekt använder en ==unik objektreferens==.

Vad ger distribuerade objekt som ren meddelandeöverföring inte ger?::==Inkapsling== – tillståndet nås bara via objektets metoder.

## Fråga 6 – Virtualisering

Vad är nätverksvirtualisering?::Att bygga ==flera virtuella nät ovanpå ett enda riktigt nät==, ett anpassat per tillämpning.

Vad vinner man på nätverksvirtualisering (overlay-nät)? (3)
||
- **Nya nättjänster** utan att ändra nätet under
- **Uppmuntrar experiment** och anpassning
- **Flera nät kan samsas** – öppnare arkitektur

Vad är systemvirtualisering?::Att köra ==flera virtuella maskiner på en fysisk dator==, var och en med eget operativsystem.

Vad vinner man på systemvirtualisering, jämfört med processer? (4)
||
- **Säkerhet**
- **Renare uppdelning** av uppgifter
- **Exaktare debitering** per användare
- **Lätt att flytta VM:er** – färre servrar och mindre energi
