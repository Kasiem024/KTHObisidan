---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-09-08
updated: 2026-09-15
description: "Svar på kursens fyra tentafrågor om fjärranrop: hur distribuerade objekt och RMI fungerar, när rena sockets slår distribuerade objekt och omvänt, en jämförelse av sockets, RPC, RMI och webbtjänster, samt skillnaderna mellan distribuerade objekt och webbtjänster."
---
# HI1031 Tentafrågor och Svar - Kap 05 Fjärranrop

Noten täcker de fyra tentafrågorna och ingenting annat. Varje fråga har en faktadel ur boken och ett
**Muntligt svar** med talpunkterna i den ordning du säger dem. **Så kan du tänka** är min egen
förklaring, inte bokens. Boken kallar kapitlet "Remote Invocation"; svaren finns i kapitel 5 och 9.

## Fråga 1 – Beskriv generellt hur distribuerade objekt och speciellt hur RMI fungerar

Bokens avsnitt: §5.4 och §5.4.1 för modellen, §5.4.2 för RMI, §5.5 för Java RMI.

**Grundidén.** Tillståndet är redan uppdelat per objekt, och eftersom det är ==logiskt uppdelat== är det
==ett litet steg== att lägga objekten i olika processer eller datorer. Vanligast är klient-server:
servern håller objekten, klienten anropar metoderna med fjärranrop. Ett serverobjekt kan själv bli
klient till ett objekt i en annan server, så anrop kan bilda ==kedjor==.

**Två begrepp som boken kallar hjärtat i modellen:**

- **Fjärrobjektreferens** — ett id som ==funkar i hela systemet== och pekar ut ett bestämt fjärrobjekt.
  Den kan ==skickas som argument och returneras som resultat==. Det är en av bokens två skillnader mot
  RPC; den andra är att man får hela objektorienteringen med objekt, klasser och arv.
- **Fjärrgränssnitt** — anger ==vilka metoder som får anropas på distans==, medan ==lokala objekt kan
  anropa alla==. Det har ==ingen konstruktor==, så man kan inte skapa ett objekt med ett fjärranrop.
  Därför finns **fabriksmetoder**: vanliga metoder vars jobb är att skapa objekt.

**Så här byggs RMI (figur 5.15).** Sex delar, där proxy, dispatcher och skelett genereras ==automatiskt
av en gränssnittskompilator==:

- **Proxy** hos klienten, en per fjärrobjekt — beter sig som ett ==lokalt objekt== men utför inget. Den
  packar målreferens, `operationId` och argument i ett request och returnerar svaret, och döljer därmed
  referensen, marshallingen och meddelandena.
- **Dispatcher** hos servern, en per klass — använder ==`operationId` för att välja metod i skelettet==.
- **Skelett** hos servern, en per klass — ==packar upp argumenten och anropar servanten==, och packar
  resultat eller undantag i ett reply.
- **Servant** — objektet som ==innehåller fjärrobjektets kod och tillstånd==, i serverprocessen.
- **Kommunikationsmodul** på båda sidor — kör request-reply och är ==tillsammans ansvariga för
  anropssemantiken==, till exempel at-most-once.
- **Fjärrreferensmodul** — översätter ==mellan lokala och fjärrobjektreferenser==.

**Java RMI (§5.5).** Samma syntax och typkontroll som lokala anrop, men anroparen ==vet== att målet är
på distans. Det är ett enda språk, så gränssnitten skrivs i vanlig Java. Allt **serialiserbart** kan
skickas, alltså allt som går att ==skriva ut som en byte-ström och läsa tillbaka==: **fjärrobjekt
skickas som referens, övriga objekt kopieras och skickas som värde**, så mottagaren får ett
==nytt objekt vars tillstånd kan avvika== från originalets.

### Muntligt svar

1. **Börja med modellen:** tillståndet är redan uppdelat per objekt, så att lägga objekten i olika
   processer är en naturlig utvidgning. Servern håller objekten, klienten anropar metoderna.
2. **Ge de två bärande begreppen:** fjärrobjektreferens, giltig i hela systemet och möjlig att skicka
   som parameter, och fjärrgränssnitt, som avgör vilka metoder som får anropas utifrån. Gränssnittet har
   ingen konstruktor, därför fabriksmetoder.
3. **Ta RMI-kedjan i ordning:** proxy hos klienten låtsas vara objektet och packar anropet, dispatcher
   hos servern väljer metod, skelettet packar upp och anropar servanten, svaret går tillbaka samma väg.
