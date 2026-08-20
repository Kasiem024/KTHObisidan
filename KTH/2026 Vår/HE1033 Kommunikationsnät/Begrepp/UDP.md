---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "UDP (User Datagram Protocol) skickar paket utan att först etablera en anslutning eller kontrollera om de kommit fram."
created: 2026-05-28
updated: 2026-05-28
---
# UDP

> **Lager:** OSI 4 (Transport)
> **Egenskap:** Connectionless, Best-effort.

---

## Definition

**UDP (User Datagram Protocol)** skickar paket utan att först etablera en anslutning eller kontrollera om de kommit fram.

### Varför UDP?

- **Snabbhet:** Ingen handskakning sparar tid.
- **Låg overhead:** Minimal header (8 byte).
- **Realtid:** Bättre att tappa enstaka paket än att vänta på omsändningar i t.ex. röstsamtal.

## Tenta-fokus

- **Användning:** Streaming (Video/Ljud), onlinespel, [[DNS]] och [[DHCP]].
- **Ordning:** Paket kan komma fram i fel ordning, applikationen måste hantera det om det behövs.

## Kopplat till

- **Alternativ:** [[TCP]]
- **Protokoll:** [[DNS]], [[DHCP]]

## Flashcards

Varför är UDP bättre lämpat för VoIP (röstsamtal) än TCP?:: För att omsändningar i TCP skulle skapa störande fördröjningar; det är bättre att bara tappa det lilla ljudet.

Hur stor är en UDP header?:: 8 byte.
