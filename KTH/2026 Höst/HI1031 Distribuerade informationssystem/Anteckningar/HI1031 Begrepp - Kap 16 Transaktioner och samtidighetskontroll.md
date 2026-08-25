---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
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

## Samtidighetskontroll

Vilka tre metoder finns för samtidighetskontroll? (3)
||
- **Låsning** (two-phase locking) – transaktioner *låser* objekt; risk för deadlock
- **Optimistisk** – kör fritt och *validerar* först vid commit
- **Tidsstämpelordning** – en tidsstämpel per transaktion avgör ordningen

**Tvåfaslåsning** (two-phase locking, 2PL);;En strategi där en transaktion ==först bara skaffar lås (växande fas) och sedan bara släpper lås== (krympande fas); garanterar serialiserbarhet.

**Deadlock** (dödläge);;När transaktioner ==väntar på varandras lås i en cykel== så att ingen kan komma vidare.