4. **Säg att proxy, dispatcher och skelett genereras automatiskt** av en gränssnittskompilator, och att
   kommunikationsmodulerna är de som ger anropssemantiken.
5. **Avsluta med Java RMI:** samma syntax som lokalt, men anroparen vet att anropet är distribuerat.
   Fjärrobjekt skickas som referens, andra objekt som kopia.

Beskriv generellt hur distribuerade objekt fungerar. (3)
||
- **Modellen** – tillståndet är redan uppdelat per objekt, så det är ett litet steg att lägga objekten i olika processer; vanligast är klient-server där servern håller objekten och klienten anropar metoderna, och anrop kan bilda kedjor
- **De två bärande begreppen** – fjärrobjektreferens, ett id som funkar i hela systemet och kan skickas som argument och resultat, och fjärrgränssnitt, som anger vilka metoder som får anropas på distans
- **Fabriksmetoder** – fjärrgränssnittet har ingen konstruktor så man kan inte skapa objekt med ett fjärranrop, därför finns fabriksmetoder vars jobb är just att skapa objekt

Beskriv speciellt hur RMI fungerar. (3)
||
- **Kedjan** – proxyn hos klienten låtsas vara objektet och packar referens, operationId och argument i en förfrågan, dispatchern hos servern väljer metod med operationId, skelettet packar upp och anropar servanten som har koden och tillståndet, och svaret går tillbaka samma väg
- **Automatiskt** – proxy, dispatcher och skelett genereras av en gränssnittskompilator, medan kommunikationsmodulerna på båda sidor kör request-reply och ger anropssemantiken som at-most-once
- **Java RMI** – samma syntax som ett lokalt anrop men anroparen vet att det är distribuerat, och fjärrobjekt skickas som referens medan andra objekt kopieras och skickas som värde

## Fråga 2 – När kan ren socket-kommunikation vara bättre än distribuerade objekt och tvärtom

Bokens avsnitt: §5.2 för vad request-reply kostar, §5.6 för sammanfattningen, §5.3.1 för latens och
felkänslighet, §5.4 för vad distribuerade objekt ger.

**Bokens egen formulering är svaret på halva frågan.** Request-reply är ==lättviktigt och minimalt
stöd== för klient-server, och sådana protokoll ==ofta används där kommunikationens omkostnader måste
minimeras — till exempel i inbyggda system==. Det är den enda platsen boken uttalat säger när man ska gå
lågnivå.

**Tre TCP-omkostnader man slipper genom att bygga eget över UDP:**

- **Bekräftelser**, eftersom svaret i sig bekräftar förfrågan.
- **Förbindelseuppsättning**, som kostar ==två extra par meddelanden== utöver förfrågan och svar.
- **Flödeskontroll**, onödig för de flesta anrop som bara skickar små argument och resultat.

**Bokens exempel: Sun NFS.** Det skickar ==filblock av fast storlek== och har gjort operationerna
==idempotenta==, så det gör inget om de utförs flera gånger. Därför behöver NFS ==ingen historik== och
kan köra ett eget, effektivare protokoll över UDP.

**Åt andra hållet.** Distribuerade objekt ==gör det lättare att skriva stora, krångliga distribuerade
program==: man får hela objektvärlden med klasser och arv, och kan skicka ==objektreferens i stället för
värde==, vilket är särskilt bra när parametern är ==stor eller komplex== — då anropar mottagaren objektet
i stället för att hela värdet går över nätet.

**Men två saker gäller alltid.** Fjärranrop är ==känsligare för fel än lokala==, och det ==går inte att
skilja ett nätfel från att serverprocessen dött==. Latensen är ==flera storleksordningar högre==. Boken
garderar följden: det ==antyder== att program behöver ta hänsyn till det, ==kanske genom att== minimera
antalet fjärranrop.

**Så kan du tänka:** frågan handlar om var arbetet ligger. Med sockets gör ==du== jobbet — format,
felfall, portar — och får kontroll utan lager du inte behöver. Med distribuerade objekt gör
==middleware== jobbet, och du betalar med omkostnader och ett lager du inte ser in i. Ju enklare och mer
prestandakritiskt utbytet är, desto mer talar för sockets.

### Muntligt svar

1. **Rama in svaret:** en avvägning mellan kontroll och omkostnad, inte en fråga om vad som är modernast.
2. **Citera boken för sockets:** request-reply är lättviktigt och minimalt, och används där
   kommunikationens omkostnader måste minimeras — boken nämner inbyggda system.
