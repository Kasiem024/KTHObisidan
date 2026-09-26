---
tags: [begrepp, HI1031, databaser, säkerhet, KTH, year2026]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 11 – säkerhet: hot och attacker, kryptografins roller, symmetrisk, asymmetrisk och hybridkryptering, digitala signaturer, certifikat och TLS."
---
# HI1031 Begrepp - Kap 11 Säkerhet

## 1. Hot och attacker

Varför behöver ett distribuerat system säkerhet alls?::Behovet kommer ur ==önskan att dela resurser==. Resurser som inte delas kan i regel skyddas genom att ==isoleras från extern åtkomst==.
<!--SR:!fsrs,2026-09-28T07:47:24.997Z,3,3.12316787,6.79877821,2,3,0,0,2026-09-25T07:47:24.997Z-->

Vad är skillnaden mellan en säkerhetspolicy och en säkerhetsmekanism?::==Policyn== säger vad som får delas och av vem; ==mekanismen== genomdriver den. Utan skillnaden går det ==inte att avgöra om ett system är säkert==.
<!--SR:!fsrs,2026-09-27T20:23:36.948Z,1,0.15587375,9.91919168,2,8,1,0,2026-09-26T20:23:36.948Z-->

Vilka tre breda klasser delar boken säkerhetshoten i? (3)
||
- **Läckage** – obehöriga får tag på information.
- **Manipulation** – obehörig ändring av information.
- **Vandalisering** – störa systemets funktion ==utan vinst för angriparen==.
<!--SR:!fsrs,2026-09-26T10:24:48.509Z,1,0.11603893,9.72735891,2,6,1,0,2026-09-25T10:24:48.509Z-->

Vilka fem attackmetoder räknar boken upp, klassade efter hur en kanal missbrukas? (5)
||
- **Avlyssning** – skaffa kopior av meddelanden utan behörighet.
- **Maskering** – skicka eller ta emot meddelanden under någon annans identitet.
- **Meddelandemanipulation** – fånga upp och ändra innehållet innan det skickas vidare.
- **Uppspelning** – lagra uppfångade meddelanden och skicka dem senare.
- **Överbelastning** – dränka en kanal eller resurs så andra inte kommer åt den.
<!--SR:!fsrs,2026-09-29T20:12:22.779Z,3,1.46144332,8.99883073,2,6,1,0,2026-09-26T20:12:22.779Z-->

Vad är en man-in-the-middle-attack?::En form av meddelandemanipulation där angriparen fångar ==allra första meddelandet i ett nyckelutbyte== och byter ut nycklarna mot sina egna. Sedan dekrypterar han allt, krypterar om det med rätt nyckel och skickar vidare.
<!--SR:!fsrs,2026-09-28T07:41:34.001Z,3,3.32831276,8.37949113,2,4,0,0,2026-09-25T07:41:34.001Z-->

Varför fungerar en uppspelningsattack även mot krypterade meddelanden?::Angriparen ==behöver ingen nyckel== – det räcker att ==kopiera bitmönstret== och skicka det igen. En betalningsbegäran kan då utföras två gånger.
<!--SR:!fsrs,2026-09-30T07:50:26.909Z,5,4.91188895,5.19004872,2,3,0,0,2026-09-25T07:50:26.909Z-->

## 2. Kryptografins roller

Vilka tre huvudroller har kryptografi enligt boken? (3)
||
- **Sekretess och integritet**
- **Autentisering**
- **Digitala signaturer**
<!--SR:!fsrs,2026-09-27T07:35:22.576Z,2,0.58578604,9.42783916,2,5,0,0,2026-09-25T07:35:22.576Z-->

Vad är en kryptografisk nyckel?::En ==parameter till krypteringsalgoritmen==, vald så att ==krypteringen inte kan vändas utan att man känner nyckeln==.
<!--SR:!fsrs,2026-09-27T07:33:37.097Z,2,0.19569001,9.88568673,2,7,0,0,2026-09-25T07:33:37.097Z-->

Vilket villkor sätter boken för att kryptering ska bevara integriteten?::Att ==redundant information, till exempel en checksumma, läggs in och kontrolleras==. Integritet får man alltså inte gratis av att kryptera.
<!--SR:!fsrs,2026-09-28T20:18:43.007Z,2,1.64362148,9.26707788,2,5,0,0,2026-09-26T20:18:43.007Z-->

