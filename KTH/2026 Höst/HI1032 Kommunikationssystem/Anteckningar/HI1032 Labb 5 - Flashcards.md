---
tags: [övrigt, HI1032, nätverk, KTH, year2026, nosr]
description: HI1032 Kommunikationssystem – HI1032 Labb 5 - Flashcards
created: 2026-09-29
updated: 2026-09-29
---
# HI1032 Labb 5 - Flashcards

## Modul 1: Grundläggande Nätverksdesign & Adressering

**Subnetting** (undernätuppdelning);;Metod för att dela upp ett större IP-nätverk i mindre undernät för att ==begränsa broadcast-domäner, höja säkerheten och effektivisera vägval==.
<!--SR:!fsrs,2026-10-02T21:45:49.448Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T21:45:49.448Z!fsrs,2026-10-02T21:57:08.371Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T21:57:08.371Z-->

Vad är syftet med att dela upp `192.168.0.0/24` i två `/25`-nät i Labb 5?::Att skapa en ==strikt logisk separation mellan Lärare och Studenter== samt routergränssnitt, vilket gör det möjligt att tillämpa olika säkerhetspolicyer (ACL:er).
<!--SR:!fsrs,2026-10-02T22:00:54.681Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:00:54.681Z-->

Hur beräknas antalet användbara host-IP-adresser i ett undernät?::Via formeln $2^{32-n} - 2$, där $n$ är prefixlängden och 2 dras av för ==nätverks-ID (första adressen) och broadcast-adressen (sista adressen)==.
<!--SR:!fsrs,2026-10-02T22:05:06.575Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T22:05:06.575Z-->

Vad innebär en Point-to-Point WAN-länk med `/30`-mask (`255.255.255.252`)?::Ett undernät med totalt 4 IP-adresser som reserverar ==exakt 2 användbara IP-adresser== för att direktkoppla två routergränssnitt utan adress-slöseri.
<!--SR:!fsrs,2026-10-02T21:48:46.119Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T21:48:46.119Z-->

Hur är de två gatewayarna kopplade upp till kantroutern Campus-V, och vad ger det? (2)
||
- **Egen länk per gateway** – var och en av Flempan-GW1 och Flempan-GW2 har en egen seriell punkt-till-punkt-länk upp till Campus-V
- **Följden** – campus får två skilda vägar upp mot kantroutern, alltså redundans om en länk eller gateway faller
<!--SR:!fsrs,2026-10-01T22:16:07.782Z,0,0.06875302,9.46178698,3,4,1,0,2026-10-01T22:06:07.782Z-->

Vad innebär rollerna DTE och DCE vid seriell WAN-kommunikation? (2)
||
- **DCE (Data Communications Equipment)** – Den ände av kabeln som genererar klocksignalen (`clock rate`) och styr överföringshastigheten (samt tillhandahåller klocksignalen till DTE-routern)
- **DTE (Data Terminal Equipment)** – Den ände av kabeln som tar emot klocksignalen och anpassar sig till DCE
<!--SR:!fsrs,2026-10-02T21:59:09.538Z,1,0.78469259,8.91819814,2,4,0,0,2026-10-01T21:59:09.538Z-->

Varför måste kommandot `clock rate 64000` ställas in på seriella gränssnitt i Labb 5?::För att tvinga DCE-gränssnittet att generera en klocksignal på 64 kbps så att ==dataöverföringen på det fysiska lagret kan synkroniseras korrekt==.
<!--SR:!fsrs,2026-10-02T21:44:21.729Z,1,0.22495104,8.39432857,2,4,1,0,2026-10-01T21:44:21.729Z-->

Vad gör kommandot `ip route 0.0.0.0 0.0.0.0 G0/1` på kantroutern Campus-V?::Skapar en statisk default route (`0.0.0.0/0`) som pekar ut via gränssnitt G0/1 för att ==skicka all trafik med okänd destination vidare mot internet==.
<!--SR:!fsrs,2026-10-01T22:14:38.503Z,0,0.19206666,8.40750771,3,3,1,0,2026-10-01T22:04:38.503Z-->

