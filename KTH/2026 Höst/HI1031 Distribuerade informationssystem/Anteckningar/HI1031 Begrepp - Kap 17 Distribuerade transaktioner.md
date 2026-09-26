---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-10
description: "Flashcards HI1031 kap 17 – de fyra tentafrågorna: extra problem med distribuerade transaktioner, tvåfas-commit, hierarkisk kontra flat 2PC, och recovery efter nod- eller nätverksfel."
---
# HI1031 Begrepp - Kap 17 Distribuerade transaktioner

## 1. Extra problem med distribuerade transaktioner

**Distribuerad transaktion**;;En transaktion som kommer åt ==objekt som hanteras av flera olika servrar==.

Vad kräver atomiciteten när en distribuerad transaktion tar slut?::Att ==antingen commit:ar alla inblandade servrar, eller abort:ar alla==. För att nå det tar en av servrarna rollen som ==koordinator==.

Vad skiljer en platt från en nästlad distribuerad transaktion?
||
- **Platt:** klienten avslutar ==varje förfrågan innan nästa==, så servrarna nås ==sekventiellt==. Med låsning kan den bara vänta på ==ett objekt i taget==
- **Nästlad:** transaktionen delas i ==subtransaktioner== som kan köra ==samtidigt==, och på olika servrar ==parallellt==

Hur får koordinatorn reda på vilka servrar som deltar?::Varje server som hanterar ett berört objekt anropar ==`join`== hos koordinatorn. När klienten anropar `closeTransaction` har koordinatorn därför ==referenser till alla deltagare==.

Hur görs identifierare globalt unika i en distribuerad transaktion?::Ett ==TID== byggs av ==serverns egen identifierare, till exempel en IP-adress, plus ett nummer som är unikt inom servern==. En ==tidsstämpel== är ett par ==lokal tidsstämpel plus server-id==.

Vad menas med global serialiserbarhet?::Att det inte räcker att varje server serialiserar sina egna objekt — ligger T före U i en konflikt på ==en== server måste de ligga i ==samma ordning på alla servrar== som båda kommer åt i konflikt.

**Distribuerad deadlock**;;En cykel i den ==globala väntegrafen som inte finns i någon enda lokal graf==, och som därför ingen server kan upptäcka på egen hand.

## 2. Tvåfas-commit (2PC)

Varför duger inte ett enfas commit-protokoll?::Därför att det ==inte låter en server fatta ett eget beslut att abort:a== när klienten ber om commit. En server kan behöva det – deadlock, misslyckad validering, eller att den kraschat och ersatts.

Vad händer i fas 1, röstningsfasen? (2)
||
- Koordinatorn skickar ==`canCommit?`== till varje deltagare
- Deltagaren svarar ==Yes eller No==. Innan Yes ==sparar den sina ändrade objekt i permanent lagring==; röstar den No ==abort:ar den omedelbart==

Vad händer i fas 2, genomförandefasen? (2)
||
- Koordinatorn samlar rösterna, sin egen inräknad. Alla Yes ger ==`doCommit` till alla==; minst en No ger ==`doAbort` till dem som röstade Yes==
- Deltagarna gör som de blir tillsagda och skickar vid commit ==`haveCommitted`== som bekräftelse

Vad betyder det att en deltagare är prepared, och vad följer av det?::Att den ==kommer att kunna commit:a==, eftersom den sparat ==alla ändrade objekt plus statusen prepared i permanent lagring==. Följden är att den ==inte får abort:a längre== – den måste kunna hålla ordet även om den kraschar och ersätts.

**Uncertain** (om en deltagare i 2PC);;Läget hos en deltagare som ==röstat Yes men ännu inte vet utfallet==.

Vad kostar det att en deltagare hamnar i uncertain-läget?::Den kan ==inte bestämma något ensidigt==, och ==objekten kan inte släppas== till andra transaktioner så länge. Har koordinatorn fallerat kan väntan bli ==lång==, och det hjälper inte ens att fråga andra deltagare om ==alla är uncertain==.

I vanlig 2PC: vad får en deltagare göra om den är klar men aldrig fått något `canCommit?`?::Den får ==abort:a ensidigt==, eftersom ==inget beslut är fattat än==. Den märker läget genom att den inte fått någon förfrågan på länge, till exempel när en låstimeout går ut.

Vad kostar 2PC i meddelanden och tid när allt går bra?::==Proportionellt mot 3N meddelanden== med N deltagare (N `canCommit?` med svar plus N `doCommit`), och ==tre rundor== i tid.

Vad är `haveCommitted` till för?::Att låta koordinatorn ==radera gammal information om transaktionen==. Protokollet ==fungerar korrekt utan det==, så det räknas inte in i kostnaden.

## 3. Hierarkiskt kontra flat 2PC

Vad är skillnaden mellan provisorisk commit och prepared to commit?::==Prepared garanterar att subtransaktionen kommer att kunna commit:a==, eftersom objekten ligger i permanent lagring. ==Provisorisk commit betyder bara att den blev klar korrekt== – ingenting sparas, så kraschar servern kan ersättaren inte commit:a.

Vilka blir deltagare i 2PC för en nästlad transaktion?::Koordinatorerna för alla subtransaktioner i trädet som ==commit:at provisoriskt och inte har någon abort:ad förfader==. Toppnivåtransaktionen är ==koordinator==.

