# Einheit 6: Änderungsbericht

## Modell

Lehrsubset: add, sub, and, or, lw, sw, beq und zusätzlich addi. bne nur mit invertierter Gleichheitsbedingung. Sieben Hauptsignale, acht Steuerbits. PCSrc ist Branch und Zero, kein achter Main-Control-Ausgang. ALUOp 00/01/10 und ALUControl 0000/0001/0010/0110 sind Kurskonventionen. Little Endian und die positive Flanke bleiben Kursannahmen. Ripes wurde nicht ausgeführt. Die Branch-Struktur folgt der offiziellen Datei rvss.h: separater Vergleicher, nicht die Lehr-ALU-SUB.

## Sichtbare Korrekturen

- Don't Care, undefinierter MUX-Eingang und hochohmiger Zustand sind getrennt.
- Die ALU-Control-Tabelle enthält or und addi. Bit 30 bei addi wählt keine Subtraktion.
- Die Meistertabelle enthält die addi-Zeile 1, 0, 1, 0, 0, 0, 00.
- Ripes wird nicht als bitgleiche Matrix beschrieben.
- Das Laborprogramm beispiele/vl6_mux_beobachter.s initialisiert Speicher, lädt zurück und enthält zwei beq-Ausgänge. Abschluss mit a7 gleich 10.
- Die Datenpfadbeschriftung nennt PCSrc als Branch und Zero.

## Notizen und Prüfung

Alle 84 Folien haben eine Notiz. Statisch nachgerechnet: add 7 plus 3 gleich 10, lw von 0x2004 liefert 37, sw schreibt 10, beq von 0x100 mit Offset 12 geht nach 0x10C oder 0x104, addi von minus 5 ist 0xFFFFFFFB, der Labortrace endet mit t0 gleich 5, t1 gleich 10, t2 gleich 10, t3 gleich 1.

Offen: kein Ripes-Lauf, daher keine gemessenen Portfarben, keine Disassembly-Adressen und keine bestätigte la-Expansion. Das Maschinenwort 0xFFB00293 wurde nicht mit einem Assembler geprüft.
