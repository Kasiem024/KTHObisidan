---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# MAC-adress

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

> **Lager:** OSI 2 (Datalänk)
> **Längd:** 48 bitar.

---

## Definition
Den fysiska adressen som är hårdkodad i nätverkskortet. Skrivs hexadecimalt: `AA:BB:CC:DD:EE:FF`.

- **Struktur:**
	- Första hälften (24 bit): Tillverkarkod (OUI).
	- Andra hälften (24 bit): Unikt serienummer för kortet.

## Tenta-fokus
- **Lager 2 vs 3:** MAC-adresser används för att flytta ramar mellan enheter på **samma** lokala nätverk. IP-adresser används för att hitta vägen **mellan** olika nätverk.
- **Broadcast:** `FF:FF:FF:FF:FF:FF` (Alla bitar är ettor).

## Kopplat till
- **Underlager:** [[LLC och MAC]]
- **Format:** [[Ethernet-ramen]]
- **Protokoll:** [[ARP]] (Kopplingen till IP)

## Flashcards

Hur många bitar består en MAC-adress av?:: 48 bitar.

Vilken MAC-adress används för broadcast?:: FF:FF:FF:FF:FF:FF.
