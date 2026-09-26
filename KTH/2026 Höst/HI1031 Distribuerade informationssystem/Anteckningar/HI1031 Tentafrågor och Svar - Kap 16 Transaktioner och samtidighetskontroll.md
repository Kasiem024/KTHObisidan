---
tags: [tenta, HI1031, databaser, programmering, KTH, year2026]
description: "Svar på tentafrågorna för HI1031 kapitel 16: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
created: 2026-09-10
updated: 2026-09-10
---
# HI1031 Tentafrågor och Svar - Kap 16 Transaktioner och samtidighetskontroll

## 1. Vad gör man åt deadlocks?

Bokens avsnitt: §16.4 och §16.4.1

**Grundbegreppen, en gång för hela kapitlet.** En ==transaktion== är en följd av operationer som utförs
som ==en enda odelbar enhet==: antingen genomförs alla, eller så blir det som om ingen skedde. Att
==commit:a== betyder att avsluta den så att ==alla ändringar sparas permanent== och blir synliga för
andra. Att ==abort:a== betyder att avsluta den så att ==ingen av dess effekter syns== för framtida
transaktioner. De ==objekt== transaktionerna arbetar på är serverns data — i bokens exempel bankkonton
med ett saldo var. ==Isolering== är kravet att en transaktions ==mellanresultat inte får synas== för
andra transaktioner. Ett ==atomärt steg== är ett steg som inte kan avbrytas halvvägs.

**Först: varför deadlocks alls uppstår.** Låsning är bokens sätt att få ==serialiserbarhet== genom att
==serialisera åtkomsten till objekten==. Servern låser varje objekt strax innan en operation i en
transaktion ska använda det. Ber en annan klient om ett objekt som redan är låst blir ==begäran
uppskjuten== och klienten får vänta tills objektet låses upp. Boken säger rakt ut: ==användningen av lås
kan leda till deadlock==. Det är alltså låsningen som är källan — de två andra metoderna i kapitlet får
inga deadlocks.

**Tvåfaslåsning (2PL).** För att alla par av konfliktande operationer ska utföras i samma ordning får en
transaktion ==inte ta några nya lås efter att den har släppt ett lås==. Första fasen är en ==växande fas==
där lås skaffas, andra fasen en ==krympande fas== där lås släpps. Det är därför den heter tvåfaslåsning.

**Strikt tvåfaslåsning.** Eftersom transaktioner kan abort:a behövs strikta körningar (se fråga 2). För
att genomföra det ==hålls alla lås som tagits under transaktionens gång till den commit:ar eller
abort:ar==. Låsen hindrar då andra transaktioner från att läsa eller skriva objekten. När en transaktion
commit:ar måste låsen dessutom hållas ==till alla objekt den uppdaterat har skrivits till permanent
lagring==, för att det ska gå att återhämta sig.

**Två låstyper, inte en.** Ett enkelt exklusivt lås för både läsning och skrivning ==minskar
samtidigheten mer än nödvändigt==, eftersom två läsningar inte krockar. Boken föredrar därför ==många
läsare, en skrivare==: ett ==läslås== före varje läsning, ett ==skrivlås== före varje skrivning.
Läslåsen delas och kallas därför ibland ==delade lås==. Viktigt för jämförelsen med de andra metoderna:
==går det inte att sätta låset direkt får transaktionen vänta — en klients begäran avslås aldrig==.

**Vad en deadlock är.** Bokens definition: ==ett tillstånd där varje medlem i en grupp transaktioner
väntar på att någon annan medlem ska släppa ett lås==. Bokens exempel: T gör `a.deposit(100)` och tar
skrivlås på A, U gör `b.deposit(200)` och tar skrivlås på B. Sedan vill T åt B och U åt A. ==Båda
väntar, och var och en är beroende av att den andra släpper ett lås.==

**När det är särskilt vanligt.** Deadlock är ==särskilt vanligt när klienten kör ett interaktivt
program==, eftersom en transaktion då kan pågå ==länge==. Många objekt blir låsta och förblir så, vilket
hindrar andra klienter.

**Väntegrafen (wait-for graph).** Noder är ==transaktioner==, bågar är ==väntar-på-relationer== — det
går en båge från T till U när ==T väntar på att U ska släppa ett lås==. Finns en ==cykel== väntar varje
transaktion på nästa, alla är blockerade och ==inget av låsen kan någonsin släppas==. ==Abort:as en av
transaktionerna i cykeln släpps dess lås och cykeln bryts.==

### Tre saker man kan göra