**Longest Prefix Match**;;Den regel i routingtabellen som säger att routern ==alltid väljer den rutt som har den mest specifika subnätmasken (längsta prefixet)==.
<!--SR:!fsrs,2026-10-03T21:59:46.746Z,2,2.01850261,6.79877821,2,3,0,0,2026-10-01T21:59:46.746Z!fsrs,2026-10-02T22:00:59.865Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:00:59.865Z-->

Varför ger Cisco IOS en varning när du sätter en static default route till ett utgående gränssnitt istället för en nästa-hopp IP?::Eftersom routern tvingas göra en ==ARP-uppslagning för varje enskild destinations-IP== på ett broadcast-medium (Ethernet), vilket kan belasta routerns minne och CPU.
<!--SR:!fsrs,2026-10-01T22:18:45.256Z,0,0.001,9.97794323,1,11,0,0,2026-10-01T22:17:45.256Z-->

Varför sitter Flempan-GW1:s och Flempan-GW2:s G0/0 på samma LAN-segment i Labb 5?::För att båda gatewayarna ska dela samma nät med var sin egen adress — det är ==förutsättningen för att HSRP ska kunna ge dem en gemensam virtuell gateway==.
<!--SR:!fsrs,2026-10-01T22:27:22.537Z,0,0.00160263,9.97699705,3,11,1,0,2026-10-01T22:17:22.537Z-->

Vad skiljer ett nätverks-ID från en broadcast-adress? (2)
||
- **Nätverks-ID** – Första IP-adressen i undernätet (alla host-bitar är 0), identifierar själva undernätet
- **Broadcast-adress** – Sista IP-adressen i undernätet (alla host-bitar är 1), används för att nå alla värdar i undernätet samtidigt
<!--SR:!fsrs,2026-10-02T22:00:20.785Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:00:20.785Z-->

Vilka delar består topologin i Labb 5 av, och vilken roll har de? (4)
||
- **Kantrouter** – Campus-V kopplar campus mot internet och WEB-servern
- **Gatewayroutrar** – Flempan-GW1 och GW2 är klienternas väg ut, med HSRP-redundans
- **Switchar** – Switch0 och Switch1 binder ihop klienter och gatewayar i samma LAN
- **Klienter & servrar** – PC10 (lärare) och PC200 (student); WEB-server och internet-server
<!--SR:!fsrs,2026-10-02T22:14:56.882Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-01T22:14:56.882Z-->

Vad vänder Campus-V:s fyra gränssnitt mot i Labb 5? (4)
||
- **S0/0/0 (seriell)** – länk ner till Flempan-GW1
- **S0/0/1 (seriell)** – länk ner till Flempan-GW2
- **G0/0 (Ethernet)** – mot WEB-servern
- **G0/1 (Ethernet)** – mot internet
<!--SR:!fsrs,2026-10-02T22:18:08.384Z,1,0.1774331,8.39265542,2,3,0,0,2026-10-01T22:18:08.384Z-->

Varför sätts klockan (clock rate) på Campus-V och inte på gatewayarna i Labb 5?::För att ==båda Campus-V:s seriella gränssnitt är DCE-änden==, och det är DCE-sidan som genererar klocksignalen.
<!--SR:!fsrs,2026-10-01T22:14:31.435Z,0,0.212,6.4133,1,1,0,0,2026-10-01T22:13:31.435Z-->

Vad får korskopplingen mellan Switch0 och Switch1 för följd i Labb 5?::Att ==båda PC:erna och båda gatewayarna hamnar i samma broadcast-domän==, vilket är förutsättningen för att HSRP ska fungera.
<!--SR:!fsrs,2026-10-01T22:18:58.624Z,0,0.03485141,9.59286876,1,3,0,0,2026-10-01T22:17:58.624Z-->

