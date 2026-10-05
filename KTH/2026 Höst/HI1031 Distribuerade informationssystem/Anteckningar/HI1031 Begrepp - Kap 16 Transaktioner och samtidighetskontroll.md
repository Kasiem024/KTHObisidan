---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 16, byggda mot tentafrågorna: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

## 1. Deadlocks

**Transaktion**;;En följd av operationer som utförs som ==en enda odelbar enhet== – antingen genomförs alla, eller så blir det som om ingen skedde.
<!--SR:!fsrs,2026-10-06T10:08:57.335Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T10:08:57.335Z!fsrs,2026-10-06T12:06:47.286Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T12:06:47.286Z-->

Vad betyder commit och abort? (2)
||
- **Commit** – avsluta så att alla ändringar sparas för gott och syns för andra
- **Abort** – avsluta så att inga av ändringarna syns för andra
<!--SR:!fsrs,2026-10-06T17:30:29.726Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T17:30:29.726Z-->

**Deadlock** (dödläge);;Ett tillstånd där ==varje medlem i en grupp transaktioner väntar på att någon annan medlem ska släppa ett lås==.
<!--SR:!fsrs,2026-10-04T15:22:21.607Z,5,5.22024091,7.86010817,2,4,0,0,2026-09-29T15:22:21.607Z!fsrs,2026-10-06T17:32:11.925Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T17:32:11.925Z-->

Vad är en väntegraf (wait-for graph)?::En graf där en pil från T till U betyder att T väntar på att U ska släppa ett lås. ==En cykel i grafen betyder deadlock.==
<!--SR:!fsrs,2026-10-06T12:07:19.094Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T12:07:19.094Z-->

Vilka tre saker kan man göra åt deadlocks? (3)
||
- **Förebygga** – lås allt vid start, eller lås i förbestämd ordning
- **Upptäcka** – leta cykler i väntegrafen och abort:a en transaktion i cykeln
- **Timeout** – varje lås blir sårbart efter en tid och kan brytas
<!--SR:!fsrs,2026-10-04T02:48:42.012Z,0,0.68180927,9.6271397,3,7,2,0,2026-10-04T02:38:42.012Z-->

Vad är problemet med att låsa alla objekt när transaktionen startar? (2)
||
- **Låser för mycket** – blockerar delade resurser i onödan
- **Går inte alltid** – man vet inte i förväg vilka objekt som behövs
<!--SR:!fsrs,2026-10-04T20:45:45.000Z,3,2.14031285,8.37789155,2,6,1,0,2026-10-01T20:45:45.000Z-->

Vad är det värsta problemet med timeout?::Att en transaktion ==kan abort:as fast det inte fanns någon deadlock== – bara för att låset blev sårbart medan någon väntade.
<!--SR:!fsrs,2026-10-06T10:10:48.518Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T10:10:48.518Z-->

Vilken transaktion avbryter man vid en deadlock?::Valet är inte enkelt – man väger in ==transaktionens ålder och hur många cykler den sitter i==.
<!--SR:!fsrs,2026-10-04T10:04:13.543Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:04:13.543Z-->

## 2. Dirty reads

**Dirty read** (smutsig läsning);;När en transaktion ==läser ett värde som en annan skrivit men inte commit:at==. Abort:ar den andra har man läst ett värde som aldrig fanns.
<!--SR:!fsrs,2026-10-16T20:48:27.936Z,15,14.65864851,5.72420896,2,4,0,0,2026-10-01T20:48:27.936Z!fsrs,2026-10-06T17:31:39.261Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T17:31:39.261Z-->

Varför är en dirty read ett problem man inte kan laga?::För att läsaren ==kan ha commit:at redan==, på ett värde som sedan försvinner – och en commit går inte att göra ogjord.
<!--SR:!fsrs,2026-10-06T10:10:35.126Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T10:10:35.126Z-->

Vad är återhämtningsbarhet (recoverability) mot dirty reads?::Att ==skjuta upp sin egen commit== tills den transaktion vars ocommit:ade värde man läst har commit:at. Abort:ar den, abort:ar man själv.
<!--SR:!fsrs,2026-10-09T10:14:46.650Z,9,8.83497632,6.79215857,2,4,0,0,2026-09-30T10:14:46.650Z-->

**Strikt körning** (strict execution);;När läsning och skrivning på ett objekt ==skjuts upp tills alla som tidigare skrivit det har commit:at eller abort:at==. Det är detta som ger isolering och stoppar dirty reads.
<!--SR:!fsrs,2026-10-06T22:20:30.035Z,3,2.11895694,9.74849079,2,9,1,0,2026-10-03T22:20:30.035Z!fsrs,2026-10-09T02:37:07.977Z,5,4.93097245,9.26201309,2,7,1,0,2026-10-04T02:37:07.977Z-->

Vad är en kaskadabort?::Avbryter man en transaktion måste ==alla som läst dess osparade värden också avbrytas==.
<!--SR:!fsrs,2026-10-04T10:01:22.154Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:01:22.154Z-->

## 3. Optimistisk samtidighetskontroll

Vad är grundidén bakom optimistisk samtidighetskontroll?::Att krockar är sällsynta, så transaktioner får ==köra fritt och kontrolleras först vid commit==.
<!--SR:!fsrs,2026-10-06T11:55:18.129Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T11:55:18.129Z-->

