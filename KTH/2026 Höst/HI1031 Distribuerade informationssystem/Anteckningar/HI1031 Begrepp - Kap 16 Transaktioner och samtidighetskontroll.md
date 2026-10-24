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
description: "Flashcards HI1031 kap 16, byggda mot tentafrågorna: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

## 1. Deadlocks

**Transaktion**;;En följd av operationer som utförs som ==en enda odelbar enhet== – antingen genomförs alla, eller så blir det som om ingen skedde.
<!--SR:!fsrs,2026-10-24T12:43:05.293Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:43:05.293Z!fsrs,2026-10-24T12:43:35.221Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:43:35.221Z-->

Vad betyder commit och abort? (2)
||
- **Commit** – avsluta så att alla ändringar sparas för gott och syns för andra
- **Abort** – avsluta så att inga av ändringarna syns för andra
<!--SR:!fsrs,2026-10-26T11:55:37.728Z,19,18.86782,7.09510771,2,4,0,0,2026-10-07T11:55:37.728Z-->

**Deadlock** (dödläge);;Ett tillstånd där ==varje medlem i en grupp transaktioner väntar på att någon annan medlem ska släppa ett lås==.
<!--SR:!fsrs,2026-10-30T15:50:32.487Z,15,15.02241093,9.0323884,2,6,0,0,2026-10-15T15:50:32.487Z!fsrs,2026-10-26T11:55:43.920Z,19,18.86782,7.09510771,2,4,0,0,2026-10-07T11:55:43.920Z-->

Vad är en väntegraf (wait-for graph)?::En graf där en pil från T till U betyder att T väntar på att U ska släppa ett lås. ==En cykel i grafen betyder deadlock.==
<!--SR:!fsrs,2026-10-24T12:57:42.148Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:57:42.148Z-->

Vilka tre saker kan man göra åt deadlocks? (3)
||
- **Förebygga** – lås allt vid start, eller lås i förbestämd ordning
- **Upptäcka** – leta cykler i väntegrafen och abort:a en transaktion i cykeln
- **Timeout** – varje lås blir sårbart efter en tid och kan brytas
<!--SR:!fsrs,2026-10-25T11:06:50.905Z,8,7.80178844,9.59064081,2,13,3,0,2026-10-17T11:06:50.905Z-->

Vad är problemet med att låsa alla objekt när transaktionen startar? (2)
||
- **Låser för mycket** – blockerar delade resurser i onödan
- **Går inte alltid** – man vet inte i förväg vilka objekt som behövs
<!--SR:!fsrs,2026-10-24T09:46:31.322Z,11,10.82608954,8.89966793,2,8,1,0,2026-10-13T09:46:31.322Z-->

Vad är det värsta problemet med timeout?::Att en transaktion ==kan abort:as fast det inte fanns någon deadlock== – bara för att låset blev sårbart medan någon väntade.
<!--SR:!fsrs,2026-10-24T12:36:27.930Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:36:27.930Z-->

Vilken transaktion avbryter man vid en deadlock?::Valet är inte enkelt – man väger in ==transaktionens ålder och hur många cykler den sitter i==.
<!--SR:!fsrs,2026-11-06T15:31:35.595Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:31:35.595Z-->

## 2. Dirty reads

**Dirty read** (smutsig läsning);;När en transaktion ==läser ett värde som en annan skrivit men inte commit:at==. Abort:ar den andra har man läst ett värde som aldrig fanns.
<!--SR:!fsrs,2026-11-16T10:25:56.624Z,30,31.70272748,7.14675903,2,5,0,0,2026-10-17T10:25:56.624Z!fsrs,2026-10-26T11:48:59.077Z,19,18.86782,7.09510771,2,4,0,0,2026-10-07T11:48:59.077Z-->

Varför är en dirty read ett problem man inte kan laga?::För att läsaren ==kan ha commit:at redan==, på ett värde som sedan försvinner – och en commit går inte att göra ogjord.
<!--SR:!fsrs,2026-10-24T12:39:17.384Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:39:17.384Z-->

Vad är återhämtningsbarhet (recoverability) mot dirty reads?::Att ==skjuta upp sin egen commit== tills den transaktion vars ocommit:ade värde man läst har commit:at. Abort:ar den, abort:ar man själv.
<!--SR:!fsrs,2026-10-26T11:31:12.220Z,17,17.32523824,7.85571375,2,5,0,0,2026-10-09T11:31:12.220Z-->

**Strikt körning** (strict execution);;När läsning och skrivning på ett objekt ==skjuts upp tills alla som tidigare skrivit det har commit:at eller abort:at==. Det är detta som ger isolering och stoppar dirty reads.
<!--SR:!fsrs,2026-11-04T16:29:08.734Z,14,14.06541982,9.61095174,2,12,1,0,2026-10-21T16:29:08.734Z!fsrs,2026-10-30T08:23:11.347Z,12,12.02406622,9.48600209,2,9,1,0,2026-10-18T08:23:11.347Z-->

Vad är en kaskadabort?::Avbryter man en transaktion måste ==alla som läst dess osparade värden också avbrytas==.
<!--SR:!fsrs,2026-11-06T15:30:25.195Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:30:25.195Z-->

## 3. Optimistisk samtidighetskontroll

Vad är grundidén bakom optimistisk samtidighetskontroll?::Att krockar är sällsynta, så transaktioner får ==köra fritt och kontrolleras först vid commit==.
<!--SR:!fsrs,2026-10-24T12:36:59.329Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:36:59.329Z-->

