# Mikrocomputertechnik 1 (MCT1)

Herzlich willkommen zur Vorlesung **Mikrocomputertechnik 1 (MCT1)** an der Dualen Hochschule Baden-Württemberg Stuttgart, Studiengang Elektro- und Informationstechnik.

**Dozent:** Prof. Dr.-Ing. Daniel Klünder  
**Kurswebsite:** [dantschi.github.io/mct1](https://dantschi.github.io/mct1/)  
**Repository:** [github.com/dantschi/mct1](https://github.com/dantschi/mct1)

Das Modul vermittelt die Grundlagen der Rechnerarchitektur am Beispiel der **RISC-V Instruction Set Architecture (ISA)**. Sie lernen, wie ein Prozessor Befehle ausführt, wie Programme auf Maschinenebene aufgebaut sind und wie Hard- und Software zusammenwirken — von Gattern und Registern bis zu Pipelining, I/O und dem Übergang von C zu Assembler.

## Kursübersicht

Der rote Faden der Veranstaltung:

**ISA → Assembler → Datenpfad → Steuerwerk → Pipeline → I/O**

Pro Einheit: Folien (Reveal.js), Handout-PDF sowie Übungsblatt (Studierende / Musterlösung). Links verweisen auf die Kurswebsite.

| Einheit | Thema | Schwerpunkt | Folien | Handout | Übungsblatt | Musterlösung |
|--------:|-------|-------------|:------:|:-------:|:-----------:|:------------:|
| 1 | Einleitung und Grundlagen | Abstraktion, Zahlendarstellung, Logik, Register, Speicher | [HTML](https://dantschi.github.io/mct1/vorlesungen/01_kickoff.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/01_kickoff-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_01_datenrepraesentation-logik.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_01_datenrepraesentation-logik-musterloesung.pdf) |
| 2 | RISC-V Basics | RV32I, Register, R-/I-Type, Maschinencode, Venus | [HTML](https://dantschi.github.io/mct1/vorlesungen/02_riscv-basics.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/02_riscv-basics-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_02_riscv-basics-venus.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_02_riscv-basics-venus-musterloesung.pdf) |
| 3 | Speicherzugriff und Kontrollfluss | Load/Store, Arrays, Branches, Endianness | [HTML](https://dantschi.github.io/mct1/vorlesungen/03_speicher-kontrollfluss.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/03_speicher-kontrollfluss-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_03_speicherzugriff-kontrollfluss.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_03_speicherzugriff-kontrollfluss-musterloesung.pdf) |
| 4 | Funktionen und Stack | `jal`/`ret`, ABI, Caller/Callee, Stack-Frames | [HTML](https://dantschi.github.io/mct1/vorlesungen/04_funktionen-stack.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/04_funktionen-stack-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_04_funktionen-stack.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_04_funktionen-stack-musterloesung.pdf) |
| 5 | Single-Cycle-Datenpfad | Hardware-Pfad von Fetch bis Write-Back | [HTML](https://dantschi.github.io/mct1/vorlesungen/05_single-cycle-datenpfad.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/05_single-cycle-datenpfad-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_05_single-cycle-datenpfad.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_05_single-cycle-datenpfad-musterloesung.pdf) |
| 6 | Steuerwerk | Control Unit, Steuersignale, Wahrheitstabellen | [HTML](https://dantschi.github.io/mct1/vorlesungen/06_steuerwerk.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/06_steuerwerk-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_06_steuerwerk.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_06_steuerwerk-musterloesung.pdf) |
| 7 | Performance und Pipelining | CPI, Hazards, Forwarding, Stalls, Branch Prediction | [HTML](https://dantschi.github.io/mct1/vorlesungen/07_performance-pipelining.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/07_performance-pipelining-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_07_performance-pipelining.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_07_performance-pipelining-musterloesung.pdf) |
| 8 | I/O und Systemarchitektur | MMIO, Interrupts/Traps, CSR, Syscalls | [HTML](https://dantschi.github.io/mct1/vorlesungen/08_io-systemarchitektur.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/08_io-systemarchitektur-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_08_io-systemarchitektur.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_08_io-systemarchitektur-musterloesung.pdf) |
| 9 | Wrap-Up und C-to-Assembly | Toolchain, Compiler-Muster, FSM, Klausur | [HTML](https://dantschi.github.io/mct1/vorlesungen/09_wrap-up-c-to-assembly.html) | [PDF](https://dantschi.github.io/mct1/vorlesungen/09_wrap-up-c-to-assembly-handout.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_09_wrap-up-state-machine.pdf) | [PDF](https://dantschi.github.io/mct1/labs/lab_09_wrap-up-state-machine-musterloesung.pdf) |

**Hinweise:** Folien im Browser öffnen (Speaker View: Taste **S**). Handout-PDF = Folieninhalt mit Skriptnotizen. Quelltexte unter [`vorlesungen/`](vorlesungen/) und [`labs/`](labs/).

### Probeklausur

| Dokument | Studierende | Musterlösung |
|----------|:-----------:|:------------:|
| Probeklausur (90 Min., 100 Punkte) | [PDF](https://dantschi.github.io/mct1/labs/probeklausur.pdf) | [PDF](https://dantschi.github.io/mct1/labs/probeklausur-musterloesung.pdf) |

## Literatur

Zentrale Referenz dieses Moduls:

> **Sarah L. Harris, David Money Harris**  
> *Digital Design and Computer Architecture — RISC-V Edition*  
> Morgan Kaufmann

Definitionen, Terminologie und didaktischer Aufbau orientieren sich an diesem Standardwerk.

Zur Vertiefung empfohlen:

> **David A. Patterson, John L. Hennessy**  
> *Computer Organization and Design: The Hardware/Software Interface — RISC-V Edition*  
> Morgan Kaufmann

## Tools und Ressourcen

| Tool | Einsatz | Link |
|------|---------|------|
| **Venus** | Browser-basierter RISC-V-Assembler und Syscall-Simulation | [thaumicmekanism.github.io/venus](https://thaumicmekanism.github.io/venus/) |
| **Ripes** | Visueller RISC-V-Simulator (Datenpfad, Pipeline, MMIO) | [github.com/mortbopet/Ripes](https://github.com/mortbopet/Ripes) |
| **RISC-V GNU Toolchain** | Assembler, Linker und Cross-Compiler | [github.com/riscv-collab/riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain) |
| **Compiler Explorer** | C live als RISC-V-Assembler betrachten | [godbolt.org](https://godbolt.org/) |

## OER und Lizenz

Dieses Vorlesungsmaterial ist eine **Open Educational Resource (OER)**. Die Vorlesungsinhalte – Texte, Code und Diagramme – stehen unter der Lizenz **[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/)**.

Sie dürfen diese Inhalte teilen und bearbeiten, sofern Sie die Urheberschaft angemessen nennen. Der vollständige Lizenztext liegt in der Datei [`LICENSE`](LICENSE) im Repository.

**Ausnahme:** Hochschullogos und andere geschützte Markenzeichen sind von dieser Lizenz **ausdrücklich ausgenommen**. Sie unterliegen dem Markenrecht der jeweiligen Rechteinhaber und dürfen ohne deren Genehmigung nicht übernommen oder weiterverwendet werden.
