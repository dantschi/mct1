# Einheit 8: Änderungsbericht

## Modelle

A. Ripes-MMIO: Exports SWITCHES_0_BASE und LED_MATRIX_0_BASE, nicht als universelle Adressen. B. Privilegierter M-Mode-Trace mit Direct-Modus, ohne verschachtelte Traps. C. Venus: Dienstnummer in a0, Argument in a1, Dienste 1, 4 und 10. Ripes wurde nicht ausgeführt, Venus ebenfalls nicht.

## Sichtbare Korrekturen

- Das Echo maskiert SW3 und schreibt Rot oder Schwarz, nicht das Rohwort.
- mstatus wird nicht mit 1 überschrieben. MIE ist Bit 3, Maske 8.
- mtvec wird im Direct-Modus nicht blind in den PC kopiert. MIE gleich 0 sperrt nicht alle Traps.
- Venus ist ein Konsolendienst, kein nachgewiesener Kernel. Eine falsche Adresse ist kein automatischer Heap-Zugriff.
- Programme: beispiele/vl8_sw3_rot.s, vl8_lauflich.s, vl8_hello.s, vl8_eva.s.

## Notizen

Alle 84 Folien haben eine Notiz. Offen bleiben die konkreten Exportadressen, die Registererhaltung von Venus und jeder UI-Lauf.
