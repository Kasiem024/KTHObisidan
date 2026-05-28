---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
---
# ARP
> **Lager:** OSI 2.5 (Hybrid)
> **Mål:** Koppla ihop IP och MAC.

---

## Definition
**ARP (Address Resolution Protocol)** används för att hitta en enhets [[MAC-adress]] när man bara vet dess IP-adress.

### Hur det fungerar
1. En enhet skickar en **ARP Request** som en broadcast till alla på lokalnätet: "Vem har IP 192.168.1.5?".
2. Den enhet som har adressen svarar med en **ARP Reply** (unicast): "Det är jag, här är min MAC-adress".

## Tenta-fokus
- **Broadcast-adress:** Förfrågan skickas till `FF:FF:FF:FF:FF:FF`.
- **Caching:** Resultaten sparas i en "ARP-tabell" så man slipper fråga varje gång.
- **Lager:** Protokollet behövs för att lager 3 (IP) ska kunna skicka data över lager 2 (Ethernet).

## Kopplat till
- **Adressering:** [[MAC-adress]], [[IPv4 och IPv6]]
- **Underlager:** [[LLC och MAC]]

## Flashcards

Vilket protokoll översätter IP-adresser till MAC-adresser?:: ARP.

Skickas en ARP Reply som broadcast eller unicast?:: Unicast (direkt till den som frågade).
