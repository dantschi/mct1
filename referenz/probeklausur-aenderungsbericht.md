# Überarbeitung der Probeklausur

Stand: 3. November 2026.

Die Probeklausur in `labs/probeklausur.qmd` prüft jetzt ausschließlich Vorlesung 1–7 und deren Wiederholung in der neuen Einheit 9. Inhalte aus Vorlesung 8 und vorausgesetztes Wissen aus der früheren Einheit 9 entfallen. Der gewünschte Eingangstext bleibt wörtlich erhalten. Die Klausur umfasst weiterhin 20 Multiple-Choice-Fragen und sechs weitere Papieraufgaben mit insgesamt 90 Punkten für ungefähr 90 Minuten.

## Änderungen und Ergebnis des Reviews

- Die bisherigen Fragen 16–20 wurden durch Shifts, Load-Use, Forwarding-Priorität, tatsächlich benutzte Quellregister und Branch-Flush ersetzt. Sie prüfen Anwendungen aus dem gehaltenen Stoff.
- Frage 3 schließt einen Reset aus und trennt kombinatorische Auswahl eindeutig vom gespeicherten Registerzustand. Frage 13 verwendet einen konkreten Store und eine präzisere falsche Option zur Registerschreibfreigabe.
- Aufgabe 3 beschreibt die Arraysumme sprachlich als RV32I-Funktionsvertrag. C-Syntax und die Regeln für signed C-Überlauf werden nicht mehr vorausgesetzt. Der Nullfall, gültige Speicherzugriffe, Aufrufkonvention und Byteadressierung bleiben prüfbar.
- Die frühere I/O-/Zustandsmaschinenaufgabe wird durch vollständige I-/S-Codierungen, Little-Endian-Bytefolge und die Unterscheidung von Immediate und Quellregisterfeld ersetzt. Dadurch wird die zuvor schwach vertretene eigenständige Maschinencodierung auch auf Papier geprüft.
- Die Stackausrichtung gilt ausdrücklich während standardkonformer Funktionen. Der fehlerhafte Epilog in Aufgabe 4 wird durch den Ersatz genau einer Instruktion beschrieben; alle Adressen bleiben eindeutig.
- Das Pipelinemodell nennt die Forwarding-Priorität, Load-Verfügbarkeit und die fehlende gleichzeitige WB→ID-Weiterleitung ausdrücklich. Laufzeit und Taktperiode erhalten unterschiedliche Symbole.
- Die Musterlösungen zu Aufgabe 4 und 7 beginnen jeweils auf einer eigenen Seite. Feldtabellen, Stufenraster und Schreibflächen bleiben für die handschriftliche Bearbeitung ausgelegt.

Im fachlichen Review wurden keine falschen Rechenergebnisse der beibehaltenen Papieraufgaben gefunden. Die Verbesserungen betreffen Stoffabgrenzung, Eindeutigkeit, ergänzte Prüfungskompetenzen und Lesefluss. Alle neuen Aufgaben besitzen vollständige Musterlösungen mit nachvollziehbaren Teilpunkten. Folgefehler werden bei korrekter Weiterrechnung nicht mehrfach abgezogen.

## Auswahlteil

Jede der 20 Fragen besitzt vier eigenständige Optionen. Eine, mehrere oder alle können richtig sein; nur die vollständig richtige Auswahl erhält einen Punkt. Die Quizacademy-Regel mit genau einer richtigen Option gilt für diese ausdrücklich verlangte Mehrfachauswahl nicht.

Vier Fragen haben eine richtige Option, elf haben zwei, vier haben drei und eine hat vier. Die Positionen A und B sind jeweils elfmal, C und D jeweils zehnmal richtig. Diese Verteilung steht nicht in der Studierendenfassung. Richtige und falsche Optionen sind sowohl kurz als auch lang; richtige Optionen sind im Mittel etwa 60, falsche etwa 66 Zeichen lang. Die Antwortlänge liefert keinen durchgängigen Schlüssel.

Der Antwortschlüssel lautet:

