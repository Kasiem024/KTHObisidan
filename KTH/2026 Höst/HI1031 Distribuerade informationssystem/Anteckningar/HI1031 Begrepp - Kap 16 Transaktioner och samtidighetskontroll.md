---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-09-10
description: "Flashcards HI1031 kap 16, byggda mot tentafrågorna: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

## 1. Deadlocks

**Transaktion**;;En följd av operationer som utförs som ==en enda odelbar enhet== – antingen genomförs alla, eller så blir det som om ingen skedde.
<!--SR:!fsrs,2026-09-27T18:02:35.255Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:02:35.255Z!fsrs,2026-09-27T18:13:07.137Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:07.137Z-->

Vad betyder det att commit:a respektive abort:a en transaktion?::==Commit:a== betyder att avsluta den så att ==alla ändringar sparas permanent== och blir synliga för andra. ==Abort:a== betyder att avsluta den så att ==ingen av dess effekter syns== för framtida transaktioner.
<!--SR:!fsrs,2026-09-27T18:09:48.419Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:09:48.419Z-->

**Deadlock** (dödläge);;Ett tillstånd där ==varje medlem i en grupp transaktioner väntar på att någon annan medlem ska släppa ett lås==.
<!--SR:!fsrs,2026-09-26T18:27:33.719Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:27:33.719Z!fsrs,2026-09-27T18:13:38.664Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:38.664Z-->

Varför är deadlock särskilt vanligt när klienten kör ett interaktivt program?::För att en transaktion då kan pågå ==länge==. Många objekt blir ==låsta och förblir så==, vilket hindrar andra klienter från att komma åt dem.
<!--SR:!fsrs,2026-09-29T20:20:07.591Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:20:07.591Z-->

Vad är en väntegraf (wait-for graph), och vad betyder en cykel i den?::Noderna är ==transaktioner== och en båge från T till U betyder ==T väntar på att U ska släppa ett lås==. En ==cykel== i grafen är en deadlock.
<!--SR:!fsrs,2026-09-27T18:03:08.622Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:03:08.622Z-->

Vad händer om man abort:ar en transaktion i en deadlock-cykel?::Dess ==lås släpps== och ==cykeln bryts==. En transaktion kan vara med i flera cykler samtidigt, så en enda abort kan bryta ==flera cykler på en gång==.
<!--SR:!fsrs,2026-09-27T18:29:59.086Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:29:59.086Z-->

Vilka tre saker kan man göra åt deadlocks? (3)
||
- **Förebygga** – lås allt vid start, eller lås i förbestämd ordning
- **Upptäcka** – leta cykler i väntegrafen och abort:a en transaktion i cykeln
- **Timeout** – varje lås blir sårbart efter en tid och kan brytas
<!--SR:!fsrs,2026-09-26T20:35:21.483Z,0,0.17250245,8.40750771,3,3,1,0,2026-09-26T20:25:21.483Z-->

Vad är problemet med att låsa alla objekt redan när transaktionen startar?::Två saker. Det ==begränsar åtkomsten till delade resurser i onödan==, och det är ==ibland omöjligt att förutse vilka objekt som ska användas== – i regel just i interaktiva program. Boken kallar metoden ==skenbart enkel men inte särskilt bra==.
<!--SR:!fsrs,2026-09-29T20:17:13.448Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:17:13.448Z-->

Hur fungerar deadlockdetektering?::==Låshanteraren== håller en bild av väntegrafen och ==letar cykler med jämna mellanrum==. Bågar läggs till när en låsbegäran blockeras och tas bort när låset släpps. Hittas en cykel ==väljs en transaktion ut för abort==.
<!--SR:!fsrs,2026-09-27T18:30:07.422Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:30:07.422Z-->

Vad vägs in när man väljer vilken transaktion som ska abort:as?::Boken säger att valet ==inte är enkelt==, och nämner två faktorer som ==kan== vägas in: transaktionens ==ålder== och ==hur många cykler den är inblandad i==.
<!--SR:!fsrs,2026-09-27T18:30:18.774Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:30:18.774Z-->

Hur fungerar en timeout på ett lås?::Låset är ==osårbart en begränsad period==, sedan ==sårbart==. Väntar ingen annan förblir objektet låst ändå. Väntar någon annan ==bryts låset==, den väntande fortsätter, och den vars lås bröts ==abort:as normalt==.
<!--SR:!fsrs,2026-09-27T18:30:14.134Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:30:14.134Z-->