Hur ger kryptering autentisering?::Lyckas dekrypteringen och innehållet har ett förväntat värde, hade avsändaren ==motsvarande krypteringsnyckel==. Är nyckeln ==bara känd av två parter== följer avsändarens identitet.
<!--SR:!fsrs,2026-09-26T06:25:10.927Z,3,3.34870974,5.20002037,2,2,0,0,2026-09-23T06:25:10.927Z-->

**Oförnekbarhet** (non-repudiation);;Kravet att en part ==inte kan förneka att han deltog i en transaktion==. Mekanismen är den digitala signaturen, som intygar för en ==tredje part== att något är en oförändrad kopia av det signeraren producerat.
<!--SR:!fsrs,2026-10-04T20:20:34.398Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:20:34.398Z!fsrs,2026-10-04T20:12:34.234Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:12:34.234Z-->

Vilket konkret problem använder boken för att motivera oförnekbarhet?::==Fantomuttag== i en bankomat. Bästa svaret banken kan ge är en transaktion som är ==digitalt signerad av kontohavaren== på ett sätt en tredje part inte kan förfalska.
<!--SR:!fsrs,2026-09-29T20:11:16.683Z,3,1.89865998,9.24167345,2,6,1,0,2026-09-26T20:11:16.683Z-->

Vilka två problem löser en delad hemlig nyckel inte? (2)
||
- **Nyckeldistribution** – hur skickas den delade nyckeln säkert i första läget?
- **Uppspelning** – hur vet mottagaren att meddelandet inte är en kopia av ett tidigare?
<!--SR:!fsrs,2026-09-27T17:32:57.256Z,2,0.95972676,9.60045057,2,6,0,0,2026-09-25T17:32:57.256Z-->

**Sessionsnyckel**;;En hemlig nyckel som delas ut för ==en följd av interaktioner== mellan två parter.
<!--SR:!fsrs,2026-09-26T10:27:37.699Z,1,0.39605237,9.44267659,2,5,1,0,2026-09-25T10:27:37.699Z!fsrs,2026-09-26T06:50:46.138Z,3,3.34870974,5.20002037,2,2,0,0,2026-09-23T06:50:46.138Z-->

## 3. Symmetrisk, asymmetrisk och hybridkryptering

Vad skiljer symmetrisk från asymmetrisk kryptering?
||
- **Symmetrisk** (secret-key): ==samma nyckel== krypterar och dekrypterar.
- **Asymmetrisk** (public-key): ett ==nyckelpar==, där nycklarna för kryptering och dekryptering är ==olika==.
<!--SR:!fsrs,2026-10-04T20:13:38.730Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:38.730Z-->

Vad är en envägsfunktion, och varför behövs den?::En funktion som är ==lätt att beräkna framåt== men vars invers är ==så svår att den inte är genomförbar==. Det är den egenskapen som skyddar klartexten.
<!--SR:!fsrs,2026-10-04T20:27:58.890Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:27:58.890Z-->

Vad är en fälldörrsfunktion, och vad används den till?::En envägsfunktion ==med en hemlig utgång== – omöjlig att vända ==om man inte känner hemligheten==. Den är grunden för ==alla publik-nyckelsystem==.
<!--SR:!fsrs,2026-09-26T10:27:56.411Z,1,0.13475465,9.44267659,2,5,1,0,2026-09-25T10:27:56.411Z-->

Vad avgör styrkan hos en symmetrisk algoritm?::==Nyckellängden==, eftersom den effektivaste allmänna attacken är ==uttömmande sökning== genom alla nyckelvärden. Tiden att knäcka nyckeln växer ==exponentiellt med antalet bitar==.
<!--SR:!fsrs,2026-09-26T07:02:55.568Z,3,3.34870974,5.20002037,2,2,0,0,2026-09-23T07:02:55.568Z-->

Hur uppstår ett asymmetriskt nyckelpar?::Ur en ==gemensam rot==, med en härledning som själv är en envägsfunktion. För RSA är roten ==två mycket stora primtal==: att multiplicera dem tar sekunder, men att ==faktorisera produkten== är ogenomförbart.
<!--SR:!fsrs,2026-09-26T07:49:52.142Z,1,0.41133081,7.86059937,2,4,1,0,2026-09-25T07:49:52.142Z-->

