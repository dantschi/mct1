# Kursvertrag MCT1

Dieser Vertrag gilt für Folien, Notizen, Übungen und die Probeklausur. Er beschreibt die **gewählte Kurskonfiguration**, nicht jede zulässige RISC-V-Implementierung.

Kleine Hinweise in den Folien trennen vier Ebenen:

| Hinweis | Bedeutung |
|---------|-----------|
| ISA-Regel | Vorgabe der RISC-V-Spezifikation |
| ABI-Konvention | Softwarevertrag (psABI), nicht von der Hardware erzwungen |
| Annahme unseres Lehrmodells | Vereinfachung nur für Datenpfad, Pipeline oder Speicherbild dieses Kurses |
| Eigenschaft dieser Simulatorversion | Verhalten von Venus oder Ripes, nicht der ISA |

## ISA und Daten

- Basis: **RV32I**, $XLEN = 32$, Byteadressierung, **Little Endian**.
- In den Kernbeispielen keine komprimierte Erweiterung `C`. Echte Instruktionen sind dort 4 Byte lang. Pseudoinstruktionen (`li`, `la`, `mv`, `j`, `ret`) kann der Assembler in mehrere echte Instruktionen expandieren.
- Architekturnamen `x0`–`x31` bezeichnen Architekturregister. Eine Mikroarchitektur darf zusätzliche physische Register besitzen (Register Renaming). `x0` liest fest 0 und verwirft Schreibzugriffe.
- Ganzzahlregisterarithmetik ist modulo $2^{32}$. Ein Überlauf setzt in RV32I kein Flag und löst keinen Trap aus. Das ist von undefiniertem vorzeichenbehaftetem Überlauf in C zu unterscheiden.
- Integer-Division gehört zur Erweiterung **M**, nicht zu RV32I. Division durch Null liefert dort definierte Ergebnisse und ist kein Trap (siehe privilegierte Vertiefung in Einheit 8).

`G` umfasst `IMAFD` sowie `Zicsr` und `Zifencei`. `C` ist davon unabhängig. `RV32I` ist unsere gewählte Basis; die Spezifikation kennt weitere Basen (etwa `E`).

## C und ABI

- C-Vergleiche in diesem Kurs beziehen sich auf eine **ILP32**-Zielumgebung: `int` und Zeiger sind dort 32 Bit. Das gilt nicht für jede C-Implementierung.
- Standard-Integer-ABI: **ILP32**, Stack an Aufrufgrenzen auf **16 Byte** ausgerichtet. Einfache skalare 32-Bit-Rückgaben liegen in `a0`. Andere Rückgabearten (Aggregate, 64-Bit-Werte, Gleitkomma) sind Ausblick.
- Ein einzelnes gesichertes Register belegt deshalb einen 16-Byte-Frame mit Padding. Mehrere Sicherungen teilen sich einen gemeinsamen Frame, dessen Größe ein Vielfaches von 16 Byte ist.
- Ein korrekter C-Compiler erhält die Lebensdauer einer C-Variable über Aufrufe hinweg (Registerwahl oder Sicherung). Ein ungesichertes Assembler-`t`-Register über einen Aufruf ist ein anderer Vertrag.

## Aufrufe und Simulatoren

Drei Verträge nicht vermischen:

1. **Normaler Funktionsaufruf** (`jal` / `jalr` / `ret`): Link in `ra` bzw. `rd`, Argumente und Rückgabe nach ILP32.
2. **Simulator-`ecall`** (Venus oder Ripes): Dienstnummer und Parameter nach der Tabelle **dieser** Distribution. In der im Kurs verlinkten Venus-Umgebung liegt die Dienstkennung in `a0` und der erste Parameter in `a1` (Beispiel Drucken einer Ganzzahl: `a0 = 1`, Wert in `a1`; Beenden: `a0 = 10`).
3. **Privilegierter Trap** (`ecall` als Environment Call in Hardware, Interrupt): `mepc`, `mcause`, `mtvec`, `mret`. Venus-`ecall`-Abfangen ist keine Demonstration eines laufenden Machine-Mode-Handlers.