Vad är det värsta problemet med timeout som deadlockmetod?::Att transaktioner ==ibland abort:as bara för att låset blev sårbart medan någon väntade, utan att det fanns någon deadlock alls==. Med detektering abort:ar man i stället ==för att en deadlock faktiskt inträffat==.
<!--SR:!fsrs,2026-09-27T18:13:03.017Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:03.017Z-->

## 2. Dirty reads

**Dirty read** (smutsig läsning);;När en transaktion ==läser ett värde som en annan transaktion skrivit men inte commit:at än==. Abort:ar skrivaren har läsaren sett ett värde som ==aldrig existerat==.
<!--SR:!fsrs,2026-10-01T20:10:33.516Z,5,5.38885005,3.58131923,2,3,0,0,2026-09-26T20:10:33.516Z!fsrs,2026-09-27T18:28:27.791Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:27.791Z-->

Varför skyddar inte serialiserbarhet mot dirty reads?::För att problemet ==inte är flätningen av operationer utan att transaktioner kan abort:a==. Boken visar att en dirty read uppstår ==även i en körning som är serialiserbar==.
<!--SR:!fsrs,2026-09-26T18:29:36.926Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:29:36.926Z-->

Vad gör en dirty read omöjlig att laga i efterhand?::Att läsaren ==kan ha commit:at redan==. Har den commit:at på ett värde som sedan försvinner ==kan det inte göras ogjort==.
<!--SR:!fsrs,2026-09-27T18:28:55.830Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:55.830Z-->

Vad är återhämtningsbarhet (recoverability) som strategi mot dirty reads?::Att ==skjuta upp commit== tills varje annan transaktion vars o-commit:ade tillstånd man har sett själv har commit:at. ==Abort:ar den måste man abort:a också.==
<!--SR:!fsrs,2026-09-29T20:10:10.020Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:10:10.020Z-->

Vad är en kaskadabort (cascading abort)?::Att en abort tvingar en annan transaktion att abort:a, som i sin tur tvingar ytterligare transaktioner att abort:a – ==en kedja av abort:er==.
<!--SR:!fsrs,2026-09-27T18:13:33.568Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:13:33.568Z-->

Hur undviker man kaskadabort:er, och hur starkt är villkoret?::Genom att bara låta transaktioner ==läsa objekt som skrivits av commit:ade transaktioner==, alltså ==skjuta upp läsningar== tills tidigare skrivare commit:at eller abort:at. Boken säger att det är ett ==starkare villkor än återhämtningsbarhet==.
<!--SR:!fsrs,2026-09-27T18:12:09.121Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:12:09.121Z-->

**Strikt körning** (strict execution);;När tjänsten skjuter upp ==både läsning och skrivning== på ett objekt ==tills alla transaktioner som tidigare skrivit objektet har commit:at eller abort:at==. Boken säger att det är detta som ger ==isolering==.
<!--SR:!fsrs,2026-09-26T18:13:59.584Z,1,0.1774331,8.39265542,2,3,0,0,2026-09-25T18:13:59.584Z!fsrs,2026-09-26T18:04:31.438Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:04:31.438Z-->

**Tentativ version** (tentative version);;En ==privat kopia av ett objekt i flyktigt minne== som bara transaktionen själv ser. Vid commit flyttas den över ==i ett enda steg==, vid abort ==raderas den==.
<!--SR:!fsrs,2026-09-27T18:29:25.270Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:29:25.270Z!fsrs,2026-09-27T18:11:34.554Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:11:34.554Z-->

Hur hindrar tidsstämpelordning dirty reads?::Genom sin läsregel: en läsning som kommer ==för tidigt får vänta== på att den tidigare transaktionen blir klar. Commit:ar den läser man dess commit:ade version, abort:ar den tar man ==versionen före==.
<!--SR:!fsrs,2026-09-27T18:27:27.463Z,2,2.29815136,5.63650136,2,3,0,0,2026-09-25T18:27:27.463Z-->

## 3. Optimistisk samtidighetskontroll

Vad är grundidén bakom optimistisk samtidighetskontroll?::Att ==sannolikheten att två transaktioner rör samma objekt är låg i de flesta tillämpningar==. Därför får de köra ==som om ingen konflikt var möjlig==, och kontrollen görs ==först vid commit==.
<!--SR:!fsrs,2026-09-27T18:12:20.313Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:12:20.313Z-->

Vilka tre nackdelar med låsning pekade Kung och Robinson ut? (3)
||
- **Låsunderhåll kostar** – även rena läsningar måste i regel låsa, fast låsning ==bara behövs i värsta fallet==
- **Lås kan ge deadlock** – och varken timeout eller detektering är ==helt tillfredsställande för interaktiva program==
- **Låsen kan inte släppas förrän slutet** – för att undvika kaskadabort:er, vilket ==minskar samtidigheten betydligt==
<!--SR:!fsrs,2026-09-28T20:14:23.137Z,2,1.06546001,8.37949113,2,4,0,0,2026-09-26T20:14:23.137Z-->

