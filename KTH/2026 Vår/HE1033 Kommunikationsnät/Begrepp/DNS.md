---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# DNS

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

> **Lager:** OSI 7 (Applikation)
> **Mål:** "Internetets telefonbok".

---

## Definition
**DNS (Domain Name System)** översätter domännamn (t.ex. kth.se) till IP-adresser.

### Struktur
- **Hierarkisk:** Rot-servrar (.) $\to$ Toppdomäner (.se, .com) $\to$ Auktoritativa servrar.
- **Resolver:** Den lokala mjukvaran (ofta i routern/OS) som ställer frågan.

## Tenta-fokus
- **Transport:** Använder oftast [[UDP]] på port 53. Om svaret är för stort används [[TCP]].
- **Caching:** DNS-svar sparas lokalt en viss tid (TTL) för att minska trafik.

## Kopplat till
- **Bas:** [[IPv4 och IPv6]]
- **Transport:** [[UDP]]

## Flashcards

Vilken port använder DNS normalt?:: Port 53.

Vad kallas processen att översätta ett namn till en IP-adress?:: Namnuppslagning (Resolution).