| Umgebung | Rolle im Kurs | Festlegung |
|----------|----------------|------------|
| Venus | Assembler, ABI, Kontrollfluss | Browser-Distribution [thaumicmekanism.github.io/venus](https://thaumicmekanism.github.io/venus/), Dokumentation der Linie [61c-teach/venus](https://github.com/61c-teach/venus/wiki). Einstieg `main`. Exit `li a0, 10` / `ecall`. Kein `C`-Modul in den Kernbeispielen. |
| Ripes | Datenpfad, Pipeline, MMIO | [mortbopet/Ripes](https://github.com/mortbopet/Ripes). Single-Cycle- bzw. 5-Stage-Modell der installierten Version. MMIO-Adressen aus der geladenen Plattform ablesen. `ecall`-Nummern nur nach der `ecalls.md` **dieser** Version; nicht mit Venus gleichsetzen. |
| GNU-Toolchain / Compiler Explorer | C nach RISC-V | Ziel ausdrücklich setzen, z. B. `-march=rv32i -mabi=ilp32`. Ein nacktes `gcc main.c` auf dem Host erzeugt keinen RISC-V-Code. |

`jal`: Linkwert = alter PC $+ 4$, Ziel aus dem alten PC und dem Byteoffset. `jalr`: Ziel $= (rs1 + \mathrm{signextend}(imm_{12}))$ mit gelöschtem Bit 0, Linkwert = alter PC $+ 4$. `ret` ist `jalr x0, 0(ra)`. „Ein Takt“ für `jal` ist eine Annahme des Single-Cycle-Lehrmodells.

## Datenpfad (Einheiten 5 und 6)

Das Lehrmodell implementiert ausdrücklich nur:

`add`, `sub`, `and`, `or`, `lw`, `sw`, `beq`.

Es ist kein vollständiger RV32I-Prozessor. `addi`, `bne` und `jal` gelten erst als unterstützt, wenn Immediate-Erzeugung, Vergleich bzw. Link-Write-Back im selben Modell ergänzt sind.

- **ImmGen** erhält das Instruktionswort und liefert für `beq` direkt den vorzeichenerweiterten **Byteoffset** einschließlich implizitem Bit 0. Danach gibt es kein zweites Shift-left-1.
- `PCSrc` ist nicht der Opcode allein: $\mathrm{PCSrc} = \mathrm{Branch} \land \mathrm{Zero}$ für `beq`.
- `ALUControl` (4 Bit) ist eine interne Kurscodierung, keine von RISC-V vorgeschriebene Leitung.
- Im Modell schließen sich `MemRead` und `MemWrite` gegenseitig aus. Das ist keine allgemeine Aussage über Read-during-write oder elektrische Buskonflikte.

## Pipeline (Einheit 7)

Fünf Stufen: IF, ID, EX, MEM, WB.

- Forwarding aus `EX/MEM` und `MEM/WB`. Der jüngste passende Produzent gewinnt. Weitergereicht wird nur bei `RegWrite` und `rd` $\neq$ `x0`. Ein Load reicht die **geladenen Daten** nach MEM weiter, nicht die Adresse aus EX.
- Load-Use: Erkennung zwischen ID und EX; Stall hält PC und IF/ID, der Produzent läuft weiter, nach ID/EX wird eine wirkungslose Bubble injiziert.
- Ohne Forwarding, aber mit Hazard-Erkennung, sind zusätzliche Stalls eine korrekte Ausführung. Falsche Ergebnisse entstehen nur ohne ausreichende Hazard-Behandlung.
- Branch-Auflösung in diesem Lehrmodell in **EX**. Bei genommenem Branch werden die zwei jüngeren Instruktionen vor Seiteneffekten verworfen (Flush). Eine frühere Entscheidung in ID ist ein anderes Modell und erzeugt eigene Operanden-Hazards.
- Registerfile dieses Lehrmodells: kein Schreib-/Lesevorgang desselben Registers im selben Takt. Drei Wartezyklen ohne Forwarding sind deshalb eine Modellannahme, nicht die einzige zulässige RISC-V-Mikroarchitektur. Im Ripes-Labor gilt die dort beobachtete Variante.
- Die Zeiten IF $= 200\,\mathrm{ps}$, ID $= 100\,\mathrm{ps}$, EX $= 150\,\mathrm{ps}$, MEM $= 250\,\mathrm{ps}$, WB $= 100\,\mathrm{ps}$ und $20\,\mathrm{ps}$ je Registerübergang (clk-to-Q und Setup zusammen) sind **erfundene Lehrwerte**, keine Messung.

## Speicherbild und I/O

- Das übliche Bild Text / statische Daten / Heap / Stack ist eine **gewählte Belegung** mit Betriebssystem. Ein Stack muss den Heap nicht erreichen, bevor eine Grenze gilt. Bare-Metal kann anders aufgeteilt sein.
- MMIO-Adressen, LED-Formate, Switch-Bitmaske und D-Pad-Einzelregister stammen aus der **Ripes-Plattformkonfiguration**, nicht aus der ISA.
- `volatile` betrifft wiederholte Zugriffe des Compilers. Es ersetzt weder Speicherattribute noch `FENCE` noch Synchronisation zwischen Kernen oder DMA.