Varför har campus två gatewayroutrar (Flempan-GW1 och GW2) i Labb 5?::För att ge ==redundans om en gateway faller==; både OSPF och HSRP finns i labben för att utnyttja den dubbla vägen.
<!--SR:!fsrs,2026-10-02T22:15:08.050Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-01T22:15:08.050Z-->

Vad kan du bara göra i Labb 5:s del 1, innan vägvalet (routing) är igång?::Bara ==pinga enheter som sitter direkt kopplade till varandra==, eftersom ingen router ännu kan nå andra nät.
<!--SR:!fsrs,2026-10-01T22:14:11.267Z,0,0.212,6.4133,1,1,0,0,2026-10-01T22:13:11.267Z-->

---

## Modul 2: Vägvalsprotokollet OSPFv2

**OSPFv2** (Open Shortest Path First v2);;Ett öppet, länkbaserat (Link-State) dynamiskt vägvalsprotokoll för IPv4 som använder ==Dijkstras SPF-algoritm för snabb konvergens och slingfria vägar==.
<!--SR:!fsrs,2026-10-02T21:54:26.100Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:54:26.100Z!fsrs,2026-10-02T21:45:43.008Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:45:43.008Z-->

Hur fungerar ett Link-State routingprotokoll som OSPF?::Alla routrar utbyter länkstatusar (Link-State) via LSA-paket, bygger upp en exakt likadan kartbild i sin databas (LSDB) och ==kör Dijkstras algoritm för att självständigt beräkna kortaste vägen==.
<!--SR:!fsrs,2026-10-02T21:56:54.971Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:56:54.971Z-->

Vad kallas den gemensamma databasen där OSPF sparar alla LSA-paket?::**LSDB** (Link-State Database) – en komplett topologisk karta som ==måste vara identisk på alla routrar inom samma area==.
<!--SR:!fsrs,2026-10-02T21:57:58.530Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:57:58.530Z-->

Hur beräknas OSPF Cost (metric) för ett gränssnitt?::Via formeln $\text{Cost} = \frac{\text{Reference Bandwidth}}{\text{Interface Bandwidth}} = \frac{10^8 \text{ bps}}{\text{Bandbredd i bps}}$, där ==lägre totalkostnad ger den bästa vägen==.
<!--SR:!fsrs,2026-10-02T18:32:37.016Z,1,0.71149248,8.91819814,2,4,0,0,2026-10-01T18:32:37.016Z-->

Vad blir OSPF-kostnaden för en FastEthernet-länk respektive en 64 kbps seriell länk? (2)
||
- **FastEthernet (100 Mbps)** – Kostnad $\frac{100\,000\,000}{100\,000\,000} = 1$
- **Seriell länk (64 kbps)** – Kostnad $\frac{100\,000\,000}{64\,000} \approx 1562$
<!--SR:!fsrs,2026-10-02T21:59:27.850Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:59:27.850Z-->

Vad är en Wildcard-mask (invers subnätmask) och hur beräknas den för OSPF?::En schablonmask där 0 kräver exakt matchning och 1 tillåter vilket värde som helst. Beräknas som ==$255.255.255.255 - \text{subnätmask}$==.
<!--SR:!fsrs,2026-10-02T21:58:31.866Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:58:31.866Z-->

I vilken ordning väljer OSPF sitt Router ID (RID)? (3)
||
- **1. Manuellt konfigurerat** – Kommandot `router-id <IP>` (högst prioritet)
- **2. Högsta Loopback-IP** – Den högsta IP-adressen på ett aktiverat Loopback-gränssnitt
- **3. Högsta fysiska IP** – Den högsta IP-adressen på något aktivt fysiskt gränssnitt
<!--SR:!fsrs,2026-10-02T22:00:33.329Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:00:33.329Z-->

Varför sätter vi ett manuellt Router ID (t.ex. `10.10.10.10`) på routrarna i Labb 5?::För att garantera en ==förutsägbar och stabil identifiering i OSPF-domänen== som inte ändras om ett fysiskt gränssnitt går ned.
<!--SR:!fsrs,2026-10-02T21:59:36.706Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:59:36.706Z-->

