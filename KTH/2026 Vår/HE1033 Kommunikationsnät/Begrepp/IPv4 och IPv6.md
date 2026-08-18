---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# IPv4 och IPv6

> **Lager:** OSI 3 (Nätverk)
> **Viktigt:** Global adressering.

---

## Definition
Huvudprotokollen för adressering på internet.

### Skillnader (Viktigt!)
| Egenskap | IPv4 | IPv6 |
| :--- | :--- | :--- |
| **Adresslängd** | 32 bitar | 128 bitar |
| **Fragmentering** | Routern kan fragmentera | Endast sändaren kan fragmentera |
| **Checksum** | I headern (beräknas i varje hopp) | Ingen checksum i headern |
| **Broadcast** | Ja | Nej (ersatt av Multicast) |

## Tenta-fokus
- **Header-förändringar:** När ett paket passerar en router minskas **TTL** (Time To Live) med 1. Om TTL blir 0 kastas paketet och ett [[ICMP]] "Time Exceeded" skickas.
- **Header Checksum:** Beräknas om i varje router i IPv4 pga TTL-ändring.

## Kopplat till
- **Adressering:** [[Subnätning och CIDR]], [[MAC-adress]]
- **Kontroll:** [[ICMP]], [[ARP]]

## Flashcards

Nämn två stora skillnader mellan IPv4 och IPv6.:: IPv6 har längre adresser (128 bit) och saknar broadcast (använder multicast).

Vilka fält ändras ALLTID i en IPv4 header vid passage genom en router?:: TTL (Time To Live) och Header Checksum.
