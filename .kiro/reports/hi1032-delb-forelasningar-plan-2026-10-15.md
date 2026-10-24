# Plan - HI1032 Del B: föreläsningsfakta i teorifilen och ~15 nya kort

Datum: 2026-10-15. Status: utkast för granskning.

## Varför

Mätt 2026-10-13 och kontrollerat 2026-10-15: om varje gammal tenta behandlas som den okända har Del B
6-12 nya poäng av 22, och i värsta fall bara 10 förberedda poäng mot gränsen 9. Av de 21 nya
delfrågorna står minst 14 på examinatorns föreläsningsbilder F4-F7. Föreläsningarna är alltså
källan, och de är avgränsade. Breddningen ska komma därifrån och inte från allmän kunskap.

## Källor, i prioritetsordning

1. F4 Övervakning, F5 Multimedia, F6 Applikationslagret - examinatorns egna bilder (Jacobsson).
   F6 sida 41 är hans egen sammanfattning av applikationslagret.
2. Rekommenderade övningsuppgifter med lösningar (`Lösningar till boken/CHAPTER_10-12.docx`): Q12-5,
   Q12-15, Q12-23, Q11-17, Q11-29, Q11-39. Examinatorn har valt ut dem.
3. F7 DNS - gästföreläsning av Internetstiftelsen, CC BY 4.0. Lägst sannolikhet att examinatorn
   ställer frågor ur den, men DNS har frågats 4 av 4.

Textuttag: `%TEMP%\lectxt\Forelasning0{4,5,6,7}-*.txt`. Sidnummer nedan är PDF-sidor.

**Uppdaterat 20:30: konverteringen är klar.** Markdown med transkriberade figurtabeller finns nu i
`Filer/Canvas/AI-optimerad Markdown/Föreläsningar och artiklar/Forelasning0{4,5,6,7}-*.md`, med ett
avsnitt `## Transkriberat innehåll` sist i varje fil. Det ger tre fakta som textuttaget inte bar:

- **SNMP** (F4 s.28-30, F. Fig. 12.17/12.18/12.22, Tbl. 12.3): Manager → agent GetRequest,
  GetNextRequest, GetBulkRequest, SetRequest; agent → manager **Response** och Trap; manager → manager
  InformRequest och Report. **Agenten lyssnar på UDP 161, managern på UDP 162**, och Trap går till 162.
- **FTP** (F6 s.12-13, Tbl. 10.4-5): hela kommandotabellen och svarskoderna. `TYPE A/E/I` = ASCII,
  EBCDIC, image. `PORT` = klienten väljer port (aktivt), `PASV` = servern väljer port (passivt).
- **RTP-huvudet** (F5 s.44): sekvensnummer och tidsstämpel börjar slumpmässigt; SSRC identifierar
  källan; payload type anger kodningen.

Ny kandidat **25**: Vilka UDP-portar använder SNMP? → agenten 161, managern 162, dit Trap skickas.
Well-known port, alltså tillåten enligt `product.md`. Källa F4 s.30 (Fig. 12.22).

## Teorifilen: vad som läggs till

Varje befintligt avsnitt får ett block `### 📍 Från föreläsningen - aldrig tentat`, efter de
tentaformade blocken och före begreppslistan. Allt i blocket är märkt med föreläsning och sida.

Ett nytt H2-avsnitt `## Applikationsprotokollen som helhet` direkt efter helhetsbilden, byggt på F6 s.41:
kommunikationsparadigm (klient/server, P2P, publish-subscribe, s.5), representation (text, binär,
bygger på BER/RPC, bygger på HTTP, s.10), paket- mot strömbaserat, multiplexing (SSH mot FTP, s.16),
och beroenden mellan protokoll (e-post via MX i DNS). Skäl: det är examinatorns egen sammanfattning,
och december 2024 fråga 8b (MX) kom direkt ur dess sista punkt.

Per avsnitt, kort:

- **SNMP** (F4): ASN.1/SMI/MIB/BER/protokoll som fem delar med var sin uppgift (s.12, Q12-15); TLV
  (s.15); hur BER kodar en OID, 1.3 blir 40·1+3 = 43 = 0x2b (s.26); FCAPS-F reaktiv mot proaktiv
  (s.4, Q12-5); Response-PDU:n Agent → Manager (Q12-23); NETCONF/YANG och varför (s.31-32).
- **FTP** (F6): port 21 och 20 (s.14); TYPE I = binärt läge, ASCII mot image (s.15), kopplat till
  oktober 2024:s transkript.
- **DNS** (F7, F6): auktoritativ namnserver mot resolver (F7 s.65); postens fem fält (s.49-54); MX har
  prioritet, lägst först, och används av mailservrar, inte av klienter (s.89-91); svarskoderna
  NOERROR/NXDOMAIN/SERVFAIL/REFUSED (s.85); före DNS fanns en hosts-lista hämtad med FTP (s.30).
- **Bild och video** (F5): förlustfria metoder - run-length, ordbok (LZW i GIF), Huffman, aritmetisk;
  PNG = ordbok + Huffman (s.12); prediktiv mot perceptuell kodning (s.14, s.17); I-ramen och vad som
  händer när den försvinner (s.33).
- **Ljud** (F5): µ-law/A-law (s.8); bithastighet = samplingar/s × bitar, 8000 × 8 = 64 kbps, CD
  705,6 kbps per kanal (s.11); varför kvantisering (Q11-17).
- **RTP, RTCP, SIP** (F5): tre sorters multimediaöverföring och hur mycket var och en kan buffra
  (s.34); RTP på jämn port, RTCP på nästa udda, högst 5 % av bandbredden (s.43, s.45); RTCP:s tre
  uppgifter (s.45); RTP räknar paket, TCP räknar byte (Q11-29); SIP är textbaserat som HTTP, metoderna
  INVITE/ACK/BYE (s.49), och kan ses som P2P eftersom båda parter är klient och server (Q11-39).