Vad måste du göra om du ändrar OSPF Router ID på en redan aktiv router?::Köra kommandot ==`clear ip ospf process`== i privileged EXEC mode för att starta om OSPF och aktivera det nya ID:t.
<!--SR:!fsrs,2026-10-03T21:54:47.692Z,2,2.01850261,6.79877821,2,3,0,0,2026-10-01T21:54:47.692Z-->

Vad är syftet med DR (Designated Router) och BDR på ett multiaccess-nätverk (Ethernet)?::Att minska mängden LSA-trafik genom att låta alla routrar enbart ==bilda fullständigt grannskap (adjacency) med DR och BDR== istället för med alla enheter.
<!--SR:!fsrs,2026-10-02T21:48:17.399Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:48:17.399Z-->

Hur väljs DR på ett Ethernet-nätverk och hur tvingade vi Flempan-GW1 att bli DR?::Först jämförs OSPF-prioritet (högst vinner, 0–255), därefter högst Router ID. På Flempan-GW1 satte vi ==`ip ospf priority 255` på G0/0== för att garantera att den blir DR.
<!--SR:!fsrs,2026-10-01T22:15:01.967Z,0,0.06875302,9.46178698,3,4,1,0,2026-10-01T22:05:01.967Z-->

Vilka två multicast-adresser används för kommunikation inom OSPF? (2)
||
- **`224.0.0.5`** – *AllSPFRouters* (alla OSPF-routrar lyssnar här för Hello-paket och uppdateringar)
- **`224.0.0.6`** – *AllDRouters* (endast DR och BDR lyssnar här på LSA-rapporter från DROther)
<!--SR:!fsrs,2026-10-02T21:57:27.467Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:57:27.467Z-->

Varför konfigureras `passive-interface G0/0` på LAN-gränssnitten i Labb 5?::Det stoppar sändning och mottagning av OSPF Hello-paket mot klientdatorer, vilket ==sparar bandbredd, skyddar mot skadliga OSPF-routrar och annonserar ändå ut nätverket==.
<!--SR:!fsrs,2026-10-02T21:57:53.691Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:57:53.691Z-->

Vad gör kommandot `default-information originate` under `router ospf 1` på Campus-V?::Genererar och sprider en dynamisk OSPF default route (`O*E2`) till GW1 och GW2 så att de ==automatiskt hittar vägen ut mot internet via Campus-V==.
<!--SR:!fsrs,2026-10-02T21:49:55.342Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:49:55.342Z-->

Vad innebär OSPF-konvergens?::Det tillstånd då ==alla routrar i nätverket har uppdaterat sina routingtabeller== och kommit överens om den aktuella topologin efter en ändring.
<!--SR:!fsrs,2026-10-02T22:00:10.057Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T22:00:10.057Z-->

Vilket nät får du uttryckligen inte annonsera i OSPF i Labb 5?::==Campus-V:s Lo0-nät (loopback)== ska inte annonseras ut i OSPF.
<!--SR:!fsrs,2026-10-01T22:14:17.731Z,0,0.212,6.4133,1,1,0,0,2026-10-01T22:13:17.731Z-->

Vilka gränssnitt gör du passiva (passive-interface) i OSPF i Labb 5?::De där det ==inte sitter någon annan OSPF-router på andra sidan==, till exempel mot klienter och servrar.
<!--SR:!fsrs,2026-10-02T22:14:38.674Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-01T22:14:38.674Z-->

---

## Modul 3: Redundans med HSRP

**HSRP** (Hot Standby Router Protocol);;Ett Cisco-proprietärt First Hop Redundancy Protocol (FHRP) som grupperar flera fysiska routrar till en virtuell router för att ==eliminera Single Point of Failure för klienternas Default Gateway==.
<!--SR:!fsrs,2026-10-02T18:34:23.910Z,1,0.78469259,8.91819814,2,4,0,0,2026-10-01T18:34:23.910Z!fsrs,2026-10-02T21:58:01.426Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:58:01.426Z-->

