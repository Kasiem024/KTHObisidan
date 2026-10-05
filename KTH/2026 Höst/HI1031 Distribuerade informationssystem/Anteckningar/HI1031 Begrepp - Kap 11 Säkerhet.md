---
tags: [begrepp, HI1031, databaser, säkerhet, KTH, year2026]
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
<!--SR:!fsrs,2026-10-04T01:20:06.039Z,1,0.81815961,9.92085463,2,11,2,0,2026-10-03T01:20:06.039Z-->

Vilka sätt kan man angripa en kanal på? Nämn fyra. (4)
||
- **Avlyssning** – läsa andras meddelanden
- **Maskering** – utge sig för någon annan
- **Uppspelning** – spara ett meddelande och skicka det igen senare
- **Överbelastning** – dränka en resurs så ingen annan kommer åt den
<!--SR:!fsrs,2026-10-05T01:23:52.805Z,2,1.53305006,9.81753238,2,10,2,0,2026-10-03T01:23:52.805Z-->

Vad är en man-in-the-middle-attack?::Angriparen ställer sig ==mitt emellan== två parter i ett nyckelutbyte och byter deras nycklar mot sina egna. Sedan kan han läsa och ändra allt utan att de märker det.
<!--SR:!fsrs,2026-10-04T20:53:17.855Z,3,3.0403125,9.40994816,2,8,1,0,2026-10-01T20:53:17.855Z-->

Varför fungerar en uppspelningsattack även mot krypterade meddelanden?::För att angriparen ==inte behöver nyckeln== – han kopierar bara bitmönstret och skickar det igen. En betalning kan då göras två gånger.
<!--SR:!fsrs,2026-10-12T10:09:26.721Z,12,12.09526369,6.79215857,2,4,0,0,2026-09-30T10:09:26.721Z-->

## 2. Kryptografins roller

Vilka tre huvudroller har kryptografi enligt boken? (3)
||
- **Sekretess och integritet**
- **Autentisering**
- **Digitala signaturer**
<!--SR:!fsrs,2026-10-04T21:02:50.214Z,3,2.61980031,9.80152568,2,8,0,0,2026-10-01T21:02:50.214Z-->

Hur ger kryptering sekretess (konfidentialitet)?::Bara den som har ==rätt nyckel== kan läsa innehållet, så en angripare som snappar upp meddelandet får bara obegriplig text.

Hur ger kryptering integritet?::Bara om man ==lägger till en kontrollsumma== som mottagaren räknar om och jämför – integritet får man inte gratis bara för att man krypterar.
<!--SR:!fsrs,2026-10-03T20:59:44.951Z,2,1.76135845,9.71530447,2,8,1,0,2026-10-01T20:59:44.951Z-->

Hur ger kryptering autentisering?::Om nyckeln ==bara två parter känner== och meddelandet går att dekryptera till något vettigt, måste det komma från den andra parten.
<!--SR:!fsrs,2026-10-04T20:39:07.860Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:39:07.860Z-->

Vad betyder oförnekbarhet, och hur ger kryptering det?::Att du ==inte kan förneka== att du skickat ett meddelande, för bara du kunde skapa din digitala signatur.
<!--SR:!fsrs,2026-10-09T22:26:09.281Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:26:09.281Z-->

## 3. Symmetrisk, asymmetrisk och hybridkryptering

Vad skiljer symmetrisk från asymmetrisk kryptering? (2)
||
- **Symmetrisk** (secret-key): samma nyckel krypterar och dekrypterar.
- **Asymmetrisk** (public-key): ett nyckelpar, där nycklarna för kryptering och dekryptering är olika.
<!--SR:!fsrs,2026-10-04T20:13:38.730Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:38.730Z-->

Vad avgör hur stark en symmetrisk algoritm är?::==Nyckellängden== – enda realistiska attacken är att prova alla nycklar (brute force), och den tiden växer exponentiellt med antalet bitar.
<!--SR:!fsrs,2026-10-04T20:41:19.282Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:41:19.282Z-->

