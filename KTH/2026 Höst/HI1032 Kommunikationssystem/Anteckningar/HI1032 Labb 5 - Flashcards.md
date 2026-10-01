---
tags: [övrigt, HI1032, nätverk, KTH, year2026]
description: HI1032 Kommunikationssystem – HI1032 Labb 5 - Flashcards
created: 2026-09-29
updated: 2026-09-29
---
# HI1032 Labb 5 - Flashcards

## Modul 1: Grundläggande Nätverksdesign & Adressering

**Subnetting** (undernätuppdelning);;Metod för att dela upp ett större IP-nätverk i mindre undernät för att ==begränsa broadcast-domäner, höja säkerheten och effektivisera vägval==.
<!--SR:!fsrs,2026-09-30T23:38:47.807Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:38:47.807Z!fsrs,2026-09-30T23:33:54.419Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:33:54.419Z-->

Vad är syftet med att dela upp `192.168.0.0/24` i två `/25`-nät i Labb 5?::Att skapa en ==strikt logisk separation mellan Lärare och Studenter== samt routergränssnitt, vilket gör det möjligt att tillämpa olika säkerhetspolicyer (ACL:er).
<!--SR:!fsrs,2026-10-01T10:44:06.137Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:44:06.137Z-->

Hur beräknas antalet användbara host-IP-adresser i ett undernät?::Via formeln $2^{32-n} - 2$, där $n$ är prefixlängden och 2 dras av för ==nätverks-ID (första adressen) och broadcast-adressen (sista adressen)==.
<!--SR:!fsrs,2026-09-30T23:35:17.861Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:35:17.861Z-->

Hur är nätverksblocket `192.168.0.0/25` uppdelat i Labb 5? (2)
||
- **Lärarnät & Routrar** – IP-intervall `192.168.0.0 – 192.168.0.127/25` med mask `255.255.255.128`
- **Studentnät** – IP-intervall `192.168.0.128 – 192.168.0.255/25` med mask `255.255.255.128`
<!--SR:!fsrs,2026-09-30T23:34:11.651Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:34:11.651Z-->

Vilka är nätverks-ID och broadcast-adress för Lärarnätet i Labb 5?::Nätverks-ID är `192.168.0.0` och broadcast-adressen är `192.168.0.127`, vilket ger ==användbara värdadresser från 192.168.0.1 till 192.168.0.126==.
<!--SR:!fsrs,2026-10-01T14:33:32.736Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:33:32.736Z-->

Vilka är nätverks-ID och broadcast-adress för Studentnätet i Labb 5?::Nätverks-ID är `192.168.0.128` och broadcast-adressen är `192.168.0.255`, vilket ger ==användbara värdadresser från 192.168.0.129 till 192.168.0.254==.
<!--SR:!fsrs,2026-10-01T14:58:10.768Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:58:10.768Z-->

Vad innebär en Point-to-Point WAN-länk med `/30`-mask (`255.255.255.252`)?::Ett undernät med totalt 4 IP-adresser som reserverar ==exakt 2 användbara IP-adresser== för att direktkoppla två routergränssnitt utan adress-slöseri.
<!--SR:!fsrs,2026-09-30T23:39:20.039Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:39:20.039Z-->

Vilka två WAN-länkar är konfigurerade i Labb 5? (2)
||
- **Campus-V till Flempan-GW1** – Nätverk `10.10.10.0/30` (IP: `.1` och `.2`)
- **Campus-V till Flempan-GW2** – Nätverk `10.10.10.4/30` (IP: `.5` och `.6`)
<!--SR:!fsrs,2026-10-01T14:34:53.119Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:34:53.119Z-->

Vad innebär rollerna DTE och DCE vid seriell WAN-kommunikation? (2)
||
- **DCE (Data Communications Equipment)** – Den ände av kabeln som genererar klocksignalen (`clock rate`) och styr överföringshastigheten (samt tillhandahåller klocksignalen till DTE-routern)
- **DTE (Data Terminal Equipment)** – Den ände av kabeln som tar emot klocksignalen och anpassar sig till DCE
<!--SR:!fsrs,2026-10-01T10:25:15.269Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-30T10:25:15.269Z-->

