---
tags:
  - begrepp
  - HI1031
  - databaser
  - säkerhet
  - KTH
  - year2026
created: 2026-08-24
updated: 2026-09-27
description: "Flashcards HI1031 kap 11 – säkerhet: hot och attacker, kryptografins roller, symmetrisk, asymmetrisk och hybridkryptering, digitala signaturer, certifikat och TLS."
---
# HI1031 Begrepp - Kap 11 Säkerhet

## 1. Hot och attacker

Vilka tre breda klasser delar boken säkerhetshoten i? (3)
||
- **Läckage** – obehöriga får tag på information.
- **Manipulation** – obehörig ändring av information.
- **Vandalisering** – störa systemets funktion utan vinst för angriparen.
<!--SR:!fsrs,2026-11-01T19:46:23.767Z,11,10.70349544,9.84981953,2,16,2,0,2026-10-21T19:46:23.767Z-->

Vilka sätt kan man angripa en kanal på? Nämn fyra. (4)
||
- **Avlyssning** – läsa andras meddelanden
- **Maskering** – utge sig för någon annan
- **Uppspelning** – spara ett meddelande och skicka det igen senare
- **Överbelastning** – dränka en resurs så ingen annan kommer åt den
<!--SR:!fsrs,2026-10-24T08:17:02.566Z,6,5.41136443,9.86193533,2,16,3,0,2026-10-18T08:17:02.566Z-->

Vad är en man-in-the-middle-attack?::Angriparen ställer sig ==mitt emellan== två parter i ett nyckelutbyte och byter deras nycklar mot sina egna. Sedan kan han läsa och ändra allt utan att de märker det.
<!--SR:!fsrs,2026-10-28T08:19:29.036Z,10,10.06542008,9.70585471,2,11,1,0,2026-10-18T08:19:29.036Z-->

Varför fungerar en uppspelningsattack även mot krypterade meddelanden?::För att angriparen ==inte behöver nyckeln== – han kopierar bara bitmönstret och skickar det igen. En betalning kan då göras två gånger.
<!--SR:!fsrs,2026-11-06T10:42:07.978Z,24,23.55240221,7.85571375,2,5,0,0,2026-10-13T10:42:07.978Z-->

## 2. Kryptografins roller

Vilka tre huvudroller har kryptografi enligt boken? (3)
||
- **Sekretess och integritet**
- **Autentisering**
- **Digitala signaturer**
<!--SR:!fsrs,2026-11-05T14:15:06.993Z,15,14.95886902,9.68156697,2,11,0,0,2026-10-21T14:15:06.993Z-->

Hur ger kryptering sekretess (konfidentialitet)?::Bara den som har ==rätt nyckel== kan läsa innehållet, så en angripare som snappar upp meddelandet får bara obegriplig text.
<!--SR:!fsrs,2026-11-21T10:51:35.896Z,30,35.27563402,5.70547582,2,5,0,0,2026-10-22T10:51:35.896Z-->

Hur ger kryptering integritet?::Bara om man ==lägger till en kontrollsumma== som mottagaren räknar om och jämför – integritet får man inte gratis bara för att man krypterar.
<!--SR:!fsrs,2026-11-05T08:16:06.153Z,14,14.4120698,9.68111991,2,12,1,0,2026-10-22T08:16:06.153Z-->

Hur ger kryptering autentisering?::Om nyckeln ==bara två parter känner== och meddelandet går att dekryptera till något vettigt, måste det komma från den andra parten.
<!--SR:!fsrs,2026-10-22T18:43:57.428Z,9,8.65659372,8.89193572,2,7,1,0,2026-10-13T18:43:57.428Z-->

Vad betyder oförnekbarhet, och hur ger kryptering det?::Att du ==inte kan förneka== att du skickat ett meddelande, för bara du kunde skapa din digitala signatur.
<!--SR:!fsrs,2026-11-19T20:08:05.539Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T20:08:05.539Z-->

## 3. Symmetrisk, asymmetrisk och hybridkryptering

