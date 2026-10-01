---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 9 – web services: vad en webbtjänst är och när den används, låg koppling, REST och hur resurser accessas, jämförelsen mot distribuerade objekt, SOA, samt Ajax."
---

# HI1031 Begrepp - Kap 09 Web services

## 1. Vad är en webbtjänst, situationer, låg koppling, protokoll

Vad är en webbtjänst?::En tjänst som ett program når ==över internet via en URI==, med ett eget specialiserat gränssnitt. En vanlig webbläsare kan inte använda den direkt.

I vilka situationer används webbtjänster?::När ett ==program i en organisation ska prata med en server i en annan== över internet – program-till-program, inte via en webbläsare.

Vad betyder låg koppling (loose coupling)?::Att hålla ==beroendena mellan tjänster så små som möjligt==, så att en ändring i en tjänst inte välter de andra.

Ge exempel på protokoll eller arkitekturer för webbtjänster. (2)
||
- **SOAP** – XML-meddelanden, oftast skickade över HTTP
- **REST** – enkla anrop mot resurser med vanliga HTTP-operationer

Hur får man låg koppling i praktiken?::Man programmerar mot ==ett enkelt och allmänt gränssnitt== i stället för mot den andra sidans kod.

## 2. REST, principerna, resurser och hypermedia

Vad är REST?::Ett ==mycket begränsat arbetssätt== där klienten använder URL:er och de vanliga HTTP-operationerna GET, PUT, POST och DELETE för att hantera resurser.

Vilka principer bygger REST på? (4)
||
- **Enhetligt gränssnitt** – samma få operationer för alla resurser
- **Varje resurs har en egen URL**
- **Fokus på data**, inte på gränssnitt
- **Klienten får hela resursens tillstånd** på en gång

Vad skiljer PUT från POST?::==PUT ger samma resultat hur många gånger den körs==; POST gör en ny sak varje gång.

Vilken roll har hypermedia (HATEOAS) i REST?::Svaret innehåller ==länkar till vad klienten kan göra härnäst==, så klienten behöver bara start-URL:en och hittar resten genom att följa länkarna.

## 3. Distribuerade objekt mot webbtjänster

Hur liknar RMI och webbtjänster varandra?::Bara ==ytligt==: i båda anropar klienten en operation – i RMI med en fjärrobjektreferens, i en webbtjänst med en URI.

Vad är den stora skillnaden i hur RMI och webbtjänster hanterar objekt?::En webbtjänst kan inte skapa nya fjärrobjekt – den är i praktiken ==ett enda fjärrobjekt==. Distribuerade objekt kan skapa och peka ut många objekt.

Hur ser webbtjänster på programmeringsspråk, jämfört med distribuerade objekt?::Webbtjänster är medvetet ==oberoende av språk och sätt att programmera==. Distribuerade objekt utgår i stället från ett bestämt, objektorienterat sätt.

Vad ger vanliga mellanprogram som webbtjänster inte ger?::==Transparens== – de döljer detaljerna i ett fjärranrop och får det att se ut som ett lokalt anrop. Det gör inte webbtjänster.

Varför är webbtjänster långsammare än CORBA?::Webbtjänster skickar ==XML som är text==, medan CORBA använder ett binärt format. Text tar mer plats och är långsammare att tolka.

Hur långt når en webbtjänst jämfört med en CORBA-referens?::En webbtjänst nås med en ==URL var som helst på internet== (via DNS), medan en CORBA-referens i praktiken bara fungerar inom en organisation.

## 4. SOA

Vad innebär SOA (Service-Oriented Architecture)?::==Designprinciper== där systemet byggs av löst kopplade tjänster som kan hittas dynamiskt och sedan prata med varandra.

Hur byggs SOA oftast, och varför?::Med ==webbtjänster==, mest tack vare deras låga koppling.

## 5. Ajax och webbtjänster

Vad är Ajax?::Ett sätt att låta ett JavaScript-program i webbläsaren ==prata i småbitar med servern==, utan att ladda om sidan.

Vad är relationen mellan Ajax och webbtjänster?::Båda ==skickar data som XML över HTTP==, inte bara färdiga webbsidor. Skillnaden: Ajax kopplar webbläsaren till sin egen server, medan webbtjänster kopplar ihop skilda program över internet.
