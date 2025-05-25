# 05-12 HI1025 Föreläsning 8

---

Skapad: `=dateformat(this.file.ctime, "D, HH:mm, EEEE ")`

Uppdaterad: `=dateformat(this.file.mtime, "D, HH:mm, EEEE")`

Tags: #year2025 #KTH #HI1025 #föreläsning

---

I POSIX finns det något som heter Socket. Det används för att kommunciera mellan tåv olika datorer. Det är en förbindelse mellan två olika ändpunkter.

Denna förbindelse kan användas för IP/TC (Inter Process/Thread Communication).

Det finns 5 sätt för processer att prata med varanadra:
- Shared memory
- Mapped memory
- Pipes
- FIFOs
- Sockets

Shared memory handlar om att processerna har tillgånga till samma adressrymd och kan läsa/skriva till samma plats i minnet.

Mapped memory liknar shared memory men handlar mer om specifikt om filer.

Pipes permit sequential communication from one process to a related process. Det är en seriell buffert för enkelriktad kommunikation.

FIFOs liknar pipes

Sockets låter kommunikation mellan olika processer även om de är på olika datorer.

**fork() MÅSTE MAN KUNNA**

Lab 4 kommer handla om sockets.

TCP består av Segment, Packet och Frame.

- Segment: TCP Header och Data
- Packet: IP Header, TCP Header och Data
- Frame: MAC Header, IP Header, TCP Header, Data och Frame Check

Enskilda datorerr kan indentifeireas genom globalt unik ip adresser. En enskild tjänst på en dator kan identifieras genom ett port-nummer

server: socket, bind, listen
klient: socket, connect

För att anropa en tjänst behövs en socket. Klienten försöker etablera en förbindlese till servern genom den socketen (connect).

server: accept, read
klient: write

Servern måste acceptera förbindelsen. Därefter kan data utbytas. Detta kan göras tills en av de avbryter förbindelsen med close.

DNS och WWW.

Domain Name System. Varje domän har en ip adress. När man söker efter en hemsida används DNS för att hitta ip adressen till just den hemsidan.

URL består av Protkoll://Host:Port/Path

Protkoll är HTTP/S

Telnet används för att kunna se ut som en webbläsare.

REST Verb att kunna:
- Get
- Post