- **E-post** (F6): vägen avsändare → egen MTA → mottagarens MTA via MX → IMAP/POP (s.19-20); brevlådan
  ligger på servern.
- **HTTP** (F6): HTTP/2 är binärt och multiplexar flera förfrågningar över en TCP-förbindelse (s.33).

Riktvärde: **+150 rader**, tak 200. Filen är 651 rader.

## Kandidatkort - 24 stycken, ska ner till ~15

Separatorval enligt `write-flashcards`: `;;` bara där baksidan entydigt pekar tillbaka.

| # | Kort | Sep | Källa |
| --- | --- | --- | --- |
| 1 | Vilket meddelande svarar agenten med på en GetRequest? → Response | :: | Q12-23 |
| 2 | **SMI** ;; reglerna för hur objekt namnges, vilka datatyper som finns och hur de kodas | ;; | F4 s.12, Q12-15 |
| 3 | **TLV** ;; varje värde kodas som typ, längd och värde | ;; | F4 s.15, s.26 |
| 4 | Reaktiv mot proaktiv fault management (2) | \|\| | F4 s.4, Q12-5 |
| 5 | **NETCONF** ;; konfigurerar enheter med transaktioner och roll-back, eftersom SNMP är svagt på konfiguration | ;; | F4 s.31-32 |
| 6 | **µ-law / A-law** ;; icke-linjär kvantiseringsskala - tysta ljud utan fler bitar | ;; | F5 s.8 |
| 7 | Bithastighet för okomprimerat ljud → samplingar/s × bitar per sampling | :: | F5 s.11 |
| 8 | Två sorters lossy-kodning (2): prediktiv, perceptuell | \|\| | F5 s.14, s.17 |
| 9 | Vad händer om en I-ram försvinner? → B/P-ramarna blir meningslösa | :: | F5 s.33 |
| 10 | Tre sorters multimediaöverföring (3): lagrad, live, interaktiv - med buffert | \|\| | F5 s.34 |
| 11 | RTP och RTCP:s portar → RTP jämn, RTCP nästa udda | :: | F5 s.43, s.45 |
| 12 | RTCP:s uppgifter (3) | \|\| | F5 s.45 |
| 13 | RTP:s sekvensnummer mot TCP:s → paket mot byte | :: | Q11-29 |
| 14 | Varför kan SIP ses som peer-to-peer? → båda parter är klient och server | :: | Q11-39 |
| 15 | Tre kommunikationsparadigm (3) | \|\| | F6 s.5, s.41 |
| 16 | Textbaserade mot binära protokoll (2) | \|\| | F6 s.10, s.41 |
| 17 | SSH mot FTP → SSH multiplexar allt i en förbindelse | :: | F6 s.16, s.41 |
| 18 | HTTP/2 mot HTTP/1.1 utöver push (2): binärt, multiplexing | \|\| | F6 s.33 |
| 19 | Vad betyder talet i en MX-post? → prioritet, lägst först | :: | F7 s.89 |
| 20 | Auktoritativ namnserver mot resolver (2) | \|\| | F7 s.65 |
| 21 | **NXDOMAIN** ;; namnet i frågan finns inte | ;; | F7 s.77, s.85 |
| 22 | Vad betyder TYPE I i FTP? → binärt läge | :: | F6 s.15 |
| 23 | Ett mejls väg (3): SMTP till egen MTA, SMTP mellan MTA efter MX, IMAP/POP | \|\| | F6 s.19-20, F7 s.92 |
| 24 | Förlustfria metoder (4)? | \|\| | F5 s.12 |

Min preliminära gallring, värst först: 24 (fyra rader och Huffman finns redan), 21 (gästföreläsning),
11 (portparitet är trivia), 7 (räkneformel, hör hemma i noten), 9 (beror på I/B/P som inte definieras
på bilderna), 19, 22. Kvar: 17.

## Kortsäkerhet - författaren drillar Del B just nu

**Uppdaterat 20:30:** författaren har bekräftat att han inte rör Del B under arbetet. Decket skrevs
senast 19:52 med 61 markörer. Stegen nedan gäller ändå, utom kravet på 15 minuters vila.

Decket skrevs senast 19:16, och Obsidian skriver om filen vid varje repetition. Två skrivare på samma
fil kan tappa en markör åt något håll.

1. Teorifilen skrivs först. Den drillas inte.
2. Omedelbart före kortändringen: kräv att deckets senaste skrivtid är minst 15 minuter gammal, annars
   stoppa och fråga författaren.
3. `Get-SRIntegrity.ps1 -Save -BaselinePath <egen fil>` direkt före, `-Compare` direkt efter. Kräv
   `cards` +N på exakt en fil och `markers placed on cards` oförändrat.
4. Nya kort läggs **mellan** befintliga kortblock, aldrig inuti. `oldStr` innehåller alltid ett helt
   befintligt kortblock inklusive markör, så en felmatchning misslyckas högljutt (T20).
5. `Test-DeckHygiene.ps1 -All`, läs bara raderna för Del B-filen.

## Del A, parallellt

En subagent jämför F1-F3 (finns som markdown) mot Del A-teorifilen och decket och listar
föreläsningsfakta som saknas i båda, rangordnade. Del A:s nyhetsgrad är 0-2 poäng, så förväntningen
är få tillägg. Resultatet blir uppgift 6.

## Utanför

Inga ändringar i befintliga kort. Ingen Forouzan. Inget under `Filer/` - konverteringsagenten äger
`AI-optimerad Markdown/` i kväll.
