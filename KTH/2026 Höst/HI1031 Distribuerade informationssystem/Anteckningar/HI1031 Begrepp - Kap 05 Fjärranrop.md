---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
description: "Flashcards HI1031 kap 5, ordnade efter kursens fyra tentafrågor: hur distribuerade objekt och RMI fungerar, sockets mot distribuerade objekt, jämförelsen av sockets, RPC, RMI och webbtjänster, samt distribuerade objekt mot webbtjänster."
---
# HI1031 Begrepp - Kap 05 Fjärranrop

## Fråga 1 – Hur distribuerade objekt och RMI fungerar

**Fjärrobjektreferens**;;Ett id som ==funkar i hela det distribuerade systemet== och pekar ut ett bestämt fjärrobjekt. Kan skickas som parameter.

**Fjärrgränssnitt**;;Det som anger ==vilka av ett fjärrobjekts metoder som får anropas på distans==. Lokala objekt kan anropa alla.

Varför behövs fabriksmetoder i den distribuerade objektmodellen?::Ett gränssnitt har ==inga konstruktorer==, så man kan inte skapa ett objekt med ett fjärranrop.

Vilka fyra delar ligger i RMI:s anropskedja, och vad gör var och en? (4)
||
- **Proxy** hos klienten – beter sig som ett lokalt objekt och packar anropet i ett meddelande
- **Dispatcher** hos servern – väljer rätt metod i skelettet med hjälp av `operationId`
- **Skelett** hos servern – packar upp argumenten och anropar servanten
- **Servant** – objektet som innehåller fjärrobjektets kod och tillstånd

Vilka tre delar av RMI genereras automatiskt, och av vad?::==Proxy, dispatcher och skelett==, av en gränssnittskompilator.

Vad är kommunikationsmodulerna tillsammans ansvariga för?::==Anropssemantiken==, till exempel at-most-once. Den ena ligger hos klienten och den andra hos servern, och de kör request-reply mellan sig.

Hur vet man i Java RMI att ett anrop går på distans?::Anroparen måste hantera ==`RemoteException`==, och fjärrobjektets klass måste implementera `Remote`.

Hur skickas parametrar i Java RMI?::Fjärrobjekt skickas som ==fjärrobjektreferens==, alla andra objekt kopieras och skickas som värde.

## Fråga 2 – Sockets mot distribuerade objekt

Vad säger boken om när man ska välja lågnivå request-reply?::Det är ==lättviktigt och minimalt==, och används ofta där kommunikationens omkostnader måste minimeras – boken nämner inbyggda system.

Vilka tre TCP-omkostnader är onödiga vid ett request-reply? (3)
||
- **Bekräftelser**, eftersom svaret i sig bekräftar förfrågan
- **Förbindelseuppsättning**, som kostar två extra par meddelanden
- **Flödeskontroll**, onödig för de flesta anrop som skickar små argument och resultat

Varför klarar Sun NFS ett eget protokoll över UDP?::Det skickar ==filblock av fast storlek== och har idempotenta operationer, så det behöver ingen historik.

**Idempotent operation**;;En operation som kan ==utföras flera gånger med samma effekt som en enda gång==.

Vad ger distribuerade objekt enligt boken?::Det blir ==lättare att skriva stora, krångliga distribuerade program== – och man kan skicka objektreferens i stället för ett stort värde.

Vad kan man aldrig komma ifrån med fjärranrop, hur bra middleware man än har?::De är ==känsligare för fel än lokala anrop==, och man kan inte skilja ett nätfel från att serverprocessen dött.

Hur mycket högre är latensen för ett fjärranrop, och vad antyder boken om följden?::==Flera storleksordningar== högre. Boken garderar: det antyder att program behöver ta hänsyn till det, kanske genom att minimera antalet fjärranrop.

## Fråga 3 – Sockets, RPC, RMI och webbtjänster

Hur förhåller sig sockets, RPC, RMI och webbtjänster till varandra?::De är ==lager, inte alternativ==. RPC och RMI byggs med sockets över request-reply, webbtjänster ovanpå HTTP.

Vilken abstraktion ger de fyra? (4)
||
- **Sockets** – byte-sekvenser
- **RPC** – ett anrop av en procedur, som om den var lokal
- **RMI** – ett anrop av en metod på ett objekt
- **Webbtjänst** – operationer på en resurs som pekas ut av en URI

Hur namnges målet i de fyra? (4)
||
- **Sockets** – (internetadress, port)
- **RPC** – program- och versionsnummer, som en port mapper översätter till port
- **RMI** – en fjärrobjektreferens, som dessutom kan skickas som parameter
- **Webbtjänst** – en URI, oftast en URL, som boken kallar en endpoint

Hur beskrivs gränssnittet i de fyra? (4)
||
- **Sockets** – inte alls, parterna kommer överens själva
- **RPC** – ett IDL, i Sun RPC språket XDR
- **RMI** – ett IDL som CORBA IDL, eller själva språket i Java RMI
- **Webbtjänst** – WSDL

Hur representeras data i de fyra? (4)
||
- **Sockets** – du marshallar själv
- **RPC** – binärt, med XDR
- **RMI** – binärt, med CORBA CDR eller Javas serialisering
- **Webbtjänst** – XML, paketerat med SOAP

Vad ger **maybe**-semantik?::Anropet körs ==en gång eller inte alls==. Ingen feltolerans, så det duger bara där enstaka misslyckade anrop är acceptabla.

Vad ger **at-least-once**-semantik?::Anroparen får ett resultat eller ett undantag, men proceduren kan ha ==körts mer än en gång==. Kräver därför idempotenta operationer.

Vad ger **at-most-once**-semantik?::Ett resultat betyder att proceduren körts ==exakt en gång==, ett undantag att den körts en gång eller inte alls.

Vad är den praktiska skillnaden mellan RMI och webbtjänster?::==Brandväggar.== RMI:s och CORBAs transportprotokoll kommer normalt inte igenom, men HTTP och SMTP gör det.

## Fråga 4 – Distribuerade objekt mot webbtjänster

Hur beskriver boken likheten mellan en webbtjänst och RMI?::Som ==ytlig== – interaktionen mellan klient och server är "på ett ytligt plan mycket lik RMI".

Vad använder en webbtjänstklient i stället för en fjärrobjektreferens?::En ==URI==, för att anropa en operation i den resurs URI:n pekar ut.

Vad delar distribuerade objekt och webbtjänster faktiskt?::==Programmering mot gränssnitt==, vilket ger lös koppling och gör att klienten slipper veta språk och plattform.

Vilken är kärnskillnaden mellan distribuerade objekt och webbtjänster?::En webbtjänst ==kan inte skapa fjärrobjekt== och returnera referenser till dem.

Vilken slutsats drar boken av att webbtjänster inte kan skapa fjärrobjekt?::Att en webbtjänst i praktiken är ==ett enda fjärrobjekt==, så både skräpsamling och fjärrobjektreferenser är irrelevanta.

Hur ändras `newShape` när skrivtavlan görs till en webbtjänst?::Den returnerar ==ett heltal== som säger var objektet ligger i en vektor, i stället för en fjärrobjektreferens, och är då inte längre en fabriksmetod.

Hur skiljer sig de två i paradigm?::Webbtjänster ==struntar i hur du programmerar==, medan distribuerade objekt vill att du gör på ett ganska bestämt sätt.

Vad ger webbtjänster inte av sig själva, som middleware annars har som huvuduppgift?::==Transparens.== I enklaste fallet läser och skriver klient och server direkt i SOAP och XML.