Varför är asymmetriska nycklar mycket längre än symmetriska?::För att produkten ==inte ska gå att faktorisera==. De långa nycklarna är en del av varför asymmetrisk kryptering är så mycket långsammare.
<!--SR:!fsrs,2026-10-07T20:43:37.458Z,5,4.97206431,9.21860173,2,8,1,0,2026-10-02T20:43:37.458Z-->

Hur mycket långsammare är asymmetrisk kryptering än symmetrisk?::Ungefär ==100 till 1000 gånger== långsammare. Därför används den bara i början, inte för all data.
<!--SR:!fsrs,2026-10-21T20:45:30.233Z,20,19.75603038,5.72420896,2,4,0,0,2026-10-01T20:45:30.233Z-->

Hur fungerar hybridkryptering?::Man byter en hemlig nyckel med ==asymmetrisk kryptering i början==, och krypterar sedan all data med snabb symmetrisk kryptering. Så gör TLS.
<!--SR:!fsrs,2026-10-04T20:19:54.078Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:19:54.078Z-->

## 3.1 Hur nyckelpar ger autenticitet

Vilken egenskap gör att ett nyckelpar kan ge autenticitet?::Att nycklarna är ==varandras inverser== – det ena låser, bara det andra låser upp, oavsett vilken ordning man använder dem.
<!--SR:!fsrs,2026-10-05T11:56:39.833Z,7,6.76476998,7.86010817,2,4,0,0,2026-09-28T11:56:39.833Z-->

Hur kan den privata nyckeln ge autenticitet?::Krypterar du något med din ==privata nyckel== kan vem som helst kontrollera det med din publika – och då vet de att bara du kunde ha skapat det.
<!--SR:!fsrs,2026-10-05T13:11:25.183Z,7,6.76476998,7.86010817,2,4,0,0,2026-09-28T13:11:25.183Z-->

## 4. Digitala signaturer

Vad är en digital signatur?::Ett sätt att ==binda din identitet till exakt det du signerat==. Ändras dokumentet efteråt stämmer inte signaturen längre.
<!--SR:!fsrs,2026-10-03T22:31:41.727Z,0,0.919819,9.62677498,3,6,1,0,2026-10-03T22:21:41.727Z-->

Vilka tre egenskaper ger en digital signatur? (3)
||
- **Autentisk** – signeraren skrev under med vilja och ingen har ändrat dokumentet
- **Oförfalskbar** – bara signeraren kunde ha gjort den
- **Oförnekbar** – signeraren kan inte förneka att han skrev under
<!--SR:!fsrs,2026-10-06T20:41:13.692Z,4,3.38533744,9.40994816,2,8,1,0,2026-10-02T20:41:13.692Z-->

Hur skapas och kontrolleras en digital signatur? (2)
||
- **Skapas** – hasha meddelandet och kryptera hashen med din privata nyckel
- **Kontrolleras** – dekryptera med avsändarens publika nyckel och jämför med en egen hash
<!--SR:!fsrs,2026-10-04T01:26:39.899Z,1,0.05109017,9.95759683,2,18,3,0,2026-10-03T01:26:39.899Z-->

Varför hashar man meddelandet innan man signerar det?::Asymmetrisk kryptering är långsam, så man signerar ==en kort sammanfattning== i stället för hela dokumentet.
<!--SR:!fsrs,2026-10-03T22:32:35.875Z,0,0.64554872,8.93300853,3,4,1,0,2026-10-03T22:22:35.875Z-->

## 4.1 Säkra sammanfattningsfunktioner

Vad är en säker hashfunktion (digest)?::Den gör om ett meddelande av ==vilken längd som helst till en kort, fast summa== som inte går att räkna baklänges.
<!--SR:!fsrs,2026-10-04T10:08:24.303Z,4,4.19933095,5.19004872,2,3,0,0,2026-09-30T10:08:24.303Z-->