**1. Förebygga (deadlock prevention).** Ett sätt är att ==låsa alla objekt transaktionen ska använda
redan när den startar==, och det måste göras ==som ett enda atomärt steg== så att man inte får en
deadlock redan där. En sådan transaktion kan inte hamna i deadlock. Boken kallar metoden ändå
==skenbart enkel men inte särskilt bra==, av två skäl: den ==begränsar åtkomsten till delade resurser i
onödan==, och det är ==ibland omöjligt att förutse vid start vilka objekt som ska användas==. Det
senare gäller ==i regel== interaktiva tillämpningar — användaren skulle behöva säga i förväg exakt
vilka objekt hen tänkte använda, vilket boken kallar ==otänkbart== i program där man letar sig fram.
Ett andra sätt är att ==begära lås i en förbestämd ordning==, men det kan ge ==för tidig låsning och
minskad samtidighet==.

**2. Upptäcka (deadlock detection).** Deadlocks ==kan== upptäckas genom att ==leta cykler i
väntegrafen==. Har man hittat en måste ==en transaktion väljas ut för abort== för att bryta cykeln.
Koden kan ligga ==i låshanteraren==, som måste hålla en bild av väntegrafen och ==kontrollera den för
cykler med jämna mellanrum== — antingen varje gång en båge läggs till, eller mer sällan för att slippa
onödig overhead.

**Att välja offer är inte trivialt.** Boken säger uttryckligen att ==valet av vilken transaktion som
ska abort:as inte är enkelt==. Två faktorer ==kan== vägas in: ==transaktionens ålder== och ==hur många
cykler den är inblandad i==.

**3. Timeout på låsen.** Detta är ==en metod som används ofta== i praktiken. Varje lås får ==en
begränsad period då det är osårbart==. Efter den tiden blir låset ==sårbart==. Är det ==ingen annan som
konkurrerar== om objektet ==förblir det låst== ändå. Men väntar någon annan transaktion på objektet
==bryts låset==, alltså objektet låses upp, och den väntande transaktionen fortsätter. Transaktionen
vars lås bröts ==abort:as normalt==.

**Timeoutens problem, och de är flera.** Boken listar dem: det ==värsta== är att transaktioner
==ibland abort:as bara för att deras lås blev sårbara medan andra väntade, utan att det fanns någon
deadlock alls==. I ett ==överlastat system== ökar antalet timeouts, och ==transaktioner som tar lång
tid kan bli straffade==. Dessutom är det ==svårt att bestämma en lämplig timeout-längd==. Boken
kontrasterar: med deadlockdetektering abort:as transaktioner ==för att en deadlock faktiskt har
inträffat==, och då ==kan man välja== vilken som ska ryka.

**Så kan du tänka.** De tre svaren skiljer sig i ==när== man betalar. Förebyggande betalar i förväg, med
sämre samtidighet för alla, även när ingen deadlock skulle uppstått. Detektering betalar löpande, med
overhead för att underhålla och söka i grafen, men abort:ar bara när det behövs. Timeout betalar i
==felaktiga abort:er==, för den gissar. Det är därför boken ställer just timeout mot detektering: båda
löser problemet efteråt, men bara detektering vet att det finns ett problem.

### Muntligt svar

1. En deadlock är ett tillstånd där varje transaktion i en grupp väntar på att någon annan i
   gruppen ska släppa ett lås. Den uppstår bara när man använder låsning.
2. Verktyget för att se den är väntegrafen. Noder är transaktioner, bågar betyder "väntar på",
   och en deadlock är en cykel i grafen.
3. Det finns tre svar på problemet: förebygga, upptäcka, eller använda timeout.
4. Förebygga betyder att låsa allt i förväg eller att låsa i en bestämd ordning. Boken kallar
   det enkelt men inte särskilt bra, för det stryper samtidigheten.
5. Upptäcka betyder att leta cykler i väntegrafen och abort:a en transaktion i cykeln. Vilken
   man väljer är ingen enkel fråga.
6. Timeout är det vanligaste i praktiken, men värsta problemet är att transaktioner abort:as
   utan att det ens fanns någon deadlock.

## 2. Är dirty reads ett problem? Hur kommer man åt det?

Bokens avsnitt: §16.2.2, plus §16.4 för hur låsning genomför det

**Ja, det är ett problem — och boken ägnar ett eget avsnitt åt det.** Servern måste spara ==alla
effekter av commit:ade transaktioner och inga effekter av abort:ade==. Alltså måste den räkna med att en
transaktion kan abort:a, och hindra att den då påverkar andra samtidiga transaktioner. Det ger
==två== problem: ==dirty reads== och ==för tidiga skrivningar== (premature writes).

