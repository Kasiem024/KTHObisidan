---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-09-10
description: "Flashcards HI1031 kap 16, byggda mot tentafrågorna: deadlocks, dirty reads, optimistisk samtidighetskontroll, tidsstämpelordning och jämförelsen mellan de tre metoderna."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

## 1. Deadlocks

**Transaktion**;;En följd av operationer som utförs som ==en enda odelbar enhet== – antingen genomförs alla, eller så blir det som om ingen skedde.

Vad betyder det att commit:a respektive abort:a en transaktion?::==Commit:a== betyder att avsluta den så att ==alla ändringar sparas permanent== och blir synliga för andra. ==Abort:a== betyder att avsluta den så att ==ingen av dess effekter syns== för framtida transaktioner.

**Deadlock** (dödläge);;Ett tillstånd där ==varje medlem i en grupp transaktioner väntar på att någon annan medlem ska släppa ett lås==.

Varför är deadlock särskilt vanligt när klienten kör ett interaktivt program?::För att en transaktion då kan pågå ==länge==. Många objekt blir ==låsta och förblir så==, vilket hindrar andra klienter från att komma åt dem.

Vad är en väntegraf (wait-for graph), och vad betyder en cykel i den?::Noderna är ==transaktioner== och en båge från T till U betyder ==T väntar på att U ska släppa ett lås==. En ==cykel== i grafen är en deadlock.

Vad händer om man abort:ar en transaktion i en deadlock-cykel?::Dess ==lås släpps== och ==cykeln bryts==. En transaktion kan vara med i flera cykler samtidigt, så en enda abort kan bryta ==flera cykler på en gång==.

Vilka tre saker kan man göra åt deadlocks? (3)
||
- **Förebygga** – lås allt vid start, eller lås i förbestämd ordning
- **Upptäcka** – leta cykler i väntegrafen och abort:a en transaktion i cykeln
- **Timeout** – varje lås blir sårbart efter en tid och kan brytas

Vad är problemet med att låsa alla objekt redan när transaktionen startar?::Två saker. Det ==begränsar åtkomsten till delade resurser i onödan==, och det är ==ibland omöjligt att förutse vilka objekt som ska användas== – i regel just i interaktiva program. Boken kallar metoden ==skenbart enkel men inte särskilt bra==.

Hur fungerar deadlockdetektering?::==Låshanteraren== håller en bild av väntegrafen och ==letar cykler med jämna mellanrum==. Bågar läggs till när en låsbegäran blockeras och tas bort när låset släpps. Hittas en cykel ==väljs en transaktion ut för abort==.

Vad vägs in när man väljer vilken transaktion som ska abort:as?::Boken säger att valet ==inte är enkelt==, och nämner två faktorer som ==kan== vägas in: transaktionens ==ålder== och ==hur många cykler den är inblandad i==.

Hur fungerar en timeout på ett lås?::Låset är ==osårbart en begränsad period==, sedan ==sårbart==. Väntar ingen annan förblir objektet låst ändå. Väntar någon annan ==bryts låset==, den väntande fortsätter, och den vars lås bröts ==abort:as normalt==.

Vad är det värsta problemet med timeout som deadlockmetod?::Att transaktioner ==ibland abort:as bara för att låset blev sårbart medan någon väntade, utan att det fanns någon deadlock alls==. Med detektering abort:ar man i stället ==för att en deadlock faktiskt inträffat==.

## 2. Dirty reads

**Dirty read** (smutsig läsning);;När en transaktion ==läser ett värde som en annan transaktion skrivit men inte commit:at än==. Abort:ar skrivaren har läsaren sett ett värde som ==aldrig existerat==.

Varför skyddar inte serialiserbarhet mot dirty reads?::För att problemet ==inte är flätningen av operationer utan att transaktioner kan abort:a==. Boken visar att en dirty read uppstår ==även i en körning som är serialiserbar==.

Vad gör en dirty read omöjlig att laga i efterhand?::Att läsaren ==kan ha commit:at redan==. Har den commit:at på ett värde som sedan försvinner ==kan det inte göras ogjort==.

Vad är återhämtningsbarhet (recoverability) som strategi mot dirty reads?::Att ==skjuta upp commit== tills varje annan transaktion vars o-commit:ade tillstånd man har sett själv har commit:at. ==Abort:ar den måste man abort:a också.==

Vad är en kaskadabort (cascading abort)?::Att en abort tvingar en annan transaktion att abort:a, som i sin tur tvingar ytterligare transaktioner att abort:a – ==en kedja av abort:er==.