Vilka tre egenskaper ska en säker hashfunktion ha? (3)
||
- **Lätt framåt** – lätt att räkna ut hashen från meddelandet
- **Svår bakåt** – går inte att räkna ut meddelandet från hashen
- **Krockfri** – svårt att hitta två meddelanden med samma hash
<!--SR:!fsrs,2026-10-07T20:50:39.136Z,6,6.37646667,8.36800982,2,6,1,0,2026-10-01T20:50:39.136Z-->

## 5.1 TLS, SSL och HTTPS

Vad är TLS/SSL?::En standard som skapar en ==säker kanal== mellan två parter över nätet. TLS är den nyare versionen av det äldre SSL.
<!--SR:!fsrs,2026-10-04T20:13:55.994Z,8,8.10051142,6.79877821,2,3,0,0,2026-09-26T20:13:55.994Z-->

Vad är HTTPS?::==Inget eget protokoll== – det är bara HTTP som körs över en TLS-kanal. Prefixet https: i adressen startar den.
<!--SR:!fsrs,2026-10-09T23:03:13.144Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T23:03:13.144Z-->

Vilka två delar består TLS av? (2)
||
- **En säker kanal** – sköter kryptering, integritet och äkthet på all data
- **En handskakning** – kommer överens om nycklar och algoritmer i början
<!--SR:!fsrs,2026-10-07T22:22:23.851Z,4,3.55533353,9.85347187,2,9,0,0,2026-10-03T22:22:23.851Z-->

Hur går TLS-handskakningen till? (4)
||
- **Hälsning** – parterna enas om vilka krypton som ska användas och byter slumptal
- **Certifikat** – servern visar sitt certifikat så klienten vet vem den pratar med
- **Nyckel** – de skapar en gemensam hemlig nyckel, skyddad med publik nyckel
- **Klart** – de slår om till krypterad trafik
<!--SR:!fsrs,2026-10-04T01:25:10.884Z,1,0.09671348,9.95708636,2,21,2,0,2026-10-03T01:25:10.884Z-->

## 5.2 Certifikat

Vad är ett digitalt certifikat?::Ett ==signerat intyg== som man kan lita på, eftersom någon man litar på har skrivit under det.
<!--SR:!fsrs,2026-10-09T22:20:04.315Z,6,6.04908239,7.86010817,2,4,0,0,2026-10-03T22:20:04.315Z-->

Vad ska ett certifikat säkerställa?::Att en ==publik nyckel verkligen hör till den ägare som står på certifikatet==. Utfärdarens signatur går i god för att kopplingen mellan nyckel och namn stämmer.
<!--SR:!fsrs,2026-10-04T20:53:30.608Z,3,1.9766116,8.90450831,2,5,0,0,2026-10-01T20:53:30.608Z-->

Vad innehåller ett certifikat? (3)
||
- **Vem det gäller** – personens namn och publika nyckel
- **Vem som skrivit under** – utfärdaren och dess signatur
- **Hur länge det gäller** – start- och slutdatum
<!--SR:!fsrs,2026-10-04T01:22:12.702Z,1,0.12702297,9.95602352,2,29,1,0,2026-10-03T01:22:12.702Z-->

Vad är en certifikatutfärdare (CA)?::En ==betrodd organisation== som ger ut certifikat och intygar att en publik nyckel hör till rätt ägare.
<!--SR:!fsrs,2026-10-03T22:33:10.633Z,0,0.64554872,8.93300853,3,4,1,0,2026-10-03T22:23:10.633Z-->

Hur vet man att man kan lita på ett certifikat?::Man ==följer kedjan av signaturer bakåt== tills man når någon man redan litar på, till exempel en känd certifikatutfärdare.
<!--SR:!fsrs,2026-10-05T22:22:56.699Z,2,1.30304824,9.91663514,2,16,1,0,2026-10-03T22:22:56.699Z-->
