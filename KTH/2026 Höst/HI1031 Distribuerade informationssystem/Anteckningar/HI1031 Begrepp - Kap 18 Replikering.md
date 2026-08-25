---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 18 – replikering: mål, replikahanterare, passiv/aktiv replikering samt konsistensmodeller och kvorum."
---
# HI1031 Begrepp - Kap 18 Replikering

Varför replikerar man data i ett distribuerat system? (3)
||
- **Prestanda** – kopior nära klienten minskar väntetiden
- **Tillgänglighet** – tjänsten fungerar även om en server är nere
- **Feltolerans** – systemet överlever krascher (och t.o.m. felaktiga svar)

**Replikering** (replication);;Att ==hålla kopior av samma data på flera datorer== för att öka prestanda, tillgänglighet och feltolerans.

**Replikahanterare** (replica manager);;En komponent som ==lagrar och sköter en kopia (replika)== av datan och utför operationer på den.

Vad skiljer passiv (primary-backup) från aktiv replikering?
||
- **Passiv:** all trafik går via *en* primär replika; en backup ==tar över om den kraschar==.
- **Aktiv:** *alla* replikor tar emot och bearbetar varje förfrågan oberoende (via multicast).

**Linjäriserbarhet** (linearizability);;Den *starkaste* konsistensmodellen: varje operation verkar ske ==momentant vid en punkt mellan sin start och sitt slut==, i realtidsordning.

**Sekventiell konsistens** (sequential consistency);;En modell där alla ser operationerna i ==samma ordning== (förenlig med varje process egen ordning), men *inte* nödvändigtvis i realtidsordning.

**Kvorum** (quorum);;Kravet att en operation måste godkännas av ett ==tillräckligt stort antal replikor== (t.ex. en majoritet) för att garantera konsistens trots att alla inte är nåbara.
