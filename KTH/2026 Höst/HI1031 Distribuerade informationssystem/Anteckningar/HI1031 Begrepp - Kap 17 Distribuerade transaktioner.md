---
tags:
  - begrepp
  - HI1031
  - databaser
  - programmering
  - KTH
  - year2026
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
<!--SR:!fsrs,2026-10-23T08:16:14.238Z,5,4.93740292,9.85911876,2,11,2,0,2026-10-18T08:16:14.238Z-->

Hur hittar man en deadlock som ligger över flera servrar? (2)
||
- **Central detektor** – en server slår ihop allas väntegrafer och letar cykel
- **Edge chasing** – ett sökmeddelande följer väntekanterna tills det kommer tillbaka
<!--SR:!fsrs,2026-10-22T11:10:43.063Z,5,5.21838092,9.83784079,2,12,2,0,2026-10-17T11:10:43.063Z-->

Vad är en distribuerad transaktion?::En transaktion, platt eller nästlad, som ==använder objekt på flera olika servrar==.
<!--SR:!fsrs,2026-11-07T08:19:08.949Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:19:08.949Z-->

Vad skiljer en platt distribuerad transaktion från en nästlad? (2)
||
- **Platt** – klienten gör ett anrop i taget, en server blir klar innan nästa börjar
- **Nästlad** – transaktionen öppnar subtransaktioner som kan köra samtidigt, till och med parallellt
<!--SR:!fsrs,2026-10-24T10:43:00.682Z,11,11.10131904,8.56466845,2,5,0,0,2026-10-13T10:43:00.682Z-->

Hur får koordinatorn reda på vilka servrar som är med i transaktionen?::Varje ny deltagare ==anropar join hos koordinatorn==, som då lägger till den i sin lista över deltagare.
<!--SR:!fsrs,2026-11-07T08:17:26.166Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:17:26.166Z-->

Hur gör man en transaktionsidentifierare (TID) unik i hela det distribuerade systemet?::Man sätter ihop den av två delar: ==namnet på servern som skapade den (t.ex. dess IP-adress)== plus ett nummer som är unikt på den servern.
<!--SR:!fsrs,2026-11-07T08:16:48.958Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:16:48.958Z-->

## 2. Tvåfas-commit (2PC)

Varför räcker inte ett enfas-protokoll för commit?::Ett enfas-protokoll låter ingen server säga nej. Men det kan en server behöva, t.ex. efter en ==deadlock eller krasch==.
<!--SR:!fsrs,2026-11-21T17:02:19.585Z,31,48.38946031,5.70547582,2,5,0,0,2026-10-21T17:02:19.585Z-->

Vad händer i fas 1 av 2PC, röstningsfasen? (2)
||
- Koordinatorn frågar alla deltagare: **canCommit?**
- Varje deltagare **röstar Yes eller No** – och sparar sina ändringar i permanent lagring innan den röstar Yes
<!--SR:!fsrs,2026-11-07T14:19:29.878Z,17,17.01685711,8.96238395,2,9,2,0,2026-10-21T14:19:29.878Z-->

Vad händer i fas 2 av 2PC, genomförandefasen? (2)
||
- Koordinatorn räknar rösterna: **alla Yes ger doCommit**, annars **doAbort**
- Deltagarna gör som de blir tillsagda och **bekräftar** att de commit:at
<!--SR:!fsrs,2026-11-12T14:43:16.260Z,23,22.57422802,7.85571375,2,5,0,0,2026-10-20T14:43:16.260Z-->

Vad är problemet för en deltagare som röstat Yes men inte fått veta utfallet?::Den måste ==vänta och hålla kvar sina lås== tills koordinatorn svarar. Har koordinatorn kraschat kan väntan bli lång.
<!--SR:!fsrs,2026-10-31T16:43:08.329Z,10,9.87218214,8.98963979,2,8,1,0,2026-10-21T16:43:08.329Z-->

Varför sparar deltagaren allt innan den röstar Yes?::För att ett Yes är ==ett löfte den måste kunna hålla efter en krasch==, så ändringarna måste finnas kvar.
<!--SR:!fsrs,2026-11-21T14:17:41.786Z,31,48.38946031,5.70547582,2,5,0,0,2026-10-21T14:17:41.786Z-->

