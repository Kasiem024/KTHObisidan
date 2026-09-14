---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
created: 2026-09-08
updated: 2026-09-09
description: "Svar på kursens fyra tentafrågor om fjärranrop: hur distribuerade objekt och RMI fungerar, när rena sockets slår distribuerade objekt och omvänt, en jämförelse av sockets, RPC, RMI och webbtjänster, samt skillnaderna mellan distribuerade objekt och webbtjänster."
---
# HI1031 Tentafrågor och Svar - Kap 05 Fjärranrop

Noten täcker de fyra tentafrågorna för kapitel 5 och ingenting annat. Varje fråga har en faktadel ur
boken och ett **Muntligt svar** med talpunkter i den ordning du säger dem. Står det **Så kan du tänka**
är det min egen förklaring, inte bokens. Frågelistan kallar kapitlet "Distribuerade objekt", boken
kallar det "Remote Invocation"; svaren finns i kapitel 5 och 9.

## Fråga 1 – Beskriv generellt hur distribuerade objekt och speciellt hur RMI fungerar

Bokens avsnitt: §5.4 och §5.4.1 för modellen, §5.4.2 för hur RMI byggs, §5.4.3 för skräpsamling, §5.5
för Java RMI. §5.2 för request-reply-protokollet under allting.

**Grundidén.** I objektorienterad kod är programmets tillstånd redan uppdelat per objekt. Eftersom det
är ==logiskt uppdelat== är det ==ett litet steg== att lägga objekten i olika processer eller
datorer. Vanligast är klient-server: servern håller objekten, klienten anropar deras metoder med
fjärranrop. Ett objekt i en server får själv bli klient till ett objekt i en annan server, så anrop
kan bilda ==kedjor==.

**Två begrepp som boken kallar hjärtat i modellen:**

- **Fjärrobjektreferens.** Ett id som ==funkar i hela det distribuerade systemet== och pekar ut ett
  bestämt fjärrobjekt. Den kan ==skickas som argument och returneras som resultat==, vilket är hela
  skillnaden mot RPC.
- **Fjärrgränssnitt.** Anger ==vilka metoder som får anropas på distans==. Andra processer kan bara
  anropa de metoderna, medan ==lokala objekt kan anropa alla==. Ett gränssnitt har ==ingen
  konstruktor==, så man kan inte skapa ett objekt med ett fjärranrop — därför finns
  **fabriksmetoder**, vanliga metoder vars jobb är att skapa objekt.

Ett **fjärrobjekt** är ett objekt som kan ta emot fjärranrop; övriga tar bara emot lokala.

**Så här byggs RMI (figur 5.15).** Sex delar, och de tre i mitten genereras ==automatiskt av en
gränssnittskompilator==:

- **Kommunikationsmodul.** Kör request-reply mellan klient och server. De två modulerna är
  ==tillsammans ansvariga för anropssemantiken==, till exempel at-most-once.
- **Fjärrreferensmodul.** Översätter ==mellan lokala och fjärrobjektreferenser== och skapar nya. Har
  en **fjärrobjekttabell** med en rad per fjärrobjekt processen håller och en rad per lokal proxy.
- **Proxy** hos klienten. Beter sig som ett ==lokalt objekt== men utför inget — den ==vidarebefordrar
  anropet i ett meddelande==. En proxy per fjärrobjekt. Den döljer referensen, marshallingen och
  meddelandena: varje metod packar målreferens, `operationId` och argument i ett request, väntar på
  reply, packar upp och returnerar.
- **Dispatcher** hos servern. En per klass. Använder ==`operationId` för att välja rätt metod i
  skelettet==. Proxy och dispatcher måste numrera metoderna likadant.
- **Skelett** hos servern. En per klass. ==Packar upp argumenten, anropar servanten==, väntar, och
  packar resultat och eventuella undantag i ett reply.
- **Servant.** Det objekt som ==faktiskt innehåller fjärrobjektets kod och tillstånd==. Lever i
  serverprocessen.

**En binder** är en separat tjänst med en tabell från ==textnamn till fjärrobjektreferenser== — servern
registrerar sina objekt, klienten letar upp dem. Det är så klienten får sin första referens.
**Skräpsamlingen** bygger på ==referensräkning==: servern håller reda på vilka som har en referens till
varje objekt, och först när ingen har det får objektet tas bort.