Vad skiljer symmetrisk från asymmetrisk kryptering? (2)
||
- **Symmetrisk** (secret-key): samma nyckel krypterar och dekrypterar.
- **Asymmetrisk** (public-key): ett nyckelpar, där nycklarna för kryptering och dekryptering är olika.
<!--SR:!fsrs,2026-11-21T19:53:57.571Z,31,48.53415125,7.13028441,2,5,0,0,2026-10-21T19:53:57.571Z-->

Vad avgör hur stark en symmetrisk algoritm är?::==Nyckellängden== – enda realistiska attacken är att prova alla nycklar (brute force), och den tiden växer exponentiellt med antalet bitar.
<!--SR:!fsrs,2026-10-23T12:52:55.671Z,17,17.11344268,7.86010817,2,4,0,0,2026-10-06T12:52:55.671Z-->

Varför är asymmetriska nycklar mycket längre än symmetriska?::För att produkten ==inte ska gå att faktorisera==. De långa nycklarna är en del av varför asymmetrisk kryptering är så mycket långsammare.
<!--SR:!fsrs,2026-10-25T15:50:48.255Z,10,10.01133374,9.63106607,2,10,1,0,2026-10-15T15:50:48.255Z-->

Hur mycket långsammare är asymmetrisk kryptering än symmetrisk?::Ungefär ==100 till 1000 gånger== långsammare. Därför används den bara i början, inte för all data.
<!--SR:!fsrs,2026-11-23T08:16:02.169Z,32,86.5683711,4.28066721,2,5,0,0,2026-10-22T08:16:02.169Z-->

Hur fungerar hybridkryptering?::Man byter en hemlig nyckel med ==asymmetrisk kryptering i början==, och krypterar sedan all data med snabb symmetrisk kryptering. Så gör TLS.
<!--SR:!fsrs,2026-11-21T20:01:43.239Z,31,48.53415125,7.13028441,2,5,0,0,2026-10-21T20:01:43.239Z-->

## 3.1 Hur nyckelpar ger autenticitet

Vilken egenskap gör att ett nyckelpar kan ge autenticitet?::Att nycklarna är ==varandras inverser== – det ena låser, bara det andra låser upp, oavsett vilken ordning man använder dem.
<!--SR:!fsrs,2026-11-06T08:11:53.409Z,19,18.5093106,9.0323884,2,6,0,0,2026-10-18T08:11:53.409Z-->

Hur kan den privata nyckeln ge autenticitet?::Krypterar du något med din ==privata nyckel== kan vem som helst kontrollera det med din publika – och då vet de att bara du kunde ha skapat det.
<!--SR:!fsrs,2026-11-06T08:19:01.701Z,19,18.5093106,9.0323884,2,6,0,0,2026-10-18T08:19:01.701Z-->

## 4. Digitala signaturer

Vad är en digital signatur?::Ett sätt att ==binda din identitet till exakt det du signerat==. Ändras dokumentet efteråt stämmer inte signaturen längre.
<!--SR:!fsrs,2026-10-24T13:37:14.907Z,4,3.34833138,9.86186993,2,13,2,0,2026-10-20T13:37:14.907Z-->

Vilka tre egenskaper ger en digital signatur? (3)
||
- **Autentisk** – signeraren skrev under med vilja och ingen har ändrat dokumentet
- **Oförfalskbar** – bara signeraren kunde ha gjort den
- **Oförnekbar** – signeraren kan inte förneka att han skrev under
<!--SR:!fsrs,2026-10-23T22:39:24.251Z,9,9.07859775,9.58411007,2,10,1,0,2026-10-14T22:39:24.251Z-->

Hur skapas och kontrolleras en digital signatur? (2)
||
- **Skapas** – hasha meddelandet och kryptera hashen med din privata nyckel
- **Kontrolleras** – dekryptera med avsändarens publika nyckel och jämför med en egen hash
<!--SR:!fsrs,2026-10-28T15:50:07.325Z,7,6.68321398,9.87284088,2,25,4,0,2026-10-21T15:50:07.325Z-->

Varför hashar man meddelandet innan man signerar det?::Asymmetrisk kryptering är långsam, så man signerar ==en kort sammanfattning== i stället för hela dokumentet.
<!--SR:!fsrs,2026-10-22T12:06:11.037Z,8,7.81541392,9.25872325,2,7,1,0,2026-10-14T12:06:11.037Z-->

## 4.1 Säkra sammanfattningsfunktioner