Vad gäller när en förälder abort:ar, och när ett barn abort:ar?::Abort:ar föräldern ==tvingas subtransaktionen abort:a också==. Men en förälder ==kan commit:a fast ett av dess barn abort:at== – ett bankkontors stående överföringar ska inte alla stoppas för att en misslyckas.

**Orphan** (om en subtransaktion);;En subtransaktion vars ==förfader abort:at==, antingen uttryckligen eller genom att dess koordinator kraschat.

Hur blir orphans till?::En subtransaktion som commit:ar provisoriskt rapporterar ==sin egen och sina efterkommandes status== uppåt, men en som abort:ar rapporterar ==bara "abort", utan information om sina efterkommande==. Barnen blir då bortglömda.

Hur fungerar hierarkiskt 2PC?::Koordinatorn skickar `canCommit?` ==bara till sina närmaste barn==, som skickar vidare nedåt i trädet. Varje deltagare ==samlar in svaren från sina efterkommande innan den svarar sin förälder==. Andra argumentet är ==den anropande deltagarens TID==.

Hur fungerar flat 2PC?::Koordinatorn skickar `canCommit?` ==direkt till alla deltagare==, som refererar till transaktionen med ==toppnivåns TID==. Andra argumentet är en ==abortList==.

Varför behöver flat 2PC en abortList?::För att en server kan ha ==både provisoriskt commit:ade och abort:ade== subtransaktioner. Lokalt ser båda provisoriskt commit:ade ut, så utan listan skulle servern ==commit:a en subtransaktion vars förälder abort:at==.

Vad är för- och nackdelen med varje variant? (2)
||
- **Hierarkiskt:** behöver ==ingen abortList==, eftersom varje deltagare bara letar efter subtransaktioner till sin närmaste förälder – men ==meddelanden måste gå ner och upp genom trädet i steg==
- **Flat:** koordinatorn ==når alla deltagare direkt== – men ==abortList måste skickas med==. ==Moss föredrog flat== av just det skälet

I nästlad 2PC: vad gör en provisoriskt commit:ad subtransaktion som aldrig får något `canCommit?`?::Den frågar efter en ==timeout== med ==`getStatus`== om föräldern commit:at eller abort:at. Därför måste ==koordinatorerna för abort:ade subtransaktioner leva vidare en tid==. Kan den inte nå sin förälder ==abort:ar den så småningom==.

## 4. Recovery från 2PC

Vilka två delar består atomiciteten av vid recovery?::==Durability==, att objekten sparas i permanent lagring och finns kvar därefter, och ==failure atomicity==, att effekterna är atomära även när servern kraschar.

Vad har recovery managern för uppgifter? (4)
||
- ==Spara objekt i permanent lagring== för commit:ade transaktioner
- ==Återställa serverns objekt efter en krasch==
- ==Omorganisera recovery-filen== så att recovery går snabbare
- ==Återvinna lagringsutrymme==

**Intentions list**;;Listan över ==referenserna till och värdena på alla objekt en transaktion ändrar==, och var värdena ligger i recovery-filen.

Vad används intentions list till vid commit respektive abort?::Vid **commit** för att ==identifiera vilka objekt som berördes==: den commit:ade versionen ==ersätts av den tentativa== och det nya värdet ==skrivs till recovery-filen==. Vid **abort** för att ==radera alla tentativa versioner==.

Vilka två posttyper tillkommer i recovery-filen för 2PC?::En ==coordinator-post== med TID och ==listan över deltagare==, och en ==participant-post== med TID och ==vem koordinatorn är==.

Vad är särskilt med statusvärdet done?::Koordinatorn sätter det när ==hela protokollet är klart==. Det ==ingår inte i protokollet== utan finns bara för ==omorganiseringen av recovery-filen==, och det ==behöver inte tvingas ut==.

När skriver en deltagare statusvärdet uncertain?::==Som en tvingad skrivning innan Yes-rösten skickas==, tillsammans med participant-posten.

Varför måste committed-posten tvingas ut till loggen?::Eftersom ==varje transaktion som inte har statusen committed i loggen abort:as efter en krasch==. Posten måste därför skrivas direkt, tillsammans med det som ligger buffrat.

Vad avgör vilken status som gällde när felet inträffade?::Den ==senaste statusposten i loggen==, alltså den närmast slutet.

Vad gör recovery managern om servern var koordinator? (2)
||
- **prepared:** inget beslut hade nåtts, så den skickar ==`abortTransaction` till alla i deltagarlistan== och skriver aborted. Finns ingen lista ==får deltagarna timeout och abort:ar själva==
- **committed:** beslutet var taget, så den skickar ==`doCommit` igen== och ==återupptar protokollet vid steg 4==

Vad gör recovery managern om servern var deltagare? (3)
||
- **uncertain:** den vet inte utfallet och ==kan inte avgöra det själv==, så den skickar ==`getDecision`== och gör därefter som svaret säger
- **prepared:** den ==har inte röstat än== och ==får abort:a==
- **committed:** den skickar ==`haveCommitted`== i fall det inte hanns med före felet

Varför måste recovery vara idempotent?::Eftersom servern kan ==krascha igen under själva recoveryn==, så proceduren måste gå att göra ==hur många gånger som helst med samma resultat==.
