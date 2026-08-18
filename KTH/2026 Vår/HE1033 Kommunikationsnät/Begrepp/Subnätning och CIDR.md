---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# Subnätning och CIDR

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

> **Lager:** OSI 3 (Nätverk)
> **Matte:** $2^{32-x}$ adresser.

---

## Definition
**Subnätning** innebär att dela upp ett stort nätverk i mindre delar för bättre prestanda och kontroll. **CIDR** (Classless Inter-Domain Routing) använder prefix-notation (t.ex. /24).

### Beräkningsregler
1. **Totala adresser:** $2^{\text{antal nollor i masken}}$.
2. **Användbara värdar:** Totala adresser - 2.
3. **Varför -2?**
	- Första adressen = **Nätverksadress** (Värddelen är bara nollor).
	- Sista adressen = **Broadcastadress** (Värddelen är bara ettor).

## Tenta-fokus
- **Prefix-tabell:**
	- /24 = 256 adresser (254 värdar)
	- /25 = 128 adresser (126 värdar)
	- /26 = 64 adresser (62 värdar)
	- /27 = 32 adresser (30 värdar)
- **Logik:** Routern gör en bitvis **AND** mellan IP-adressen och nätmasken för att hitta nätverksadressen.

## Kopplat till
- **Bas:** [[IPv4 och IPv6]]
- **Tilldelning:** [[DHCP]]

## Flashcards

Hur många användbara värdar ryms i ett /27 nät?:: 30 stycken ($32 - 2$).

Vilken logisk operation används för att få fram nätverksadressen?:: Bitvis AND-operation.
