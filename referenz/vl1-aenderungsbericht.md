# Einheit 1: Änderungsbericht

## Annahmen

RV32I, Registerbreite XLEN gleich 32, RISC-V-Word bleibt 32 Bit. Little Endian, positive Taktflanke, kombinatorisches Lesen und synchrones Schreiben der Registerbank sind Kursannahmen. Z ist ein internes ALU-Signal. Eine UE-Dauer von 45 Minuten ist nicht als geprüfte Modulminutenzahl belegt; die Folientabelle nennt neun Blöcke zu je 4 UE.

## Sichtbare Korrekturen

- Literalregeln: 0b nur als C23 oder GNU-Erweiterung; eine führende Null in C ist oktal.
- Word und XLEN sind getrennt. Der Adressraum umfasst 4 GiB, nicht den eingebauten RAM.
- Z ist keine RISC-V-Statusflag. BEQ und BNE vergleichen Register.
- Eine OR-Rückkopplung ist keine Basis aller Speicherzellen. Das SR-Latch aus NOR-Gattern verbietet S und R gleichzeitig eins.
- Die steigende Flanke gehört zum D-FF-Lehrmodell. add endet mit Registerwriteback, nicht mit Store.
- Kopierbeispiel add x6, x5, x0. Registerbankbeispiel add x7, x5, x6.
- Die Folienquelle ist Deutsch. Die Lernfassung ist das Handout-PDF mit Notizen.

## Folien

- 01 Titelfolie: Mikrocomputertechnik 1
- 02 Einleitung und Grundlagen
- 03 Modul: Mikrocomputertechnik 1
- 04 Agenda für den Kickoff
- 05 Lernziele
- 06 Organisatorisches & Spielregeln
- 07 Literatur
- 08 Die Werkzeuge im Praktikum
- 09 2. Warum Abstraktion?
- 10 Strukturierung von Komplexität
- 11 Das Komplexitätsproblem
- 12 Die Lösung: Teile und Herrsche
- 13 Was ist Abstraktion?
- 14 Das Schichtenmodell der IT
- 15 3. Datenrepräsentation
- 16 Datenrepräsentation — Überblick
- 17 Alles ist eine Zahl
- 18 Das Bit und das Byte
- 19 Das Word (Wortbreite)
- 20 Das Problem mit Binärzahlen
- 21 Die Lösung: Das Hexadezimalsystem
- 22 Der magische Vierer-Block (Nibble)
- 23 Mustererkennung: Visuelle Umrechnung
- 24 Notation und Präfixe im Code
- 25 Interaktive Übung: Konvertierung
- 26 4. Negative Zahlen in der Hardware
- 27 Negative Zahlen — Überblick
- 28 Das Vorzeichen-Problem der Hardware
- 29 Ansatz 1: Vorzeichen & Betrag (Sign-Magnitude)
- 30 Die +0 und die −0
- 31 Ansatz 2: Das Zweierkomplement
- 32 Bildung des Zweierkomplements
- 33 Rechenbeispiel: Aus +5 wird −5
- 34 Die Symmetrie: Von −5 zu +5
- 35 Das Zahlenrad und der Überlauf (Overflow)
- 36 Vorzeichenerweiterung (Sign Extension)
- 37 5. Byte-Reihenfolge (Endianness)
- 38 Byte-Reihenfolge — Überblick
- 39 Der Speicher als lineares Array
- 40 Das Platzproblem im Speicher
- 41 Big-Endian vs. Little-Endian
- 42 Endianness in der Kursumgebung
- 43 6. Kombinatorische Logik
- 44 Kombinatorische Logik — Überblick
- 45 Kombinatorik vs. Sequenzielle Logik
- 46 Refresher: Die grundlegenden Logikgatter
- 47 Das „Weichen“-Problem im Datenpfad
- 48 Der Multiplexer (MUX)
- 49 Die Logik des 2:1-Multiplexers
- 50 Der Multiplexer in reiner Hardware
- 51 Die Brücke zur Software: MUX = IF/ELSE
- 52 Vom 1-Bit- zum 32-Bit-Bus-Multiplexer
- 53 7. Addition in Hardware
- 54 Addition in Hardware — Überblick
- 55 Binäre Addition (mentales Modell)
- 56 Der Halbaddierer (Half-Adder)
- 57 Der Volladdierer (Full-Adder)
- 58 Kaskadierung: Ripple-Carry-Adder (RCA)
- 59 Das Problem der Laufzeit (Ripple Delay)
- 60 Carry-Lookahead als schnellere Addiererstruktur
- 61 8. Die Arithmetic Logic Unit (ALU)
- 62 Die ALU — Überblick
- 63 Ein Taschenrechner ohne Tasten
- 64 Struktur einer 1-Bit-ALU
- 65 Subtraktion elegant integrieren
- 66 Das Zero-Signal (Null-Erkennung)
- 67 Die 32-Bit RISC-V ALU
- 68 Das ALU-Schaltsymbol
- 69 9. Die Notwendigkeit der Zeit
- 70 Die Notwendigkeit der Zeit — Überblick
- 71 Das Problem der reinen Kombinatorik
- 72 Die Lösung: Zustandsspeicherung
- 73 Das Taktsignal (Clock / CLK)
- 74 Flankensteuerung (Edge-Triggering)
- 75 10. Sequenzielle Logik
- 76 Sequenzielle Logik — Überblick
- 77 Das Rückkopplungs-Konzept
- 78 Das D-Flip-Flop (D-FF)
- 79 Das Verhalten der Kamera (Metapher)
- 80 Physikalische Limits: Setup- und Hold-Time
- 81 Vom 1-Bit-D-FF zum 32-Bit-Register
- 82 Das Write-Enable-Signal (WE)
- 83 Das abstrahierte Register-Symbol
- 84 11. Das Register File (Registersatz)
- 85 Das Register File — Überblick
- 86 Was ist ein Registersatz?
- 87 Architektur des Register Files
- 88 Interner Aufbau: Lesen (kombinatorisch)
- 89 Interner Aufbau: Schreiben (sequenziell)
- 90 Die RISC-V-Register ($x0$–$x31$)
- 91 Das Hardwired-Zero-Register ($x0$)
- 92 12. Speicherarchitektur
- 93 Speicherarchitektur — Überblick
- 94 Wo liegen die Programme?
- 95 Die Von-Neumann-Architektur
- 96 Die Harvard-Architektur
- 97 Der RISC-V-Kompromiss im Labor
- 98 Abschlussblatt

Alle 98 Folien haben eine Notiz. Die Lehrwerte stehen in beispiele/vl1_lehrwerte.md.

## Prüfung

Statisch nachgerechnet: 0x2A gleich 42, 0xFB signed minus 5, Little Endian von 0x12345678 beginnt mit 0x78, der Volladdierer bei drei Einsen liefert Summe 1 und Carry 1, 7 minus 3 ergibt 4, x7 wird 10.

Offen: kein Ripes-Lauf und keine Bauteildatenblatt-Zeiten. Die Endian-Grafik zeigt die Bytes 78, 56, 34 und 12. Die Subtraktionsgrafik beschriftet den ersten Carry-Eingang.
