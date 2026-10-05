---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 17 – de fyra tentafrågorna: extra problem med distribuerade transaktioner, tvåfas-commit, hierarkisk kontra flat 2PC, och recovery efter nod- eller nätverksfel."
---
# HI1031 Begrepp - Kap 17 Distribuerade transaktioner

## 1. Extra problem med distribuerade transaktioner

Vilka extra problem får en distribuerad transaktion jämfört med en lokal? (3)
||
- **Alla eller ingen** – flera servrar måste enas om att commit:a eller abort:a, så någon måste samordna dem
- **Global ordning** – varje server ordnar sina egna objekt, men samma ordning måste gälla på alla servrar
- **Distribuerad deadlock** – en väntecykel som ligger utspridd över servrar och som ingen ser ensam
<!--SR:!fsrs,2026-10-04T02:38:31.733Z,0,0.05082128,9.80832141,3,5,1,0,2026-10-04T02:28:31.733Z-->

Hur hittar man en deadlock som ligger över flera servrar? (2)
||
- **Central detektor** – en server slår ihop allas väntegrafer och letar cykel
- **Edge chasing** – ett sökmeddelande följer väntekanterna tills det kommer tillbaka
<!--SR:!fsrs,2026-10-05T02:29:14.148Z,1,0.45666083,9.61525112,2,6,1,0,2026-10-04T02:29:14.148Z-->

Vad är en distribuerad transaktion?::En transaktion, platt eller nästlad, som ==använder objekt på flera olika servrar==.
<!--SR:!fsrs,2026-10-07T01:26:47.259Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:26:47.259Z-->

Vad skiljer en platt distribuerad transaktion från en nästlad? (2)
||
- **Platt** – klienten gör ett anrop i taget, en server blir klar innan nästa börjar
- **Nästlad** – transaktionen öppnar subtransaktioner som kan köra samtidigt, till och med parallellt
<!--SR:!fsrs,2026-10-06T01:25:35.868Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-03T01:25:35.868Z-->

Hur får koordinatorn reda på vilka servrar som är med i transaktionen?::Varje ny deltagare ==anropar join hos koordinatorn==, som då lägger till den i sin lista över deltagare.
<!--SR:!fsrs,2026-10-07T01:22:53.309Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:22:53.309Z-->

Hur gör man en transaktionsidentifierare (TID) unik i hela det distribuerade systemet?::Man sätter ihop den av två delar: ==namnet på servern som skapade den (t.ex. dess IP-adress)== plus ett nummer som är unikt på den servern.
<!--SR:!fsrs,2026-10-07T01:23:24.381Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:23:24.381Z-->

## 2. Tvåfas-commit (2PC)

Varför räcker inte ett enfas-protokoll för commit?::Ett enfas-protokoll låter ingen server säga nej. Men det kan en server behöva, t.ex. efter en ==deadlock eller krasch==.
<!--SR:!fsrs,2026-10-06T20:33:36.921Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-02T20:33:36.921Z-->

Vad händer i fas 1 av 2PC, röstningsfasen? (2)
||
- Koordinatorn frågar alla deltagare: **canCommit?**
- Varje deltagare **röstar Yes eller No** – och sparar sina ändringar i permanent lagring innan den röstar Yes
<!--SR:!fsrs,2026-10-04T02:38:07.528Z,0,0.32781764,9.45745509,3,5,2,0,2026-10-04T02:28:07.528Z-->

Vad händer i fas 2 av 2PC, genomförandefasen? (2)
||
- Koordinatorn räknar rösterna: **alla Yes ger doCommit**, annars **doAbort**
- Deltagarna gör som de blir tillsagda och **bekräftar** att de commit:at
<!--SR:!fsrs,2026-10-06T20:38:45.925Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-02T20:38:45.925Z-->

Vad är problemet för en deltagare som röstat Yes men inte fått veta utfallet?::Den måste ==vänta och hålla kvar sina lås== tills koordinatorn svarar. Har koordinatorn kraschat kan väntan bli lång.
<!--SR:!fsrs,2026-10-05T20:31:00.211Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-02T20:31:00.211Z-->

Varför sparar deltagaren allt innan den röstar Yes?::För att ett Yes är ==ett löfte den måste kunna hålla efter en krasch==, så ändringarna måste finnas kvar.
<!--SR:!fsrs,2026-10-06T20:35:24.992Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-02T20:35:24.992Z-->

Vad kostar 2PC när allt går bra, med N deltagare? (2)
||
- **Meddelanden** – ungefär 3N: N canCommit?, N svar och N doCommit
- **Tid** – tre rundor av meddelanden
<!--SR:!fsrs,2026-10-07T01:21:03.847Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:21:03.847Z-->

Vad är meddelandet haveCommitted till för?::Deltagaren bekräftar att den genomfört, så koordinatorn vet att den kan ==slänga sin sparade info om transaktionen==.
<!--SR:!fsrs,2026-10-07T01:24:43.852Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:24:43.852Z-->

Vad får en deltagare göra om den aldrig får något canCommit? från koordinatorn?::Eftersom inget beslut tagits än får den ==avbryta på egen hand== (abortera).
<!--SR:!fsrs,2026-10-07T01:18:30.289Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:18:30.289Z-->

Hur tar en deltagare som röstat Yes reda på utfallet om koordinatorn inte svarar?::Den skickar en ==getDecision till koordinatorn== och frågar vad beslutet blev.
<!--SR:!fsrs,2026-10-07T01:24:08.893Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:24:08.893Z-->

## 3. Hierarkiskt kontra flat 2PC