**Det viktigaste att förstå först.** Båda problemen ==kan uppstå även i körningar som är
serialiserbara==. Serialiserbarhet skyddar alltså ==inte== mot dem. Problemet är inte flätningen av
operationer, utan ==att transaktioner kan abort:a==.

**Vad en dirty read är.** Isoleringsegenskapen kräver att transaktioner ==inte ser andra transaktioners
o-commit:ade tillstånd==. En dirty read ==händer när en transaktion läser något en annan just har skrivit
men inte commit:at==.

**Bokens exempel.** T läser saldot på konto A (100) och sätter det 10 mer, alltså 110. Sedan läser U
saldot (110) och sätter det 20 mer, alltså 130. ==Körningen är serialiserbar.== Nu abort:ar T efter att
U har commit:at. Då har U ==sett ett värde som aldrig existerat==, eftersom A återställs till sitt
ursprungliga värde. Det är en dirty read. Och det avgörande: ==eftersom U har commit:at kan det inte
göras ogjort==.

### Hur man kommer åt det — tre villkor som blir allt starkare

**1. Återhämtningsbarhet (recoverability).** Har en transaktion commit:at efter att ha sett effekterna
av en transaktion som sedan abort:ade är läget ==inte återhämtningsbart==. Strategin är därför att
==skjuta upp commit tills efter att varje annan transaktion vars o-commit:ade tillstånd man har sett
själv har commit:at==. I exemplet skjuter U upp sin commit tills T commit:at. ==Abort:ar T måste U
abort:a också.==

**2. Undvik kaskadabort:er (cascading aborts).** Om U måste abort:a, och andra transaktioner har sett
U:s effekter, ==måste de abort:a också==, vilket kan tvinga ytterligare transaktioner att abort:a. För
att slippa det tillåts transaktioner ==bara läsa objekt som skrivits av commit:ade transaktioner==. För
att säkra det måste ==varje läsoperation skjutas upp tills andra transaktioner som skrivit samma objekt
har commit:at eller abort:at==. Boken påpekar att detta är ett ==starkare villkor än
återhämtningsbarhet==.

**3. Strikta körningar (strict executions).** ==I regel== krävs att transaktioner skjuter upp ==både==
sina läs- och skrivoperationer, så att man slipper både dirty reads och för tidiga skrivningar. En
körning kallas ==strikt== om tjänsten skjuter upp ==både läsning och skrivning på ett objekt tills alla
transaktioner som tidigare skrivit det objektet har commit:at eller abort:at==. Boken säger att ==den
strikta körningen är det som ger den önskade egenskapen isolering==.

**Det andra problemet, för tidiga skrivningar.** Det handlar om ==samspelet mellan skrivoperationer på
samma objekt i olika transaktioner==, och slutsatsen är densamma: ==skrivoperationer måste skjutas upp
tills tidigare transaktioner som uppdaterat samma objekt har commit:at eller abort:at==.

**Hur det byggs: tentativa versioner.** För att en servers uppdateringar ska kunna ==tas bort om en
transaktion abort:ar== görs alla uppdateringar i ==tentativa versioner av objekten i flyktigt minne==.
Varje transaktion får ==sin egen privata uppsättning== tentativa versioner av de objekt den ändrat.
Läsoperationer i transaktionen tar värden ==ur den egna uppsättningen om det går, annars ur objekten==.
De tentativa versionerna flyttas över till objekten ==först när transaktionen commit:ar==, då de också
har skrivits till permanent lagring. Det görs ==i ett enda steg==, och under det ==stängs andra
transaktioner ute== från de objekt som ändras. ==Abort:ar transaktionen raderas dess tentativa
versioner.==

### Vad de tre metoderna gör åt det

- **Strikt tvåfaslåsning** ==håller alla lås till commit eller abort== (se fråga 1), så ingen annan kan
  läsa eller skriva objektet under tiden.
- **Optimistisk kontroll** kan ==inte få dirty reads alls==, eftersom all läsning sker på ==commit:ade
  versioner==.
- **Tidsstämpelordning** låter en läsning som kommer ==för tidigt vänta== på den tidigare transaktionen.
  Boken säger att ==den regeln hindrar dirty reads==.

**Så kan du tänka.** De tre villkoren är samma verktyg använt på tre platser: ==skjut upp något tills
osäkerheten är borta==. Återhämtningsbarhet skjuter upp ==commit==, kaskadskyddet skjuter upp
==läsningar==, strikthet skjuter upp ==både läsningar och skrivningar==. Ju tidigare i kedjan man
skjuter upp, desto mer samtidighet betalar man — men desto mindre kan gå fel. Att ==strikt== 2PL heter
"strikt" är exakt detta: det är låsningens sätt att köpa den starkaste av de tre nivåerna.

