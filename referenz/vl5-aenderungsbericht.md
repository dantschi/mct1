# Einheit 5: Änderungsbericht

## Modell

Basissubset: add, sub, and, or, lw, sw, beq. Unkomprimierte 32-Bit-Instruktionen, PC-Schritt 4 Byte. ImmGen liefert für beq den fertigen Byteoffset einschließlich Bit 0, ohne zweites Schieben. PCSrc = Branch UND Zero. addi, jal, li, la und ecall sind Erweiterung oder Ripes-Setup.

Ripes wurde in dieser Überarbeitung nicht ausgeführt. Exit-Annahme der Labordateien: Dienst 10 in a7, nicht Venus a0=10. Extended-Layout und konkrete Portnamen sind an der installierten Version zu prüfen.

## Korrekturen

- add und sub unterscheiden sich über funct7.
- Der volle ImmGen hat nicht generell nur zwölf Eingänge.
- Die Branch-Grafik sagt B-Byteoffset statt Shifted Immediate.
- Store schreibt vier Bytes. Die Freigabe wird vor Clock gelesen.
- Ripes ist nicht das live geschaltete Lehrbuchdiagramm und misst keine Gatterzeiten.
- Lehrtiming: add 5,5 ns, beq 5,7 ns, lw 7,3 ns, Grenze etwa 137 MHz.

## Dateien

- beispiele/mct1_vl5_rtype_trace.s, mct1_vl5_load_store_trace.s, mct1_vl5_branch_trace.s
- Steuerübersicht in der Folie zu den Steuersignalen
- 79 Notizblöcke

## Prüfung

Statisch: Codierungen 0x007302B3, 0x00628533 und 0x0044A503, Summe 150, Load 88, Store ersetzt 99 durch 88, Branch-Offset +12 Byte. Nicht ausgeführt: Ripes-Lauf, Screenshots, echte Frequenz.
