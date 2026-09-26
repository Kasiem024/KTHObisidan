---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-15
description: "Flashcards HI1031 kap 4, ordnade efter kursens sex tentafrågor: karakterisering av IPC-anrop, XML, UDP/TCP/multicast, portar och multicast, IPC mot distribuerade objekt, samt nätverks- och systemvirtualisering."
---
# HI1031 Begrepp - Kap 04 Interprocesskommunikation

## Fråga 1 – Karakterisera ett IPC-anrop

Vilka fyra sätt karakteriserar ett IPC-anrop enligt boken? (4)
||
- **Synkront eller asynkront**
- **Meddelandets destination**
- **Tillförlitlighet**
- **Ordning**

Vad gäller vid **synkron** kommunikation?::==Både send och receive blockerar.== `send` väntar på motsvarande `receive`, `receive` väntar på ett meddelande.

Vad gäller vid **asynkron** kommunikation?::`send` är ==icke-blockerande== – sändaren fortsätter så snart meddelandet kopierats till en lokal buffert.

Varför erbjuder dagens system i regel inte icke-blockerande `receive`?::Med trådar har blockerande `receive` ==inga nackdelar==, och den icke-blockerande lägger bara komplexitet på mottagaren.

Hur anges en meddelandedestination, och hur många parter kan den ha?::Med paret ==(internetadress, lokal port)==. En port har exakt en mottagare men många sändare.

Hur definierar boken tillförlitlighet?::Med ==giltighet== – att meddelanden kommer fram trots ett "rimligt" antal tappade paket – och integritet, att de kommer fram oskadade och utan dubbletter.

## Fråga 2 – XML

Vad är ett **märkspråk**?;;Text där ==taggar visar både innehållet och dess struktur eller utseende==.

Vad är skillnaden mellan XML:s och HTML:s taggar?::XML:s taggar beskriver ==den logiska strukturen==, HTML:s säger hur webbläsaren ska visa texten. XML låter dig dessutom definiera egna taggar.

Varför behöver XML vara självbeskrivande, när CORBA CDR inte behöver det?::CORBA CDR:s parter ==känner redan ordningen och typerna==. XML skulle användas av flera tillämpningar för olika syften.

Vad är en XML-**namnrymd**?;;En uppsättning namn ==refererad med en URL==, som låter en tillämpning använda flera uppsättningar definitioner utan namnkollisioner.

Vad används XML till enligt boken? (4)
||
- **Webbtjänster** – klienter pratar med dem i XML via SOAP, och XML definierar tjänsternas gränssnitt
- **Arkivering och återsökning**
- **Specifikation av användargränssnitt**
- **Kodning av konfigurationsfiler**

Vad är priset för att XML är text med taggar, och vad gör man åt det?::==Stora meddelanden==, alltså längre tider och mer lagring. Motmedlet är komprimering – HTTP 1.1 tillåter det.

## Fråga 3 – Tre typer av IPC

Vad skickas ett UDP-datagram utan, och vad blir följden?::==Bekräftelse och omsändning==, så felmodellen är utelämnandefel och leverans i fel ordning.

Vilka tjänster nämner boken som exempel på UDP respektive TCP?::UDP: ==DNS och Voice over IP==, för att slippa omkostnaderna för garanterad leverans. TCP: HTTP, FTP, Telnet och SMTP.

Vad ger en TCP-ström för abstraktion?::En ==tvåvägsström av bytes utan meddelandegränser==.

Vad döljer TCP-strömmen? (4)
||
- **Meddelandestorlekar**
- **Tappade meddelanden**, via bekräftelser och omsändning
- **Flödeskontroll**, som bromsar en skrivare snabbare än läsaren
- **Dubbletter och ordning**

Varför är TCP **inte** tillförlitlig kommunikation?::Passerar paketförlusten en gräns, eller kapas eller överbelastas nätet, ==förklarar TCP förbindelsen bruten==.

Vilka två saker kan en process inte avgöra när TCP förklarar förbindelsen bruten? (2)
||
- Om felet var **nätet** eller att **processen i andra änden dog**
- Om de meddelanden den **nyligen skickade kom fram**

Vad gör en **multicast-operation**?;;Skickar ==ett enda meddelande från en process till varje medlem i en grupp==, normalt så att medlemskapet är transparent för sändaren.

Hur anges en multicast-grupp, och hur nås IP multicast från ett program?::Med en ==klass D-adress==, och på programmeringsnivå bara via UDP.

## Fråga 4 – Portar med flera mottagare

