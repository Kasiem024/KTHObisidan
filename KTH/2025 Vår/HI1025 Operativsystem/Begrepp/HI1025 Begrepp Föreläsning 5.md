---
tags: [begrepp, HI1025, KTH, year2025]
---
Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`


---

## Begrepp

Inter Process Communication (IPC) (Definition):: Metoder för hur separata processer kan **utbyta data** och synkronisera med varandra. Exempel är delat minne, meddelandeköer (message queues), pipes och signaler. Nödvändigt för **samarbete mellan processer**.
<!--SR:!2025-05-15,7,257!2025-05-15,7,297-->

Threads (Definition):: **Parallella aktiviteter** inom en process som delar adressrymd men har egen programräknare och register.
<!--SR:!2025-04-19,1,237!2025-04-21,3,257-->

 POSIX API (Definition):: En standardiserad uppsättning **C-funktionsanrop** för att skapa och hantera trådar
<!--SR:!2025-04-19,3,270!2025-04-21,3,277-->

Single- vs. Multithread (Definition);; En single-threaded process har en tråd. En multi-threaded process har flera trådar som kan köra parallellt.
<!--SR:!2025-05-20,7,290-->

Race condition (Definition):: Uppstår när flera trådar kommer åt delad data samtidigt och resultatet beror på den exakta ordningen i vilken trådarna exekveras.
<!--SR:!2025-04-21,3,257!2025-05-15,7,297-->

Critical Section (Definition):: En kodavsnitt som accessar en **delad resurs** (t.ex. en global variabel eller datastruktur) och som inte får exekveras av fler än en tråd åt gången för att undvika **race conditions**.
<!--SR:!2025-04-19,1,237!2025-05-15,7,290-->

Mutual exclusion (Definition):: Egenskapen som garanterar att högst en tråd åt gången kan exekvera kod inom en given kritisk sektion. Uppnås oftast genom att använda lås (locks/mutexes).
<!--SR:!2025-05-20,7,257!2025-04-23,3,277-->

Atomic instruction (Definition):: En instruktion som antingen slutförs, eller så sker ingenting. Den kan inte avbrytas mitt i, och dess effekter blir synliga som en enda, odelbar operation. Grundläggande byggsten för synkronisering.
<!--SR:!2025-05-20,7,277!2025-04-21,3,277-->

Test-and-set Instruction (TAS) (Definition):: En atomär instruktion som skriver 1 (satt/låst) till en minnesadress och returnerar dess _tidigare_ värde (0 eller 1). Används ofta för att implementera enkla spin locks.
<!--SR:!2025-05-15,7,258!2025-05-19,2,238-->

Compare-and-swap Instruction (CAS) (Definition):: En atomär instruktion som jämför innehållet i en minnesadress med ett förväntat värde. _Om_ de är lika, modifieras minnesplatsen med ett nytt värde; annars sker ingen ändring. Returnerar oftast det ursprungliga värdet, eller en flagga som indikerar framgång/misslyckande.
<!--SR:!2025-05-10,2,237!2025-05-15,7,277-->

Load-link/Store-conditional (LL/SC) Instruction (Definition)
||
Ett _par_ av atomära instruktioner som används tillsammans för lås och lock-free-strukturer.
- **Load-link** läser ett värde från minnet.
- **Store-conditional** skriver ett nytt värde till samma minnesplats _endast_ om ingen annan tråd har skrivit till platsen sedan load-link utfördes. Returnerar success/failure.
<!--SR:!2025-05-15,7,279-->

Fetch-and-add (FAA) Instruction (Definition):: En atomär instruktion som ökar (eller minskar) värdet på en minnesplats och returnerar det gamla värdet. Kan användas för att implementera "ticket locks".
<!--SR:!2025-04-19,3,250!2025-05-20,7,330-->

Spin lock (Definition):: Ett lås där en väntande tråd _aktivt_ loopar ("spinner") och upprepade gånger kollar om låset är ledigt, istället för att blockeras av OS. Kallas "busy-waiting". Slösar CPU-tid under väntan, men kan vara effektivt om väntetiden förväntas vara mycket kort (kortare än ett kontextbyte)
<!--SR:!2025-05-15,7,297!2025-04-21,3,277-->

Condition Variable (Definition):: Ett kö-objekt som låter trådar vänta på att ett visst villkor ska bli sant. Används _alltid_ tillsammans med ett lås (mutex). En tråd väntar genom `wait()` och väcks av en annan tråd via `signal()` eller `broadcast()`.
<!--SR:!2025-04-21,1,237!2025-05-15,7,277-->

Signal, Wait, Broadcast (Definition) (3)
||
Operationer på konditionsvariabler.
- **Wait** släpper mutexen och försätter tråden i väntetillstånd på konditionsvariabeln tills den signaleras.
- **Signal** väcker en enda tråd som väntar på konditionsvariabeln.
- **Broadcast** väcker alla trådar som väntar på konditionsvariabeln.
<!--SR:!2025-04-19,1,237-->