Vad är en säker hashfunktion (digest)?::Den gör om ett meddelande av ==vilken längd som helst till en kort, fast summa== som inte går att räkna baklänges.
<!--SR:!fsrs,2026-11-06T15:31:10.339Z,21,21.31537609,7.85571375,2,5,0,0,2026-10-16T15:31:10.339Z-->

Vilka tre egenskaper ska en säker hashfunktion ha? (3)
||
- **Lätt framåt** – lätt att räkna ut hashen från meddelandet
- **Svår bakåt** – går inte att räkna ut meddelandet från hashen
- **Krockfri** – svårt att hitta två meddelanden med samma hash
<!--SR:!fsrs,2026-11-18T16:26:21.791Z,28,28.1146136,8.52011077,2,8,1,0,2026-10-21T16:26:21.791Z-->

## 5.1 TLS, SSL och HTTPS

Vad är TLS/SSL?::En standard som skapar en ==säker kanal== mellan två parter över nätet. TLS är den nyare versionen av det äldre SSL.
<!--SR:!fsrs,2026-11-21T19:56:17.706Z,31,48.53415125,7.13028441,2,5,0,0,2026-10-21T19:56:17.706Z-->

Vad är HTTPS?::==Inget eget protokoll== – det är bara HTTP som körs över en TLS-kanal. Prefixet https: i adressen startar den.
<!--SR:!fsrs,2026-11-19T20:05:29.069Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T20:05:29.069Z-->

Vilka två delar består TLS av? (2)
||
- **En säker kanal** – sköter kryptering, integritet och äkthet på all data
- **En handskakning** – kommer överens om nycklar och algoritmer i början
<!--SR:!fsrs,2026-10-27T14:20:17.328Z,6,5.80708185,9.86559718,2,16,2,0,2026-10-21T14:20:17.328Z-->

Hur går TLS-handskakningen till? (4)
||
- **Hälsning** – parterna enas om vilka krypton som ska användas och byter slumptal
- **Certifikat** – servern visar sitt certifikat så klienten vet vem den pratar med
- **Nyckel** – de skapar en gemensam hemlig nyckel, skyddad med publik nyckel
- **Klart** – de slår om till krypterad trafik
<!--SR:!fsrs,2026-10-29T09:15:53.781Z,7,7.24339896,9.90969286,2,27,2,0,2026-10-22T09:15:53.781Z-->

## 5.2 Certifikat

Vad är ett digitalt certifikat?::Ett ==signerat intyg== som man kan lita på, eftersom någon man litar på har skrivit under det.
<!--SR:!fsrs,2026-11-19T19:54:06.123Z,29,29.24969121,8.0702759,2,6,0,0,2026-10-21T19:54:06.123Z-->

Vad ska ett certifikat säkerställa?::Att en ==publik nyckel verkligen hör till den ägare som står på certifikatet==. Utfärdarens signatur går i god för att kopplingen mellan nyckel och namn stämmer.
<!--SR:!fsrs,2026-10-26T14:15:00.225Z,5,5.44343169,9.80243161,2,13,2,0,2026-10-21T14:15:00.225Z-->

Vad innehåller ett certifikat? (3)
||
- **Vem det gäller** – personens namn och publika nyckel
- **Vem som skrivit under** – utfärdaren och dess signatur
- **Hur länge det gäller** – start- och slutdatum
<!--SR:!fsrs,2026-11-01T16:29:01.678Z,11,11.28958063,9.81160372,2,34,1,0,2026-10-21T16:29:01.678Z-->

Vad är en certifikatutfärdare (CA)?::En ==betrodd organisation== som ger ut certifikat och intygar att en publik nyckel hör till rätt ägare.
<!--SR:!fsrs,2026-10-27T10:34:52.091Z,10,10.41987943,9.23974709,2,8,1,0,2026-10-17T10:34:52.091Z-->

Hur vet man att man kan lita på ett certifikat?::Man ==följer kedjan av signaturer bakåt== tills man når någon man redan litar på, till exempel en känd certifikatutfärdare.
<!--SR:!fsrs,2026-10-22T15:51:40.822Z,7,6.50137559,9.87261439,2,19,1,0,2026-10-15T15:51:40.822Z-->