Hur får en port flera mottagare, när den normalt bara har en?::Genom ==IP multicast== – bara de processerna delar portar. Kopior går till alla lokala sockets som gått med i adressen och är bundna till portnummret.

Vad möjliggör multicast enligt boken? (4)
||
- **Feltolerans med replikerade tjänster** – en grupp servrar gör samma operation, så klienterna betjänas även när några går ner
- **Att hitta tjänster i spontana nät**
- **Bättre prestanda med replikerad data**
- **Spridning av händelsenotifieringar**

Vad händer om ett datagram tappas mellan två multicast-routrar?::==Ingen mottagare bortom den routern== får meddelandet.

Vilka två ordningsproblem har multicast? (2)
||
- Samma sändares datagram kan nå **olika medlemmar i olika ordning**
- Meddelanden från **två sändare** kommer inte nödvändigtvis i samma ordning hos alla

Varför är replikerade tjänster det hårda fallet för multicast?::Servrarna måste göra ==samma operationer i samma ordning==, så missar en enda medlem en förfrågan blir den inkonsistent.

Vilka två starkare garantier behövs ovanpå IP multicast? (2)
||
- **Tillförlitlig multicast** – ett skickat meddelande tas emot av alla medlemmar eller av ingen
- **Totalt ordnad multicast** – den strängaste: alla meddelanden når alla medlemmar i samma ordning

## Fråga 5 – IPC mot distribuerade objekt

Vilken relation har IPC och distribuerade objekt?::De är ==lager, inte alternativ== – IPC är det undre middleware-lagret och distribuerade objekt byggs ovanpå det.

Vad är **marshalling**?;;Att ==platta datastrukturer till en sekvens av bytes== för överföring, och bygga upp dem igen vid ankomsten.

Vad är skillnaden i abstraktion mellan IPC och distribuerade objekt?::IPC är ==meddelandeöverföring== med `send` och `receive` på bytes; distribuerade objekt ger metodanrop där detaljerna döljs.

Hur skiljer sig destinationen i IPC och distribuerade objekt?::IPC använder (internetadress, port); ett distribuerat objekt använder en ==fjärrobjektreferens som är unik i tid och rum== och aldrig återanvänds.

Hur tvingar distribuerade objekt fram inkapsling?::Klient och server ligger i ==olika processer==, så tillståndet nås bara via objektets metoder och obehöriga metoder kan inte röra det.

Varför får olika platser använda olika dataformat med distribuerade objekt?::Objekten nås ==bara via sina metoder==, så klienterna märker inte formatskillnaden.

Vad kan skickas som parameter i ett fjärranrop, utöver värden?::En ==objektreferens==. Det är vinsten när parametern är stor – mottagaren kan nå objektet med ett nytt anrop i stället för att hela värdet skickas.

## Fråga 6 – Virtualisering

Vad är **nätverksvirtualisering**?;;Att bygga ==många virtuella nät ovanpå ett enda befintligt nät==, ett per tillämpning, vart och ett med eget adresseringssätt, egna protokoll och egen routing.

Varför kan man inte i stället ändra internetprotokollen?::Det vore ==opraktiskt== med så många olika tillämpningar – det som förbättrar den ena kan skada den andra.

Hur förhåller sig nätverksvirtualisering till Saltzers end-to-end-argument?::Den ==antyder ett svar på dilemmat== – man kan optimera ett virtuellt nät för en bestämd tillämpning utan att ändra nätet under. Boken säger "suggests", inte "solves".

Vad är ett **overlay-nät**?;;Den konkreta formen av ett virtuellt nät: ==noder och virtuella länkar== ovanpå ett underliggande nät, som ger något det underliggande nätet inte ger.

Vilka tre fördelar har overlay-nät? (3)
||
- **Nya nättjänster** utan att ändra det underliggande nätet
- De **uppmuntrar experiment** och anpassning till särskilda tillämpningsklasser
- **Flera overlays kan samexistera**, vilket ger en öppnare och mer utbyggbar arkitektur

Vad är **systemvirtualisering**?;;Att köra ==flera virtuella maskiner på en fysisk dator==, där varje virtuell maskin har sitt eget operativsystem.

Vad vinner systemvirtualisering, jämfört med processer?::==Säkerhet, renare uppdelning och exaktare debitering== – och en virtuell maskin kan migreras ganska enkelt, vilket enligt boken har potential att minska investeringen i serverdatorer och sänka energiförbrukningen.

**Hypervisor**;;Det tunna lagret mjukvara ovanpå den fysiska arkitekturen som gör systemvirtualisering. Kallas även ==virtual machine monitor==.
