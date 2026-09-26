---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
description: "Flashcards HI1031 kap 9 – web services: vad en webbtjänst är och när den används, låg koppling, REST med sina sex principer och hypermedia, jämförelsen mot distribuerade objekt, SOA, samt Ajax."
---

# HI1031 Begrepp - Kap 09 Web services

## 1. Vad är en webbtjänst, situationer, låg koppling, protokoll

**Webbtjänst** (web service);;En tjänst som nås ==över internet via en URI==, med ett funktionellt specialiserat gränssnitt och meddelanden i XML. Kan **inte** nås direkt av en webbläsare.

Vad består ett webbtjänstgränssnitt normalt av?::En ==samling operationer== som en klient kan använda över internet. Operationerna kan utföras av program, objekt eller databaser.

Varför räcker inte webbläsaren som klient?::Den är en ==generell klient==, och det begränsar vilka tillämpningar man kan bygga. Webbtjänster går tillbaka till modellen där båda sidor är specialiserade.

Varför är brandväggar ett praktiskt skäl att transportera med HTTP?::Transportprotokollen som Java RMI och CORBA använder släpps **normalt inte** genom en brandvägg, medan ==HTTP och SMTP normalt släpps igenom==.

**Låg koppling** (loose coupling);;Att hålla ==beroendena mellan tjänster så små som möjligt==, så att en ändring i en tjänst inte välter de andra. Boken varnar att ordet ofta används luddigt.

Vilka tre saker förstärker låg koppling? (3)
||
- **Programmering mot gränssnitt** – skiljer gränssnitt från implementation
- **Enkla, generella gränssnitt** som REST – minskar beroendet av operationsnamn
- **Valet av kommunikationsparadigm** – request-reply kopplar, asynkront frikopplar

Vad specificerar SOAP? (4)
||
- Hur **XML används för att representera** ett meddelandes innehåll
- Hur ett par **enkelriktade meddelanden bildar request-reply**
- Hur **mottagaren ska behandla** XML-elementen
- Hur **HTTP och SMTP** ska användas för att skicka meddelandena

Vad ligger ett SOAP-meddelande i?::En ==envelope med en valfri header och en body==. Kuvertet bär ingen destinationsadress – vart meddelandet ska är transportprotokollets sak, vilket är därför det kan skickas över både HTTP och SMTP.

## 2. REST, principerna, resurser och hypermedia

**REST** (Representational State Transfer);;En ==arkitekturstil== för distribuerade hypermediasystem, presenterad av Roy Fielding 2000.

Vad är REST uttryckligen INTE, enligt restfulapi.net?::Varken ett ==protokoll eller en standard, och inte HTTP==. Fieldings avhandling nämner ingen implementationsriktning – hedras de sex principerna är gränssnittet RESTful.

Hur beskriver kursboken REST?::Ett ==mycket hårt begränsat== sätt att arbeta: URL:er plus GET, PUT, DELETE och POST mot resurser i XML, med tyngdpunkt på data i stället för gränssnitt. Klienten får hela resursens tillstånd.

Vilka sex principer ska en RESTful webbtjänst uppfylla? (6)
||
- **Likformigt gränssnitt**
- **Klient-server**
- **Tillståndslöshet**
- **Cachebarhet**
- **Skiktat system**
- **Kod på begäran** – valfri

Vilka fyra villkor ger ett likformigt gränssnitt? (4)
||
- Varje resurs **identifieras unikt**
- Resurser **hanteras genom representationer**
- Meddelanden är **självbeskrivande**
- **HATEOAS** – hypermedia driver tillståndet

Vad innebär tillståndslöshet i REST?::Varje anrop måste ==skicka med allt servern behöver==. Servern minns ingenting mellan anropen, så klienten håller reda på hela sessionen.

Vad är en resurs i REST?::==Allt som kan namnges== – ett dokument, en bild, en tjänst, en samling resurser eller ett fysiskt föremål. Det är REST:s centrala abstraktion.

Vad består en resursrepresentation av? (3)
||
- **Datat**
- **Metadata** som beskriver datat
- **Hypermedialänkarna** till nästa önskade tillstånd

Varför kan samma REST-resurs levereras som JSON, XML eller HTML?::För att ==resursen är skild från sin representation==. Formatet kallas representationens media type.

**HATEOAS**;;*Hypermedia as the engine of application state* – klienten ska ==bara ha första URI:n== och sedan driva alla andra resurser och samspel via hyperlänkar som servern skickar med i svaren.

## 3. Distribuerade objekt mot webbtjänster