Vad är problemet med att konfigurera en statisk Default Gateway IP på klientdatorer?::Klienter kan bara ha en gateway-IP inställd om den routern kraschar eller tappar sin länk ==förlorar klienterna all kontakt med andra nätverk==, även om det finns alternativa routrar.
<!--SR:!fsrs,2026-10-02T21:45:12.593Z,1,0.62814848,9.26065651,2,5,1,0,2026-10-01T21:45:12.593Z-->

Hur löser HSRP problemet med Single Point of Failure?::Genom att låta två fysiska routrar samarbeta kring en gemensam ==virtuell IP-adress och virtuell MAC-adress== som klienterna pekar mot (där Active routern svarar på ARP med den virtuella MAC-adressen).
<!--SR:!fsrs,2026-10-02T21:46:06.528Z,1,0.78469259,8.91819814,2,4,0,0,2026-10-01T21:46:06.528Z-->

Vad måste du ställa in på PC10 och PC200 i Labb 5, och vad händer om du ställer fel? (2)
||
- **Default gateway ska vara den virtuella adressen** – ett eget steg i labben, efter att HSRP är konfigurerat på båda gatewayarna
- **Fällan** – pekar du i stället på en av routrarnas egna adresser fungerar nätet som vanligt, ända till just den routern faller, och då tappar klienten allt
<!--SR:!fsrs,2026-10-02T21:49:05.678Z,1,0.35678783,9.61483704,2,5,0,0,2026-10-01T21:49:05.678Z-->

Vilka två huvudroller finns i en HSRP-grupp? (2)
||
- **Active Router** – Hanterar och vidarebefordrar all trafik skickad till den virtuella gatewayens IP och MAC
- **Standby Router** – Övervakar den aktiva routern via Hello-paket och står redo att omedelbart ta över om den aktiva går ned
<!--SR:!fsrs,2026-10-02T22:05:27.151Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:05:27.151Z-->

Hur väljs Active Router i HSRP och hur tvingade vi Flempan-GW1 att bli Active?::Routrarna jämför prioritet (standard 100, högst vinner). På Flempan-GW1 satte vi ==`standby 1 priority 150` på G0/0== för att garantera att den vinner valet över GW2.
<!--SR:!fsrs,2026-10-02T21:48:35.023Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T21:48:35.023Z-->

Vad gör kommandot `standby 1 preempt` på Flempan-GW1?::Tillåter routern att ==omedelbart ta tillbaka Active-rollen== från en router med lägre prioritet när den startar om eller kommer tillbaka online.
<!--SR:!fsrs,2026-10-02T22:06:50.942Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T22:06:50.942Z-->

Vilka timers och nätverksparametrar använder HSRPv2 för sin kommunikation? (3)
||
- **Hello Time** – 3 sekunder (intervall mellan "jag lever"-paket)
- **Hold Time** – 10 sekunder (tid innan Standby förklarar Active död och tar över)
- **Multicast IP & Port** – `224.0.0.102` över **UDP-port 1985**
<!--SR:!fsrs,2026-10-02T22:04:52.087Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T22:04:52.087Z-->

Vad händer steg-för-steg om kabeln till Flempan-GW1 dras ur i Labb 5?::GW1 slutar skicka Hello-paket. Efter ==10 sekunder (Hold Time)== upptäcker GW2 detta, övergår från Standby till Active och börjar svara på all trafik till `192.168.0.254`.
<!--SR:!fsrs,2026-10-02T22:17:37.224Z,1,0.62814848,9.26065651,2,5,1,0,2026-10-01T22:17:37.224Z-->

Vilka är de tre första stegen i HSRP:s tillståndsmaskin (FSM)? (3)
||
- **Initial** – Starttillstånd innan HSRP aktiverats eller gränssnittet precis kommit upp
- **Listen** – Routern lyssnar efter Hello-paket för att upptäcka om det redan finns Active/Standby routrar
- **Speak** – Routern skickar egna Hello-paket och deltar aktivt i valet av Active/Standby
<!--SR:!fsrs,2026-10-02T22:05:15.831Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T22:05:15.831Z-->