Varför är asymmetriska nycklar så mycket längre än symmetriska?::För att produkten *N* ==inte ska gå att faktorisera==. Följden är att risken för uttömmande sökning är ==liten== – motståndskraften bygger på faktoriseringen i stället. Rekommendationen är ==minst 768 bitar==, och 512 är klart otillräckligt.
<!--SR:!fsrs,2026-09-26T10:25:02.365Z,1,0.21607437,9.26065651,2,5,1,0,2026-09-25T10:25:02.365Z-->

Hur mycket dyrare är asymmetrisk kryptering?::Den kräver ==typiskt 100 till 1000 gånger så mycket processorkraft== som symmetrisk. Boken tillägger att bekvämligheten ibland ==väger över nackdelen==.
<!--SR:!fsrs,2026-10-01T10:43:00.448Z,7,7.49448566,3.58131923,2,3,0,0,2026-09-24T10:43:00.448Z-->

Hur fungerar hybridkryptering, och när används respektive typ?::==Asymmetrisk== kryptering autentiserar parterna och ==krypterar ett utbyte av hemliga nycklar==; sedan sköter ==symmetrisk== kryptering all vidare kommunikation. Alltså ==symmetriskt för bulkdata== och ==asymmetriskt bara i de inledande stegen==, för nyckelutbyte och signering. Boken säger rakt ut att asymmetriska algoritmer ==sällan används för att kryptera data==. TLS är bokens exempel.
<!--SR:!fsrs,2026-10-04T20:19:54.078Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:19:54.078Z-->

Vad betyder algoritmernas prestanda i praktiken för https?::==Minimalt.== Webbsidor är sällan större än ==100 kilobyte==, så en sida krypteras med vilken symmetrisk algoritm som helst på ==några millisekunder==. RSA med 1024 bitar tar ==cirka 4,75 ms att signera== och ==0,18 ms att verifiera==.
<!--SR:!fsrs,2026-09-26T07:06:50.599Z,3,3.34870974,5.20002037,2,2,0,0,2026-09-23T07:06:50.599Z-->

## 3.1 Hur nyckelpar ger autenticitet

Vilken egenskap hos ett nyckelpar gör att det kan ge autenticitet?::Att de två funktionerna är ==varandras inverser==. För RSA är det bevisat att de kan köras i ==vilken ordning som helst== och ge tillbaka originalvärdet.
<!--SR:!fsrs,2026-09-27T10:33:53.854Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-24T10:33:53.854Z-->

Vad händer om man krypterar med den privata nyckeln i stället för den publika?::Då kan ==vem som helst dekryptera med den publika==. Det ger ==ingen sekretess==, men bevisar att ==bara innehavaren av den privata nyckeln kunde ha producerat det==. I praktiken signeras ==en sammanfattning==, inte hela meddelandet.
<!--SR:!fsrs,2026-09-27T10:36:44.620Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-24T10:36:44.620Z-->

Vilket förbehåll måste uppfyllas för att en signatur ska bevisa något?::Verifieraren måste vara säker på att den publika nyckeln ==verkligen tillhör den som påstås ha signerat==. Därför certifikat, ==signerade av en välkänd myndighet==.
<!--SR:!fsrs,2026-09-28T20:18:11.776Z,2,2.01687629,9.49868051,2,6,0,0,2026-09-26T20:18:11.776Z-->

## 4. Digitala signaturer

Vad är en digital signatur, i grunden?::Ett sätt att ==oåterkalleligt binda signerarens identitet till hela bitföljden== i ett dokument. Den bygger på ==en hemlighet bara signeraren har== – för handskrivna signaturer är hemligheten handstilsmönstret.
<!--SR:!fsrs,2026-09-27T19:52:12.098Z,3,2.49363211,8.37949113,2,4,0,0,2026-09-24T19:52:12.098Z-->

Vilka tre egenskaper ska en signatur ge? (3)
||
- **Autentisk** – signeraren signerade medvetet, och ==ingen annan har ändrat== dokumentet.
- **Oförfalskbar** – bara signeraren kunde ha gjort den, och den ==kan inte kopieras till ett annat dokument==.
- **Oförnekbar** – signeraren kan ==inte trovärdigt förneka== att han signerat.
<!--SR:!fsrs,2026-09-27T10:50:30.200Z,3,2.49363211,8.37949113,2,4,0,0,2026-09-24T10:50:30.200Z-->