Varför måste kommandot `clock rate 64000` ställas in på seriella gränssnitt i Labb 5?::För att tvinga DCE-gränssnittet att generera en klocksignal på 64 kbps så att ==dataöverföringen på det fysiska lagret kan synkroniseras korrekt==.
<!--SR:!fsrs,2026-09-30T23:40:11.234Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:40:11.234Z-->

Vad gör kommandot `ip route 0.0.0.0 0.0.0.0 G0/1` på kantroutern Campus-V?::Skapar en statisk default route (`0.0.0.0/0`) som pekar ut via gränssnitt G0/1 för att ==skicka all trafik med okänd destination vidare mot internet==.
<!--SR:!fsrs,2026-09-30T23:37:30.571Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:37:30.571Z-->

**Longest Prefix Match**;;Den regel i routingtabellen som säger att routern ==alltid väljer den rutt som har den mest specifika subnätmasken (längsta prefixet)==.
<!--SR:!fsrs,2026-10-01T10:48:25.854Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:48:25.854Z!fsrs,2026-10-01T14:37:48.149Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:37:48.149Z-->

Varför ger Cisco IOS en varning när du sätter en static default route till ett utgående gränssnitt istället för en nästa-hopp IP?::Eftersom routern tvingas göra en ==ARP-uppslagning för varje enskild destinations-IP== på ett broadcast-medium (Ethernet), vilket kan belasta routerns minne och CPU.
<!--SR:!fsrs,2026-09-30T14:41:48.371Z,0,0.00720941,9.93638689,1,5,0,0,2026-09-30T14:40:48.371Z-->

Vilka fysiska IP-adresser har Flempan-GW1 och Flempan-GW2 på sitt gemensamma LAN-gränssnitt G0/0?::Flempan-GW1 har `192.168.0.1/25` och Flempan-GW2 har `192.168.0.2/25` ==(båda ligger inom Lärar/Router-intervallet)==.
<!--SR:!fsrs,2026-10-01T14:22:45.086Z,1,0.00773286,9.94987373,2,8,0,0,2026-09-30T14:22:45.086Z-->

---

## Modul 2: Vägvalsprotokollet OSPFv2

**OSPFv2** (Open Shortest Path First v2);;Ett öppet, länkbaserat (Link-State) dynamiskt vägvalsprotokoll för IPv4 som använder ==Dijkstras SPF-algoritm för snabb konvergens och slingfria vägar==.
<!--SR:!fsrs,2026-10-01T14:39:42.740Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:39:42.740Z!fsrs,2026-10-01T14:40:46.331Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:40:46.331Z-->

Hur fungerar ett Link-State routingprotokoll som OSPF?::Alla routrar utbyter länkstatusar (Link-State) via LSA-paket, bygger upp en exakt likadan kartbild i sin databas (LSDB) och ==kör Dijkstras algoritm för att självständigt beräkna kortaste vägen==.
<!--SR:!fsrs,2026-10-01T14:10:13.446Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:10:13.446Z-->

Vad kallas den gemensamma databasen där OSPF sparar alla LSA-paket?::**LSDB** (Link-State Database) – en komplett topologisk karta som ==måste vara identisk på alla routrar inom samma area==.
<!--SR:!fsrs,2026-10-01T14:12:54.181Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:12:54.181Z-->

Hur beräknas OSPF Cost (metric) för ett gränssnitt?::Via formeln $\text{Cost} = \frac{\text{Reference Bandwidth}}{\text{Interface Bandwidth}} = \frac{10^8 \text{ bps}}{\text{Bandbredd i bps}}$, där ==lägre totalkostnad ger den bästa vägen==.
<!--SR:!fsrs,2026-10-01T14:38:13.484Z,1,0.1774331,8.39265542,2,3,0,0,2026-09-30T14:38:13.484Z-->

Vad blir OSPF-kostnaden för en FastEthernet-länk respektive en 64 kbps seriell länk? (2)
||
- **FastEthernet (100 Mbps)** – Kostnad $\frac{100\,000\,000}{100\,000\,000} = 1$
- **Seriell länk (64 kbps)** – Kostnad $\frac{100\,000\,000}{64\,000} \approx 1562$
<!--SR:!fsrs,2026-10-01T14:58:01.072Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:58:01.072Z-->

