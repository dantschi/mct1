# Probeklausur: Kurzfassung für 60 Minuten

Stand: 3. November 2026.

Die Probeklausur in `labs/probeklausur.qmd` wurde von 90 auf 60 Minuten und von 90 auf 60 Punkte gekürzt. Sie enthält jetzt zehn statt 20 Multiple-Choice-Fragen und sechs kürzere Papieraufgaben mit 50 Punkten. Stoffumfang bleiben ausschließlich Vorlesung 1–7 und deren Wiederholung in Einheit 9. Der gewünschte Eingangstext ist wörtlich erhalten.

## Umfang und tatsächliche Entlastung

| Aufgabe | Schwerpunkt | Punkte | Richtzeit |
|:---:|:---|---:|---:|
| 1 | Zehn Multiple-Choice-Fragen | 10 | 10 min |
| 2 | Zahlendarstellung und Logik | 8 | 8 min |
| 3 | Array und Schleife in RV32I | 10 | 10 min |
| 4 | Funktionsaufruf und Stacktrace | 8 | 8 min |
| 5 | Datenpfad und Steuerwerk | 8 | 8 min |
| 6 | Pipeline und Laufzeit | 10 | 10 min |
| 7 | Maschinencode und Bytefolge | 6 | 6 min |
| | Summe | 60 | 60 min |

Die Kürzung reduziert den Bearbeitungsumfang:

- Die zehn ausgewählten MC-Fragen decken ISA, Bitmuster, Logik und Registerflanke, Immediates, Speichererweiterung, Branches, ABI, ALU-Steuerung, Laufzeit und Forwarding ab.
- In Aufgabe 2 entfällt die zusätzliche Register-Zeittabelle; das Konzept bleibt in MC-Frage 3 enthalten.
- In Aufgabe 3 ersetzen sechs gezielte Lücken das vollständige Schreiben einer Assemblerfunktion. Die Aufgaben zu Nullfall, Loads und Byteadressierung bleiben erhalten.
- In Aufgabe 4 entfallen die zusätzlichen Begründungen zu Framegröße und Sicherung. Zustands- und Speichertrace sowie der fehlerhafte Rückkehrlink bleiben prüfbar.
- Aufgabe 5 beschränkt sich auf zwei Steuerzeilen und die Branchentscheidung. Das Abschreiben interner ALU-Codes und der zusätzliche Fehler-Load entfallen.
- Aufgabe 6 fragt neben Raster und Forwarding nur noch Taktzahl, Laufzeit und Speedup ab; zusätzliche Endwerte und der endliche CPI entfallen.
- Aufgabe 7 enthält nur noch eine I-Format-Codierung und deren Bytefolge. S-Format-Codierung und zusätzliche Hazard-Frage entfallen.

Die Musterlösungen und Teilpunkte sind entsprechend gekürzt und neu zugeordnet. Bei Folgefehlern wird korrektes Weiterarbeiten weiterhin getrennt bewertet. Die Punkte sind an der geplanten Bearbeitungszeit ausgerichtet; 60 Minuten sind ein didaktischer Richtwert für vorbereitete Studierende einschließlich Lesen und Rechnen.

## Multiple Choice

Jede Frage hat vier eigenständige Optionen; eine, mehrere oder alle können richtig sein. Nur die vollständig richtige Auswahl erhält einen Punkt. Es gibt weder Teilpunkte noch Punktabzug. Die Quizacademy-Regel mit genau einer richtigen Option gilt nicht für diese ausdrücklich verlangte Mehrfachauswahl.

Der Schlüssel lautet: 1 A/D, 2 A/B/C/D, 3 A/D, 4 B, 5 B/C, 6 A/C, 7 B/C, 8 D, 9 A/C/D, 10 B/C/D.

Zwei Fragen haben eine richtige Option, fünf haben zwei, zwei haben drei und eine hat vier. A und B sind je fünfmal richtig, C und D je sechsmal. Diese Verteilung steht nicht in der Studierendenfassung. Richtige und falsche Antworten sind sowohl kurz als auch lang; ihre mittleren Längen betragen ungefähr 57 beziehungsweise 64 Zeichen. Ein systematischer Längenhinweis wurde nicht gefunden.

## Prüfungen

- Exakter Eingangstext, zehn nummerierte Fragen mit 40 Optionen, Schlüssel, neue Aufgaben- und Teilpunktsummen geprüft: insgesamt 60 Punkte.
- Unabhängiges fachliches Review bestätigt Stoffabdeckung, eindeutige Fragestellungen und tatsächliche Verringerung des Arbeitsumfangs.
- 59 funktionale, numerische und strukturelle Prüfgruppen bestanden.
- Ausgefüllter Lückencode stimmt mit der Musterfunktion überein. Für alle fünf Längen null bis vier und jeweils drei verschiedene Registerinitialisierungen wurden Ergebnisse, genau `n` Loads, gültige Speichergrenzen sowie Register- und Stackvertrag geprüft.
- Stacktrace und fehlende `ra`-Wiederherstellung, Steuerzeilen und Branchziel `0x3FF4`, Pipeline-Raster mit acht Takten, Gesamtlauf mit 118 Takten / 236 ns / Speedup ungefähr 3,39 sowie Codierung `0xFE458713` und Little-Endian-Bytes `13 87 45 FE` nachgerechnet.
- Beide PDF-Fassungen mit Quarto und XeLaTeX erzeugt: zehn A4-Seiten für Studierende und 17 A4-Seiten Musterlösung; Aufgaben, Lösungen, Tabellen, Schreibraum und Seitenränder geprüft. Die Studierendenfassung enthält keine Lösungen.
- UTF-8 und `git diff --check` geprüft. Die README nennt 60 Minuten und 60 Punkte.

Die funktionalen Prüfungen sind unabhängige Papiermodelle, keine Simulator- oder RISC-V-Toolchain-Läufe. Die PDF-Dateien sind Build-Artefakte und bleiben unversioniert. Der vorhandene GitHub-Workflow erzeugt `labs/probeklausur.pdf` und `labs/probeklausur-musterloesung.pdf` für die Kurswebsite.