Vilka tre nackdelar med låsning ville optimistisk metod undvika? (3)
||
- **Kostar** – även rena läsningar måste låsa, fast krock är ovanligt
- **Kan ge deadlock** – och varken timeout eller detektering är helt bra
- **Låsen hålls till slutet** – vilket sänker samtidigheten
<!--SR:!fsrs,2026-10-04T02:53:18.828Z,0,0.26210537,9.85781919,3,8,2,0,2026-10-04T02:43:18.828Z-->

Vilka tre faser har en optimistisk transaktion? (3)
||
- **Arbetsfas** – kör fritt mot egna kopior
- **Valideringsfas** – vid commit, kolla om något krockat
- **Uppdateringsfas** – spara ändringarna permanent
<!--SR:!fsrs,2026-10-06T11:53:11.322Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T11:53:11.322Z-->

Vad är den stora nackdelen med optimistisk kontroll?::Att ==mycket arbete kan behöva göras om när en transaktion abort:as==. Den lönar sig bara när krockarna är få.
<!--SR:!fsrs,2026-10-06T17:30:56.318Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T17:30:56.318Z-->

Hur ser valideringen att två transaktioner krockat?::Den jämför transaktionens ==lästa och skrivna objekt mot de andra som kört samtidigt==.
<!--SR:!fsrs,2026-10-04T09:59:29.657Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T09:59:29.657Z-->

## 4. Tidsstämpelordning mot tvåfaslåsning

Hur fungerar tidsstämpelordning i grunden?::Varje transaktion får en ==tidsstämpel när den startar== som bestämmer dess ordning. Varje operation kollas när den görs, och en som bryter ordningen abort:as direkt.
<!--SR:!fsrs,2026-10-06T11:59:25.512Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T11:59:25.512Z-->

Varför kan tidsstämpelordning inte hamna i deadlock?::För att transaktioner ==bara väntar på tidigare transaktioner==, så ingen cykel kan uppstå.
<!--SR:!fsrs,2026-10-06T10:13:11.516Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T10:13:11.516Z-->

När passar tidsstämpelordning respektive 2PL bäst? (2)
||
- **Tidsstämpelordning** – när transaktioner mest läser
- **Tvåfaslåsning** – när det mest är skrivningar
<!--SR:!fsrs,2026-10-06T12:08:20.854Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T12:08:20.854Z-->

När bestäms ordningen mellan transaktioner? (2)
||
- **Tidsstämpelordning** – redan när transaktionen startar
- **Tvåfaslåsning** – efter hand, i den ordning objekten används
<!--SR:!fsrs,2026-10-06T11:55:52.809Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T11:55:52.809Z-->

## 5. Jämförelse av de tre metoderna

**Serialiserbarhet** (serial equivalence);;Att en flätad körning av transaktioner ger ==samma resultat som om de körts en och en i någon ordning==.
<!--SR:!fsrs,2026-10-06T02:13:27.356Z,2,1.9683062,9.79623421,2,9,1,0,2026-10-04T02:13:27.356Z!fsrs,2026-10-04T15:20:00.664Z,5,5.22024091,7.86010817,2,4,0,0,2026-09-29T15:20:00.664Z-->

**Tvåfaslåsning** (two-phase locking);;Att en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper dem (krympande fas)== – inga nya lås efter det första släppta.
<!--SR:!fsrs,2026-10-07T02:37:47.230Z,3,3.11168537,9.26637225,2,7,1,0,2026-10-04T02:37:47.230Z!fsrs,2026-10-16T21:00:14.287Z,15,14.65864851,5.72420896,2,4,0,0,2026-10-01T21:00:14.287Z-->

Vad gör strikt tvåfaslåsning "strikt"?::Att ==alla lås hålls kvar tills transaktionen commit:ar eller abort:ar==, i stället för att släppas direkt. Det skyddar mot dirty reads.
<!--SR:!fsrs,2026-10-06T10:11:05.502Z,8,8.17307705,5.64640287,2,3,0,0,2026-09-28T10:11:05.502Z-->

Vilka två låstyper använder låsning?::Läslås och skrivlås – alltså ==många läsare eller en skrivare==. Ett läslås kan delas; ett skrivlås är exklusivt.
<!--SR:!fsrs,2026-10-09T10:16:27.999Z,9,8.83497632,6.79215857,2,4,0,0,2026-09-30T10:16:27.999Z-->

Vad är den gemensamma tanken bakom de tre metoderna?::Alla gör en av två saker vid en krock: ==låter transaktioner vänta, eller startar om dem==. Låsning väntar; tidsstämpel och optimistisk startar om.
<!--SR:!fsrs,2026-10-04T20:41:01.988Z,2,0.43024292,9.92755403,2,11,1,0,2026-10-02T20:41:01.988Z-->

Hur gör de tre metoderna vid en konflikt, och vilken kan ge deadlock? (3)
||
- **Strikt 2PL** – transaktionen väntar; enda metoden som kan ge deadlock
- **Tidsstämpelordning** – abort direkt, men väntar bara på tidigare, så ingen deadlock
- **Optimistisk** – abort vid commit och arbetet görs om; inga lås, så ingen deadlock
<!--SR:!fsrs,2026-10-08T02:15:46.730Z,4,4.11030637,9.65242913,2,7,0,0,2026-10-04T02:15:46.730Z-->
