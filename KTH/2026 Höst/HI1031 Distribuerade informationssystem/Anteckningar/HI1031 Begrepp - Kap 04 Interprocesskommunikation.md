---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 4, ordnade efter kursens sex tentafrågor: karakterisering av IPC-anrop, XML, UDP/TCP/multicast, portar och multicast, IPC mot distribuerade objekt, samt nätverks- och systemvirtualisering."
---
# HI1031 Begrepp - Kap 04 Interprocesskommunikation

## Fråga 1 – Karakterisera ett IPC-anrop

Vilka fyra sätt karakteriserar ett IPC-anrop enligt boken? (4)
||
- Synkront eller asynkront
- Meddelandets destination
- Tillförlitlighet
- Ordning

Vad gäller vid **synkron** kommunikation?::==Både send och receive blockerar.== `send` väntar på motsvarande `receive`, `receive` väntar på ett meddelande.

Vad gäller vid **asynkron** kommunikation?::`send` är ==icke-blockerande== – sändaren fortsätter så snart meddelandet kopierats till en lokal buffert.

Varför erbjuder dagens system i regel inte icke-blockerande `receive`?::Med trådar har blockerande `receive` ==inga nackdelar==, och den icke-blockerande lägger bara ==komplexitet== på mottagaren.

Hur anges en meddelandedestination, och hur många parter kan den ha?::Med paret ==(internetadress, lokal port)==. En port har ==exakt en mottagare men många sändare==.

Hur definierar boken tillförlitlighet?::Med ==giltighet== – att meddelanden kommer fram trots ett "rimligt" antal tappade paket – och ==integritet==, att de kommer fram oskadade och utan dubbletter.

Vad är **sändarordning**?;;Den ordning sändaren skickade meddelandena i.

## Fråga 2 – XML

Vad står XML för, och vem definierade det?::==Extensible Markup Language==, definierat av ==W3C==.

Vad är ett **märkspråk**?;;Text där ==taggar visar både innehållet och dess struktur eller utseende==.

Vad är skillnaden mellan XML:s och HTML:s taggar?::XML:s taggar beskriver ==den logiska strukturen==, HTML:s säger ==hur webbläsaren ska visa== texten.

Varför kallas XML *extensible*?::Du får ==definiera egna taggar==, medan HTML har en fast uppsättning.

Varför behöver XML vara självbeskrivande, när CORBA CDR inte behöver det?::CORBA CDR:s parter ==känner redan ordningen och typerna==. XML skulle användas av ==flera tillämpningar för olika syften==.

Vad är en XML-**namnrymd**?;;En uppsättning namn ==refererad med en URL==, som låter en tillämpning använda flera uppsättningar definitioner ==utan namnkollisioner==.

Vad används XML till enligt boken? (4)
||
- Webbtjänster – klienter pratar med dem i XML via SOAP, vars taggar är publicerade, och XML definierar tjänsternas gränssnitt
- Arkivering och återsökning
- Specifikation av användargränssnitt
- Kodning av konfigurationsfiler i operativsystem

Vad är priset för att XML är text med taggar, och vad gör man åt det?::==Stora meddelanden==, alltså längre tider och mer lagring. Motmedlet är komprimering – ==HTTP 1.1 tillåter det==.

Vad krävs för att ett XML-dokument ska vara **välformat**? (3)
||
- Varje starttagg har en matchande sluttagg
- Taggarna är korrekt nästlade
- Det finns ett enda rotelement

## Fråga 3 – Tre typer av IPC

Vilka tre typer av IPC bygger kapitlet på? (3)
||
- UDP-datagram
- TCP-strömmar
- Multicast

Vad är ett **datagram**?;;Ett oberoende paket som bär ett enskilt meddelande i UDP.

Vad skickas ett UDP-datagram utan?::==Bekräftelse och omsändning.== Blir det fel kan meddelandet inte komma fram alls.

Vilka två fel har UDP-datagram?::==Utelämnandefel== och ==leverans i fel ordning==.

Vilka två tjänster nämner boken som exempel på UDP, och varför?::==DNS== och ==Voice over IP== – man slipper omkostnaderna för garanterad leverans.

Vad ger en TCP-ström för abstraktion?::En ==tvåvägsström av bytes utan meddelandegränser==.

Vad döljer TCP-strömmen? (4)
||
- Meddelandestorlekar
- Tappade meddelanden, via bekräftelser och omsändning
- Flödeskontroll, som blockerar en skrivare snabbare än läsaren
- Dubbletter och ordning

Vilka två anrop upprättar en TCP-förbindelse, och vad är nackdelen?::==`connect`== från klienten följt av ==`accept`== från servern. Det kan bli en betydande omkostnad ==för en enda fråga och ett enda svar==.

Varför är TCP **inte** tillförlitlig kommunikation?::Passerar paketförlusten en gräns, eller kapas eller överbelastas nätet, ==förklarar TCP förbindelsen bruten==.

Vilka två saker kan en process inte avgöra när en TCP-förbindelse bryts? (2)
||
- Om felet var nätet eller att processen i andra änden dog
- Om de meddelanden den nyligen skickade kom fram

Vilka fyra tjänster nämner boken som exempel på TCP?::==HTTP, FTP, Telnet och SMTP==.

Vad gör en **multicast-operation**?;;Skickar ==ett enda meddelande från en process till varje medlem i en grupp==, så sändaren slipper veta vilka som är med.

Hur anges en multicast-grupp, och hur nås IP multicast från ett program?::Med en ==klass D-adress==, och på programmeringsnivå ==bara via UDP==.

## Fråga 4 – Portar med flera mottagare