3. **Visa vad man sparar:** bekräftelser är onödiga när svaret bekräftar, förbindelseuppsättning kostar
   två extra par meddelanden, och flödeskontroll är onödig för små argument.
4. **Ge NFS som exempel:** fasta filblock och idempotenta operationer betyder att man klarar sig utan
   historik, så ett eget protokoll över UDP är effektivare.
5. **Vänd på det:** distribuerade objekt ger större uttryckskraft — hela objektmodellen, och möjligheten
   att skicka objektreferens i stället för ett stort värde.
6. **Avsluta med det som alltid gäller:** känsligare för fel, man kan inte skilja nätfel från serverfel,
   och latensen är flera storleksordningar högre.

När är ren socket-kommunikation bättre än distribuerade objekt? (3)
||
- **Ramen** – en avvägning mellan kontroll och omkostnad: request-reply är lättviktigt och minimalt och används där omkostnaderna måste hållas nere, boken nämner inbyggda system
- **Vad man sparar** – tre TCP-omkostnader man slipper över UDP: bekräftelser, eftersom svaret bekräftar förfrågan, förbindelseuppsättning, som kostar två extra par meddelanden, och flödeskontroll, onödig för små argument
- **Exemplet** – Sun NFS skickar filblock av fast storlek och har idempotenta operationer, så det klarar sig utan historik och kör ett eget effektivare protokoll över UDP

När är distribuerade objekt bättre än rena sockets? (3)
||
- **Uttryckskraften** – de gör det lättare att skriva stora, krångliga program, för man får hela objektmodellen med klasser och arv och kan skicka en objektreferens i stället för ett stort värde så mottagaren anropar objektet i stället för att allt går över nätet
- **Priset alltid** – fjärranrop är känsligare för fel än lokala, och man kan inte skilja ett nätfel från att serverprocessen dött
- **Latensen** – den är flera storleksordningar högre, vilket antyder att man bör minimera antalet fjärranrop

## Fråga 3 – Jämför sockets, RPC, RMI och webbtjänster

Bokens avsnitt: §4.2 för sockets, §5.2 för request-reply, §5.3 och §5.3.1 för RPC, §5.4 för RMI, §9.1
och §9.2 för webbtjänster.

**Först det som håller ihop dem: de är lager, inte alternativ.** Sockets är interprocesskommunikationen
längst ner. RPC och RMI byggs ==med== sockets, i regel över ett request-reply-protokoll. Webbtjänster
ligger ovanpå HTTP, som självt är request-reply.

**Fyra axlar att jämföra på:**

- **Abstraktion.** Sockets: ==byte-sekvenser==. RPC: ==en procedur== som om den var lokal. RMI: ==en
  metod på ett objekt==. Webbtjänst: ==operationer på en resurs som pekas ut av en URI==.
- **Namngivning.** Sockets: ==(internetadress, port)==. RMI: ==fjärrobjektreferens==, som kan skickas
  som parameter. Webbtjänst: en ==URI==, oftast en URL, som boken kallar en **endpoint**.
- **Gränssnittsbeskrivning.** Sockets: ==inte alls==, parterna kommer överens själva. RPC: ett **IDL**.
  RMI: ett IDL som ==CORBA IDL==, eller språket självt i Java RMI. Webbtjänst: ==WSDL==, som boken kallar
  ett IDL för ett internetomfattande RPC.
- **Datarepresentation.** Sockets: du ==marshallar själv==. RPC och RMI: ==binärt==, med Javas
  serialisering. Webbtjänst: ==XML== paketerat med **SOAP** — skrymmande och långsammare att tolka, men
  läsbart.

**Anropssemantiken är RPC:s och RMI:s egen axel (figur 5.9).** Lokala anrop har ==exactly once==. På
distans väljer man mellan tre, beroende på hur mycket feltolerans man lägger in:

| Sänd om förfrågan | Filtrera dubbletter | Kör om eller sänd om svaret | Semantik |
|---|---|---|---|
| Nej | – | – | **Maybe** |
| Ja | Nej | Kör om proceduren | **At-least-once** |
| Ja | Ja | Sänd om svaret | **At-most-once** |

- **Maybe** — anropet körs ==en gång eller inte alls==. Duger bara där enstaka misslyckade anrop är OK.
- **At-least-once** — anroparen får ==ett resultat eller ett undantag==, men proceduren kan ha körts
  ==mer än en gång==. Ofarligt bara om operationerna är **idempotenta**. Sun RPC ger detta.
