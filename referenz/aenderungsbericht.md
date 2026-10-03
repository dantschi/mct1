# Änderungsbericht

Fachliche Korrekturen und didaktische Ergänzungen. Nicht jeder Diagrammpunkt der Aufgabenliste ist eine neue Vollbildschaltung; vorhandene Schaltbilder der Einheit 1 bleiben.

## Vertrag

- Neu: `referenz/kursvertrag.md`, `referenz/glossar.md`, Verweis in `README.md`.
- Didaktisch: gemeinsame Namen für ISA, ABI, Lehrmodell und Simulator.

## Einheit 1

- Fachlich: Sign-Magnitude-Null ist ein hypothetischer Bitmustervergleich, kein C-`==`.
- Fachlich: Abschnitt heißt Byte-Reihenfolge; Alignment wird getrennt.
- Fachlich: Little Endian als Kursumgebung; Zeiger auf das erste Byte.
- Fachlich: Zweierkomplementbereich und modulo-$2^{32}$ gegen undefinierten C-Überlauf.
- Fachlich: Von-Neumann-Buskonflikt an den gemeinsamen Port gebunden.
- Fachlich: positive Flanke als Lehrmodell, nicht als ISA-Regel.
- Grafik: `assets/images/endian-12345678.svg`.

## Einheit 2

- Fachlich: RISC/CISC ohne Energiegarantie und ohne „atomar“ als Synchronisation.
- Fachlich: `G` einschließlich `Zicsr` und `Zifencei`; `I` nicht als einzige Basis.
- Fachlich: Division durch Null ist kein RISC-V-Trap; `div` gehört zu M.
- Fachlich: Architekturregister; Venus-`ecall` mit Dienst in `a0` und Parameter in `a1`.
- Fachlich: `srai(-3,1) = -2`, C-Division `-3/2 = -1`; untere fünf Shift-Bits.
- Fachlich: logische Immediates vorzeichenerweitert, Beispiel `xori` mit `-1`.
- Grafik: `rtype-015A04B3.svg`, `shift-srai-neg3.svg`.

## Einheit 3

- Fachlich: `array+i` bzw. `&array[i]` gegen `&array+(i*4)`.
- Fachlich: Alignment der effektiven Adresse; kein pauschaler Trap.
- Fachlich: ASCII ist 7 Bit; `lb`/`lbu` von `0x80`.
- Fachlich: Registerfile ist nicht die CPU-Speicherkapazität.
- Didaktisch: vollständiges Summenprogramm, Sollwert 150.
- Grafik: `alignment-effective.svg`, `lb-lbu-0x80.svg`.

## Einheit 4

- Fachlich: ungesichertes `t0` ist Assembler, kein undefiniertes C-`int`.
- Fachlich: Frames durchgehend 16 Byte; Offsets und Epiloge angepasst.
- Fachlich: `jal`/`jalr` aus dem alten PC; `ra` einmal im Non-Leaf-Prolog.
- Fachlich: `BoeseFunc` ohne Fall-through, Venus-Exit in `Main`.
- Grafik: `stack-frame-16.svg`.
- Labor und Probeklausur: dieselbe 16-Byte-Schablone.

## Einheit 5

- Fachlich: Befehlsumfang `add/sub/and/or/lw/sw/beq` ausdrücklich.
- Fachlich: ImmGen liefert den Byteoffset, kein zweites Shift-left-1.
- Fachlich: B-Felder ohne Escape-Zeichen; `jal` aus altem PC, außerhalb des Basismodells bis der Link-Pfad ergänzt ist.
- Fachlich: Store-Schreibadresse aus den Instruktionsbits, nicht zufällig.
- Fachlich: Ripes ist nicht „exakt der Folien-Prozessor“.
- Offen: keine neue Bildserie auf identischer Geometrie für add/lw/sw/beq. Das vorhandene `single-cycle-datapath.svg` bleibt die Übersicht.

## Einheit 6

- Fachlich: Pegel statt „Strom an/aus“.
- Fachlich: `MemRead = 0` ist kein Hochohm- oder Kurzschlussbeweis.
- Fachlich: 131072 Zeilen sind eine naive Tabelle, nicht die synthetisierte Fläche.
- Fachlich: kein pauschales „x86 hardwired unmöglich“ und keine Dutzend-Gatter-Behauptung.
- Offen: die ALU-Control-Zeile für `or` wurde nicht neu vermessen; die bestehende Main-Control-Tabelle bleibt.

## Einheit 7

- Fachlich: Befehlsanzahl meint dynamisch ausgeführte Maschineninstruktionen.
- Fachlich: Lehrzeiten 820 ps / 270 ps, $N=20$, Speedup etwa 2,53. Keine Messung.
- Fachlich: ohne Forwarding, aber mit Erkennung, bleiben Ergebnisse korrekt.
- Fachlich: Countdown endet nach zehn Schritten.
- Fachlich: unbelegte 30–40 % und 95 % Trefferquote entfernt.
- Grafik: `pipeline-timing-lehr.svg`.
- Offen: die bestehenden Zyklusraster wurden nicht Folie für Folie neu gezeichnet.

## Einheit 8

- Fachlich: Polling bleibt eine gebräuchliche Methode; Busy Waiting ist die engere Variante.
- Fachlich: 10000 Iterationen sind keine belegte 20-ms-Wartezeit.
- Fachlich: Leaf-Trap-Handler ohne `call`; 64-Byte-Frame nur mit Unteraufruf.
- Fachlich: `mepc+4` nur für konsumiertes 4-Byte-`ecall`.
- Fachlich: `volatile` ist kein Cache- oder DMA-Vertrag.
- Fachlich: Syscall-Clobber nicht aus der Funktions-ABI abgeleitet.
- Offen: keine neue Adresskarte und kein neues Zeitdiagramm für Entprellung.

## Einheit 9

- Fachlich: Host-`gcc` erzeugt keinen RISC-V-Code; `-march=rv32i -mabi=ilp32` nennen.
- Fachlich: `-O0`/`-O3` ohne versprochene Register- oder Pipelinebelegung.
- Fachlich: `calc` als Fragment, nicht als Fall-through-Programm.
- Fachlich: Code-Schloss mit UP, DOWN, RIGHT, Release und Halten.
- Grafik: `fsm-code-lock.svg`.
- Die Probeklausur behält ihren Aufbau; Aufgabe 4 nutzt jetzt den 16-Byte-Frame. Klausurdauer bleibt eine organisatorische Angabe der bestehenden Datei.

## Verifikation

- Ausgeführt: `python beispiele/sollwerte.py`. Codierungen `0x015A04B3` und `0x007302B3`, `lb`/`lbu` von `0x80`, `srai` von $-3$, Summe 150, Lehrzeiten 820 ps / 270 ps und Speedup etwa 2,53 sowie die Schlossfolge bis S3 stimmen.
- Ausgeführt: Reveal.js aller neun Einheiten nach `_site/vorlesungen/`.
- Ausgeführt: Handout-PDFs aller neun Einheiten nach `_handout/vorlesungen/`.
- LuaTeX hat ältere ReportLab-PDFs nicht eingebunden. Die Geschwister-PDFs wurden aus den SVGs neu erzeugt. Das IEC-Zeichen `≥1` in vier Gattersymbolen ist dafür als `OR` gesetzt, weil die nicht eingebettete Symbol-Schrift den PDF-Einschluss abbricht.
- Nicht ausgeführt: Venus, Ripes, Cross-Compiler, Compiler Explorer. Keine Simulatorläufe und keine Messwerte.