Vilka tre nackdelar med låsning ville optimistisk metod undvika? (3)
||
- **Kostar** – även rena läsningar måste låsa, fast krock är ovanligt
- **Kan ge deadlock** – och varken timeout eller detektering är helt bra
- **Låsen hålls till slutet** – vilket sänker samtidigheten
<!--SR:!fsrs,2026-11-01T16:46:07.976Z,11,10.86943158,9.71758265,2,13,2,0,2026-10-21T16:46:07.976Z-->

Vilka tre faser har en optimistisk transaktion? (3)
||
- **Arbetsfas** – kör fritt mot egna kopior
- **Valideringsfas** – vid commit, kolla om något krockat
- **Uppdateringsfas** – spara ändringarna permanent
<!--SR:!fsrs,2026-10-25T13:20:24.380Z,9,9.21660091,8.99399605,2,8,1,0,2026-10-16T13:20:24.380Z-->

Vad är den stora nackdelen med optimistisk kontroll?::Att ==mycket arbete kan behöva göras om när en transaktion abort:as==. Den lönar sig bara när krockarna är få.
<!--SR:!fsrs,2026-10-26T11:54:54.873Z,19,18.86782,7.09510771,2,4,0,0,2026-10-07T11:54:54.873Z-->

Hur ser valideringen att två transaktioner krockat?::Den jämför transaktionens ==lästa och skrivna objekt mot de andra som kört samtidigt==.
<!--SR:!fsrs,2026-11-15T15:30:56.355Z,30,42.63275953,5.70547582,2,5,0,0,2026-10-16T15:30:56.355Z-->

## 4. Tidsstämpelordning mot tvåfaslåsning

Hur fungerar tidsstämpelordning i grunden?::Varje transaktion får en ==tidsstämpel när den startar== som bestämmer dess ordning. Varje operation kollas när den görs, och en som bryter ordningen abort:as direkt.
<!--SR:!fsrs,2026-10-24T12:49:25.121Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:49:25.121Z-->

Varför kan tidsstämpelordning inte hamna i deadlock?::För att transaktioner ==bara väntar på tidigare transaktioner==, så ingen cykel kan uppstå.
<!--SR:!fsrs,2026-10-24T12:19:38.701Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:19:38.701Z-->

När passar tidsstämpelordning respektive 2PL bäst? (2)
||
- **Tidsstämpelordning** – när transaktioner mest läser
- **Tvåfaslåsning** – när det mest är skrivningar
<!--SR:!fsrs,2026-11-13T20:03:51.078Z,23,22.57082391,8.00306729,2,8,1,0,2026-10-21T20:03:51.078Z-->

När bestäms ordningen mellan transaktioner? (2)
||
- **Tidsstämpelordning** – redan när transaktionen startar
- **Tvåfaslåsning** – efter hand, i den ordning objekten används
<!--SR:!fsrs,2026-10-24T12:36:51.562Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:36:51.562Z-->

## 5. Jämförelse av de tre metoderna

**Serialiserbarhet** (serial equivalence);;Att en flätad körning av transaktioner ger ==samma resultat som om de körts en och en i någon ordning==.
<!--SR:!fsrs,2026-11-04T08:15:20.433Z,13,13.07878374,9.74605546,2,13,1,0,2026-10-22T08:15:20.433Z!fsrs,2026-10-30T16:07:41.650Z,15,15.02241093,9.0323884,2,6,0,0,2026-10-15T16:07:41.650Z-->

**Tvåfaslåsning** (two-phase locking);;Att en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper dem (krympande fas)== – inga nya lås efter det första släppta.
<!--SR:!fsrs,2026-11-07T19:56:43.538Z,17,16.63278769,9.29672816,2,10,1,0,2026-10-21T19:56:43.538Z!fsrs,2026-11-16T10:53:09.033Z,30,31.70272748,7.14675903,2,5,0,0,2026-10-17T10:53:09.033Z-->

Vad gör strikt tvåfaslåsning "strikt"?::Att ==alla lås hålls kvar tills transaktionen commit:ar eller abort:ar==, i stället för att släppas direkt. Det skyddar mot dirty reads.
<!--SR:!fsrs,2026-10-24T12:43:27.613Z,18,18.01159901,7.09510771,2,4,0,0,2026-10-06T12:43:27.613Z-->

Vilka två låstyper använder låsning?::Läslås och skrivlås – alltså ==många läsare eller en skrivare==. Ett läslås kan delas; ett skrivlås är exklusivt.
<!--SR:!fsrs,2026-10-26T11:32:25.279Z,17,17.32523824,7.85571375,2,5,0,0,2026-10-09T11:32:25.279Z-->

Vad är den gemensamma tanken bakom de tre metoderna?::Alla gör en av två saker vid en krock: ==låter transaktioner vänta, eller startar om dem==. Låsning väntar; tidsstämpel och optimistisk startar om.
<!--SR:!fsrs,2026-11-02T17:01:43.825Z,12,12.36057073,9.78426752,2,15,1,0,2026-10-21T17:01:43.825Z-->

Hur gör de tre metoderna vid en konflikt, och vilken kan ge deadlock? (3)
||
- **Strikt 2PL** – transaktionen väntar; enda metoden som kan ge deadlock
- **Tidsstämpelordning** – abort direkt, men väntar bara på tidigare, så ingen deadlock
- **Optimistisk** – abort vid commit och arbetet görs om; inga lås, så ingen deadlock
<!--SR:!fsrs,2026-11-03T15:15:34.993Z,13,13.32058489,9.74808321,2,10,0,0,2026-10-21T15:15:34.993Z-->
