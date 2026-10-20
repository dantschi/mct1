# Glossar MCT1

Kurzreferenz. Verbindlich ist der [Kursvertrag](kursvertrag.md).

| Begriff | Bedeutung in diesem Kurs |
|---------|--------------------------|
| ISA | Befehlssatzvertrag (hier RV32I). Unabhängig von einer konkreten Schaltung. |
| ABI | Softwarekonvention ILP32: Registerrollen, auf 16 Byte ausgerichteter Stackzeiger, hier skalare 32-Bit-Rückgabe in `a0`. |
| Opcode | Feld zur Befehlsgruppe. Weitere Funktionsbits wählen je nach Format die genaue Operation; `funct7` ist beispielsweise ein Feld des R-Formats. |
| Immediate | Im Befehl codierte Konstante. Bei `addi` und Loads zwölf Bit, vorzeichenerweitert. Shift-Immediates enthalten dagegen eine Schiebeweite und Funktionsbits; S/B/U/J haben andere Aufteilungen. |
| Alignment | Natürliche Ausrichtung: effektive Adresse durch die Zugriffsbreite teilbar. Die Kursaufgaben setzen sie voraus; die Behandlung unausgerichteter Zugriffe hängt von der Umgebung ab. |
| Endianness | Byte-Reihenfolge eines Mehrbytewerts. Kurs: Little Endian. Nicht dasselbe wie Alignment. |
| Hazard | Eine Abhängigkeit oder Ressourcenlage, die die naive Pipeline-Überlappung stört. |
| Stall | Vorübergehendes Halten benötigter Pipeline-Arbeit. Beim Load-Use-Stall dieses Modells halten PC und IF/ID, während ältere Instruktionen weiterlaufen. |
| Bubble | Ungültiger, nebenwirkungsfreier Pipeline-Eintrag, etwa nach einem Stall. Keine zusätzliche abgeschlossene Programminstruktion und daher kein Beitrag zu $N$. |
| Flush | Jüngere, noch nebenwirkungsfreie Instruktionen nach einem genommenen Branch verwerfen. |
| Trap | Kontrolltransfer in eine privilegierte Behandlung (`mepc`, `mtvec`, `mret`). |
| MMIO | Peripherie im Adressraum der konfigurierten Plattform, nicht der ISA. |
| volatile | C-Qualifizierer für beobachtbare Zugriffe gemäß der Zieldefinition des Compilers. Kein Ersatz für Gerätevertrag, Speicherattribute, Barrieren oder Synchronisation. |