### Muntligt svar

1. Ja. En dirty read är när en transaktion läser ett värde som en annan har skrivit men inte
   commit:at än. Om skrivaren abort:ar sen har läsaren sett ett värde som aldrig funnits.
2. Det som gör det allvarligt är att det inte går att laga i efterhand. Har läsaren redan
   commit:at kan det inte ångras.
3. Serialiserbarhet räcker inte som skydd. Boken visar att en dirty read uppstår även i en
   körning som är serialiserbar, för problemet är abort:erna och inte flätningen.
4. Botemedlet kommer i tre steg som blir allt starkare: skjut upp commit, läs bara commit:ade
   värden, och skjut upp både läsningar och skrivningar.
5. Det sista kallas en strikt körning, och det är den som ger isoleringen.
6. I praktiken görs det med strikt tvåfaslåsning och tentativa versioner. Både optimistisk
   kontroll och tidsstämpelordning slipper dirty reads redan genom sin konstruktion.

## 3. Vad är optimistisk approach (optimistic concurrency control) och varför kan det vara att föredra? Vad är nackdelen?

Bokens avsnitt: §16.5, plus §16.7 för de moderna exemplen

### Varför den kan vara att föredra — bokens tre nackdelar med låsning

1. **Låsunderhåll är en overhead** som inte finns i system som inte stöder samtidig åtkomst. ==Även
   rena läsningar== (frågor), som ==inte kan påverka datans integritet==, måste ==i regel== använda lås
   för att garantera att datan inte ändras under läsningen. Men — och det är poängen — ==låsning kan
   behövas bara i värsta fallet==. Bokens räkneexempel: två klienter som samtidigt räknar upp värdena
   på *n* objekt i två orelaterade ordningar, med en egen transaktion per objekt, krockar i genomsnitt
   med chansen ==1 på n==. Alltså behövs låsning ==bara en gång per n transaktioner==.
2. **Lås kan ge deadlock.** Att förebygga deadlock ==minskar samtidigheten kraftigt==, så deadlocks
   måste lösas med timeout eller detektering, och boken skriver att ==ingen av dem är helt
   tillfredsställande för interaktiva program==.
3. **Låsen kan inte släppas förrän transaktionen är slut**, eftersom kaskadabort:er ska undvikas. Det
   ==kan minska möjligheten till samtidighet betydligt==.

**Därför "optimistisk".** Metoden bygger på iakttagelsen att ==sannolikheten att två klienters
transaktioner rör samma objekt är låg i de flesta tillämpningar==. Transaktioner får därför köra
==som om det inte fanns någon möjlighet till konflikt== ända till klienten är klar och skickar
`closeTransaction`. Uppstår en konflikt ==abort:as i regel någon transaktion== och måste ==startas om av
klienten==.

### De tre faserna

**Arbetsfasen.** Varje transaktion har en ==tentativ version== av varje objekt den uppdaterar, och den
är ==en kopia av den senast commit:ade versionen==. Tentativa versioner är det som gör att transaktionen
kan abort:a ==utan effekt på objekten==. Läsningar utförs ==omedelbart==: finns redan en tentativ version
för transaktionen läses den, annars läses ==det senast commit:ade värdet==. Skrivningar lagras som
==tentativa värden som är osynliga för andra transaktioner==, och med flera samtidiga transaktioner kan
==flera olika tentativa värden av samma objekt finnas samtidigt==. Dessutom förs två register: en
==läsmängd== (read set) med de objekt transaktionen läst och en ==skrivmängd== (write set) med de den
skrivit. Boken noterar följden: eftersom all läsning sker på commit:ade versioner ==kan dirty reads inte
uppstå==.

**Valideringsfasen.** När `closeTransaction` kommer in valideras transaktionen för att avgöra ==om dess
operationer på objekt krockar med andra transaktioners operationer på samma objekt==. Går valideringen
igenom får den commit:a. Misslyckas den krävs någon form av konfliktlösning, och då abort:as ==antingen
den aktuella transaktionen eller, i vissa fall, de den krockar med==.

**Uppdateringsfasen.** Godkänns transaktionen görs ==alla ändringar i dess tentativa versioner
permanenta==. ==Rena läsningar kan commit:a direkt== efter godkänd validering. Skrivande transaktioner
kan commit:a ==när de tentativa versionerna har skrivits till permanent lagring==.

### Vad valideringen faktiskt jämför

Valideringen använder konfliktreglerna för läs och skriv för att säkra att transaktionen är
serialiserbar mot alla ==överlappande== transaktioner, alltså de som ==ännu inte commit:at när den här
transaktionen startade==.