Hur genereras och kontrolleras en digital signatur? (4 steg)
||
1. Avsändaren ==publicerar sin publika nyckel==.
2. Han räknar ut ==sammanfattningen H(M)== och ==krypterar den med sin privata nyckel== – det är signaturen.
3. Han skickar ==meddelandet plus signaturen==.
4. Mottagaren ==dekrypterar signaturen med den publika nyckeln==, räknar ==själv ut H(M)==, och jämför. ==Lika = giltig.==
<!--SR:!fsrs,2026-09-27T20:27:33.418Z,1,0.04575401,9.95716975,2,9,1,0,2026-09-26T20:27:33.418Z-->

Varför används signerarens *privata* nyckel, när sekretess använder mottagarens publika?::För att en signatur måste ==skapas med en hemlighet bara signeraren känner==, men vara ==åtkomlig för alla att verifiera==. Sekretess är det omvända behovet.
<!--SR:!fsrs,2026-09-29T20:09:49.860Z,3,2.08886429,8.90450831,2,5,0,0,2026-09-26T20:09:49.860Z-->

## 4.1 Säkra sammanfattningsfunktioner

**Säker hashfunktion** (digest, H(M));;En funktion som gör ett meddelande av ==godtycklig längd== till ett ==bitmönster av fast längd== som karakteriserar det, och som ==inte går att vända==.
<!--SR:!fsrs,2026-09-29T20:20:19.718Z,3,2.3375668,8.99883073,2,6,1,0,2026-09-26T20:20:19.718Z!fsrs,2026-10-04T20:09:22.548Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:09:22.548Z-->

Vilka tre egenskaper ska en säker digest-funktion ha? (3)
||
1. Givet *M* är det ==lätt att räkna ut h==.
2. Givet *h* är det ==svårt att räkna ut M==.
3. Givet *M* är det ==svårt att hitta ett annat M'== med ==samma hash==.
<!--SR:!fsrs,2026-09-26T20:21:00.251Z,0,0.73673908,8.40750771,3,3,1,0,2026-09-26T20:11:00.251Z-->

Hur långt måste ett hashvärde vara, och varför?::==Minst 128 bitar.== Vid 64 bitar räcker i snitt ==2^32 varianter== av två dokument för att hitta två med samma hash, vilket boken kallar ==för litet för att vara bekvämt==.
<!--SR:!fsrs,2026-09-26T06:50:41.618Z,3,3.34870974,5.20002037,2,2,0,0,2026-09-23T06:50:41.618Z-->

## 5.1 TLS, SSL och HTTPS

Vad är skillnaden mellan SSL, TLS och HTTPS?::==SSL== kom från Netscape; en ==utökad version av SSL== blev internetstandard under namnet ==TLS==. ==HTTPS är inget eget protokoll== – prefixet `https:` i en URL ==startar upprättandet av en TLS-kanal== mellan webbläsare och webbserver.
<!--SR:!fsrs,2026-10-04T20:13:55.994Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:55.994Z-->

Vilka två lager består TLS av? (2)
||
- **Record-protokollet** – själva ==säkra kanalen==, som ger ==sekretess, integritet och autenticitet== genom vilket förbindelseorienterat protokoll som helst.
- **Handskakningslagret** – ==etablerar och underhåller sessionen==.
<!--SR:!fsrs,2026-09-26T10:36:59.259Z,2,0.49007445,9.42783916,2,5,0,0,2026-09-24T10:36:59.259Z-->

Hur går TLS-handskakningen till? (4 steg)
||
1. **ClientHello / ServerHello** – etablerar version, sessions-id, ==cipher suite== och komprimering, och utbyter slumpvärden. Servern ==erbjuder en lista==, klienten ==väljer en==.
2. **Certifikat, valfritt** – parterna autentiserar varandra med ==signerade X.509-certifikat==.
3. **Pre-master secret** – en part skickar den ==krypterad med den publika nyckeln==; båda räknar fram ==sessionsnycklar och MAC-hemligheter==.
4. **ChangeCipherSpec och Finished** – därefter är ==all trafik krypterad och signerad==.
<!--SR:!fsrs,2026-09-25T18:38:12.794Z,0,0.0021016,9.97013439,3,11,1,0,2026-09-25T18:23:12.794Z-->