Vad är en Wildcard-mask (invers subnätmask) och hur beräknas den för OSPF?::En schablonmask där 0 kräver exakt matchning och 1 tillåter vilket värde som helst. Beräknas som ==$255.255.255.255 - \text{subnätmask}$==.
<!--SR:!fsrs,2026-10-01T14:38:24.108Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:38:24.108Z-->

Vilka Wildcard-masker används för Lärarnätet (/25) och WAN-länkarna (/30) i Labb 5? (2)
||
- **Lärarnät (/25)** – Wildcard-mask `0.0.0.127` (beräknat som $255.255.255.255 - 255.255.255.128$)
- **WAN-länkar (/30)** – Wildcard-mask `0.0.0.3` (beräknat som $255.255.255.255 - 255.255.255.252$)
<!--SR:!fsrs,2026-10-01T14:39:37.148Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:39:37.148Z-->

I vilken ordning väljer OSPF sitt Router ID (RID)? (3)
||
- **1. Manuellt konfigurerat** – Kommandot `router-id <IP>` (högst prioritet)
- **2. Högsta Loopback-IP** – Den högsta IP-adressen på ett aktiverat Loopback-gränssnitt
- **3. Högsta fysiska IP** – Den högsta IP-adressen på något aktivt fysiskt gränssnitt
<!--SR:!fsrs,2026-10-01T14:40:33.835Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:40:33.835Z-->

Varför sätter vi ett manuellt Router ID (t.ex. `10.10.10.10`) på routrarna i Labb 5?::För att garantera en ==förutsägbar och stabil identifiering i OSPF-domänen== som inte ändras om ett fysiskt gränssnitt går ned.
<!--SR:!fsrs,2026-10-01T14:38:48.748Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:38:48.748Z-->

Vad måste du göra om du ändrar OSPF Router ID på en redan aktiv router?::Köra kommandot ==`clear ip ospf process`== i privileged EXEC mode för att starta om OSPF och aktivera det nya ID:t.
<!--SR:!fsrs,2026-10-01T14:39:56.515Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:39:56.515Z-->

Vad är syftet med DR (Designated Router) och BDR på ett multiaccess-nätverk (Ethernet)?::Att minska mängden LSA-trafik genom att låta alla routrar enbart ==bilda fullständigt grannskap (adjacency) med DR och BDR== istället för med alla enheter.
<!--SR:!fsrs,2026-10-01T14:22:00.935Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:22:00.935Z-->

Hur väljs DR på ett Ethernet-nätverk och hur tvingade vi Flempan-GW1 att bli DR?::Först jämförs OSPF-prioritet (högst vinner, 0–255), därefter högst Router ID. På Flempan-GW1 satte vi ==`ip ospf priority 255` på G0/0== för att garantera att den blir DR.
<!--SR:!fsrs,2026-10-01T14:12:21.789Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:12:21.789Z-->

Vilka två multicast-adresser används för kommunikation inom OSPF? (2)
||
- **`224.0.0.5`** – *AllSPFRouters* (alla OSPF-routrar lyssnar här för Hello-paket och uppdateringar)
- **`224.0.0.6`** – *AllDRouters* (endast DR och BDR lyssnar här på LSA-rapporter från DROther)
<!--SR:!fsrs,2026-10-01T14:11:13.990Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:11:13.990Z-->

Varför konfigureras `passive-interface G0/0` på LAN-gränssnitten i Labb 5?::Det stoppar sändning och mottagning av OSPF Hello-paket mot klientdatorer, vilket ==sparar bandbredd, skyddar mot skadliga OSPF-routrar och annonserar ändå ut nätverket==.
<!--SR:!fsrs,2026-10-01T14:34:35.839Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:34:35.839Z-->

Vad gör kommandot `default-information originate` under `router ospf 1` på Campus-V?::Genererar och sprider en dynamisk OSPF default route (`O*E2`) till GW1 och GW2 så att de ==automatiskt hittar vägen ut mot internet via Campus-V==.
<!--SR:!fsrs,2026-10-01T14:38:33.396Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:38:33.396Z-->

