# Einheit 4: Änderungsbericht und Abnahme

## Annahmen

- RV32I, ILP32, Stack an 16 Byte ausgerichtet, Wachstum zu kleineren Adressen.
- Venus der Kurslinie (thaumicmekanism / 61c-teach): Einstieg `main`, Exit `li a0, 10` / `ecall`. Der Anfangswert von `sp` heisst S und wird von der Umgebung bereitgestellt.
- ISA-Stand für die Begriffe x0, PC, `jal`, `jalr`: RISC-V Unprivileged ISA, Ausgabe 20240411. Calling Convention: ABI 1.0. Pseudoinstruktionen `j`, `mv`, `ret` nach dem Assembly Programmer's Manual, gegen den Venus-Assembler dieser Einheit gehalten.
- Diese Fassung wurde nicht in Venus ausgeführt. Die Kontrolle ist statisch: Syntax, Offsets und die 16 Kontrollpunkte rechnerisch.

## Korrigierte Widersprüche

- x1 ist ein allgemeines Register mit ABI-Rolle `ra`, kein dediziertes Spezialregister.
- Push und Pop nutzen Offset 12, nicht 0.
- Framegrösse ist `16 * ceil(B/16)`, nicht Registerzahl mal 4.
- Prolog −16 und Epilog +8 lassen 8 Byte offen, zwei Wörter, und verletzen die Ausrichtung.
- Nicht jede Funktion braucht einen Speicher-Prolog. Stack Overflow ist keine Heap-Kollision.
- `sqrt` ist durch `sum`/`calc` ersetzt. Das Labor ist `beispiele/mct1_vl4_nested_calls_ok.s`, der Selbstloop `beispiele/mct1_vl4_ra_fehler.s`.

## Prüfung

- 61 Folien, je ein Notizblock. Kürzeste Notiz über 90 Wörter.
- Rechenproben: PC+4, 5+10=15, 42+99=141, 15+5=20, −16+16=0, −16+8=−8, 0x1000−16=0x0FF0, Slot 12 bei 0x0FFC.
- Venus-Lauf: nicht ausgeführt.

## Abnahme

Alle 61 Originaltitel behalten einen eigenen Notizblock mit lokaler Begriffserklärung, Beispiel, Denkfehler, Kontrollfrage und Übergang. Abbildungen: `vl4-zwei-aufrufe`, `vl4-jal-zyklus`, `vl4-save-restore`, `vl4-frame-zustaende`, `stack-frame-16`, `vl4-drei-slots`, `vl4-ungleichgewicht`, `vl4-ra-backup`, `vl4-rekursion`. Offen bleibt ein tatsächlicher Venus-Step mit gemessenem S und gemessenen Labeladressen.