- **At-most-once** — ett resultat betyder ==exakt en gång==, ett undantag ==en gång eller inte alls==.
  Kräver alla tre åtgärderna.

**Skillnaden som avgör i praktiken: brandväggar.** Transportprotokollen som Java RMI och CORBA använder
==kommer normalt inte genom en brandvägg==, medan brandväggar normalt ==släpper igenom HTTP och SMTP==.
Därför transporteras SOAP över dem, och därför fungerar webbtjänster ==mellan organisationer== där RMI
och CORBA inte gör det.

### Muntligt svar

1. **Säg först att de är lager, inte alternativ.** Sockets underst, RPC och RMI byggs med sockets över
   request-reply, webbtjänster ovanpå HTTP.
2. **Gå uppåt i abstraktion:** byte-sekvens, procedur, metod på ett objekt, operation på en resurs med
   en URI.
3. **Ta namngivningen:** adress och port, fjärrobjektreferens som kan skickas vidare, URI.
4. **Ta gränssnitt och dataformat ihop:** inget alls och egen marshalling, IDL och binärt, CORBA IDL
   eller Java, WSDL och XML via SOAP — text kostar plats och tid men går att läsa.
5. **Ge anropssemantiken**, eftersom den är RPC:s och RMI:s egen: lokalt exactly once, på distans maybe,
   at-least-once eller at-most-once, och at-least-once kräver idempotenta operationer.
6. **Avsluta med brandväggarna:** RMI:s och CORBAs transport kommer inte igenom, HTTP och SMTP gör det,
   så webbtjänster vinner mellan organisationer.

Jämför sockets, RPC, RMI och webbtjänster: ram, abstraktion, namngivning. (3)
||
- **Rama in** – de är lager, inte alternativ: sockets underst, RPC och RMI byggs med sockets över request-reply, och webbtjänster ligger ovanpå HTTP som självt är request-reply
- **Abstraktion** – sockets ger byte-sekvenser, RPC en procedur som om den vore lokal, RMI en metod på ett objekt, och en webbtjänst operationer på en resurs som pekas ut av en URI
- **Namngivning** – sockets använder internetadress och port, RMI en fjärrobjektreferens som kan skickas som parameter, och en webbtjänst en URI, oftast en URL som kallas endpoint

Jämför sockets, RPC, RMI och webbtjänster: gränssnitt, semantik, brandväggar. (3)
||
- **Gränssnitt och dataformat** – sockets beskrivs inte alls och du marshallar själv, RPC och RMI använder ett IDL och binärt format, och en webbtjänst använder WSDL och XML paketerat med SOAP, som är skrymmande men läsbart
- **Anropssemantik** – lokalt gäller exactly once, på distans väljer man maybe, en gång eller inte alls, at-least-once, som kan köra om proceduren och därför bara passar idempotenta operationer, eller at-most-once, som ger exakt en gång
- **Brandväggar** – Java RMI:s och CORBAs transport kommer normalt inte igenom en brandvägg men HTTP och SMTP gör det, så SOAP transporteras över dem och webbtjänster fungerar mellan organisationer där RMI och CORBA inte gör det

## Fråga 4 – Vad är skillnaderna och likheterna mellan distribuerade objekt och webbtjänster

Bokens avsnitt: §9.2.2 är bokens egen jämförelse, plus §9.1 och §9.2 för webbtjänsterna och §5.4 för
objekten.

**Likheterna, och boken är noga med att de är ytliga.** En webbtjänst har ett **tjänstegränssnitt** med
operationer som når och uppdaterar dess dataresurser, och boken skriver att interaktionen ==på ett
ytligt plan är mycket lik RMI==: där RMI använder en fjärrobjektreferens använder webbtjänsten en
==URI== för att anropa en operation i den resurs URI:n pekar ut. Båda bygger på **programmering mot
gränssnitt**, vilket ger **lös koppling** — ==beroendena mellan tjänster hålls så små som möjligt==, så
en ändring inte sprider sig — och gör att klienten slipper veta språk och plattform. Båda kan dölja
marshallingen bakom en ==proxy==, och båda har **dynamiskt anrop** när gränssnittet inte är känt vid
kompileringen.

**Skillnaden allt annat följer ur: en webbtjänst kan inte skapa fjärrobjekt.** I objektmodellen kan
objekt ==skapa fjärrobjekt dynamiskt== och returnera referenser som mottagaren i sin tur anropar. Boken
säger rakt ut att ==ingenting sådant kan göras med webbtjänster==, och drar slutsatsen att en webbtjänst
i praktiken är ==ett enda fjärrobjekt== — därför är både ==skräpsamling och fjärrobjektreferenser
irrelevanta==.