Vad kostar 2PC när allt går bra, med N deltagare? (2)
||
- **Meddelanden** – ungefär 3N: N canCommit?, N svar och N doCommit
- **Tid** – tre rundor av meddelanden
<!--SR:!fsrs,2026-11-07T08:15:53.782Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:15:53.782Z-->

Vad är meddelandet haveCommitted till för?::Deltagaren bekräftar att den genomfört, så koordinatorn vet att den kan ==slänga sin sparade info om transaktionen==.
<!--SR:!fsrs,2026-11-07T08:26:18.777Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:26:18.777Z-->

Vad får en deltagare göra om den aldrig får något canCommit? från koordinatorn?::Eftersom inget beslut tagits än får den ==avbryta på egen hand== (abortera).
<!--SR:!fsrs,2026-11-07T08:20:36.060Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:20:36.060Z-->

Hur tar en deltagare som röstat Yes reda på utfallet om koordinatorn inte svarar?::Den skickar en ==getDecision till koordinatorn== och frågar vad beslutet blev.
<!--SR:!fsrs,2026-11-07T08:23:38.234Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:23:38.234Z-->

## 3. Hierarkiskt kontra flat 2PC

Vad menas med att en subtransaktion "commit:ar provisoriskt"?::Att den ==blev klar korrekt men inte sparat något i permanent lagring==. Kraschar servern kan ersättaren därför inte commit:a den – till skillnad från "prepared".
<!--SR:!fsrs,2026-10-23T08:15:31.263Z,5,4.78218628,9.60886679,2,11,2,0,2026-10-18T08:15:31.263Z-->

Vilka subtransaktioner är med i 2PC för en nästlad transaktion?::De som ==committat provisoriskt och inte har någon aborterad förälder högre upp==.
<!--SR:!fsrs,2026-11-12T14:22:46.548Z,22,22.34648772,8.50690723,2,8,1,0,2026-10-21T14:22:46.548Z-->

Hur fungerar hierarkiskt 2PC? (2)
||
- **Nedåt** – koordinatorn skickar canCommit? bara till sina närmaste barn, som skickar vidare nedåt i trädet
- **Uppåt** – varje deltagare samlar ihop barnens svar innan den svarar sin egen förälder
<!--SR:!fsrs,2026-11-21T16:50:16.198Z,31,48.38946031,5.70547582,2,5,0,0,2026-10-21T16:50:16.198Z-->

Hur fungerar flat 2PC?::Koordinatorn skickar canCommit? ==direkt till alla deltagare== på en gång, i stället för nedåt genom trädet.
<!--SR:!fsrs,2026-10-25T18:57:43.296Z,12,11.89312086,8.56466845,2,5,0,0,2026-10-13T18:57:43.296Z-->

Varför behöver flat 2PC en abortList?::För att en server kan ha ==både provisoriskt commit:ade och abort:ade subtransaktioner==. Utan listan skulle den råka commit:a en vars förälder egentligen abort:at.
<!--SR:!fsrs,2026-10-23T08:17:56.462Z,5,4.63420528,9.68259288,2,12,3,0,2026-10-18T08:17:56.462Z-->

Vad gäller när en förälder avbryts, respektive när ett barn avbryts? (2)
||
- **Förälder avbryts** – då tvingas barnet (subtransaktionen) också avbryta
- **Barn avbryts** – föräldern kan ändå genomföra, den noterar bara vilket barn som föll bort
<!--SR:!fsrs,2026-10-24T10:54:47.249Z,11,11.10131904,8.56466845,2,5,0,0,2026-10-13T10:54:47.249Z-->

Vad är en orphan (subtransaktion)?::En subtransaktion vars ==förälder eller någon högre upp har avbrutit==, antingen med flit eller för att dess koordinator kraschat.
<!--SR:!fsrs,2026-11-07T08:27:31.968Z,20,20.17483282,7.85571375,2,5,0,0,2026-10-18T08:27:31.968Z-->

Vad gör en subtransaktion som genomfört provisoriskt men aldrig blir tillfrågad om den kan committa?::Den frågar själv med ==getStatus== om föräldern genomfört eller avbrutit.
<!--SR:!fsrs,2026-10-22T22:41:09.334Z,8,8.31206553,8.90183723,2,7,1,0,2026-10-14T22:41:09.334Z-->