---

## Modul 3: Redundans med HSRP

**HSRP** (Hot Standby Router Protocol);;Ett Cisco-proprietärt First Hop Redundancy Protocol (FHRP) som grupperar flera fysiska routrar till en virtuell router för att ==eliminera Single Point of Failure för klienternas Default Gateway==.
<!--SR:!fsrs,2026-10-01T10:24:06.808Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-30T10:24:06.808Z!fsrs,2026-10-01T10:48:46.846Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:48:46.846Z-->

Vad är problemet med att konfigurera en statisk Default Gateway IP på klientdatorer?::Klienter kan bara ha en gateway-IP inställd om den routern kraschar eller tappar sin länk ==förlorar klienterna all kontakt med andra nätverk==, även om det finns alternativa routrar.
<!--SR:!fsrs,2026-10-01T10:22:01.310Z,1,1.07709473,8.39265542,2,3,0,0,2026-09-30T10:22:01.310Z-->

Hur löser HSRP problemet med Single Point of Failure?::Genom att låta två fysiska routrar samarbeta kring en gemensam ==virtuell IP-adress och virtuell MAC-adress== som klienterna pekar mot (där Active routern svarar på ARP med den virtuella MAC-adressen).
<!--SR:!fsrs,2026-10-01T10:42:43.138Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-30T10:42:43.138Z-->

Vilka är den virtuella IP-adressen och MAC-adressen i Labb 5? (2)
||
- **Virtuell IP** – `192.168.0.254` (inställd som Default Gateway på PC-10 och PC-200)
- **Virtuell MAC (HSRPv2 Group 1)** – `0000.0c9f.f001` (genereras automatiskt utifrån gruppnumret)
<!--SR:!fsrs,2026-10-01T14:13:03.309Z,1,0.10421247,9.44205284,2,4,0,0,2026-09-30T14:13:03.309Z-->

Vilka två huvudroller finns i en HSRP-grupp? (2)
||
- **Active Router** – Hanterar och vidarebefordrar all trafik skickad till den virtuella gatewayens IP och MAC
- **Standby Router** – Övervakar den aktiva routern via Hello-paket och står redo att omedelbart ta över om den aktiva går ned
<!--SR:!fsrs,2026-10-01T10:43:06.153Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:43:06.153Z-->

Hur väljs Active Router i HSRP och hur tvingade vi Flempan-GW1 att bli Active?::Routrarna jämför prioritet (standard 100, högst vinner). På Flempan-GW1 satte vi ==`standby 1 priority 150` på G0/0== för att garantera att den vinner valet över GW2.
<!--SR:!fsrs,2026-09-30T23:51:12.824Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:51:12.824Z-->

Vad gör kommandot `standby 1 preempt` på Flempan-GW1?::Tillåter routern att ==omedelbart ta tillbaka Active-rollen== från en router med lägre prioritet när den startar om eller kommer tillbaka online.
<!--SR:!fsrs,2026-09-30T23:33:28.339Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:33:28.339Z-->

Vilka timers och nätverksparametrar använder HSRPv2 för sin kommunikation? (3)
||
- **Hello Time** – 3 sekunder (intervall mellan "jag lever"-paket)
- **Hold Time** – 10 sekunder (tid innan Standby förklarar Active död och tar över)
- **Multicast IP & Port** – `224.0.0.102` över **UDP-port 1985**
<!--SR:!fsrs,2026-09-30T23:35:29.975Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:35:29.975Z-->

Vad händer steg-för-steg om kabeln till Flempan-GW1 dras ur i Labb 5?::GW1 slutar skicka Hello-paket. Efter ==10 sekunder (Hold Time)== upptäcker GW2 detta, övergår från Standby till Active och börjar svara på all trafik till `192.168.0.254`.
<!--SR:!fsrs,2026-10-01T14:11:47.837Z,1,1.07709473,8.39265542,2,3,0,0,2026-09-30T14:11:47.837Z-->

