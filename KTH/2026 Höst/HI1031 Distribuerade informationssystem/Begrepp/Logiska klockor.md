---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Begrepp: logiska klockor (HI1031)."
---
# Logiska klockor

## Definition

Ett sätt att ==ordna händelser efter orsak–verkan utan en gemensam fysisk klocka==. En *Lamport-klocka* är en räknare som ökar vid varje händelse och skickas med meddelanden. En *vektorklocka* (en räknare per process) kan dessutom avgöra om två händelser är orsaksberoende eller *samtidiga*.

## Kopplat till

- [[Distribuerat system]]
- [[Konsensus]]

## Flashcards

**Logisk klocka** (Lamport);;En räknare som ==ökar vid varje händelse och följer med meddelanden==, för att ordna händelser efter orsak–verkan utan fysisk klocka.

Vad kan en vektorklocka som en Lamport-klocka inte kan?::Avgöra *exakt* om två händelser är ==orsaksberoende eller samtidiga== (concurrent).
