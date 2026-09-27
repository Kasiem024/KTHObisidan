---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 16, byggda mot tentafrågorna: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

## 1. Deadlocks

**Transaktion**;;En följd av operationer som utförs som ==en enda odelbar enhet== – antingen genomförs alla, eller så blir det som om ingen skedde.
<!--SR:!fsrs,2026-09-27T18:02:35.255Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:02:35.255Z!fsrs,2026-09-27T18:13:07.137Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:07.137Z-->

Vad betyder commit och abort? (2)
||
- **Commit** – avsluta så att alla ändringar sparas för gott och syns för andra
- **Abort** – avsluta så att inga av ändringarna syns för andra
<!--SR:!fsrs,2026-09-27T18:09:48.419Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:09:48.419Z-->

**Deadlock** (dödläge);;Ett tillstånd där ==varje medlem i en grupp transaktioner väntar på att någon annan medlem ska släppa ett lås==.
<!--SR:!fsrs,2026-09-28T20:35:50.717Z,2,2.01850261,6.79877821,2,3,0,0,2026-09-26T20:35:50.717Z!fsrs,2026-09-27T18:13:38.664Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:38.664Z-->

Vad är en väntegraf (wait-for graph)?::En graf där en pil från T till U betyder att T väntar på att U ska släppa ett lås. ==En cykel i grafen betyder deadlock.==
<!--SR:!fsrs,2026-09-27T18:03:08.622Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:03:08.622Z-->

Vilka tre saker kan man göra åt deadlocks? (3)
||
- **Förebygga** – lås allt vid start, eller lås i förbestämd ordning
- **Upptäcka** – leta cykler i väntegrafen och abort:a en transaktion i cykeln
- **Timeout** – varje lås blir sårbart efter en tid och kan brytas
<!--SR:!fsrs,2026-09-27T20:46:22.559Z,1,0.20347043,8.39432857,2,4,1,0,2026-09-26T20:46:22.559Z-->

Vad är problemet med att låsa alla objekt när transaktionen startar? (2)
||
- **Låser för mycket** – blockerar delade resurser i onödan
- **Går inte alltid** – man vet inte i förväg vilka objekt som behövs
<!--SR:!fsrs,2026-09-29T20:17:13.448Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:17:13.448Z-->

Vad är det värsta problemet med timeout?::Att en transaktion ==kan abort:as fast det inte fanns någon deadlock== – bara för att låset blev sårbart medan någon väntade.
<!--SR:!fsrs,2026-09-27T18:13:03.017Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:03.017Z-->

Vilken transaktion avbryter man vid en deadlock?::Valet är inte enkelt – man väger in ==transaktionens ålder och hur många cykler den sitter i==.

## 2. Dirty reads

**Dirty read** (smutsig läsning);;När en transaktion ==läser ett värde som en annan skrivit men inte commit:at==. Abort:ar den andra har man läst ett värde som aldrig fanns.
<!--SR:!fsrs,2026-10-01T20:10:33.516Z,5,5.38885005,3.58131923,2,3,0,0,2026-09-26T20:10:33.516Z!fsrs,2026-09-27T18:28:27.791Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:27.791Z-->

Varför är en dirty read ett problem man inte kan laga?::För att läsaren ==kan ha commit:at redan==, på ett värde som sedan försvinner – och en commit går inte att göra ogjord.
<!--SR:!fsrs,2026-09-27T18:28:55.830Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:55.830Z-->

Vad är återhämtningsbarhet (recoverability) mot dirty reads?::Att ==skjuta upp sin egen commit== tills den transaktion vars ocommit:ade värde man läst har commit:at. Abort:ar den, abort:ar man själv.
<!--SR:!fsrs,2026-09-29T20:10:10.020Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:10:10.020Z-->

**Strikt körning** (strict execution);;När läsning och skrivning på ett objekt ==skjuts upp tills alla som tidigare skrivit det har commit:at eller abort:at==. Det är detta som ger isolering och stoppar dirty reads.
<!--SR:!fsrs,2026-09-26T20:46:30.301Z,0,0.08641389,9.45690513,3,4,1,0,2026-09-26T20:36:30.301Z!fsrs,2026-09-27T20:46:51.271Z,1,0.20347043,8.39432857,2,4,1,0,2026-09-26T20:46:51.271Z-->

Vad är en kaskadabort?::Avbryter man en transaktion måste ==alla som läst dess osparade värden också avbrytas==.

## 3. Optimistisk samtidighetskontroll

Vad är grundidén bakom optimistisk samtidighetskontroll?::Att krockar är sällsynta, så transaktioner får ==köra fritt och kontrolleras först vid commit==.
<!--SR:!fsrs,2026-09-27T18:12:20.313Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:12:20.313Z-->

