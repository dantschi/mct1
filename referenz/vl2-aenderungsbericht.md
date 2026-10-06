# Einheit 2: Änderungsbericht

## Annahmen

RV32I, unkomprimierte 32-Bit-Instruktionen, Little Endian als Kursumgebung, ILP32 für die einfachen C-Beispiele. Venus: Dienstnummer in `a0`, Druckwert in `a1`, Dienst 1 und Ende mit Dienst 10. Diese Überarbeitung hat Venus nicht ausgeführt.

## Korrekturen

- Opcode `0110011` ist Registerarithmetik/-logik. `add` und `sub` unterscheiden sich über `funct7`.
- Eine Quelltextzeile, eine native Instruktion und ein Hardwaretakt werden getrennt.
- `array[index + 4]` ist ein Elementversatz. Bei ILP32-int sind das 16 Byte.
- Die Shift-Skizze `10110` wird zu `01100`. Die Grafik zu `sra` schreibt minus 3, minus 2, minus 1 und minus unendlich aus.
- Zicsr sind CSR-Zugriffsbefehle. `fence.i` ist keine Vorschrift, alle Caches zu leeren.
- Die Musterlösung der Gleichung steht in `beispiele/vl2_gleichung.s`. Weitere Programme: `vl2_shifts.s`, `vl2_immediates.s`.
- Das Abschlussblatt erklärt die Begriffe selbst. Little Endian ist keine Eigenschaft jeder RISC-V-Implementierung.

## Notizen und Programme

Alle 82 Folien haben eigene Notizen. Titel- und Abschnittsfolien bleiben kurz. Inhaltsfolien erklären Kürzel, ein Zahlenbeispiel, einen typischen Fehler und den Übergang. Die Musterlösung der Gleichung steht in `beispiele/vl2_gleichung.s`, Shifts in `vl2_shifts.s`, Masken und große Konstanten in `vl2_immediates.s`.

## Prüfung

Statisch nachgerechnet: `add x9, x20, x21` = `0x015A04B3`, `sub` derselben Register = `0x415A04B3`, `srai` von minus 3 um 1 = minus 2 bzw. `0xFFFFFFFE`, C-Division minus 3 durch 2 = minus 1, Gleichung 15 minus 5 = 10. Die Shiftgrafik schreibt minus 3, minus 2, minus 1 und minus unendlich als Text.

Offen, weil Venus in dieser Fassung nicht ausgeführt wurde: die konkrete `li`-Expansion, die genaue Step-Markierung und die Assemblerdiagnose für `addi` mit 2048.