Hur undviker man kaskadabort:er, och hur starkt är villkoret?::Genom att bara låta transaktioner ==läsa objekt som skrivits av commit:ade transaktioner==, alltså ==skjuta upp läsningar== tills tidigare skrivare commit:at eller abort:at. Boken säger att det är ett ==starkare villkor än återhämtningsbarhet==.

**Strikt körning** (strict execution);;När tjänsten skjuter upp ==både läsning och skrivning== på ett objekt ==tills alla transaktioner som tidigare skrivit objektet har commit:at eller abort:at==. Boken säger att det är detta som ger ==isolering==.

**Tentativ version** (tentative version);;En ==privat kopia av ett objekt i flyktigt minne== som bara transaktionen själv ser. Vid commit flyttas den över ==i ett enda steg==, vid abort ==raderas den==.

Vad är en för tidig skrivning (premature write)?::När två transaktioner ==skriver samma objekt== och abort genomförs genom att återställa ==förebilder==. Commit:ar den ena och den andra abort:ar blir slutvärdet fel. Botemedlet är att ==skjuta upp skrivningar== tills tidigare skrivare är klara.

Hur hindrar tidsstämpelordning dirty reads?::Genom sin läsregel: en läsning som kommer ==för tidigt får vänta== på att den tidigare transaktionen blir klar. Commit:ar den läser man dess commit:ade version, abort:ar den tar man ==versionen före==.

## 3. Optimistisk samtidighetskontroll

Vad är grundidén bakom optimistisk samtidighetskontroll?::Att ==sannolikheten att två transaktioner rör samma objekt är låg i de flesta tillämpningar==. Därför får de köra ==som om ingen konflikt var möjlig==, och kontrollen görs ==först vid commit==.

Vilka tre nackdelar med låsning pekade Kung och Robinson ut? (3)
||
- **Låsunderhåll kostar** – även rena läsningar måste i regel låsa, fast låsning ==bara behövs i värsta fallet==
- **Lås kan ge deadlock** – och varken timeout eller detektering är ==helt tillfredsställande för interaktiva program==
- **Låsen kan inte släppas förrän slutet** – för att undvika kaskadabort:er, vilket ==minskar samtidigheten betydligt==

Vad visar bokens 1-på-n-räkning?::Två klienter som räknar upp *n* objekt i orelaterade ordningar, med en transaktion per objekt, krockar i genomsnitt med chansen ==1 på n==. Alltså behövs låsning ==bara en gång per n transaktioner==.

Vilka tre faser har en optimistisk transaktion? (3)
||
- **Arbetsfas** – kör fritt mot tentativa versioner
- **Valideringsfas** – vid `closeTransaction`, kontrollera mot överlappande transaktioner
- **Uppdateringsfas** – gör de tentativa versionerna permanenta

Vad händer i arbetsfasen?::Transaktionen arbetar mot ==tentativa versioner== som är kopior av det senast commit:ade värdet, och för två register: en ==läsmängd== med objekten den läst och en ==skrivmängd== med de den skrivit. Eftersom all läsning sker på commit:ade versioner ==kan dirty reads inte uppstå==.

Vad jämför bakåtvalidering, och vilken utväg finns vid konflikt?::Den jämför ==den validerande transaktionens läsmängd mot skrivmängderna hos tidigare överlappande transaktioner==. Eftersom de andra ==redan commit:at== är ==enda utvägen att abort:a den som valideras==.

Vad jämför framåtvalidering, och vilken frihet ger det?::Den jämför ==den validerande transaktionens skrivmängd mot läsmängderna hos aktiva transaktioner==. Eftersom de andra ==fortfarande är aktiva== kan man välja: skjuta upp valideringen, abort:a de konfliktande, eller abort:a sig själv.

Vad är den stora nackdelen med optimistisk kontroll?::Att ==en betydande mängd arbete kan behöva göras om när en transaktion abort:as==. Metoden är effektiv ==bara när konflikterna är få==.

**Svält** (starvation);;Att en transaktion ==aldrig kommer fram till commit==, eftersom den krockar på nytt varje gång den startas om. Boken kallar det ==sannolikt sällsynt==, men servern måste ändå hindra det.

Hur ser optimistisk kontroll ut i moderna system?::==Dropbox== och ==Wikipedia== accepterar båda ==den första skrivningen== och lämnar konflikten till användaren – versionshistorik respektive en redigeringskonflikt. De ==löser konflikten i efterhand i stället för att abort:a==.

## 4. Tidsstämpelordning mot tvåfaslåsning

Hur fungerar tidsstämpelordning i grunden?::Varje transaktion får ==en unik tidsstämpel när den startar==, som ==bestämmer dess plats i tidsföljden==. Varje operation ==valideras när den utförs==, och går den inte igenom ==abort:as transaktionen omedelbart==.