Vad är fördelen med hierarkiskt respektive flat 2PC? (2)
||
- **Hierarkiskt** – varje deltagare behöver bara titta efter barn till sin närmaste förälder, ingen abortlista behövs
- **Flat** – koordinatorn pratar direkt med alla deltagare, slipper skicka meddelanden ner och upp genom trädet
<!--SR:!fsrs,2026-10-30T22:40:58.935Z,16,16.02506358,7.8524272,2,5,0,0,2026-10-14T22:40:58.935Z-->

## 4. Recovery från 2PC

Vad ska transaktionsrecovery garantera efter en krasch? (2)
||
- Att commit:ade ändringar **finns kvar** i permanent lagring (durability)
- Att en transaktion blir **antingen helt av eller inte alls**, även om servern kraschar (failure atomicity)
<!--SR:!fsrs,2026-10-27T16:29:20.070Z,6,6.28843101,9.5658435,2,10,1,0,2026-10-21T16:29:20.070Z-->

Hur vet en server efter en krasch var i 2PC den befann sig?::Den läser den ==senaste statusposten i loggen== (den närmast slutet), och den avgör vad servern ska göra härnäst.
<!--SR:!fsrs,2026-10-23T22:39:32.200Z,10,10.10879534,6.79877821,2,3,0,0,2026-10-13T22:39:32.200Z-->

Varför måste "committed" skrivas till loggen direkt, som en forced write?::Saknas "committed" i loggen ==avbryts transaktionen efter en krasch==. Skrivs den för sent blir en färdig transaktion felaktigt avbruten.
<!--SR:!fsrs,2026-10-29T16:42:11.305Z,8,7.88228501,9.5416559,2,10,1,0,2026-10-21T16:42:11.305Z-->

Vad gör recovery efter en krasch om servern var koordinator? (2)
||
- **prepared** – inget beslut hade tagits, så servern aborterar och säger åt deltagarna att abortera
- **committed** – beslutet var redan taget, så servern skickar doCommit igen och slutför
<!--SR:!fsrs,2026-10-28T14:16:44.575Z,7,6.84610993,9.7184177,2,10,0,0,2026-10-21T14:16:44.575Z-->

Vad gör recovery efter en krasch om servern var deltagare? (3)
||
- **uncertain** – den vet inte utfallet, så den frågar koordinatorn (getDecision) och gör som svaret säger
- **prepared** – den hade inte röstat än, så den får abortera
- **committed** – den bekräftar (haveCommitted) ifall det inte hanns med före kraschen
<!--SR:!fsrs,2026-10-23T00:03:33.472Z,3,3.05570347,9.88690451,2,13,1,0,2026-10-20T00:03:33.472Z-->

Varför måste recovery vara idempotent?::Eftersom servern kan ==krascha igen mitt i recoveryn==, så proceduren måste ge samma resultat hur många gånger den än körs.
<!--SR:!fsrs,2026-11-21T10:49:30.681Z,30,35.27563402,5.70547582,2,5,0,0,2026-10-22T10:49:30.681Z-->

Vad är en intentions list?::En lista över ==alla objekt en transaktion ändrat==, med referenser och värden, som servern använder för att skriva värdena vid commit och slänga dem vid abort.
<!--SR:!fsrs,2026-11-04T14:19:03.396Z,14,13.68998833,9.31704431,2,8,1,0,2026-10-21T14:19:03.396Z-->

Vilka två extra posttyper låter en server minnas vilka som är med i 2PC? (2)
||
- **Coordinator** – transaktionens id och listan över alla deltagare
- **Participant** – transaktionens id och vem som är koordinator
<!--SR:!fsrs,2026-11-16T19:58:34.488Z,26,25.52968592,7.0810712,2,6,0,0,2026-10-21T19:58:34.488Z-->

Vad betyder statusen done i recovery-filen?::Att koordinatorn sett att ==hela 2PC är klar== – alla deltagare har bekräftat att de genomfört.
<!--SR:!fsrs,2026-10-22T23:51:11.864Z,8,8.49491362,8.35320204,2,6,0,0,2026-10-14T23:51:11.864Z-->
