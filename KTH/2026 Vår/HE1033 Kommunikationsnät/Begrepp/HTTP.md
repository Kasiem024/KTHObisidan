---
tags: [begrepp, HE1033, KTH, nätverk, year2026]
created: 2026-08-18
updated: 2026-08-18
---
# HTTP

> **Lager:** OSI 7 (Applikation)
> **Transport:** TCP, port 80 (HTTPS: 443).

---

## Definition
**HTTP (HyperText Transfer Protocol)** är applikationsprotokollet som webben bygger på. Det följer en **klient-server**-modell där klienten skickar en *request* och servern svarar med en *response*.

- **Tillståndslöst (stateless):** Servern minns inget mellan två anrop. Tillstånd byggs istället med cookies, sessioner eller tokens.
- **Pålitlig transport:** HTTP använder [[TCP]], så protokollet behöver inte själv hantera omsändning eller ordning.
- **HTTPS:** Samma protokoll men inkapslat i TLS, vilket ger kryptering och autentisering av servern.

### Vanliga metoder
- **GET:** Hämta en resurs (ska inte ändra något).
- **POST:** Skicka data till servern, t.ex. ett formulär.
- **PUT:** Skapa eller ersätt en resurs.
- **DELETE:** Ta bort en resurs.
- **HEAD:** Som GET men enbart headers, utan kropp.

### Statuskoder
- **1xx:** Informativt.
- **2xx:** Lyckades — `200 OK`.
- **3xx:** Omdirigering — `301` (permanent), `304` (Not Modified, använd cache).
- **4xx:** Klientfel — `404 Not Found`, `403 Forbidden`.
- **5xx:** Serverfel — `500 Internal Server Error`.

## Tenta-fokus
- **Varför TCP och inte UDP?** Webbsidor måste komma fram kompletta och i rätt ordning; TCP ger både omsändning och ordning.
- **Persistenta kopplingar:** HTTP/1.0 öppnade en ny TCP-koppling per objekt. HTTP/1.1 återanvänder kopplingen (*keep-alive*), vilket sparar en handskakning per objekt.
- **Utveckling:** HTTP/2 multiplexar flera förfrågningar i samma koppling (binärt format). HTTP/3 byter transport till QUIC, som körs över UDP.
- **Tillståndslöshet:** En vanlig fråga är *hur* en inloggning kan fungera trots att HTTP är tillståndslöst — svaret är cookies som skickas med i varje request.

## Kopplat till
- **Transport:** [[TCP]]
- **Ramverk:** [[OSI-modellen]]
- **Namnuppslagning:** [[DNS]]

## Flashcards

Vilket transportprotokoll och vilken port använder HTTP som standard?:: TCP, port 80 (HTTPS använder port 443).

Vad innebär det att HTTP är tillståndslöst?(Definition):: Att servern inte sparar någon information om klienten mellan två förfrågningar — tillstånd måste lösas med t.ex. cookies.

Vilken är den viktigaste skillnaden mellan HTTP/1.0 och HTTP/1.1?:: HTTP/1.1 använder persistenta kopplingar (keep-alive) och återanvänder samma TCP-koppling för flera objekt.

Vad betyder statuskoderna 200, 404 och 500?(3):: 200 = OK, 404 = Not Found (klientfel), 500 = Internal Server Error (serverfel).

Vilket transportprotokoll använder HTTP/3?:: QUIC, som i sin tur körs över UDP.