Vad visar bokens 1-på-n-räkning?::Två klienter som räknar upp *n* objekt i orelaterade ordningar, med en transaktion per objekt, krockar i genomsnitt med chansen ==1 på n==. Alltså behövs låsning ==bara en gång per n transaktioner==.
<!--SR:!fsrs,2026-09-26T18:04:59.125Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:04:59.125Z-->

Vilka tre faser har en optimistisk transaktion? (3)
||
- **Arbetsfas** – kör fritt mot tentativa versioner
- **Valideringsfas** – vid `closeTransaction`, kontrollera mot överlappande transaktioner
- **Uppdateringsfas** – gör de tentativa versionerna permanenta
<!--SR:!fsrs,2026-09-27T18:12:48.585Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:12:48.585Z-->

Vad händer i arbetsfasen?::Transaktionen arbetar mot ==tentativa versioner== som är kopior av det senast commit:ade värdet, och för två register: en ==läsmängd== med objekten den läst och en ==skrivmängd== med de den skrivit. Eftersom all läsning sker på commit:ade versioner ==kan dirty reads inte uppstå==.
<!--SR:!fsrs,2026-09-27T18:08:23.731Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:08:23.731Z-->

Vad skiljer bakåt- från framåtvalidering?::==Bakåtvalidering== jämför mot ==tidigare överlappande== transaktioner, som redan commit:at, så enda utvägen är att ==abort:a den som valideras==. ==Framåtvalidering== jämför mot ==fortfarande aktiva== transaktioner, och då kan man välja vem som ska abort:a.
<!--SR:!fsrs,2026-09-26T20:28:39.986Z,0,0.001,9.97751004,1,9,0,0,2026-09-26T20:27:39.986Z-->

Vad är den stora nackdelen med optimistisk kontroll?::Att ==en betydande mängd arbete kan behöva göras om när en transaktion abort:as==. Metoden är effektiv ==bara när konflikterna är få==.
<!--SR:!fsrs,2026-09-27T18:29:07.326Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:29:07.326Z-->

**Svält** (starvation);;Att en transaktion ==aldrig kommer fram till commit==, eftersom den krockar på nytt varje gång den startas om. Boken kallar det ==sannolikt sällsynt==, men servern måste ändå hindra det.
<!--SR:!fsrs,2026-09-27T18:28:22.295Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:22.295Z!fsrs,2026-09-27T18:11:43.297Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:11:43.297Z-->

## 4. Tidsstämpelordning mot tvåfaslåsning

Hur fungerar tidsstämpelordning i grunden?::Varje transaktion får ==en unik tidsstämpel när den startar==, som ==bestämmer dess plats i tidsföljden==. Varje operation ==valideras när den utförs==, och går den inte igenom ==abort:as transaktionen omedelbart==.
<!--SR:!fsrs,2026-09-27T17:59:23.241Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:59:23.241Z-->

Vad är grundregeln för när en skrivning respektive läsning är giltig?::En ==skrivning== är giltig bara om objektet ==senast lästs och skrivits av tidigare transaktioner==. En ==läsning== är giltig bara om objektet ==senast skrivits av en tidigare transaktion==.
<!--SR:!fsrs,2026-09-27T18:29:49.054Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:29:49.054Z-->

Varför kan tidsstämpelordning inte hamna i deadlock?::För att transaktioner ==bara väntar på tidigare transaktioner==, så ==ingen cykel kan uppstå i väntegrafen==. Alltså behövs varken detektering, timeout eller förebyggande.
<!--SR:!fsrs,2026-09-27T17:58:52.473Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:58:52.473Z-->

För vilka transaktioner är tidsstämpelordning bättre än strikt 2PL, och när är 2PL bättre?::Tidsstämpelordning, ==särskilt flerversionsvarianten==, är bättre för ==rena läsningstransaktioner==. Tvåfaslåsning är bättre när operationerna ==mest är uppdateringar==.
<!--SR:!fsrs,2026-09-27T18:04:15.206Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:04:15.206Z-->

Vad är skillnaden i när serialiseringsordningen bestäms?::Tidsstämpelordning bestämmer den ==statiskt, när transaktionen startar==. Tvåfaslåsning bestämmer den ==dynamiskt, efter i vilken ordning objekten nås==.
<!--SR:!fsrs,2026-09-27T17:58:17.122Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T17:58:17.122Z-->