De tre reglerna, för en transaktion Tv som valideras mot en överlappande Ti:

1. **Tv skriver, Ti läser:** Ti får ==inte läsa objekt som Tv har skrivit==.
2. **Tv läser, Ti skriver:** Tv får ==inte läsa objekt som Ti har skrivit==.
3. **Båda skriver:** ==ingen av dem får skriva objekt den andra skrivit==.

Boken förenklar med regeln att ==bara en transaktion åt gången får vara i validerings- och
uppdateringsfasen==, vilket ==uppfyller regel 3 automatiskt==. Tillsammans med att dirty reads inte kan
uppstå ==ger det strikta körningar==. Faserna kan genomföras som en ==kritisk sektion==, alltså ett
kodavsnitt som bara en transaktion i taget får köra.

**Två former av validering.** ==Bakåtvalidering== jämför transaktionen med ==tidigare överlappande
transaktioner==, som redan commit:at — då är ==enda utvägen att abort:a den som valideras==.
==Framåtvalidering== jämför i stället mot de transaktioner som ==fortfarande är aktiva==, och då ==har man
ett val==: skjuta upp valideringen, abort:a de konfliktande, eller abort:a den som valideras.

### Nackdelen

**Arbete måste göras om.** Bokens formulering i jämförelseavsnittet: optimistisk kontroll ger
==relativt effektiv drift när det är få konflikter==, men ==en betydande mängd arbete kan behöva göras
om när en transaktion abort:as==. Det är den raka nackdelen, och den är priset för att inte ha låsts
från början.

**Svält (starvation).** I metoder som bygger på att abort:a och starta om finns ==ingen garanti att en
given transaktion någonsin passerar valideringen==, för den kan krocka på nytt varje gång den startas
om. Att en transaktion aldrig kommer fram till commit kallas ==svält==. Boken säger att svält
==sannolikt är sällsynt==, men att en server ==måste se till att en klients transaktion inte abort:as
gång på gång==. Kung och Robinson ==föreslår== att servern upptäcker en transaktion som abort:ats flera
gånger och då ger den ==exklusiv åtkomst==, alltså låter den köra ensam en stund så att den garanterat
kommer igenom.

**Så kan du tänka.** Låsning betalar ==alltid==, i väntan och underhåll, för att aldrig behöva göra om
något. Optimistisk kontroll betalar ==aldrig i förväg==, men riskerar att göra om allt. Vilken som är
billigare avgörs helt av ==hur ofta konflikter faktiskt inträffar==, och bokens 1-på-n-räkning är
argumentet för att det ofta är sällan.

### Muntligt svar

1. Grundidén är att chansen att två transaktioner rör samma objekt är låg i de flesta
   tillämpningar. Så låt dem köra som om ingen konflikt fanns, och kontrollera först vid commit.
2. Den har tre faser: arbetsfas, valideringsfas och uppdateringsfas.
3. Skälet att föredra den är att låsning kostar även när den inte behövs. Kung och Robinson
   listar tre nackdelar med lås, och en av dem är att låsning bara behövs i värsta fallet.
4. Två saker faller bort gratis: inga deadlocks, och inga dirty reads, eftersom all läsning
   sker på commit:ade versioner.
5. Nackdelen är att arbete måste göras om när en transaktion abort:as, och att den kan svälta,
   alltså aldrig komma igenom valideringen.
6. Valideringen finns i två former, bakåt och framåt, och de skiljer sig i vilken frihet man
   har att lösa konflikten.

## 4. Varför ska man välja tidsstämpelmetoden (time-stamp ordering) snarare än tvåfaslåsning (2PL)?

Bokens avsnitt: §16.6 och §16.7

**Vad metoden gör.** Varje operation i en transaktion ==valideras när den utförs==. Kan den inte
valideras ==abort:as transaktionen omedelbart== och kan sedan startas om av klienten. Varje transaktion
får ==en unik tidsstämpel när den startar==, och den ==definierar transaktionens plats i tidsföljden==.
Alla förfrågningar kan därmed ==totalordnas efter sina tidsstämplar==.

**Grundregeln, som är kort.** En transaktions begäran att ==skriva== ett objekt är giltig ==bara om
objektet senast lästs och skrivits av tidigare transaktioner==. En begäran att ==läsa== ett objekt är
giltig ==bara om objektet senast skrivits av en tidigare transaktion==.

**Vad servern håller reda på.** Varje objekt har ==en skrivtidsstämpel==, ==en mängd tentativa
versioner== med sina egna skrivtidsstämplar, och ==en mängd lästidsstämplar==. Vid commit ==blir de
tentativa versionernas värden objektens värden==.