**Java RMI specifikt (§5.5).** Samma syntax som lokala anrop, och typkontrollen gäller likadant. Men:

- Anroparen ==vet== att målet är på distans, för den måste hantera `RemoteException`, och den som
  skriver fjärrobjektet vet det, för klassen måste ==implementera gränssnittet `Remote`==. Det är också
  så undantag hanteras — ett fjärranrop kan alltid misslyckas för skäl som beror på distributionen.
- **Ett enda språk**, så fjärrgränssnitt skrivs i vanlig Java. Med ett flerspråkssystem som CORBA
  måste man i stället ==lära sig ett IDL== och hur det mappas till språket.
- **Parametrar:** allt antas vara `in`, resultatet är ett enda `out`. Allt som är **serialiserbart** —
  alltså går att ==skriva ut som en byte-ström och läsas tillbaka== — kan skickas. **Fjärrobjekt skickas
  som fjärrobjektreferens**, men **övriga objekt kopieras och skickas som värde** — mottagaren får ett
  ==nytt objekt vars tillstånd sedan kan avvika== från originalets.

### Muntligt svar

1. **Börja med modellen:** tillståndet är redan uppdelat per objekt, så att lägga objekten i olika
   processer är en naturlig utvidgning. Servern håller objekten, klienten anropar metoderna.
2. **Ge de två bärande begreppen:** fjärrobjektreferens, giltig i hela systemet och möjlig att skicka
   som parameter, och fjärrgränssnitt, som avgör vilka metoder som får anropas utifrån.
3. **Nämn vinsterna:** inkapsling tvingas fram eftersom klient och server är skilda processer, och
   heterogenitet blir gratis eftersom man bara ser metoderna.
4. **Gå över till RMI:** proxy hos klienten låtsas vara objektet och packar anropet, dispatcher hos
   servern väljer metod, skelettet packar upp och anropar servanten, och svaret går tillbaka samma väg.
5. **Säg att proxy, dispatcher och skelett genereras automatiskt** av en gränssnittskompilator, och att
   kommunikationsmodulerna är de som ger anropssemantiken.
6. **Avsluta med Java RMI:** samma syntax som lokalt, men `RemoteException` och `Remote` avslöjar att
   anropet är distribuerat. Fjärrobjekt skickas som referens, andra objekt som kopia.

## Fråga 2 – När kan ren socket-kommunikation vara bättre än distribuerade objekt och tvärtom

Bokens avsnitt: §5.2 för vad request-reply kostar, §5.6 för bokens egen sammanfattning, §5.3.1 för
latensen och felkänsligheten, §5.4 för vad distribuerade objekt ger.

**Bokens egen formulering är svaret på halva frågan.** I sammanfattningen säger den att request-reply
är ==lättviktigt och minimalt stöd== för klient-server, och att sådana protokoll ==ofta används där
kommunikationens omkostnader måste minimeras — till exempel i inbyggda system==. Det är den enda
platsen boken uttalat säger när man ska gå lågnivå.

**Så här sparar man på att bygga eget över UDP i stället för TCP.** Boken listar tre saker som är
onödiga när man bara skickar en förfrågan och ett svar:

- **Bekräftelser är överflödiga**, eftersom svaret i sig bekräftar förfrågan.
- **Att upprätta en förbindelse kostar två extra par meddelanden** utöver det par som förfrågan och
  svar behöver.
- **Flödeskontroll är överflödig** för de flesta anrop, som bara skickar små argument och resultat.
  (Flödeskontroll är TCP:s sätt att ==bromsa en skrivare som är snabbare än läsaren==.)

Boken ger ett riktigt exempel: **Sun NFS** skickar ==filblock av fast storlek==, så det behöver inget
stöd för obegränsat stora meddelanden, och dess operationer är gjorda ==idempotenta==, så det gör inget
om de utförs flera gånger. Därför behöver NFS ==ingen historik== och kan köra ett eget, effektivare
protokoll över UDP.

**Åt andra hållet: när middleware är värt priset.** Boken säger att distribuerade objekt ==gör det
lättare att skriva stora, krångliga distribuerade program==:

- Man får ==hela objektvärlden== — objekt, klasser, arv, och verktygen som hör dit.
- **Rikare parameteröverföring:** man kan skicka ==objektreferens och inte bara värde==, vilket är
  särskilt bra när parametern är ==stor eller trög==, för då kan mottagaren anropa objektet i stället för
  att hela värdet skickas över nätet.
