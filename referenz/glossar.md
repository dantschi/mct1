# Glossar MCT1

Kurzreferenz. Verbindlich ist der [Kursvertrag](kursvertrag.md).

| Begriff | Bedeutung in diesem Kurs |
|---------|--------------------------|
| ISA | Befehlssatzvertrag (hier RV32I). Unabhängig von einer konkreten Schaltung. |
| ABI | Softwarekonvention ILP32: Registerrollen, 16-Byte-Stack, Rückgabe in `a0`. |
| Opcode | Feld zur Befehlsgruppe. Zusammen mit `funct3`/`funct7` wählt es die Operation. |
| Immediate | In der Instruktion codierte Konstante. I: 12 Bit, vorzeichenerweitert. B/U/J haben andere Felder. |
| Alignment | Die **effektive** Adresse `Basis + Offset` muss zur Zugriffsbreite passen. Ein gerader Offset reicht bei ungerader Basis nicht. |
| Endianness | Byte-Reihenfolge eines Mehrbytewerts. Kurs: Little Endian. Nicht dasselbe wie Alignment. |
| Hazard | Eine Abhängigkeit oder Ressourcenlage, die die naive Pipeline-Überlappung stört. |
| Stall | Anhalten von PC und IF/ID, während ältere Instruktionen weiterlaufen. |
| Bubble | Wirkungslose Platzhalter-Instruktion, die nach dem Stall in die Pipeline wandert. |
| Flush | Jüngere, noch nebenwirkungsfreie Instruktionen nach einem genommenen Branch verwerfen. |
| Trap | Kontrolltransfer in eine privilegierte Behandlung (`mepc`, `mtvec`, `mret`). |
| MMIO | Peripherie im Adressraum der konfigurierten Plattform, nicht der ISA. |
| volatile | C-Qualifizierer: der Compiler darf den Zugriff nicht wegoptimieren. Kein Cache- oder Busvertrag. |