| Frage | Richtig | Frage | Richtig |
|:---:|:---:|:---:|:---:|
| 1 | A, D | 11 | B, C, D |
| 2 | A, B, C, D | 12 | B |
| 3 | B, D | 13 | B, C |
| 4 | B | 14 | A, C, D |
| 5 | A, C, D | 15 | A |
| 6 | B, C | 16 | A, D |
| 7 | A, D | 17 | B, C |
| 8 | B, C | 18 | B, C, D |
| 9 | A, D | 19 | A |
| 10 | A, C | 20 | A, B |

Die Erläuterungen begründen die richtigen Aussagen und erklären die typischen Verwechslungen der falschen Optionen.

## Papieraufgaben und Zeit

| Aufgabe | Schwerpunkt | Punkte | Richtzeit |
|:---:|:---|---:|---:|
| 1 | 20 Verständnisfragen zu Vorlesung 1–7 | 20 | 20 min |
| 2 | Zahlendarstellung, Überlauf, Logik und Register | 10 | 10 min |
| 3 | Array, Schleife und RV32I-Blattfunktion | 16 | 16 min |
| 4 | Aufruf, Stacktrace und Registererhaltung | 10 | 10 min |
| 5 | Datenpfad, Steuerwerk und Fehlerwirkung | 12 | 12 min |
| 6 | Pipeline, Forwarding und Laufzeit | 12 | 12 min |
| 7 | Maschinencode, Bytefolge und Formatverständnis | 10 | 10 min |
| | Summe | 90 | 90 min |

Alle Aufgaben sind mit dem ausgeteilten RISC-V-Referenzblatt auf Papier lösbar. Die Richtzeiten umfassen Lesen und Bearbeiten; sie sind eine didaktische Planung für vorbereitete Studierende, keine empirisch gemessene Bearbeitungszeit. Die Themenübersicht in der Musterlösung ordnet die Aufgaben ausschließlich den Vorlesungen 1–7 zu.

## Durchgeführte Prüfungen

- Exakter Eingangstext, 20 nummerierte Fragen, 80 Optionen, alle Antwortschlüssel, Aufgaben- und Teilpunktsummen geprüft: insgesamt 90 Punkte.
- 64 unabhängige funktionale beziehungsweise numerische Prüfgruppen bestanden.
- Die tatsächlich abgedruckte Arraysummenfunktion für alle Längen null bis vier mit jeweils drei unterschiedlichen Registerinitialisierungen geprüft: Rückgaben 0, −2, 3, 10 und 7; genau so viele Loads wie Elemente, keine Zugriffe außerhalb des gültigen Arrays, Erhaltung von Stack, Rückkehrlink und callee-saved Registern.
- Stacktrace einschließlich Sicherungsadressen, Wiederherstellung und fehlender `ra`-Wiederherstellung geprüft.
- Steuerzeilen, Branchziel `0x3FF4` und Fehler-Loadwert `0x200C` unabhängig nachgerechnet.
- Das taktweise Fünfstufenmodell reproduziert das Stufenraster mit acht Takten und den Ergebnissen `t0=12`, `a0=24`. Der getrennte Lauf ergibt 118 Takte, CPI 1,18, 236 ns und Speedup ungefähr 3,39.
- Neue Codierungen `0xFE458713` und `0xFCE5AE23` einschließlich Rückdecodierung sowie Bytefolge `13 87 45 FE` geprüft.
- Studierenden- und Lösungs-PDF mit Quarto und XeLaTeX erzeugt: zwölf beziehungsweise 20 A4-Seiten. Aufgaben, Antwortfelder, Schreibraum, Tabellen, Seitenaufteilung, Textgrenzen und getrennte Lösungen wurden geprüft.
- UTF-8 und `git diff --check` geprüft. Vorlesungs-, Übungs- und Quizdateien der übrigen Veranstaltung bleiben unverändert.

Die funktionalen Prüfungen sind unabhängige Papiermodelle, keine Ripes-, Venus- oder RISC-V-Toolchain-Läufe und keine Hardwaremessungen. Generierte PDFs sind wie die übrigen Labor-Builds unversioniert. Der vorhandene GitHub-Workflow erzeugt daraus `labs/probeklausur.pdf` und `labs/probeklausur-musterloesung.pdf` für die Kurswebsite. Die README nennt jetzt ausdrücklich den Stoffumfang Vorlesung 1–7.