**Skrivregeln, och vad "för sent" betyder.** Går skrivningen igenom utförs den på en tentativ version.
Annars gäller att ==varje skrivning som kommer för sent abort:as== — för sent i den meningen att ==en
transaktion med en senare tidsstämpel redan har läst eller skrivit objektet==.

**Läsregeln, som har tre utfall.** En läsning kan ==utföras direkt== på en commit:ad version, ==få
vänta== om den valda versionen är tentativ, eller ==abort:as==. En läsning som kommer ==för tidigt
väntar== på att den tidigare transaktionen blir klar: commit:ar den läser man dess commit:ade version,
abort:ar den tar man versionen före. Boken skriver att ==denna regel hindrar dirty reads==. En läsning
som kommer ==för sent abort:as==.

**Metoden är strikt.** Boken säger uttryckligen att algoritmen ==ger strikta körningar==: läsregeln
skjuter upp läsningar till alla som tidigare skrivit objektet har commit:at eller abort:at, och att
versionerna commit:as i tidsstämpelordning gör samma sak för skrivningar. En commit ==kan alltid
genomföras==, eftersom alla operationer redan kontrollerats innan de utfördes. Samordnaren ==kan behöva
vänta== på tidigare transaktioner, men ==klienten behöver inte vänta==.

### Varför man skulle välja den framför 2PL

**1. Den kan inte hamna i deadlock.** Detta är det starkaste argumentet, och boken är rak: skrivningar
kan göras ==efter att closeTransaction returnerat, utan att klienten väntar==, och klienten behöver bara
vänta när en läsning måste vänta. ==Det kan inte leda till deadlock, eftersom transaktioner bara väntar
på tidigare transaktioner och ingen cykel därför kan uppstå i väntegrafen.== Alltså behövs varken
deadlockdetektering, timeouts eller förebyggande — hela fråga 1 försvinner.

**2. Den är bättre för lästunga transaktioner.** Bokens direkta jämförelse: ==tidsstämpelordning, och i
synnerhet flerversions-tidsstämpelordning, är bättre än strikt tvåfaslåsning för rena
läsningstransaktioner==, medan ==tvåfaslåsning är bättre när operationerna mest är uppdateringar==. Det
är svaret på frågan så som boken ger det. Observationen används också som argument för ==hybridlösningar==
där vissa transaktioner använder tidsstämplar och andra lås.

**3. Ordningen bestäms i förväg.** Båda metoderna är ==pessimistiska== och upptäcker konflikter ==när
varje objekt nås==. Skillnaden ligger i ==när serialiseringsordningen avgörs==: tidsstämpelordning
bestämmer den ==statiskt, när transaktionen startar==, tvåfaslåsning ==dynamiskt, efter i vilken ordning
objekten nås==.

**4. Vid konflikt slipper man vänta.** Boken ställer strategierna mot varandra: ==tidsstämpelordning
abort:ar transaktionen omedelbart, medan låsning låter transaktionen vänta — men med ett möjligt senare
straff i form av abort för att undvika deadlock==. Med lås kan man alltså både vänta ==och== abort:as.

**Flerversions-tidsstämpelordning tar det längre.** I den varianten hålls ==en lista av gamla commit:ade
versioner== för varje objekt, så ==läsningar som kommer för sent inte behöver avslås== — de får läsa en
gammal version. Boken sammanfattar: den ger ==avsevärd samtidighet, drabbas inte av deadlocks och
tillåter alltid läsningar==.

### Vad som talar emot, för det ska med

**Omstarter, och att praktiken går åt andra hållet.** Boken skriver att metoden ==visserligen undviker
deadlocks, men är ganska trolig att orsaka omstarter==. Och den är tydlig med att ==historiskt är låsning
den dominerande metoden== för samtidighetskontroll i distribuerade system.

**Så kan du tänka.** Frågan har ett rakt svar och ett djupare. Det raka är arbetslasten: ==läser du mest,
välj tidsstämplar; skriver du mest, välj lås.== Det djupare är att de två metoderna hanterar
==osäkerhet== olika. Låsning skjuter upp beslutet om ordningen till sista stund och betalar för det med
väntan och deadlockrisk. Tidsstämpelordning bestämmer ordningen först och betalar för det med abort:er
när verkligheten inte följer den ordning som redan bestämts. Ingen av dem är gratis — boken kröner ingen
vinnare, och det är därför frågans "varför" har ett villkorat svar och inte ett absolut.

### Muntligt svar

1. Bokens raka svar är att tidsstämpelordning är bättre för lästunga transaktioner, medan
   tvåfaslåsning är bättre när transaktionerna mest uppdaterar.