Hur får en port flera mottagare, när den normalt bara har en?::Genom ==IP multicast== – bara de processerna delar portar. När ett multicast-meddelande kommer skickas ==kopior till alla lokala sockets== som gått med i adressen och är bundna till portnummret.

Vad möjliggör multicast enligt boken? (4)
||
- Feltolerans med replikerade tjänster – en grupp servrar gör samma operation, så klienterna betjänas även när några går ner
- Att hitta tjänster i spontana nät
- Bättre prestanda med replikerad data
- Spridning av händelsenotifieringar

Vad händer om ett datagram tappas mellan två multicast-routrar?::==Ingen mottagare bortom den routern== får meddelandet.

Vilka två ordningsproblem har multicast? (2)
||
- Samma sändares datagram kan nå olika medlemmar i olika ordning
- Meddelanden från två sändare kommer inte nödvändigtvis i samma ordning hos alla

Varför är replikerade tjänster det hårda fallet för multicast?::Servrarna måste göra ==samma operationer i samma ordning==, så ==missar en enda medlem en förfrågan blir den inkonsistent==.

Vad är **tillförlitlig multicast**?;;Att ett skickat meddelande ==tas emot av alla medlemmar i gruppen eller av ingen==.

Vad är **totalt ordnad multicast**?;;Den strängaste garantin: ==alla meddelanden når alla medlemmar i samma ordning==.

## Fråga 5 – IPC mot distribuerade objekt

Vilken relation har IPC och distribuerade objekt?::De är ==lager, inte alternativ== – IPC är det undre middleware-lagret och distribuerade objekt byggs ovanpå det.

Vad är **marshalling**?;;Att ==platta datastrukturer till en sekvens av bytes== för överföring, och bygga upp dem igen vid ankomsten.

Vad är skillnaden i abstraktion mellan IPC och distribuerade objekt?::IPC är ==meddelandeöverföring== med `send` och `receive` på bytes; distribuerade objekt ger ==metodanrop== där detaljerna döljs.

Vad är en **fjärrobjektreferens**?;;Ett id för ett fjärrobjekt som ==funkar i hela det distribuerade systemet==, är ==unikt i tid och rum== och ==aldrig återanvänds==.

Vad är ett **fjärrgränssnitt**?;;Det som anger ==vilka av ett fjärrobjekts metoder som får anropas på distans==.

Hur tvingar distribuerade objekt fram inkapsling?::Klient och server ligger i ==olika processer==, så tillståndet nås bara via objektets metoder och ==obehöriga metoder kan inte röra det==.

Varför får olika platser använda olika dataformat med distribuerade objekt?::Objekten nås ==bara via sina metoder==, så klienterna ==märker inte== formatskillnaden.

Vad kan skickas som parameter i ett fjärranrop, utöver värden?::En ==objektreferens==. Det är vinsten när parametern är stor – mottagaren kan nå objektet med ett nytt anrop i stället för att hela värdet skickas.

## Fråga 6 – Virtualisering

Vilka två slags virtualisering tar boken upp?::==Nätverksvirtualisering== (4.5) och ==systemvirtualisering== (7.7.1).

Vad är **nätverksvirtualisering**?;;Idén att bygga ==många virtuella nät ovanpå ett enda befintligt nät==, ett per tillämpning.

Vad har varje virtuellt nät eget?::==Adresseringssätt, protokoll och routingalgoritmer.==

Varför kan man inte i stället ändra internetprotokollen?::Det vore ==opraktiskt== med så många olika tillämpningar – ==det som förbättrar den ena kan skada den andra==.

Hur förhåller sig nätverksvirtualisering till Saltzers end-to-end-argument?::Den ==antyder ett svar på dilemmat== – man kan optimera ett virtuellt nät för en bestämd tillämpning ==utan att ändra nätet under==. Boken säger "suggests", inte "solves".

Vad är ett **overlay-nät**?;;Den konkreta formen av ett virtuellt nät: ==noder och virtuella länkar== ovanpå ett underliggande nät, som ger något det underliggande nätet inte ger.

Vilka tre fördelar har overlay-nät? (3)
||
- Nya nättjänster utan att ändra det underliggande nätet
- De uppmuntrar experiment och anpassning till särskilda tillämpningsklasser
- Flera overlays kan samexistera, vilket ger en öppnare och mer utbyggbar arkitektur

Vilka två nackdelar har overlay-nät?::==Ett extra lager av indirektion==, som kan kosta prestanda, och ==högre komplexitet== än TCP/IP.

Vad är **systemvirtualisering**?;;Att köra ==flera virtuella maskiner på en fysisk dator==, där varje virtuell maskin har sitt eget operativsystem.

Vad vinner systemvirtualisering jämfört med processer?::==Säkerhet och renare uppdelning av uppgifter==, plus att man kan ==fördela och ta betalt för resursanvändning mer exakt==.

Vad kan man göra med en virtuell maskin som man inte kan med en process, och vad sparar det?::==Migrera den enkelt== till en annan fysisk maskin. Det sparar ==investering i serverdatorer och energi==.

**Hypervisor**;;Det tunna lagret mjukvara ovanpå den fysiska arkitekturen som gör systemvirtualisering. Kallas även ==virtual machine monitor==.

Vad kännetecknar **full virtualisering**?;;Den virtuella maskinen ==ser ut precis som en riktig dator==, så vanliga operativsystem kan köra ==oförändrat==.

Vad är **paravirtualisering**, och vad kostar den?::Ett ==modifierat gränssnitt== som ger bättre prestanda på arkitekturer som x86, men ==operativsystemen måste portas== till det.
