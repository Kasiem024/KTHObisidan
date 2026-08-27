---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-27
description: "Begrepp: inkapsling (encapsulation) (HI1032)."
---
# Inkapsling

## Definition

Att varje lager ==lägger till sitt eget huvud== (och ibland släp) runt dataenheten från lagret ovanför innan den skickas nedåt i stacken. Mottagaren *avkapslar* i omvänd ordning. Därför byter dataenheten namn per lager: meddelande → segment → datagram → ram → bitar.

## Kopplat till

- [[Protokollskiktning]]
- [[TCP-IP-modellen]]

## Flashcards

**Inkapsling** (encapsulation) ==DISABLEDFLASHCARD== Att ett lager ==lägger till sitt eget huvud== på dataenheten från lagret ovanför innan den skickas nedåt.

Vad heter dataenheten (PDU) i varje TCP/IP-lager? (5)
==DISABLEDFLASHCARD==
- Applikation: meddelande · Transport: segment/user datagram · Nätverk: datagram · Datalänk: ram · Fysiskt: bitar
