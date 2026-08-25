---
tags: [begrepp, HI1031, databaser, programmering, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Begrepp: anropssemantik (invocation semantics) (HI1031)."
---
# Anropssemantik

## Definition

Vilka garantier ett fjärranrop ger vid fel. Tre nivåer: **maybe** (inga garantier, 0 eller 1 gång), **at-least-once** (upprepas tills svar, kan ske flera gånger) och **at-most-once** (utförs högst en gång). *Idempotenta* operationer gör at-least-once säkert.

## Kopplat till

- [[Fjärrprocedursanrop (RPC)]]
- [[Fjärrmetodanrop (RMI)]]

## Flashcards

Vilka tre anropssemantiker finns för fjärranrop? (3)
||
- **Maybe** – inga garantier (0 eller 1 gång)
- **At-least-once** – upprepas tills svar; kan ske flera gånger
- **At-most-once** – utförs högst en gång

**At-most-once-semantik**;;Garantin att en operation ==utförs högst en gång== – klienten får ett resultat eller ett fel, aldrig dubbelkörning.
