---
tags: [begrepp, HI1032, nätverk, KTH, year2026]
created: 2026-08-24
updated: 2026-08-26
description: "Flashcards HI1032 kap 26 – standardprotokoll: HTTP, FTP, e-post (SMTP/POP3/IMAP), TELNET/SSH och DNS."
---
# HI1032 Begrepp - Kap 26 Standard klient-server-protokoll

**HTTP** (HyperText Transfer Protocol);;Huvudprotokollet för att ==hämta data på webben (WWW)==; en klient (webbläsare) begär resurser från en webbserver, vanligen över TCP port 80.

Varför använder FTP *två* separata förbindelser?::En ==kontrollförbindelse== (kommandon, port 21) och en separat ==dataförbindelse== (själva filöverföringen) – så att kommandon och data hålls isär.

Vilka protokoll används i e-post och till vad? (3)
||
- **SMTP** – *skicka/leverera* post (från klient och mellan servrar)
- **POP3** – *hämta* post från servern (laddar ner den)
- **IMAP4** – *hämta och hantera* post som ligger kvar på servern

**SMTP** (Simple Mail Transfer Protocol);;Protokollet som ==skickar och levererar e-post==; hämtning från servern sker i stället med POP3 eller IMAP.

**MIME** (Multipurpose Internet Mail Extensions);;Ett tillägg som låter e-post (som i grunden bara bär *7-bitars ASCII*) skicka ==icke-ASCII: binärfiler, bilder, ljud, video och andra språk== – omvandlas till ASCII hos sändaren och tillbaka hos mottagaren.

Vilka två kodningar packar MIME icke-ASCII som ASCII med? (2)
||
- **Base64** – tar *6 bitar* i taget → 4 ASCII-tecken per 3 byte (gör filen ca *+33 %*).
- **Quoted-Printable** – lämnar vanliga ASCII-tecken orörda och kodar bara *udda* byte som `=XX` (hex).

Vad skiljer TELNET från SSH?
||
- **TELNET:** fjärrinloggning i *klartext* – ==osäkert==.
- **SSH:** ==krypterad== fjärrinloggning – den säkra ersättaren som används idag.

**DNS** (Domain Name System);;Ett klient-server-system som ==översätter domännamn till IP-adresser== via en *hierarkisk* och decentraliserad namnrymd.

Vad skiljer rekursiv från iterativ DNS-upplösning?
||
- **Rekursiv:** servern ==frågar vidare åt klienten== och lämnar det färdiga svaret.
- **Iterativ:** servern ger en *hänvisning* och klienten frågar nästa server själv.

Vilka vanliga posttyper (resource records) finns i DNS? (5)
||
- **A** – en *IPv4-adress*
- **AAAA** – en *IPv6-adress*
- **MX** – domänens *mailserver*
- **NS** – domänens *auktoritativa namnservrar*
- **CNAME** – *alias* för ett annat namn

Varför kan en ändrad DNS-post ta timmar att slå igenom?::Servrar ==cachar svar så länge postens TTL (time to live) anger==; först när TTL:en löpt ut hämtas den nya posten från den auktoritativa servern.