Vilka tre nackdelar med låsning ville optimistisk metod undvika? (3)
||
- **Kostar** – även rena läsningar måste låsa, fast krock är ovanligt
- **Kan ge deadlock** – och varken timeout eller detektering är helt bra
- **Låsen hålls till slutet** – vilket sänker samtidigheten
<!--SR:!fsrs,2026-09-28T20:14:23.137Z,2,1.06546001,8.37949113,2,4,0,0,2026-09-26T20:14:23.137Z-->

Vilka tre faser har en optimistisk transaktion? (3)
||
- **Arbetsfas** – kör fritt mot egna kopior
- **Valideringsfas** – vid commit, kolla om något krockat
- **Uppdateringsfas** – spara ändringarna permanent
<!--SR:!fsrs,2026-09-27T18:12:48.585Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:12:48.585Z-->

Vad är den stora nackdelen med optimistisk kontroll?::Att ==mycket arbete kan behöva göras om när en transaktion abort:as==. Den lönar sig bara när krockarna är få.
<!--SR:!fsrs,2026-09-27T18:29:07.326Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:29:07.326Z-->

Hur ser valideringen att två transaktioner krockat?::Den jämför transaktionens ==lästa och skrivna objekt mot de andra som kört samtidigt==.

## 4. Tidsstämpelordning mot tvåfaslåsning

Hur fungerar tidsstämpelordning i grunden?::Varje transaktion får en ==tidsstämpel när den startar== som bestämmer dess ordning. Varje operation kollas när den görs, och en som bryter ordningen abort:as direkt.
<!--SR:!fsrs,2026-09-27T17:59:23.241Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:59:23.241Z-->

Varför kan tidsstämpelordning inte hamna i deadlock?::För att transaktioner ==bara väntar på tidigare transaktioner==, så ingen cykel kan uppstå.
<!--SR:!fsrs,2026-09-27T17:58:52.473Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:58:52.473Z-->

När passar tidsstämpelordning respektive 2PL bäst? (2)
||
- **Tidsstämpelordning** – när transaktioner mest läser
- **Tvåfaslåsning** – när det mest är skrivningar
<!--SR:!fsrs,2026-09-27T18:04:15.206Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:04:15.206Z-->

När bestäms ordningen mellan transaktioner? (2)
||
- **Tidsstämpelordning** – redan när transaktionen startar
- **Tvåfaslåsning** – efter hand, i den ordning objekten används
<!--SR:!fsrs,2026-09-27T17:58:17.122Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:58:17.122Z-->

## 5. Jämförelse av de tre metoderna

**Serialiserbarhet** (serial equivalence);;Att en flätad körning av transaktioner ger ==samma resultat som om de körts en och en i någon ordning==.
<!--SR:!fsrs,2026-09-27T20:19:20.031Z,1,0.71149248,8.91819814,2,4,0,0,2026-09-26T20:19:20.031Z!fsrs,2026-09-28T20:30:45.088Z,2,2.01850261,6.79877821,2,3,0,0,2026-09-26T20:30:45.088Z-->

**Tvåfaslåsning** (two-phase locking);;Att en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper dem (krympande fas)== – inga nya lås efter det första släppta.
<!--SR:!fsrs,2026-09-29T20:29:03.681Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:29:03.681Z!fsrs,2026-10-01T20:11:25.563Z,5,5.38885005,3.58131923,2,3,0,0,2026-09-26T20:11:25.563Z-->

Vad gör strikt tvåfaslåsning "strikt"?::Att ==alla lås hålls kvar tills transaktionen commit:ar eller abort:ar==, i stället för att släppas direkt. Det skyddar mot dirty reads.
<!--SR:!fsrs,2026-09-27T18:28:42.502Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:42.502Z-->

Vilka två låstyper använder låsning?::Läslås och skrivlås – alltså ==många läsare eller en skrivare==. Ett läslås kan delas; ett skrivlås är exklusivt.
<!--SR:!fsrs,2026-09-29T20:41:37.034Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:41:37.034Z-->

Vad är den gemensamma tanken bakom de tre metoderna?::Alla gör en av två saker vid en krock: ==låter transaktioner vänta, eller startar om dem==. Låsning väntar; tidsstämpel och optimistisk startar om.
<!--SR:!fsrs,2026-09-26T21:03:06.788Z,0,0.01949032,9.92009286,3,6,1,0,2026-09-26T20:53:06.788Z-->

Hur gör de tre metoderna vid en konflikt, och vilken kan ge deadlock? (3)
||
- **Strikt 2PL** – transaktionen väntar; enda metoden som kan ge deadlock
- **Tidsstämpelordning** – abort direkt, men väntar bara på tidigare, så ingen deadlock
- **Optimistisk** – abort vid commit och arbetet görs om; inga lås, så ingen deadlock
<!--SR:!fsrs,2026-09-27T20:30:35.384Z,1,0.71149248,8.91819814,2,4,0,0,2026-09-26T20:30:35.384Z-->
