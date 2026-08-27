---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-27
description: "Begrepp: marshalling (HI1031)."
---
# Marshalling

## Definition

Att ==omvandla data till en följd av bytes== som kan skickas över nätet, och tillbaka igen (*unmarshalling*) hos mottagaren. Behövs eftersom olika datorer lagrar data olika (byteordning, teckenkodning); en gemensam *extern datarepresentation* (t.ex. CORBA CDR, XML) gör datan tolkbar oavsett arkitektur.

## Kopplat till

- [[Fjärrprocedursanrop (RPC)]]
- [[Fjärrmetodanrop (RMI)]]

## Flashcards

**Marshalling** ==DISABLEDFLASHCARD== Att ==omvandla data till en följd av bytes== som kan skickas över nätet (och tillbaka via *unmarshalling*), oberoende av datorarkitektur.
