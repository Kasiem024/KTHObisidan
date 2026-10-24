# Parked findings: HI1032 lecture coverage (2026-10-20) and HI1031 oral-exam depth (2026-10-21)

Status: findings only. Nothing below is applied unless it says so. The raw subagent reports lived in
`%TEMP%\hi1032cov` and `%TEMP%\hi1031depth`, which are not durable. This file is the durable copy.

## HI1032: is everything the seven lectures teach covered by the theory notes or decks?

**Method.** Seven auditors ran, one per lecture, each with a verifier. The auditors read every slide and
searched the two theory notes and the two Tentaplugg decks.

**Result.** Every concept and mechanism the lectures teach is in the theory notes or the decks, and
nothing in them contradicts the lectures. All 21 spot checks of "covered" held. The verifiers rejected
none of the gaps and found no new ones.

**Worth adding.** The author has not decided on these. He moved on to the flashcard-candidate task
(F102) without answering.

1. **Webbhotell** (lecture 7; topic World Wide Web och HTTP, Säker). The lecture explains why the HTTP
   request carries the domain name in the `Host:` line: a web host serves many sites from one IP
   address. The theory note has the `Host:` line but not the reason. This was asked on an old exam
   (B 5b, 1 p).
2. **Send-window worked example** (lecture 3, Säker). The lecture works through "sent up to byte 202,
   cwnd = 20, ack 200, rwnd = 9". The concept is covered but the example is not. It fits the
   Räkna själv list.
3. **One-sentence details in Säker topics:**
   - k = 2 in the simple RTO = k·RTT_S (lecture 2)
   - RTP's payload type gives the encoding (lecture 5)
   - a port can be given in the URL, as in `:8000` (lecture 1)
   - two-way communication gives four buffers (lecture 2)

**His decision.** Lecture 7 spends about ten slides on the `dig` demo and on reading DNS response
statuses: NOERROR, NXDOMAIN, SERVFAIL, REFUSED and timeout. The Föreläsningskarta classes the demo as
Osannolik, but one learning objective is to "känna igen vissa fel och problem".

**Outside the lectures.** Two old-exam sub-questions are neither in the lectures' text nor in the files:

- SDP, which negotiates the encoding in SIP (B 7c, 2 p)
- JPEG macroblocks and the downsampling of Cb and Cr (B 5f, 2 p)

The slides are images without text, so either may be on a slide nobody could read.

**Left as is.**

- Möjlig-topic details, which the one-line rule cuts.
- Material classed Osannolik or treated as lab material: Python socket code, the Wireshark exercise,
  monitoring tools and product names, PlanetLab, the IPv6 delay study, video bitrates, HTML tags, CSS
  and JavaScript, and domain names as trademarks.
- The window scale and timestamp options, which exist only in the Labb 1 deck.

## HI1031: does the Snabbsvar manuscript go deep enough for the oral exam?

**Method.** Nine examiner agents ran, one per chapter group, and nine verifiers tried to throw out
unfair findings. They judged against the official question list and against the book.

**Result.** There are no factual errors and no high-severity gaps. There are seven medium gaps. Each
one names a concept without explaining it, so the obvious follow-up question would catch the student:

| Chapter, question | Missing | Book |
| --- | --- | --- |
| Kap 2, Middleware | the end-to-end argument (Saltzer): some functions need the application at the end points | §2.3.3 "Limitations of middleware" |
| Kap 2, Mobil agent | the security threat in both directions, to the host and to the agent | §2.3.1 |
| Kap 4, Virtualisering | what the end-to-end argument is (the card names it only) | §2.3.3, §4.5 |
| Kap 5, RMI | the binder or RMIregistry that gives the client its first remote reference | §5.4.2 |
| Kap 16, Optimistic | validation compares the read set and write set of overlapping transactions | §16.5 |
| Kap 16, Dirty reads | what a cascading abort is | §16.2.2 |
| Kap 17, Hierarchical vs flat 2PC | what "provisional commit" means, and how it differs from prepared | §17.3.2 |

**Low gaps.** None of these has been applied anywhere:

- REST choreography (Kap 9, §9.7.3)
- the pub-sub subscription models and content-based routing strategies (Kap 6, §6.3.1–6.3.2)
- fault tolerance as part of the point of indirect communication (Kap 6, §6.6)
- at-least-once vs at-most-once (Kap 4, §5.3.1)
- RPC's addressing in the four-way comparison (Kap 5)
- exceptions and distributed garbage collection in the object model (Kap 5, §5.4.1)
- the 2PC recovery status values *done* and *uncertain* (Kap 17, §17.6.4)
- the name → GUID lookup in P2P (Kap 10, §10.4)

**Decisions.**

- The author declined deepening Snabbsvar itself ("nej glöm det", 2026-10-21). Do not deepen Snabbsvar
  unasked.
- He then had the seven medium gaps closed in the new Nyckelord file, one trigger keyword each (F104).
- He did not ask for the low gaps.

**Rejected by the verifiers, so do not raise these again:**

- REST statelessness: it is not in the book's web-services chapter, only on restfulapi.net.
- Kerberos or Needham–Schroeder for the question about the roles of cryptography: the question does not
  ask for an authentication protocol.
- The block and CBC modes of symmetric encryption: they are an implementation detail with no exam
  sub-question.
