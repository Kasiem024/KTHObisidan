---
tags: [begrepp, HI1031, databaser, säkerhet, KTH, year2026]
created: 2026-08-24
updated: 2026-09-09
description: "Flashcards HI1031 kap 11 – säkerhet: hot och attacker, kryptografins roller, symmetrisk, asymmetrisk och hybridkryptering, digitala signaturer, certifikat och TLS."
---
# HI1031 Begrepp - Kap 11 Säkerhet

## 1. Hot och attacker

Vilka tre breda klasser delar boken säkerhetshoten i? (3)
||
- **Läckage** – obehöriga får tag på information.
- **Manipulation** – obehörig ändring av information.
- **Vandalisering** – störa systemets funktion utan vinst för angriparen.
<!--SR:!fsrs,2026-09-28T20:36:08.317Z,2,0.47674588,9.71285992,2,7,1,0,2026-09-26T20:36:08.317Z-->

Vilka sätt kan man angripa en kanal på? Nämn fyra. (4)
||
- **Avlyssning** – läsa andras meddelanden
- **Maskering** – utge sig för någon annan
- **Uppspelning** – spara ett meddelande och skicka det igen senare
- **Överbelastning** – dränka en resurs så ingen annan kommer åt den
<!--SR:!fsrs,2026-09-29T20:12:22.779Z,3,1.46144332,8.99883073,2,6,1,0,2026-09-26T20:12:22.779Z-->

Vad är en man-in-the-middle-attack?::Angriparen ställer sig ==mitt emellan== två parter i ett nyckelutbyte och byter deras nycklar mot sina egna. Sedan kan han läsa och ändra allt utan att de märker det.
<!--SR:!fsrs,2026-09-28T07:41:34.001Z,3,3.32831276,8.37949113,2,4,0,0,2026-09-25T07:41:34.001Z-->

Varför fungerar en uppspelningsattack även mot krypterade meddelanden?::För att angriparen ==inte behöver nyckeln== – han kopierar bara bitmönstret och skickar det igen. En betalning kan då göras två gånger.
<!--SR:!fsrs,2026-09-30T07:50:26.909Z,5,4.91188895,5.19004872,2,3,0,0,2026-09-25T07:50:26.909Z-->

## 2. Kryptografins roller

Vilka tre huvudroller har kryptografi enligt boken? (3)
||
- **Sekretess och integritet**
- **Autentisering**
- **Digitala signaturer**
<!--SR:!fsrs,2026-09-27T07:35:22.576Z,2,0.58578604,9.42783916,2,5,0,0,2026-09-25T07:35:22.576Z-->

Hur ger kryptering integritet?::Bara om man ==lägger till en kontrollsumma== som mottagaren räknar om och jämför – integritet får man inte gratis bara för att man krypterar.
<!--SR:!fsrs,2026-09-28T20:18:43.007Z,2,1.64362148,9.26707788,2,5,0,0,2026-09-26T20:18:43.007Z-->

Hur ger kryptering autentisering?::Om nyckeln ==bara två parter känner== och meddelandet går att dekryptera till något vettigt, måste det komma från den andra parten.
<!--SR:!fsrs,2026-10-04T20:39:07.860Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:39:07.860Z-->

Vad betyder oförnekbarhet, och hur ger kryptering det?::Att du ==inte kan förneka== att du skickat ett meddelande, för bara du kunde skapa din digitala signatur.

## 3. Symmetrisk, asymmetrisk och hybridkryptering

Vad skiljer symmetrisk från asymmetrisk kryptering? (2)
||
- **Symmetrisk** (secret-key): samma nyckel krypterar och dekrypterar.
- **Asymmetrisk** (public-key): ett nyckelpar, där nycklarna för kryptering och dekryptering är olika.
<!--SR:!fsrs,2026-10-04T20:13:38.730Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:38.730Z-->

Vad avgör hur stark en symmetrisk algoritm är?::==Nyckellängden== – enda realistiska attacken är att prova alla nycklar (brute force), och den tiden växer exponentiellt med antalet bitar.
<!--SR:!fsrs,2026-10-04T20:41:19.282Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:41:19.282Z-->

Varför är asymmetriska nycklar mycket längre än symmetriska?::För att produkten ==inte ska gå att faktorisera==. De långa nycklarna är en del av varför asymmetrisk kryptering är så mycket långsammare.
<!--SR:!fsrs,2026-09-28T20:38:40.116Z,2,0.85574823,9.24662422,2,6,1,0,2026-09-26T20:38:40.116Z-->

Hur mycket långsammare är asymmetrisk kryptering än symmetrisk?::Ungefär ==100 till 1000 gånger== långsammare. Därför används den bara i början, inte för all data.
<!--SR:!fsrs,2026-10-01T10:43:00.448Z,7,7.49448566,3.58131923,2,3,0,0,2026-09-24T10:43:00.448Z-->

Hur fungerar hybridkryptering?::Man byter en hemlig nyckel med ==asymmetrisk kryptering i början==, och krypterar sedan all data med snabb symmetrisk kryptering. Så gör TLS.
<!--SR:!fsrs,2026-10-04T20:19:54.078Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:19:54.078Z-->

## 3.1 Hur nyckelpar ger autenticitet