- Man får dessutom ==inkapsling och heterogenitet gratis==, eftersom objekt bara nås via metoder.

**Men två saker gäller alltid, hur bra middleware man än har.** Fjärranrop är ==känsligare för fel än
lokala==, eftersom nätet, en annan dator och en annan process är inblandade, och det ==går inte att
skilja ett nätfel från att serverprocessen dött==. Latensen är dessutom ==flera storleksordningar
högre== än för ett lokalt anrop. Boken är försiktig med följden: det ==antyder== att program behöver ta
hänsyn till det, ==kanske genom att== minimera antalet fjärranrop.

**Så kan du tänka:** frågan handlar om var arbetet ligger. Med rena sockets gör ==du== jobbet — format,
felfall, portar — och får full kontroll och inga lager du inte behöver. Med distribuerade objekt gör
==middleware== jobbet, och du betalar med omkostnader och ett lager du inte ser in i. Ju enklare och mer
prestandakritiskt utbytet är, desto mer talar för sockets.

### Muntligt svar

1. **Rama in svaret:** det är en avvägning mellan kontroll och omkostnad, inte en fråga om vilket som
   är modernast.
2. **Citera boken för sockets:** request-reply är lättviktigt och minimalt, och används där
   kommunikationens omkostnader måste minimeras — boken nämner inbyggda system.
3. **Visa vad man sparar:** bekräftelser är onödiga när svaret bekräftar, förbindelseuppsättning kostar
   två extra par meddelanden, och flödeskontroll är onödig för små argument.
4. **Ge NFS som exempel:** fasta filblock och idempotenta operationer betyder att man klarar sig utan
   historik, så ett eget protokoll över UDP är effektivare.
5. **Vänd på det:** distribuerade objekt ger större uttryckskraft för komplexa tillämpningar — hela
   objektmodellen, och möjligheten att skicka objektreferens i stället för ett stort värde.
6. **Avsluta med det som alltid gäller:** fjärranrop är känsligare för fel än lokala, man kan inte
   skilja nätfel från serverfel, och latensen är flera storleksordningar högre.

## Fråga 3 – Jämför sockets, RPC, RMI och webbtjänster

Bokens avsnitt: §4.2 för sockets, §5.2 för request-reply, §5.3 och §5.3.1 för RPC, §5.4 för RMI, §9.1
och §9.2 för webbtjänster.

**Först det som håller ihop dem: de är lager, inte alternativ.** Sockets är
interprocesskommunikationen längst ner. RPC och RMI ligger direkt ovanpå och byggs ==med== sockets, i
regel över ett request-reply-protokoll. Webbtjänster ligger ovanpå HTTP, som självt är ett
request-reply-protokoll.

**Jämför dem på fem axlar:**

- **Abstraktion.** Sockets skickar ==byte-sekvenser==. RPC anropar en ==procedur== som om den var
  lokal. RMI anropar en ==metod på ett objekt==. En webbtjänst erbjuder ==operationer på en resurs som
  pekas ut av en URI==.
- **Hur målet namnges.** Sockets: ==(internetadress, port)==. RPC: Sun RPC använder ==program- och
  versionsnummer== som en lokal **port mapper** översätter till portnummer. RMI:
  ==fjärrobjektreferens==, som dessutom kan skickas som parameter. Webbtjänst: en ==URI==, oftast en
  URL, vilket boken kallar en **endpoint**.
- **Hur gränssnittet beskrivs.** Sockets: ==inte alls==, parterna kommer överens på egen hand. RPC:
  ett **IDL**, i Sun RPC språket ==XDR== med kompilatorn `rpcgen`. RMI: ett IDL som ==CORBA IDL==,
  eller själva språket i Java RMI. Webbtjänster: ==WSDL==, som boken kallar ett IDL för ett
  internetomfattande RPC.
- **Hur data representeras.** Sockets: du ==marshallar själv==. RPC och RMI: ==binärt==, med XDR, CORBA
  CDR eller Javas serialisering. Webbtjänster: ==XML==, paketerat med **SOAP** — reglerna för hur XML
  används för att ==packa meddelanden och bilda request-reply av två enkelriktade meddelanden==. Text är
  mer skrymmande och långsammare att tolka, men läsbart och lätt att felsöka.