Vilka är de tre första stegen i HSRP:s tillståndsmaskin (FSM)? (3)
||
- **Initial** – Starttillstånd innan HSRP aktiverats eller gränssnittet precis kommit upp
- **Listen** – Routern lyssnar efter Hello-paket för att upptäcka om det redan finns Active/Standby routrar
- **Speak** – Routern skickar egna Hello-paket och deltar aktivt i valet av Active/Standby
<!--SR:!fsrs,2026-10-01T14:34:25.031Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:34:25.031Z-->

Vilka är de två sista stegen i HSRP:s tillståndsmaskin (FSM)? (2)
||
- **Standby** – Reservrouter som kontinuerligt övervakar den aktiva routern
- **Active** – Huvudrouter som hanterar all trafik skickad till den virtuella gatewayen

---

## Modul 4: Trafikstyrning & Utökade ACL:er

**ACL** (Access Control List);;En sekventiell regellista på en router som utvärderar inkommande eller utgående datapaket för att ==tillåta (permit) eller stoppa (deny) trafik==.
<!--SR:!fsrs,2026-10-01T10:44:30.385Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:44:30.385Z!fsrs,2026-10-01T14:37:05.365Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:37:05.365Z-->

Vad är den huvudsakliga skillnaden mellan en Standard ACL och en Utökad (Extended) ACL?::En Standard ACL kan enbart filtrera på käll-IP, medan en Utökad ACL kan filtrera på ==käll-IP, destinations-IP, Layer 4-protokoll (TCP/UDP/ICMP/OSPF) och portnummer==.
<!--SR:!fsrs,2026-10-01T10:23:50.200Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-30T10:23:50.200Z-->

Vad innebär First-match principle när en router utvärderar en ACL?::Routorn läser regellistan ovanifrån och ned – så fort ett paket matchar en regel ==utförs åtgärden (permit/deny) omedelbart och utvärderingen avslutas==.
<!--SR:!fsrs,2026-10-01T10:48:43.998Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:48:43.998Z-->

Vad innebär osynlig Implicit Deny i slutet av en ACL?::Att all trafik som inte uttryckligen tillåtits av en tidigare regel ==stoppas automatiskt av den osynliga sista regeln `deny ip any any`==.
<!--SR:!fsrs,2026-10-01T10:47:56.374Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T10:47:56.374Z-->

Var ska Utökade respektive Standard ACL:er placeras i nätverket? (2)
||
- **Utökad ACL** – Placeras så nära källan som möjligt för att stoppa otillåten trafik direkt på ingångsgränssnittet innan den hinner belasta routerresurser och WAN-länkar i onödan.
- **Standard ACL** – Placeras så nära destinationen som möjligt för att inte blockera giltig trafik till andra mål
<!--SR:!fsrs,2026-09-30T23:34:01.811Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:34:01.811Z-->

På vilket gränssnitt och i vilken riktning placeras ACL:en i Labb 5?::På LAN-gränssnittet **G0/0** på Flempan-GW1 och Flempan-GW2 i **inkommande riktning (`in`)** med kommandot ==`ip access-group SLUTUPPGIFT_ACL in`==.
<!--SR:!fsrs,2026-10-01T14:37:44.557Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:37:44.557Z-->

Vilka regler gäller för Lärarnätet (`192.168.0.0/25`) mot webbservern (`172.16.0.10`) i Labb 5? (3)
||
- **HTTP (Port 80)** – `permit tcp 192.168.0.0 0.0.0.127 host 172.16.0.10 eq 80`
- **FTP (Port 21)** – `permit tcp 192.168.0.0 0.0.0.127 host 172.16.0.10 eq 21`
- **ICMP (Ping)** – `permit icmp 192.168.0.0 0.0.0.127 host 172.16.0.10`
<!--SR:!fsrs,2026-10-01T14:37:20.853Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:37:20.853Z-->

Vilka regler gäller för Studentnätet (`192.168.0.128/25`) mot webbservern i Labb 5? (2)
||
- **HTTP (Port 80)** – `permit tcp 192.168.0.128 0.0.0.127 host 172.16.0.10 eq 80`
- **ICMP (Ping)** – `permit icmp 192.168.0.128 0.0.0.127 host 172.16.0.10` *(FTP är spärrat via Implicit Deny)*
<!--SR:!fsrs,2026-10-01T14:12:31.629Z,1,0.10421247,9.44205284,2,4,0,0,2026-09-30T14:12:31.629Z-->

