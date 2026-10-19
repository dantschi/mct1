# Übungsblätter 1–9: Aufgabenstart und neue Beispiele

Stand: 19. Oktober 2026.

Alle neun Blätter wurden nacheinander mit den zugehörigen Folien verglichen und überarbeitet. Die Studierendenfassungen beginnen nach Titel und Untertitel unmittelbar mit Aufgabe 1. Allgemeine Einführungen, Lernzieltexte, Ablaufpläne und separate Modellkapitel entfallen. Nötige Annahmen stehen kurz bei der jeweiligen Aufgabe. Die Papieraufgaben, Punkte und getrennten Musterlösungen bleiben erhalten.

## Neue Aufgaben und Referenzen

| Blatt | Neue Beispiele und Transfer |
|---|---|
| 1 | Andere Bitmuster und Speicherwörter, manuelle/automatische Signalwahl, neue Übertragskette und Registerspur |
| 2 | Andere Masken und Schiebeweiten, neue R-/I-Codierungen, Messkorrektur mit Differenz und vierfachem Eingang |
| 3 | Messpuffer mit negativer Adressverschiebung, neue Teilzugriffe und Store-Codierungen, negative Arraywerte zählen |
| 4 | Versatzfunktion mit Differenz-Helfer, 32-Byte-Frame, andere Slots und Adressen, Rekursion mit konstantem Zuschlag |
| 5 | ODER statt Folien-Addition, Paketkopie mit negativem Wort, Rückwärtsbranch und neue Pfadverzögerungen |
| 6 | Fehlerhaften Decoder korrigieren, neue ALU-Fälle und Boolesche Bedingungen, zusätzlicher Schreibversuch nach x0, Bitprüfung |
| 7 | Vier abhängige Instruktionen mit zwei Forwarding-Quellen, neue Laufzeitdaten, Vierer-Scheduling und wechselnde Vorhersagefolge |
| 8 | Zweibit-Anzeige mit anderer Papierkarte, Vierprobenfilter, andere Trap-Ursachen und Statusfälle, korrigierte Messwertausgabe |
| 9 | Andere C-Kontrollflüsse, Summe gerader Arrayindizes, neue Aufruffunktion und dreistufiger Lüfterregler statt Code-Schloss |

Die praktischen Aufgaben verweisen ausschließlich auf die 13 neuen Dateien mit Präfix lab_ unter beispiele/ (zwölf Assemblerdateien und eine C-Datei). Die bisherigen vl-Referenzen bleiben für die unveränderten Vorlesungsfolien bestehen. Unveränderliche ISA-, ABI- und Datenpfadregeln werden beibehalten; Aufgabenwerte, Anwendungsfälle und Programmfunktionen wurden neu gewählt.

Papierpunkte nach Blatt: 60, 60, 60, 60, 50, 50, 60, 60, 60. Optionale Aufgaben bleiben entsprechend gekennzeichnet.

## Prüfung

- Alle Aufgaben- und Lösungsfassungen auf fachliche Konsistenz und eindeutige Anfangswerte geprüft; jede Studierendenfassung beginnt mit Aufgabe 1.
- Alle zwölf neuen Assemblerdateien im funktionalen RV32I-Papiermodell geprüft: Varianten, Arraygrenzen, Null-Länge, s-Register- und Stack-Erhaltung.
- Venus-Ausgabepfade zusätzlich mit bewusst zerstörten Datenregistern nach Diensten geprüft; keine undokumentierte Registererhaltung für anschließende Rechnungen vorausgesetzt.
- Neue native Lehrtabelle mit allen sechs Stackzuständen, rekursive Zuschlagsfunktion und Teilzugriffe unabhängig berechnet.
- Pipeline-Raster mit Load-Use, beiden Forwarding-Quellen und WB/ID-Konflikt unabhängig berechnet; Scheduling führt genau dieselben vier Kerninstruktionen aus.
- Vierprobenfilter sowie sämtliche Lüfter-Zustandsübergänge, alle 16 Rohmasken und 25 vollständige Abfragegruppen mit dem tatsächlichen Programmcode geprüft.
- Neue C-Funktionen mit dem Hostcompiler gebaut und in 69 Fällen geprüft. Das ist kein Nachweis einer RISC-V-Compilerübersetzung.
- Alle 18 PDF-Fassungen mit Quarto und XeLaTeX gebaut und visuell kontrolliert. Automatische Prüfung: A4, keine Textüberläufe, keine kurzen Restseiten, vollständige Aufgabenfolge und keine Musterlösung in der Studierendenfassung.
- UTF-8 und git diff --check geprüft.

Die PDF-Seitenzahlen pro Fassung betragen nach Blatt 7, 7, 7, 8, 6, 6, 7, 8, 8. Einzeldateien und zwei Sammel-PDFs mit je 64 Seiten liegen lokal unter labs/_output/ und bleiben als Build-Artefakte unversioniert. Beide Sammelfassungen haben Lesezeichen je Blatt.

Die Code- und Zeitangaben sind funktional geprüfte Modellvorhersagen. Es wurden keine eigenen Venus-/Ripes-Beobachtungen, privilegierten Hardwareläufe oder RISC-V-Compilerergebnisse erfunden. Tatsächliche Geräteadressen, Simulatorversionen und Beobachtungen werden weiterhin in den praktischen Aufgaben selbst protokolliert.