Var i handskakningen byter TLS från klartext till kryptering?::Handskakningen ==börjar i klartext==, går sedan över till ==publik nyckel==, och till sist till ==hemlig nyckel== när den delade nyckeln finns. ==Varje övergång är valfri och föregås av en förhandling.==
<!--SR:!fsrs,2026-09-26T10:52:57.696Z,2,0.52419145,9.42783916,2,5,0,0,2026-09-24T10:52:57.696Z-->

Vad innehåller en cipher suite? (3)
||
- **Nyckelutbytesmetod** – hur sessionsnyckeln utbyts. Exempel: ==RSA med publik-nyckelcertifikat==.
- **Chiffer för dataöverföring** – block- eller strömchiffer för datan. Exempel: ==IDEA==.
- **Digest-funktion** – för att skapa ==MAC:ar==. Exempel: ==SHA-1==.
<!--SR:!fsrs,2026-09-26T20:21:10.734Z,0,0.001,9.97799571,1,22,0,0,2026-09-26T20:20:10.734Z-->

Vad händer om klient och server inte har några algoritmer gemensamt?::==Anslutningsförsöket misslyckas.== Algoritmerna ==förhandlas== under handskakningen, eftersom man i ett öppet nät inte kan anta att alla har samma programvara.
<!--SR:!fsrs,2026-09-30T07:44:53.065Z,5,4.91188895,5.19004872,2,3,0,0,2026-09-25T07:44:53.065Z-->

## 5.2 Certifikat

**Certifikat** (digitalt);;Ett ==dokument som innehåller ett påstående, oftast kort, signerat av en principal==. Det behöver inte handla om nycklar – kan intyga ==många typer av påståenden==.
<!--SR:!fsrs,2026-09-26T17:31:42.273Z,1,0.80996206,8.91930885,2,5,1,0,2026-09-25T17:31:42.273Z!fsrs,2026-09-30T07:48:57.922Z,5,4.91188895,5.19004872,2,3,0,0,2026-09-25T07:48:57.922Z-->

Vad innehåller ett X.509-certifikat? (4 fält)
||
- **Subject** – ==Distinguished Name och publik nyckel==.
- **Issuer** – ==Distinguished Name och signatur==.
- **Period of validity** – ==två datum==, "not before" och "not after".
- **Administrative information** – ==version och serienummer==.
<!--SR:!fsrs,2026-09-26T20:10:52.124Z,0,0.001,9.97799569,1,18,0,0,2026-09-26T20:09:52.124Z-->

**Certifikatutfärdare** (Certificate Authority, CA);;En ==välkänd organisation som utfärdar publik-nyckelcertifikat== till den som lämnar in ==godtagbara bevis på sin identitet==. Bokens exempel: ==Verisign== och ==CREN==.
<!--SR:!fsrs,2026-09-26T10:28:27.675Z,1,0.13475465,9.44267659,2,5,1,0,2026-09-25T10:28:27.675Z!fsrs,2026-09-30T07:38:21.828Z,5,4.91188895,5.19004872,2,3,0,0,2026-09-25T07:38:21.828Z-->

Hur verifieras ett X.509-certifikat? (2 steg)::1. ==Hämta utfärdarens publik-nyckelcertifikat från en pålitlig källa.== 2. ==Validera signaturen.== Kedjan måste till slut sluta i en nyckel man fått på ett sätt man har förtroende för.
<!--SR:!fsrs,2026-09-26T17:32:09.977Z,1,0.00284768,9.95522331,2,10,0,0,2026-09-25T17:32:09.977Z-->

Varför har certifikat ett utgångsdatum?::För att ==återkallning annars är i praktiken omöjlig== – kopior finns hos alla som fått certifikatet, och boken kallar det ==dyrt, om inte omöjligt== att spåra upp dem alla. Med utgångsdatum ==avvisas det automatiskt== och innehavaren får begära förnyelse.
<!--SR:!fsrs,2026-10-04T20:13:19.058Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:19.058Z-->