**Tre följder, med bokens eget exempel den delade skrivtavlan:**

- `newShape` är en **fabriksmetod** i objektversionen, men den är i webbtjänstversionen
  ==inte längre en fabriksmetod==.
- **Inga servanter.** Servern modelleras ==normalt== som en samling servanter, en per resurs.
  Webbtjänster ==stöder inte servanter==.
- **Inga fjärrreferenser som parametrar.** Webbtjänster ==tillåter inte== att de skickas som argument
  eller returneras som resultat.

**Två skillnader till.** Webbtjänster är gjorda för att vara ==oberoende av varje
programmeringsparadigm==, eftersom många språk och paradigm ==finns sida vid sida== på internet — boken
ställer det mot distribuerade objekt, som ==vill att du gör på ett bestämt sätt==. Och middleware har som
huvuduppgift att dölja dataformat och marshalling och få fjärranrop att se ut som lokala, men ==inget av
detta ingår== för webbtjänster: i enklaste fallet läser och skriver klient och server ==direkt i SOAP och
XML==, och bekvämligheten läggs på i ett API ovanpå.

### Muntligt svar

1. **Ta likheten först, och kalla den ytlig** — bokens ord. Båda har ett tjänstegränssnitt med
   operationer, och klienten anropar via en referens respektive en URI.
2. **Nämn det de faktiskt delar:** programmering mot gränssnitt, vilket ger lös koppling och döljer
   språk och plattform, och att båda kan gömma marshalling bakom en proxy.
3. **Ge kärnskillnaden:** en webbtjänst kan inte skapa fjärrobjekt och returnera referenser till dem.
4. **Dra bokens slutsats:** en webbtjänst är i praktiken ett enda fjärrobjekt, så skräpsamling och
   fjärrobjektreferenser är irrelevanta.
5. **Visa följderna med skrivtavlan:** `newShape` är inte längre en fabriksmetod, och det finns inga
   servanter.
6. **Avsluta med paradigm och transparens:** webbtjänster är paradigmoberoende, och ger ingen transparens
   av sig själva — utan ett API läser man SOAP och XML direkt.

Vilka är likheterna mellan distribuerade objekt och webbtjänster? (2)
||
- **Ytlig likhet** – på ytan är de lika: där RMI använder en fjärrobjektreferens använder webbtjänsten en URI för att anropa en operation i den resurs URI:n pekar ut
- **Vad de delar** – båda bygger på programmering mot gränssnitt, vilket ger lös koppling och döljer språk och plattform, och båda kan gömma marshallingen bakom en proxy

Vilka är skillnaderna mellan distribuerade objekt och webbtjänster? (3)
||
- **Kärnskillnaden** – en webbtjänst kan inte skapa fjärrobjekt och returnera referenser till dem som objektmodellen kan, så en webbtjänst är i praktiken ett enda fjärrobjekt och både skräpsamling och fjärrobjektreferenser blir irrelevanta
- **Följderna** – newShape är inte längre en fabriksmetod, det finns inga servanter, och fjärrreferenser får inte skickas som argument eller returneras
- **Paradigm och transparens** – webbtjänster är oberoende av programmeringsparadigm medan distribuerade objekt vill att du gör på ett bestämt sätt, och webbtjänster ger ingen transparens, i enklaste fallet läser och skriver man direkt i SOAP och XML

## Luckor och källor

**Figur 5.9:s kolumnrubriker skiljer sig från löptexten** — en verklig skillnad i boken, inte ett fel i
noten. Figuren säger *Retransmit request message*, *Duplicate filtering* och *Re-execute procedure or
retransmit reply*, medan §5.3.1 kallar dem något annat. Tabellen i fråga 3 följer figuren.

**Fråga 2 är delvis min syntes.** Boken har inget avsnitt som ställer sockets mot distribuerade objekt.
Bokens är citatet om inbyggda system, de tre omkostnaderna, NFS-exemplet, uttryckskraften hos
distribuerade objekt samt latensen och felkänsligheten. Sammanvägningen i **Så kan du tänka** är min.

**Medvetet utanför noten**, eftersom ingen tentafråga rör det: HTTP:s metoder och statuskoder, kodexempel
och Java-API:er, R-, RR- och RRA-protokollen, Sun RPC:s autentisering, aktivering och passivering,
lokaliseringstjänster, dynamiska skelett, binder, samt CORBA-detaljer.