Vad är grundregeln för när en skrivning respektive läsning är giltig?::En ==skrivning== är giltig bara om objektet ==senast lästs och skrivits av tidigare transaktioner==. En ==läsning== är giltig bara om objektet ==senast skrivits av en tidigare transaktion==.

Vad håller servern reda på per objekt i tidsstämpelordning?::En ==skrivtidsstämpel==, en mängd ==tentativa versioner== med egna skrivtidsstämplar, och en mängd ==lästidsstämplar== som kan representeras av ==sin största medlem==.

Varför kan tidsstämpelordning inte hamna i deadlock?::För att transaktioner ==bara väntar på tidigare transaktioner==, så ==ingen cykel kan uppstå i väntegrafen==. Alltså behövs varken detektering, timeout eller förebyggande.

För vilka transaktioner är tidsstämpelordning bättre än strikt 2PL, och när är 2PL bättre?::Tidsstämpelordning, ==särskilt flerversionsvarianten==, är bättre för ==rena läsningstransaktioner==. Tvåfaslåsning är bättre när operationerna ==mest är uppdateringar==.

Vad är skillnaden i när serialiseringsordningen bestäms?::Tidsstämpelordning bestämmer den ==statiskt, när transaktionen startar==. Tvåfaslåsning bestämmer den ==dynamiskt, efter i vilken ordning objekten nås==.

Vad vinner flerversions-tidsstämpelordning?::Den håller ==gamla commit:ade versioner==, så ==läsningar som kommer för sent behöver inte avslås== – de läser en gammal version. ==Läsningar tillåts alltid==, och ==regel 2 faller bort== eftersom skrivningar inte längre krockar. Priset är ==lagringsutrymme==.

Vad är priset för tidsstämpelordning, och vad säger boken om praktiken?::Metoden ==undviker deadlocks men är ganska trolig att orsaka omstarter==. Och ==historiskt är låsning den dominerande metoden== i distribuerade system – CORBA:s tjänst bygger helt på lås.

## 5. Jämförelse av de tre metoderna

**Serialiserbarhet** (serial equivalence);;Att en ==flätad körning av transaktioner ger samma effekt som om de körts en och en i någon ordning==. Samma effekt betyder att ==läsningarna returnerar samma värden== och att ==objekten har samma värden till slut==.

Vad är bokens formella kriterium för serialiserbarhet?::Att ==alla par av konfliktande operationer utförs i samma ordning vid alla objekt som båda transaktionerna använder==. Boken kallar det ==nödvändigt och tillräckligt==. Det räcker alltså inte att varje objekt för sig nås snyggt.

Vilka operationspar krockar, och vilket gör det inte?::==Läs och läs krockar inte==, eftersom effekten inte beror på ordningen. ==Läs och skriv== krockar, och ==skriv och skriv== krockar, eftersom effekten där beror på ordningen.

Vad är problemet "förlorad uppdatering" (lost update)?::När två transaktioner ==läser det gamla värdet och räknar fram det nya ur det==, så den enas uppdatering skrivs över. Bokens exempel höjer 200 med 10 procent två gånger: rätt svar är 242, samtidig körning ger ==220==.

Vad är problemet "inkonsistent hämtning" (inconsistent retrievals)?::När en transaktion ==summerar flera objekt medan en annan hunnit göra bara halva sin överföring==, så summan blir fel. Bokens exempel får 300 i stället för 400.

**Tvåfaslåsning** (two-phase locking);;Att en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper dem (krympande fas)== – inga nya lås efter det första släppta.

Vad gör strikt tvåfaslåsning "strikt"?::Att ==alla lås hålls till transaktionen commit:ar eller abort:ar==, i stället för att släppas så fort objektet är klart. Det är det som ger ==strikta körningar== och därmed skydd mot dirty reads.

Vilka två låstyper använder boken, och vad händer när ett lås inte kan sättas?::==Läslås== (delade) och ==skrivlås==, alltså ==många läsare, en skrivare==. Går låset inte att sätta direkt ==får transaktionen vänta – en begäran avslås aldrig==.

Vad är bokens sammanfattande axel för all samtidighetskontroll?::Att den åstadkoms ==antingen genom att transaktioner väntar på varandra, eller genom att starta om dem efter en upptäckt konflikt, eller en kombination==. Låsning är väntandet, de andra två är omstarterna.

Hur skiljer de tre metoderna sig vid en konflikt, och vilken kan ge deadlock? (3)
||
- **Strikt 2PL** – transaktionen ==väntar==; ==enda metoden som kan ge deadlock==
- **Tidsstämpelordning** – ==abort direkt==, men man väntar bara på tidigare, så ingen deadlock
- **Optimistisk** – ==abort vid commit== och arbetet görs om; inga lås, alltså ingen deadlock