Hur beskriver boken likheten mellan RMI och webbtjänster?::Som lik ==bara på ett ytligt plan== (*at a superficial level*): klienten anropar en operation med en fjärrobjektreferens i RMI och med en URI i en webbtjänst.

Varför är skräpsamling och fjärrobjektreferenser irrelevanta för en webbtjänst?::Därför att den ==inte kan skapa fjärrobjekt dynamiskt== – en webbtjänst är i praktiken ett enda fjärrobjekt.

Vad är en **servant**?;;Det ==objekt i servern som håller en resurs== och utför anropen mot den. I objektmodellen modelleras servern normalt som en samling servanter.

Vad gäller servanter i webbtjänster, och hur tvingas det fram?::De ==stöds inte==, och för att tvinga fram det får implementationen varken konstruktor eller main-metod.

Vad händer med fabriksmetoden `newShape` när den görs till webbtjänst?::Den returnerar ett ==heltal== – platsen i en vektor – i stället för en fjärrreferens, och slutar därmed vara en fabriksmetod.

Vad är skillnaden i paradigm mellan de två?::Webbtjänster är medvetet ==oberoende av programmeringsparadigm==, eftersom många språk och paradigm samexisterar på internet. Distribuerade objekt förespråkar ett ganska bestämt paradigm.

Vad ger mellanprogram normalt som webbtjänster INTE ger?::==Transparens== – att dölja datarepresentation och marshalling, och att få fjärranrop att se ut som lokala. Det får läggas till själv med proxy eller dynamisk invokering.

Vad mäter siffrorna 14× och 882×?::==SOAP mot CORBA== i en studie av Olson och Ogbuji: anropet var 14 gånger så stort och tog 882 gånger så lång tid. Orsaken är formatet – CDR är binärt, XML är text.

Varför räcker en URL globalt där en CORBA-referens inte gör det?::CORBA:s IOR bär en typidentifierare som bara förstås av ==ett bestämt gränssnittsregister==. För en URL är DNS den enda tjänst som behövs.

## 4. SOA

Vad är SOA?::==Designprinciper== där systemet byggs av löst kopplade tjänster som kan upptäckas dynamiskt och sedan kommunicerar med varandra eller koordineras genom koreografi.

Vad är koreografi av webbtjänster?::Att en webbtjänst använder ==förutbestämda mönster== för hur den anropar andra tjänster. Behövs eftersom webbtjänster ger åtkomst till resurser men inget sätt att samordna dem.

Vilket är det huvudsakliga sättet att förverkliga SOA, och varför?::==Webbtjänster==, till stor del på grund av den låga koppling som ligger i dem. SOA är abstrakt och går också att bygga med distribuerade objekt.

Vad är SOA:s främsta användning enligt boken?::Det ==bredare internet== – en gemensam bild av tjänster så att de blir globalt åtkomliga och går att komponera. Inom en verksamhet ger det flexibilitet och interoperabilitet.

Vad är B2B-integration?::Att organisationer tar sig över internets heterogenitet genom att ==exponera webbtjänstgränssnitt utåt== – en kan köra CORBA internt och en annan .NET.

**Mashup**;;En ==ny tjänst som en tredjepartsutvecklare skapar== genom att kombinera två eller flera befintliga tjänster i miljön.

## 5. Ajax och webbtjänster

**Ajax** (Asynchronous Javascript And XML);;En ==utbyggnad av webbens vanliga klient-serversamspel==, för finkornig kommunikation mellan ett Javascript-frontend i webbläsaren och ett serverprogram.

Vilka tre begränsningar i det vanliga webbsamspelet löser Ajax? (3)
||
- **Användaren kan inte interagera** medan den nya sidan hämtas, och tiden är obestämd
- **En hel ny sida** måste hämtas för att uppdatera även en liten del
- **Sidan kan inte uppdateras** när applikationsdatat på servern ändras

Hur skickar Ajax sitt anrop?::Genom Javascript-objektet ==`XmlHttpRequest`==, och den asynkrona varianten används nästan alltid, eftersom fördröjda serversvar annars blir oacceptabla i gränssnittet.

Mellan vilka skikt sitter Ajax i bokens flerskiktsmodell?::Mellan ==skikt 1 och skikt 2== – webbläsare och server, alltså gränssnittet och logiken.

Vad förenar Ajax och webbtjänster? (egen slutsats)::Båda ==tar sig runt begränsningarna i webbläsarens vanliga samspel==, och båda gör det över HTTP med XML. Ajax för att webbläsaren är för klumpig, webbtjänster för att den är för allmän.
