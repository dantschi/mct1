# Einheit 7: Änderungsbericht

## Modell

Fünf Stufen sind eine Mikroarchitektur, keine RISC-V-Vorschrift. Lehrzeiten: Stufen 200, 100, 150, 250 und 100 ps plus 20 ps Overhead. Single Cycle 820 ps, Pipeline-Takt 270 ps, Einzellatenz 1350 ps. Für 20 Befehle: 16400 gegen 6480 ps, Speedup etwa 2,53. Waschsalon: 8 gegen 3,5 Stunden, etwa 2,29. Ripes wurde nicht ausgeführt.

## Sichtbare Korrekturen

- Die Einzellatenz kann steigen. Das Waschsalonmodell bleibt bei zwei Stunden je Korb.
- Der kritische Pfad ist der längste Signalweg, nicht ein einzelnes Gatter.
- Forwarding prüft Gültigkeit, RegWrite, x0, beide Quellen und den jüngeren Produzenten. ALUSrc bleibt getrennt.
- Die Branch-Tabelle in Takt 4 zeigt die Folgebefehle als ungültig und das Ziel in IF.
- Der Schleifenbranch bleibt rückwärts. Neunmal genommen, einmal Fall-through.
- Scheduling vergleicht dieselben drei Befehle. Die Programme stehen in beispiele/vl7_schedule_a.s und vl7_schedule_b.s.
- Weitere Programme: vl7_forwarding.s, vl7_loaduse.s, vl7_branch.s, vl7_flush.s.

## Notizen

Alle 85 Folien haben eine Notiz. Offen bleiben konkrete Ripes-Portcodes, Farben, die la-Expansion und Disassembly-Adressen.