**Anropssemantiken är RPC:s och RMI:s egen axel (figur 5.9).** Lokala anrop har ==exactly once==. För
fjärranrop väljer man mellan tre, beroende på hur mycket feltolerans man lägger in:

| Sänd om förfrågan | Filtrera dubbletter | Kör om eller sänd om svaret | Semantik |
|---|---|---|---|
| Nej | – | – | **Maybe** |
| Ja | Nej | Kör om proceduren | **At-least-once** |
| Ja | Ja | Sänd om svaret | **At-most-once** |

- **Maybe:** anropet körs ==en gång eller inte alls==. Bara användbart där enstaka misslyckade anrop är
  acceptabla.
- **At-least-once:** anroparen får ==antingen ett resultat eller ett undantag==. Risken är att
  proceduren körs ==mer än en gång==, vilket bara är ofarligt om operationerna är **idempotenta** — en
  operation som kan utföras flera gånger med samma effekt som en enda gång. Sun RPC ger at-least-once.
- **At-most-once:** ett resultat betyder att proceduren körts ==exakt en gång==, ett undantag att den
  körts ==en gång eller inte alls==. Kräver alla tre åtgärderna.

**Skillnaden som avgör i praktiken: brandväggar.** Boken säger att transportprotokollen som Java RMI
och CORBA använder ==normalt inte kommer genom en brandvägg==, medan brandväggar normalt ==släpper
igenom HTTP och SMTP==. Det är därför webbtjänster transporterar SOAP över dem, och det är skälet till
att webbtjänster fungerar ==mellan organisationer== där RMI och CORBA inte gör det.

### Muntligt svar

1. **Säg först att de är lager, inte alternativ.** Sockets underst, RPC och RMI byggs med sockets över
   request-reply, webbtjänster ovanpå HTTP.
2. **Gå uppåt i abstraktion:** byte-sekvens, procedur, metod på ett objekt, operation på en resurs med
   en URI.
3. **Ta namngivningen:** adress och port, program- och versionsnummer via en port mapper,
   fjärrobjektreferens som kan skickas vidare, URI.
4. **Ta gränssnitt och dataformat ihop:** inget alls och egen marshalling, XDR och binärt, CORBA IDL
   eller Java, WSDL och XML via SOAP — text kostar plats och tid men går att läsa.
5. **Ge anropssemantiken**, eftersom den är RPC:s och RMI:s egen: lokalt är exactly once, på distans
   maybe, at-least-once eller at-most-once, och at-least-once kräver idempotenta operationer.
6. **Avsluta med brandväggarna**, som är den praktiska skillnaden: RMI:s och CORBAs transport kommer
   inte igenom, HTTP och SMTP gör det, så webbtjänster vinner mellan organisationer.

## Fråga 4 – Vad är skillnaderna och likheterna mellan distribuerade objekt och webbtjänster

Bokens avsnitt: §9.2.2, som är bokens egen jämförelse, plus §9.1 och §9.2 för webbtjänsterna och §5.4
för objekten.

**Likheterna, och boken är noga med att de är ytliga.** En webbtjänst har ett **tjänstegränssnitt** med
operationer för att komma åt och uppdatera sina dataresurser. Boken skriver att interaktionen mellan
klient och server ==på ett ytligt plan är mycket lik RMI==: i RMI använder klienten en
fjärrobjektreferens för att anropa en operation i ett fjärrobjekt, i en webbtjänst en ==URI== för att
anropa en operation i den resurs URI:n pekar ut. Båda bygger på **programmering mot gränssnitt**, vilket
ger **lös koppling** — att ==beroendena mellan tjänster hålls så små som möjligt==, så en ändring i en
tjänst inte sprider sig till andra — och gör att klienten slipper veta språk och plattform. Båda kan
dölja marshallingen bakom en ==proxy eller stubbar==, och båda har **dynamiskt anrop** som alternativ när
gränssnittet inte är känt vid kompileringen.

**Skillnaden allt annat följer ur: en webbtjänst kan inte skapa fjärrobjekt.** I den distribuerade
objektmodellen kan objekt ==skapa fjärrobjekt dynamiskt== och returnera referenser till dem, som
mottagaren i sin tur kan anropa. Boken säger rakt ut att ==ingenting sådant kan göras med
webbtjänster==. Slutsatsen boken drar: en webbtjänst är i praktiken ==ett enda fjärrobjekt==, och
därför är både ==skräpsamling och fjärrobjektreferenser irrelevanta==.

