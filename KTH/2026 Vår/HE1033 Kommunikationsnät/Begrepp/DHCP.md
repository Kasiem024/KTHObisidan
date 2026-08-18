---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
description: "### DORA-processen (Viktigt!) 1. Discover: Klienten skriker: \"Finns det någon server här?\" (Broadcast). 2."
created: 2026-05-28
updated: 2026-05-28
---
# DHCP

> **Lager:** OSI 7 (Applikation)
> **Mål:** Automatisk nätverkskonfiguration.

---

## Definition
**DHCP (Dynamic Host Configuration Protocol)** gör att enheter kan få IP-adress, nätmask, gateway och DNS-server automatiskt när de ansluter.

### DORA-processen (Viktigt!)
1. **Discover:** Klienten skriker: "Finns det någon server här?" (Broadcast).
2. **Offer:** Servern svarar: "Jag finns, här är ett förslag på adress."
3. **Request:** Klienten: "Tack, jag tar den!"
4. **Acknowledge:** Servern: "Okej, den är din under en begränsad tid (Lease)."

## Tenta-fokus
- **Lease time:** Adressen är bara "lånad". Klienten måste förnya den innan tiden går ut.
- **Broadcast:** Processen börjar med broadcasts eftersom klienten inte har någon IP än.

## Kopplat till
- **Bas:** [[IPv4 och IPv6]], [[Subnätning och CIDR]]
- **Transport:** [[UDP]]

## Flashcards

Vad står förkortningen DORA för i DHCP-sammanhang?:: Discover, Offer, Request, Acknowledge.

Varför används DHCP?:: För att slippa konfigurera varje enskild enhet i ett nätverk manuellt.
