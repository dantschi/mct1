# Einheit 3: Änderungsbericht

## Annahmen

RV32I, unkomprimierte 32-Bit-Instruktionen, Little Endian, ILP32 mit `sizeof(int) = 4`. Venus der Kurslinie: Dienstnummer in `a0`, Druckwert in `a1`, Dienst 1 gibt eine Ganzzahl aus, Dienst 10 beendet. Diese Überarbeitung hat Venus nicht ausgeführt. Die Sollwerte sind statisch nachgerechnet.

## Korrekturen

- Index 3 bleibt Offset 12. Ein `addi` auf die Basis verschiebt sie dauerhaft, zerstört sie nicht.
- Die Grafik mit garantierter Exception bei Adresse `0x01` ist entfernt. Ausrichtung gilt für Basis plus Offset.
- `lb` von `0x80` ist −128, nicht 128. `lbu` ergibt 128.
- Halfword-Alignment prüft die effektive Adresse. Ein gerader Offset genügt nicht.
- Die `bne`-Schleife initialisiert `t0` und ist als fußgesteuert gekennzeichnet.
- Die Summe heißt durchgängig `s0`. Am Prüfpunkt vor den Dienstnummern steht 150 in `a0`.
- Das Abschlussblatt erklärt die Begriffe selbst.

## Programme

`beispiele/vl3_wordzugriff.s`, `vl3_teilzugriffe.s`, `vl3_if_else.s`, `vl3_array_summe.s`.

Codierungen: `lw t0, 8(s1)` = `0x0084A283`, `sw t0, 12(s1)` = `0x0054A623`, `sw t0, -4(s1)` = `0xFE54AE23`.

## Offen

Kein Venus-Lauf. Konkrete Labeladressen und die Byteansicht hängen von der eingesetzten Version ab.