Vilken egenskap gör att ett nyckelpar kan ge autenticitet?::Att nycklarna är ==varandras inverser== – det ena låser, bara det andra låser upp, oavsett vilken ordning man använder dem.
<!--SR:!fsrs,2026-09-27T10:33:53.854Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-24T10:33:53.854Z-->

Hur kan den privata nyckeln ge autenticitet?::Krypterar du något med din ==privata nyckel== kan vem som helst kontrollera det med din publika – och då vet de att bara du kunde ha skapat det.
<!--SR:!fsrs,2026-09-27T10:36:44.620Z,3,2.69463548,6.79877821,2,3,0,0,2026-09-24T10:36:44.620Z-->

## 4. Digitala signaturer

Vad är en digital signatur?::Ett sätt att ==binda din identitet till exakt det du signerat==. Ändras dokumentet efteråt stämmer inte signaturen längre.
<!--SR:!fsrs,2026-09-27T19:52:12.098Z,3,2.49363211,8.37949113,2,4,0,0,2026-09-24T19:52:12.098Z-->

Vilka tre egenskaper ger en digital signatur? (3)
||
- **Autentisk** – signeraren skrev under med vilja och ingen har ändrat dokumentet
- **Oförfalskbar** – bara signeraren kunde ha gjort den
- **Oförnekbar** – signeraren kan inte förneka att han skrev under
<!--SR:!fsrs,2026-09-27T10:50:30.200Z,3,2.49363211,8.37949113,2,4,0,0,2026-09-24T10:50:30.200Z-->

Hur skapas och kontrolleras en digital signatur? (2)
||
- **Skapas** – hasha meddelandet och kryptera hashen med din privata nyckel
- **Kontrolleras** – dekryptera med avsändarens publika nyckel och jämför med en egen hash
<!--SR:!fsrs,2026-09-27T20:27:33.418Z,1,0.04575401,9.95716975,2,9,1,0,2026-09-26T20:27:33.418Z-->

## 4.1 Säkra sammanfattningsfunktioner

Vad är en säker hashfunktion (digest)?::Den gör om ett meddelande av ==vilken längd som helst till en kort, fast summa== som inte går att räkna baklänges.

Vilka tre egenskaper ska en säker hashfunktion ha? (3)
||
- **Lätt framåt** – lätt att räkna ut hashen från meddelandet
- **Svår bakåt** – går inte att räkna ut meddelandet från hashen
- **Krockfri** – svårt att hitta två meddelanden med samma hash
<!--SR:!fsrs,2026-09-27T20:42:22.938Z,1,0.78982635,8.39432857,2,4,1,0,2026-09-26T20:42:22.938Z-->

## 5.1 TLS, SSL och HTTPS

Vad är TLS/SSL?::En standard som skapar en ==säker kanal== mellan två parter över nätet. TLS är den nyare versionen av det äldre SSL.
<!--SR:!fsrs,2026-10-04T20:13:55.994Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:55.994Z-->

Vad är HTTPS?::==Inget eget protokoll== – det är bara HTTP som körs över en TLS-kanal. Prefixet https: i adressen startar den.

Vilka två delar består TLS av? (2)
||
- **En säker kanal** – sköter kryptering, integritet och äkthet på all data
- **En handskakning** – kommer överens om nycklar och algoritmer i början
<!--SR:!fsrs,2026-09-27T20:28:36.073Z,1,1.13884283,9.60540134,2,6,0,0,2026-09-26T20:28:36.073Z-->

Hur går TLS-handskakningen till? (4)
||
- **Hälsning** – parterna enas om vilka krypton som ska användas och byter slumptal
- **Certifikat** – servern visar sitt certifikat så klienten vet vem den pratar med
- **Nyckel** – de skapar en gemensam hemlig nyckel, skyddad med publik nyckel
- **Klart** – de slår om till krypterad trafik
<!--SR:!fsrs,2026-09-26T20:44:59.550Z,0,0.00195162,9.97541175,3,12,1,0,2026-09-26T20:34:59.550Z-->

## 5.2 Certifikat

Vad är ett digitalt certifikat?::Ett ==signerat intyg== som man kan lita på, eftersom någon man litar på har skrivit under det.

Vad ska ett certifikat säkerställa?::Att en ==publik nyckel verkligen hör till den ägare som står på certifikatet==. Utfärdarens signatur går i god för att kopplingen mellan nyckel och namn stämmer.

Vad innehåller ett certifikat? (3)
||
- **Vem det gäller** – personens namn och publika nyckel
- **Vem som skrivit under** – utfärdaren och dess signatur
- **Hur länge det gäller** – start- och slutdatum
<!--SR:!fsrs,2026-09-26T20:47:41.583Z,0,0.001,9.97799571,1,21,0,0,2026-09-26T20:46:41.583Z-->

Vad är en certifikatutfärdare (CA)?::En ==betrodd organisation== som ger ut certifikat och intygar att en publik nyckel hör till rätt ägare.

Hur vet man att man kan lita på ett certifikat?::Man ==följer kedjan av signaturer bakåt== tills man når någon man redan litar på, till exempel en känd certifikatutfärdare.
<!--SR:!fsrs,2026-09-26T20:57:05.495Z,0,0.00134819,9.97553539,3,12,1,0,2026-09-26T20:47:05.495Z-->
