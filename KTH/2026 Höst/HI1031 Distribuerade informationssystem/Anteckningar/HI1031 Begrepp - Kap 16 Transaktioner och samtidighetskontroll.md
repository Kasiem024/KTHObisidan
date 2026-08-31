---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026, nosr]
created: 2026-08-24
updated: 2026-08-31
description: "Flashcards HI1031 kap 16 – transaktioner och samtidighetskontroll: ACID, serialiserbarhet, låsning, optimistisk och tidsstämpelordning."
---
# HI1031 Begrepp - Kap 16 Transaktioner och samtidighetskontroll

**Transaktion**;;En sekvens av operationer som utförs som ==en enda odelbar enhet== – antingen slutförs alla (commit) eller ingen (abort).

Vilka egenskaper sammanfattas i *ACID*? (4)
||
- **Atomicitet** – allt eller inget
- **Konsistens** – tar systemet från ett giltigt tillstånd till ett annat
- **Isolering** – samtidiga transaktioner stör inte varandra
- **Varaktighet** (durability) – resultatet överlever krascher

**Atomicitet** (atomicity);;Att en transaktion är ==allt-eller-inget== – antingen utförs alla dess operationer, eller så blir det som om ingen skedde.

**Isolering** (isolation);;Att samtidiga transaktioner ==inte ser varandras mellanresultat== – var och en ser ut att köra ensam.

**Serialiserbarhet** (serial equivalence);;Kravet att en flätad körning av transaktioner ger ==samma resultat som om de körts en och en== i någon ordning.

Vad är "lost update"-problemet?::När två transaktioner läser samma värde och båda skriver tillbaka – den enas uppdatering ==skrivs över och försvinner==.

Vad är "dirty read"-problemet?::När en transaktion ==läser ett värde som en annan transaktion skrivit men ännu inte commit:at==. Om den andra sedan abort:ar har man läst ett värde som aldrig blev giltigt. Undviks genom att bara läsa *committade* värden.

## Samtidighetskontroll

Vilka tre metoder finns för samtidighetskontroll? (3)
||
- **Låsning** (two-phase locking) – transaktioner *låser* objekt; risk för deadlock
- **Optimistisk** – kör fritt och *validerar* först vid commit
- **Tidsstämpelordning** – en tidsstämpel per transaktion avgör ordningen

**Tvåfaslåsning** (two-phase locking, 2PL);;En strategi där en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper lås== (krympande fas); garanterar serialiserbarhet.

**Deadlock** (dödläge);;När transaktioner ==väntar på varandras lås i en cykel== så att ingen kan komma vidare.

**Optimistisk samtidighetskontroll**;;Transaktioner får köra *fritt utan lås* och ==valideras först vid commit==; upptäcks en konflikt då abort:as transaktionen. Effektivt när konflikter är sällsynta, men arbete måste göras om vid abort.

**Tidsstämpelordning** (timestamp ordering);;Varje transaktion får en tidsstämpel *när den startar*, som ==bestämmer serialiseringsordningen i förväg==. Vid konflikt abort:as transaktionen *direkt* (låsning låter den i stället vänta). Bra för lästunga transaktioner.