Vilka är de två sista stegen i HSRP:s tillståndsmaskin (FSM)? (2)
||
- **Standby** – Reservrouter som kontinuerligt övervakar den aktiva routern
- **Active** – Huvudrouter som hanterar all trafik skickad till den virtuella gatewayen
<!--SR:!fsrs,2026-10-02T22:14:03.898Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-01T22:14:03.898Z-->

Vad är skillnaden mellan HSRP och VRRP?::HSRP är ett Cisco-proprietärt protokoll medan **VRRP (Virtual Router Redundancy Protocol)** är en ==öppen IETF-standard med liknande funktionalitet==.
<!--SR:!fsrs,2026-10-02T21:34:10.429Z,1,0.78469259,8.91819814,2,4,0,0,2026-10-01T21:34:10.429Z-->

Hur verifierar du HSRP i Labb 5, och vad ska du se?::Med kommandot ==`show standby`==: Flempan-GW1 ska stå i active och Flempan-GW2 i standby.
<!--SR:!fsrs,2026-10-01T22:18:29.760Z,0,0.08335672,8.80630447,1,2,0,0,2026-10-01T22:17:29.760Z-->

---

## Modul 4: Trafikstyrning & Utökade ACL:er

**ACL** (Access Control List);;En sekventiell regellista på en router som utvärderar inkommande eller utgående datapaket för att ==tillåta (permit) eller stoppa (deny) trafik==.
<!--SR:!fsrs,2026-10-03T21:54:35.388Z,2,2.01850261,6.79877821,2,3,0,0,2026-10-01T21:54:35.388Z!fsrs,2026-10-02T21:44:47.017Z,1,0.20347043,8.39432857,2,4,1,0,2026-10-01T21:44:47.017Z-->

Vad är den huvudsakliga skillnaden mellan en Standard ACL och en Utökad (Extended) ACL?::En Standard ACL kan enbart filtrera på käll-IP, medan en Utökad ACL kan filtrera på ==käll-IP, destinations-IP, Layer 4-protokoll (TCP/UDP/ICMP/OSPF) och portnummer==.
<!--SR:!fsrs,2026-10-02T18:32:18.472Z,1,0.78469259,8.91819814,2,4,0,0,2026-10-01T18:32:18.472Z-->

Vad innebär First-match principle när en router utvärderar en ACL?::Routorn läser regellistan ovanifrån och ned – så fort ett paket matchar en regel ==utförs åtgärden (permit/deny) omedelbart och utvärderingen avslutas==.
<!--SR:!fsrs,2026-10-02T21:48:25.903Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:48:25.903Z-->

Vad innebär osynlig Implicit Deny i slutet av en ACL?::Att all trafik som inte uttryckligen tillåtits av en tidigare regel ==stoppas automatiskt av den osynliga sista regeln `deny ip any any`==.
<!--SR:!fsrs,2026-10-02T21:57:42.483Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:57:42.483Z-->

Var ska Utökade respektive Standard ACL:er placeras i nätverket? (2)
||
- **Utökad ACL** – Placeras så nära källan som möjligt för att stoppa otillåten trafik direkt på ingångsgränssnittet innan den hinner belasta routerresurser och WAN-länkar i onödan.
- **Standard ACL** – Placeras så nära destinationen som möjligt för att inte blockera giltig trafik till andra mål
<!--SR:!fsrs,2026-10-04T22:00:03.353Z,3,2.69463548,6.79877821,2,3,0,0,2026-10-01T22:00:03.353Z-->

På vilket gränssnitt och i vilken riktning placeras ACL:en i Labb 5?::På LAN-gränssnittet **G0/0** på Flempan-GW1 och Flempan-GW2 i **inkommande riktning (`in`)** med kommandot ==`ip access-group SLUTUPPGIFT_ACL in`==.
<!--SR:!fsrs,2026-10-02T21:57:05.115Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:57:05.115Z-->