2. Båda är pessimistiska metoder. Konflikter upptäcks när varje objekt nås, inte i efterhand.
3. Den viktigaste skillnaden är när ordningen bestäms: tidsstämpelordning bestämmer den
   statiskt när transaktionen startar, tvåfaslåsning dynamiskt efter åtkomstordningen.
4. Den andra skillnaden är vad som händer vid konflikt: tidsstämpelordning abort:ar direkt,
   låsning låter transaktionen vänta men kan behöva abort:a den senare ändå.
5. Det starkaste argumentet är att metoden inte kan hamna i deadlock, för transaktioner väntar
   bara på tidigare transaktioner och då kan ingen cykel bildas.
6. Priset är omstarter, och boken säger att låsning historiskt är den dominerande metoden i
   distribuerade system.

## 5. Strict two-phase locking, Timestamp ordering och optimistisk approach är tre varianter för schemaläggning av transaktioner — beskriv och jämför dem

Bokens avsnitt: §16.2.1 för grunden (serialiserbarhet och konfliktreglerna) och §16.7 för jämförelsen

**Vad alla tre försöker uppnå.** Målet är ==serialiserbarhet== (serial equivalence). En flätning av
operationer är serialiserbar om ==den samlade effekten är densamma som om transaktionerna hade utförts
en och en i någon ordning==. Att två körningar har ==samma effekt== betyder i boken två saker:
==läsoperationerna returnerar samma värden==, och ==objektens variabler har samma värden till slut==.
Målet för en server är att ==maximera samtidigheten==, så transaktioner får köra samtidigt just när det
ger samma effekt som en seriell körning.

**Konfliktande operationer, som är själva verktyget.** Två operationer ==krockar om deras samlade effekt
beror på i vilken ordning de utförs==. Bokens regler:

| Operationer i olika transaktioner | Krockar | Skäl |
|---|---|---|
| läs och läs | Nej | effekten av två läsningar beror inte på ordningen |
| läs och skriv | Ja | effekten av en läsning och en skrivning beror på ordningen |
| skriv och skriv | Ja | effekten av två skrivningar beror på ordningen |

Ur det får boken sitt formella kriterium: för att två transaktioner ska vara serialiserbara är det
==nödvändigt och tillräckligt att alla par av konfliktande operationer utförs i samma ordning vid alla
objekt som båda använder==. Det räcker alltså inte att varje objekt för sig nås i en snygg ordning —
==ordningen måste vara densamma vid alla objekt==.

### De tre metoderna i kort form

- **Strikt tvåfaslåsning.** Servern sätter lås innan varje åtkomst. ==Växande fas== skaffar lås,
  ==krympande fas== släpper dem, och inga nya lås får tas efter det första släppta. Strikt betyder att
  ==alla lås hålls till commit eller abort==. Vid konflikt ==väntar== transaktionen, och en begäran
  ==avslås aldrig==. Låsning hindrar förlorade uppdateringar genom att en transaktion sätter ==läslås vid
  läsning och uppgraderar det till skrivlås== när den skriver samma objekt, och inkonsistenta hämtningar
  genom att ==hämtningens läslås fördröjer uppdateringen==.
- **Tidsstämpelordning.** Varje transaktion får ==en tidsstämpel vid start== som ==bestämmer ordningen i
  förväg==. Varje operation ==valideras när den utförs== mot objektets läs- och skrivtidsstämplar. Vid
  konflikt ==abort:as transaktionen direkt==, eller får ==vänta== på en tidigare transaktion.
- **Optimistisk kontroll.** Transaktionen kör ==fritt utan lås== i en arbetsfas med tentativa versioner,
  ==valideras vid closeTransaction== mot överlappande transaktioner, och ==uppdaterar== om den går
  igenom. Vid konflikt ==abort:as den och arbetet görs om==.

### Jämförelsen

Boken inleder med att ==alla tre kostar tid och plats, och att alla tre i någon mån begränsar
möjligheten till samtidighet==. Ingen av dem är gratis.

| Axel | Strikt 2PL | Tidsstämpelordning | Optimistisk |
|---|---|---|---|
| Grundhållning | pessimistisk | pessimistisk | optimistisk |
| När konflikten upptäcks | när objektet nås | när objektet nås | vid commit |
| När ordningen bestäms | dynamiskt, av åtkomstordningen | statiskt, vid start | vid valideringen |
| Vid konflikt | transaktionen väntar | abort direkt | abort och gör om |
| Deadlock möjlig | ja | nej | nej |
| Passar bäst när | mest skrivningar | mest läsningar | få konflikter |

