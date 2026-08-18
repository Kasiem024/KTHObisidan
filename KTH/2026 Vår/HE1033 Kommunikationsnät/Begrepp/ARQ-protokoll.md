---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-05-28
updated: 2026-05-28
---
# ARQ-protokoll

**Skapad:** `= this.created` · **Uppdaterad:** `= this.updated`

> **Lager:** OSI 2 & 4
> **Mål:** Garantera leverans över opålitliga länkar.

---

## Definition
**ARQ (Automatic Repeat Request)** är metoder för att hantera paketförluster genom omsändning.

1. **Stop-and-Wait:** Skicka ett paket, vänta på ACK. Lågt utnyttjande av bandbredd.
2. **Go-Back-N:** Skicka flera paket. Vid fel skickas allt om från det felaktiga paketet. Fönster: $2^k-1$.
3. **Selective Repeat:** Skicka flera paket. Endast det specifika paket som gick förlorat skickas om. Fönster: $2^{k-1}$.

## Tenta-fokus
- **Fönsterberäkning:** Ofta frågor om maximal fönsterstorlek givet $k$ sekvensnummer-bitar.
- **Komponenter:** Sekvensnummer (för ordning), ACK (bekräftelse), Timeout (när ska vi skicka om?).

## Kopplat till
- **Protokoll:** [[TCP]]
- **Koncept:** [[Sliding Window]]

## Flashcards

Vilka tre komponenter krävs i ett ARQ-protokoll?(3):: Buffring, Sekvensnummer och en Timeout-klocka.

Vad är den största skillnaden mellan Go-Back-N och Selective Repeat?:: I GBN skickas alla paket från felet och framåt om, i SR skickas endast det felaktiga paketet om.
