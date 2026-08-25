---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1031 kap 15 – koordinering och överenskommelse: ömsesidig uteslutning, val, multicast-ordning och konsensus."
---
# HI1031 Begrepp - Kap 15 Koordinering och överenskommelse

**Distribuerad ömsesidig uteslutning** (mutual exclusion);;Att se till att ==bara en process åt gången== är i sin kritiska sektion (använder en delad resurs), trots avsaknad av delat minne.

Vad är syftet med en *val-algoritm* (election)?::Att låta processerna ==komma överens om en ny koordinator== – t.ex. efter att den gamla kraschat – så att exakt en väljs.

## Ordnad multicast

Vilka leveransordningar kan man garantera för multicast? (3)
||
- **FIFO** – meddelanden från *samma* avsändare levereras i sändningsordning
- **Kausal** (causal) – om ett meddelande orsaksberoende föregår ett annat levereras det först
- **Total** – *alla* mottagare får meddelandena i samma ordning

**Total ordning** (totally ordered multicast);;När ==alla mottagare levererar meddelandena i exakt samma ordning==, även om de kommer från olika avsändare.

**Kausal ordning** (causal multicast);;När ett meddelande som ==orsaksberoende föregår== ett annat garanterat levereras före det.

## Överenskommelse

**Konsensus** (consensus);;Problemet att få en grupp processer att ==enas om ett gemensamt värde==, trots att vissa av dem kan fela.

Vad säger det berömda omöjlighetsresultatet om konsensus (FLP)?::Att i ett *asynkront* system går det ==inte att garantera konsensus== om ens en enda process kan krascha – trots att det ofta lyckas i praktiken.

**Byzantine generals-problemet**;;En modell för överenskommelse där vissa deltagare kan vara ==förrädiska och ljuga==; frågan är hur de lojala ändå kan enas om ett gemensamt beslut.