Vad händer om du glömmer att lägga till undantagsregler för OSPF och HSRP i din ACL?::Det osynliga `deny ip any any` kraschar nätverket genom att ==stoppa OSPF (IP-protokoll 89) och HSRP (UDP port 1985)==, vilket bryter vägvalet och redundansen.
<!--SR:!fsrs,2026-09-30T23:34:42.853Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:34:42.853Z-->

Vilka två explicita undantagsregler måste finnas i ACL:en för infrastruktur? (2)
||
- **OSPF-trafik** – `permit ospf any any` (tillåter OSPF IP-protokoll 89)
- **HSRP-trafik** – `permit udp any host 224.0.0.102 eq 1985` (tillåter HSRPv2 Hello-paket på UDP-port 1985)
<!--SR:!fsrs,2026-09-30T23:36:30.905Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:36:30.905Z-->

Vilken regel tillåter alla användare (`192.168.0.0/24`) att surfa på webben mot internet?::`permit tcp 192.168.0.0 0.0.0.255 any eq 80` ==(tillåter utgående HTTP-trafik till valfri destination)==.
<!--SR:!fsrs,2026-10-01T14:40:41.899Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:40:41.899Z-->

Hur kan du verifiera vilka regler i din ACL som har matchats av paket på routern?::Med privileged EXEC-kommandot ==`show access-lists`==, som visar regellistan och antalet träffar (*match counters*) per rad.
<!--SR:!fsrs,2026-09-30T23:39:10.351Z,1,0.1774331,8.39265542,2,3,0,0,2026-09-29T23:39:10.351Z-->

---

## 1. Nätverksdesign, IP & Subnetting

Vad skiljer ett nätverks-ID från en broadcast-adress? (2)
||
- **Nätverks-ID** – Första IP-adressen i undernätet (alla host-bitar är 0), identifierar själva undernätet
- **Broadcast-adress** – Sista IP-adressen i undernätet (alla host-bitar är 1), används för att nå alla värdar i undernätet samtidigt
<!--SR:!fsrs,2026-10-01T14:39:07.364Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-30T14:39:07.364Z-->

## 2. OSPFv2 – Vägvalsprotokoll & Teori

Vad innebär OSPF-konvergens?::Det tillstånd då ==alla routrar i nätverket har uppdaterat sina routingtabeller== och kommit överens om den aktuella topologin efter en ändring.
<!--SR:!fsrs,2026-09-30T23:39:55.618Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:39:55.618Z-->

## 3. HSRP & FHRP – Redundans på Djupet

Vad är skillnaden mellan HSRP och VRRP?::HSRP är ett Cisco-proprietärt protokoll medan **VRRP (Virtual Router Redundancy Protocol)** är en ==öppen IETF-standard med liknande funktionalitet==.
<!--SR:!fsrs,2026-10-01T10:48:04.647Z,1,0.21206544,8.39265542,2,3,0,0,2026-09-30T10:48:04.647Z-->

## 4. ACL:er & Trafikstyrning

Vad är skillnaden på inkommande (`in`) och utgående (`out`) riktning för en ACL? (2)
||
- **Inbound (`in`)** – Utvärderar paketet direkt när det anländer till gränssnittet, innan routingbeslutet tas
- **Outbound (`out`)** – Utvärderar paketet efter att routern tagit routingbeslutet och valt utgående gränssnitt
<!--SR:!fsrs,2026-09-30T23:42:29.701Z,1,0.42437996,5.20002037,2,2,0,0,2026-09-29T23:42:29.701Z-->

Vilka är portnumren och protokollen för HTTP, FTP, ICMP och OSPF? (4)
||
- **HTTP** – TCP-port 80
- **FTP** – TCP-port 21 (kontrollförbindelse)
- **ICMP** – Protokoll på Nätverkslagret (saknar Layer 4-port)
- **OSPF** – IP-protokollnummer 89
<!--SR:!fsrs,2026-10-01T10:43:51.537Z,1,0.10421247,9.44205284,2,4,0,0,2026-10-01T10:43:51.537Z-->