Vad skiljer lärarnas och studenternas policy mot WEB-servern i Labb 5? (2)
||
- **Lika för båda** – både lärar- och studenthalvan får webb (HTTP) och ping (ICMP) mot WEB-servern
- **Enda skillnaden** – bara lärarhalvan får dessutom FTP
<!--SR:!fsrs,2026-10-02T21:58:12.458Z,1,0.35003063,7.86059937,2,4,1,0,2026-10-01T21:58:12.458Z-->

Vad händer om du glömmer att lägga till undantagsregler för OSPF och HSRP i din ACL?::Det osynliga `deny ip any any` kraschar nätverket genom att ==stoppa OSPF (IP-protokoll 89) och HSRP (UDP port 1985)==, vilket bryter vägvalet och redundansen.
<!--SR:!fsrs,2026-10-02T21:35:46.340Z,1,0.22495104,8.39432857,2,4,1,0,2026-10-01T21:35:46.340Z-->

Vilka två explicita undantagsregler måste finnas i ACL:en för infrastruktur? (2)
||
- **OSPF-trafik** – `permit ospf any any` (tillåter OSPF IP-protokoll 89)
- **HSRP-trafik** – `permit udp any host 224.0.0.102 eq 1985` (tillåter HSRPv2 Hello-paket på UDP-port 1985)
<!--SR:!fsrs,2026-10-02T22:00:44.945Z,1,0.22495104,8.39432857,2,4,1,0,2026-10-01T22:00:44.945Z-->

Vad säger utgående-policyn för campusnätet mot resten av nätet i Labb 5?::Bara ==webbtrafik (HTTP)== släpps vidare ut mot internet; allt annat fångas av den implicita neka-regeln.
<!--SR:!fsrs,2026-10-01T22:27:06.097Z,0,0.06875302,9.46178698,3,4,1,0,2026-10-01T22:17:06.097Z-->

Hur kan du verifiera vilka regler i din ACL som har matchats av paket på routern?::Med privileged EXEC-kommandot ==`show access-lists`==, som visar regellistan och antalet träffar (*match counters*) per rad.
<!--SR:!fsrs,2026-10-02T21:50:33.774Z,1,0.87439376,8.91819814,2,4,0,0,2026-10-01T21:50:33.774Z-->

Vad är skillnaden på inkommande (`in`) och utgående (`out`) riktning för en ACL? (2)
||
- **Inbound (`in`)** – Utvärderar paketet direkt när det anländer till gränssnittet, innan routingbeslutet tas
- **Outbound (`out`)** – Utvärderar paketet efter att routern tagit routingbeslutet och valt utgående gränssnitt
<!--SR:!fsrs,2026-10-02T22:15:27.298Z,1,0.38698377,7.86059937,2,4,1,0,2026-10-01T22:15:27.298Z-->

Vilka är portnumren och protokollen för HTTP, FTP, ICMP och OSPF? (4)
||
- **HTTP** – TCP-port 80
- **FTP** – TCP-port 21 (kontrollförbindelse)
- **ICMP** – Protokoll på Nätverkslagret (saknar Layer 4-port)
- **OSPF** – IP-protokollnummer 89
<!--SR:!fsrs,2026-10-02T21:50:16.190Z,1,0.10421247,9.61483704,2,5,0,0,2026-10-01T21:50:16.190Z-->

Alla PDU-tester lyckas före ACL:en – vilka tre ska misslyckas efter den, och varför? (3)
||
- **Lärar-PC pingar internet** – faller, för bara webbtrafik släpps ut mot internet
- **Student-PC pingar internet** – faller av samma skäl, ping ut tillåts inte
- **Student-PC kör FTP mot WEB** – faller, studenter får bara webb och ping, inte FTP
<!--SR:!fsrs,2026-10-02T22:13:58.578Z,1,0.42437996,5.20002037,2,2,0,0,2026-10-01T22:13:58.578Z-->