**Tre konkreta följder, med bokens eget exempel: den delade skrivtavlan.**

- I objektversionen är `newShape` en **fabriksmetod** — den skapar en ny `Shape` och returnerar en
  fjärrobjektreferens. I webbtjänstversionen tas gränssnittet `Shape` bort, dess operationer flyttas in
  i `ShapeList`, och `newShape` returnerar ==ett heltal== som säger var objektet ligger i en vektor. Den
  är därmed ==inte längre en fabriksmetod==.
- **Inga servanter.** I objektmodellen modelleras servern ==normalt== som en samling servanter, en per
  resurs. Webbtjänster ==stöder inte servanter==, och för att tvinga fram det får implementationen
  ==varken ha konstruktor eller `main`-metod==.
- **Inga fjärrreferenser som parametrar.** JAX-RPC ==tillåter inte== att fjärrobjektreferenser skickas
  som argument eller returneras som resultat.

**Två skillnader till, ur §9.1 och §9.2.** Webbtjänster är gjorda för att vara ==oberoende av varje
programmeringsparadigm==, eftersom många språk och paradigm ==finns sida vid sida== på internet — boken
ställer det uttryckligen mot distribuerade objekt, som ==vill att du gör på ett bestämt sätt==. Och
middleware
har som huvuduppgift att dölja dataformat och marshalling och få fjärranrop att se ut som lokala, men
boken säger att ==inget av detta ingår== för webbtjänster: i enklaste fallet läser och skriver klient och
server ==direkt i SOAP och XML==, och bekvämligheten läggs på i ett API ovanpå.

**Så kan du tänka:** enklaste sättet att minnas det är att distribuerade objekt har ==identitet== och
webbtjänster har ==adress==. Ett objekt kan födas, få en referens, skickas runt och dö, och det är
därför man behöver skräpsamling. En webbtjänst är en URI som ligger still och tar emot operationer, och
då behövs inget av det.

### Muntligt svar

1. **Ta likheten först, och kalla den ytlig** — bokens ord. Båda har ett tjänstegränssnitt med
   operationer, och klienten anropar en operation via en referens respektive en URI.
2. **Nämn det de faktiskt delar:** programmering mot gränssnitt, vilket ger lös koppling och döljer
   språk och plattform, och att båda kan gömma marshalling bakom en proxy.
3. **Ge kärnskillnaden:** en webbtjänst kan inte skapa fjärrobjekt och returnera referenser till dem.
4. **Dra bokens slutsats:** en webbtjänst är i praktiken ett enda fjärrobjekt, så skräpsamling och
   fjärrobjektreferenser är irrelevanta.
5. **Visa följderna med skrivtavlan:** `newShape` är en fabriksmetod i objektversionen men returnerar
   ett heltal i webbtjänstversionen, det finns inga servanter, och implementationen får varken ha
   konstruktor eller `main`.
6. **Avsluta med paradigm och transparens:** webbtjänster är gjorda för att vara paradigmoberoende, och
   de ger ingen transparens av sig själva — utan ett API läser man SOAP och XML direkt.

## Luckor och källor

**Figur 5.9:s kolumnrubriker skiljer sig från löptexten** — en verklig skillnad i boken, inte ett fel i
noten. Figuren säger *Retransmit request message*, *Duplicate filtering* och *Re-execute procedure or
retransmit reply*, medan §5.3.1 kallar dem något annat. Tabellen i fråga 3 följer figuren.

**Fråga 2 är delvis min syntes.** Boken har inget avsnitt som ställer sockets mot distribuerade objekt.
Bokens är citatet om att request-reply är lättviktigt och används i inbyggda system, de tre
omkostnaderna, NFS-exemplet, uttryckskraften hos distribuerade objekt samt latensen och felkänsligheten.
Sammanvägningen i **Så kan du tänka** är min.

**Det som inte är utskrivet här** frågas inte av någon tentafråga: HTTP:s metoder, statuskoder och
MIME-typer, alla kodexempel och Java-API:er, R-, RR- och RRA-protokollen, Sun RPC:s autentisering,
aktivering och passivering, lokaliseringstjänster, dynamiska skelett, och CORBA-detaljer.
