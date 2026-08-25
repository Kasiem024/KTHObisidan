---
tags: [begrepp, HI1032, nätverk, säkerhet, KTH, year2026]
created: 2026-08-24
updated: 2026-08-24
description: "Flashcards HI1032 kap 32 – internetsäkerhet: IPSec/VPN, TLS/SSL, e-postsäkerhet (PGP/S-MIME) och brandväggar."
---
# HI1032 Begrepp - Kap 32 Internetsäkerhet

Var i lagermodellen läggs de olika säkerhetslösningarna? (3)
||
- **Nätverkslagret:** ==IPSec== (skyddar IP-paket; grund för VPN)
- **Transportlagret:** ==SSL/TLS== (skyddar t.ex. HTTPS)
- **Applikationslagret:** ==PGP / S/MIME== (skyddar e-post)

**IPSec**;;En samling protokoll som ger säkerhet på ==nätverkslagret== (kryptering, integritet och autentisering av IP-paket); grunden för *VPN*.

Vad skiljer IPSec:s transportläge från tunnelläge?
||
- **Transportläge:** skyddar bara ==transportlagrets nyttolast==, inte IP-huvudet (värd-till-värd).
- **Tunnelläge:** skyddar ==hela IP-paketet== genom att kapsla in det i ett nytt (används i VPN).

**VPN** (Virtual Private Network);;Ett ==virtuellt privat nät över det publika internet==, där trafiken skyddas (oftast med IPSec) så att den känns privat.

**TLS/SSL**;;Säkerhet på ==transportlagret== som ger en krypterad och autentiserad förbindelse (t.ex. HTTPS).

**PGP** (Pretty Good Privacy);;Ett system för ==e-postsäkerhet== (kryptering och signering), mest för privat bruk; bygger på en *web of trust*.

**Brandvägg** (firewall);;En enhet mellan det interna nätet och internet som ==vidarebefordrar vissa paket och blockerar andra== enligt regler.

Vad skiljer en paketfiltrerande från en proxy-brandvägg?
||
- **Paketfilter:** släpper/blockerar paket utifrån ==IP-adress, port och protokoll== (nätverks-/transportlager).
- **Proxy:** granskar ==innehållet på applikationsnivå== och agerar mellanhand.