Vad menas med att en subtransaktion "commit:ar provisoriskt"?::Att den ==blev klar korrekt men inte sparat något i permanent lagring==. Kraschar servern kan ersättaren därför inte commit:a den – till skillnad från "prepared".
<!--SR:!fsrs,2026-10-05T20:33:49.785Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-02T20:33:49.785Z-->

Vilka subtransaktioner är med i 2PC för en nästlad transaktion?::De som ==committat provisoriskt och inte har någon aborterad förälder högre upp==.
<!--SR:!fsrs,2026-10-06T02:30:55.676Z,2,1.95685139,8.91930885,2,5,1,0,2026-10-04T02:30:55.676Z-->

Hur fungerar hierarkiskt 2PC? (2)
||
- **Nedåt** – koordinatorn skickar canCommit? bara till sina närmaste barn, som skickar vidare nedåt i trädet
- **Uppåt** – varje deltagare samlar ihop barnens svar innan den svarar sin egen förälder
<!--SR:!fsrs,2026-10-06T20:44:06.626Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-02T20:44:06.626Z-->

Hur fungerar flat 2PC?::Koordinatorn skickar canCommit? ==direkt till alla deltagare== på en gång, i stället för nedåt genom trädet.
<!--SR:!fsrs,2026-10-05T20:42:14.291Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-02T20:42:14.291Z-->

Varför behöver flat 2PC en abortList?::För att en server kan ha ==både provisoriskt commit:ade och abort:ade subtransaktioner==. Utan listan skulle den råka commit:a en vars förälder egentligen abort:at.
<!--SR:!fsrs,2026-10-06T02:12:19.999Z,2,1.5221036,8.38116261,2,5,1,0,2026-10-04T02:12:19.999Z-->

Vad gäller när en förälder avbryts, respektive när ett barn avbryts? (2)
||
- **Förälder avbryts** – då tvingas barnet (subtransaktionen) också avbryta
- **Barn avbryts** – föräldern kan ändå genomföra, den noterar bara vilket barn som föll bort
<!--SR:!fsrs,2026-10-06T01:26:04.035Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-03T01:26:04.035Z-->

Vad är en orphan (subtransaktion)?::En subtransaktion vars ==förälder eller någon högre upp har avbrutit==, antingen med flit eller för att dess koordinator kraschat.
<!--SR:!fsrs,2026-10-07T01:24:32.900Z,4,4.19933095,5.19004872,2,3,0,0,2026-10-03T01:24:32.900Z-->

Vad gör en subtransaktion som genomfört provisoriskt men aldrig blir tillfrågad om den kan committa?::Den frågar själv med ==getStatus== om föräldern genomfört eller avbrutit.
<!--SR:!fsrs,2026-10-04T22:20:17.915Z,1,0.22495104,8.39432857,2,4,1,0,2026-10-03T22:20:17.915Z-->

Vad är fördelen med hierarkiskt respektive flat 2PC? (2)
||
- **Hierarkiskt** – varje deltagare behöver bara titta efter barn till sin närmaste förälder, ingen abortlista behövs
- **Flat** – koordinatorn pratar direkt med alla deltagare, slipper skicka meddelanden ner och upp genom trädet
<!--SR:!fsrs,2026-10-06T01:21:56.942Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-03T01:21:56.942Z-->

## 4. Recovery från 2PC

Vad ska transaktionsrecovery garantera efter en krasch? (2)
||
- Att commit:ade ändringar **finns kvar** i permanent lagring (durability)
- Att en transaktion blir **antingen helt av eller inte alls**, även om servern kraschar (failure atomicity)

Hur vet en server efter en krasch var i 2PC den befann sig?::Den läser den ==senaste statusposten i loggen== (den närmast slutet), och den avgör vad servern ska göra härnäst.

Varför måste "committed" skrivas till loggen direkt, som en forced write?::Saknas "committed" i loggen ==avbryts transaktionen efter en krasch==. Skrivs den för sent blir en färdig transaktion felaktigt avbruten.

Vad gör recovery efter en krasch om servern var koordinator? (2)
||
- **prepared** – inget beslut hade tagits, så servern aborterar och säger åt deltagarna att abortera
- **committed** – beslutet var redan taget, så servern skickar doCommit igen och slutför

Vad gör recovery efter en krasch om servern var deltagare? (3)
||
- **uncertain** – den vet inte utfallet, så den frågar koordinatorn (getDecision) och gör som svaret säger
- **prepared** – den hade inte röstat än, så den får abortera
- **committed** – den bekräftar (haveCommitted) ifall det inte hanns med före kraschen

Varför måste recovery vara idempotent?::Eftersom servern kan ==krascha igen mitt i recoveryn==, så proceduren måste ge samma resultat hur många gånger den än körs.

Vad är en intentions list?::En lista över ==alla objekt en transaktion ändrat==, med referenser och värden, som servern använder för att skriva värdena vid commit och slänga dem vid abort.
<!--SR:!fsrs,2026-10-05T02:35:13.885Z,1,1.10334664,8.39432857,2,4,1,0,2026-10-04T02:35:13.885Z-->

Vilka två extra posttyper låter en server minnas vilka som är med i 2PC? (2)
||
- **Coordinator** – transaktionens id och listan över alla deltagare
- **Participant** – transaktionens id och vem som är koordinator

Vad betyder statusen done i recovery-filen?::Att koordinatorn sett att ==hela 2PC är klar== – alla deltagare har bekräftat att de genomfört.
<!--SR:!fsrs,2026-10-04T02:45:11.879Z,0,0.212,6.4133,1,1,0,0,2026-10-04T02:44:11.879Z-->