**Bokens sammanfattande axel.** Den enda mening som binder ihop hela kapitlet: samtidighetskontroll kan
åstadkommas ==antingen genom att klienternas transaktioner väntar på varandra, eller genom att starta om
transaktioner efter att konflikter upptäckts, eller genom en kombination av de två==. Låsning är
väntandet, tidsstämplar och optimistisk kontroll är omstarterna.

### Muntligt svar

1. Alla tre försöker uppnå samma sak, serialiserbarhet, och alla tre kostar tid och plats och
   begränsar samtidigheten något.
2. Strikt tvåfaslåsning skaffar lås i en växande fas, släpper dem i en krympande, och håller
   alla lås till commit eller abort. Vid konflikt får man vänta.
3. Tidsstämpelordning ger varje transaktion en tidsstämpel vid start som bestämmer ordningen i
   förväg, och validerar varje operation när den utförs. Vid konflikt abort:as man direkt.
4. Optimistisk kontroll låter alla köra fritt och validerar vid commit. Vid konflikt abort:as
   man och får göra om arbetet.
5. Bokens sammanfattande axel är att samtidighetskontroll antingen bygger på att transaktioner
   väntar på varandra eller på att starta om dem efter en upptäckt konflikt, eller en blandning.
6. Valet styrs av arbetslasten: låsning vid mycket skrivningar, tidsstämpelordning vid lästunga
   transaktioner, optimistisk kontroll när konflikter är sällsynta. Deadlock finns bara hos
   låsning.

## Luckor och källor

**Inga luckor mot tentafrågorna.** Alla fem frågor besvaras ur boken själv. Kapitel 16 skiljer sig
därmed från kapitel 2, där MVC saknas helt i boken, och kapitel 9, där REST-principerna kräver en extern
artikel. Tentan har fem frågor och inga delfrågor, och noten har fem H2-rubriker som svarar på dem.

**Fyra stycken är märkta "Så kan du tänka"** och innehåller mina egna slutsatser, inte bokens: fråga 1,
2, 3 och 4. Fråga 5 har inget sådant stycke.

**Avsnitt som medvetet inte lästs.** §16.1 med inledningen, enkel synkronisering utan transaktioner och
felmodellen; §16.3 nästlade transaktioner; och §16.4.2 om att öka samtidigheten i låsningsscheman
(tvåversionslåsning och hierarkiska lås). ==Ingen tentafråga rör dem.== Låsningsreglerna för nästlade
transaktioner i §16.4 är också hoppade över av samma skäl. Notera att kapitel 17:s tentafråga 3 handlar
om ==platt mot hierarkisk 2PC==, vilket är en annan sak än nästlade transaktioner och hör till nästa
kapitel.

**KursPM markerar §16.7 som kursivt, men fråga 4 och 5 kräver det.** Hela jämförelsen mellan de tre
metoderna finns bara där, inklusive den mening som är det direkta svaret på fråga 4. Avsnittet är därför
läst och använt. Samma mönster som kapitel 4 fråga 6, som krävde §7.7, och kapitel 10 fråga 4, som krävde
§10.5.3.

**Figuren som inte går att kontrollera.** Regel 1 i bokens tabell över tidsstämpelordningens
konfliktregler (fråga 4) ==saknar sitt olikhetstecken både i textversionen och i PDF:en==. Därför står
regeln i noten bara i ord, ==utan att jag påstår vilket tecken boken använder==. Konfliktreglerna för läs
och skriv i fråga 5 är hämtade ur PDF:en, eftersom den kolumnen var kapad. Övriga figurer är
kontrollerade och löptexten täcker dem; detaljerna står i
`.kiro/reports/hi1031-genomgang-2026-09-10.md` och rör kontrollen av noten, inte plugget.

**Om upplägget mellan fråga 3, 4 och 5.** De tre frågorna handlar om samma tre metoder, så materialet är
medvetet fördelat i stället för upprepat: fråga 3 äger detaljerna om optimistisk kontroll, fråga 4 äger
detaljerna om tidsstämpelordning och den direkta jämförelsen mot låsning, och fråga 5 äger ==den
gemensamma grunden== plus ==jämförelsen mellan alla tre==. Låsningens mekanism står under fråga 1,
eftersom deadlocks är det den frågan handlar om, och dirty-read-skyddet under fråga 2. Läser du en
fråga och saknar en mekanism finns den alltså under en annan.

**Grundbegreppen står först under fråga 1.** Boken definierar transaktion, commit, abort och isolering i
§16.2, som ingen tentafråga direkt handlar om, men utan dem går ingen av de fem frågorna att besvara.
De är därför samlade i ett stycke i början av fråga 1 i stället för att antas kända.