Vad vinner flerversions-tidsstämpelordning?::Den håller ==gamla commit:ade versioner==, så ==läsningar som kommer för sent behöver inte avslås== – de läser en gammal version. ==Läsningar tillåts alltid==, och ==regel 2 faller bort== eftersom skrivningar inte längre krockar. Priset är ==lagringsutrymme==.
<!--SR:!fsrs,2026-09-29T20:23:24.156Z,3,3.07506611,5.19004872,2,3,0,0,2026-09-26T20:23:24.156Z-->

Vad är priset för tidsstämpelordning, och vad säger boken om praktiken?::Metoden ==undviker deadlocks men är ganska trolig att orsaka omstarter==. Och ==historiskt är låsning den dominerande metoden== i distribuerade system – CORBA:s tjänst bygger helt på lås.
<!--SR:!fsrs,2026-09-27T18:15:09.936Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:15:09.936Z-->

## 5. Jämförelse av de tre metoderna

**Serialiserbarhet** (serial equivalence);;Att en ==flätad körning av transaktioner ger samma effekt som om de körts en och en i någon ordning==. Samma effekt betyder att ==läsningarna returnerar samma värden== och att ==objekten har samma värden till slut==.
<!--SR:!fsrs,2026-09-27T20:19:20.031Z,1,0.71149248,8.91819814,2,4,0,0,2026-09-26T20:19:20.031Z!fsrs,2026-09-26T17:58:02.225Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T17:58:02.225Z-->

Vad är bokens formella kriterium för serialiserbarhet?::Att ==alla par av konfliktande operationer utförs i samma ordning vid alla objekt som båda transaktionerna använder==. Boken kallar det ==nödvändigt och tillräckligt==. Det räcker alltså inte att varje objekt för sig nås snyggt.
<!--SR:!fsrs,2026-09-26T18:21:24.275Z,1,0.03670404,9.78698263,2,5,0,0,2026-09-25T18:21:24.275Z-->

Vilka operationspar krockar, och vilket gör det inte?::==Läs och läs krockar inte==, eftersom effekten inte beror på ordningen. ==Läs och skriv== krockar, och ==skriv och skriv== krockar, eftersom effekten där beror på ordningen.
<!--SR:!fsrs,2026-10-01T20:18:55.783Z,5,5.38885005,3.58131923,2,3,0,0,2026-09-26T20:18:55.783Z-->

**Tvåfaslåsning** (two-phase locking);;Att en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper dem (krympande fas)== – inga nya lås efter det första släppta.
<!--SR:!fsrs,2026-09-26T18:27:59.511Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:27:59.511Z!fsrs,2026-10-01T20:11:25.563Z,5,5.38885005,3.58131923,2,3,0,0,2026-09-26T20:11:25.563Z-->

Vad gör strikt tvåfaslåsning "strikt"?::Att ==alla lås hålls till transaktionen commit:ar eller abort:ar==, i stället för att släppas så fort objektet är klart. Det är det som ger ==strikta körningar== och därmed skydd mot dirty reads.
<!--SR:!fsrs,2026-09-27T18:28:42.502Z,2,2.29815136,3.4641143,2,2,0,0,2026-09-25T18:28:42.502Z-->

Vilka två låstyper använder boken, och vad händer när ett lås inte kan sättas?::==Läslås== (delade) och ==skrivlås==, alltså ==många läsare, en skrivare==. Går låset inte att sätta direkt ==får transaktionen vänta – en begäran avslås aldrig==.
<!--SR:!fsrs,2026-09-26T18:03:57.062Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-25T18:03:57.062Z-->

Vad är bokens sammanfattande axel för all samtidighetskontroll?::Att den åstadkoms ==antingen genom att transaktioner väntar på varandra, eller genom att starta om dem efter en upptäckt konflikt, eller en kombination==. Låsning är väntandet, de andra två är omstarterna.
<!--SR:!fsrs,2026-09-26T18:15:38.727Z,1,0.07856591,9.44205284,2,4,0,0,2026-09-25T18:15:38.727Z-->

Hur skiljer de tre metoderna sig vid en konflikt, och vilken kan ge deadlock? (3)
||
- **Strikt 2PL** – transaktionen ==väntar==; ==enda metoden som kan ge deadlock==
- **Tidsstämpelordning** – ==abort direkt==, men man väntar bara på tidigare, så ingen deadlock
- **Optimistisk** – ==abort vid commit== och arbetet görs om; inga lås, alltså ingen deadlock
<!--SR:!fsrs,2026-09-26T18:09:37.139Z,1,0.1774331,8.39265542,2,3,0,0,2026-09-25T18:09:37.139Z-->
