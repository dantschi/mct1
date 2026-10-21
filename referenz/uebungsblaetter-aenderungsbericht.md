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

## Nachtrag 21. Oktober 2026: Blatt 6 konkreter

Blatt 6 war zu abstrakt. Die Papieraufgaben bauen jetzt aufeinander auf: Wirkung von fünf Befehlen mit Zahlenwerten bestimmen, das Steuerwerk eines Mini-Datenpfads (nur add, beq, lw, sw, Zweibit-Gruppencode) als Wahrheitstabelle, Formeln und Gatterschaltung selbst bauen, ein Programm damit verfolgen, einen Verdrahtungsfehler (MemtoReg an g0) finden und schließlich ALUOp/ALUControl für vier Rechenbefehle ergänzen. Entfallen sind die Bit-30-Sonderfälle, die Don't-Care-Formelvarianten und die Fehlerfolgen über Immediate-Bits als Registeradresse.

Der Mini-Datenpfad ist als TikZ-Abbildung im Blatt enthalten. Die Ripes-Aufgabe enthält das vollständige Programm, das denselben Ablauf wie die Papieraufgabe ausführt, sowie eine Tabelle, die die Signale des Mini-Modells den Ripes-Anschlüssen zuordnet; Studierende brauchen kein Repository. Eine separate Datei unter beispiele/ gibt es für Blatt 6 nicht mehr; beispiele/lab_06_bitpruefung.s entfällt. Papierpunkte bleiben 50. Sollwerte, Fehlerlauf und Ripes-Variante (Sollwert 41) wurden mit einer Python-Modellrechnung nachgerechnet; ein Ripes-Lauf fand nicht statt. Seitenzahl Blatt 6: Studierende 8, Musterlösung 11.

## Nachtrag 21. Oktober 2026: Blätter 1–9 und Quizze nach dem Muster von Blatt 6

Alle übrigen Blätter und alle Quizze wurden nach dem Muster der neuen Fassung von Blatt 6 überarbeitet: konkrete Zahlen statt Sonderfall-Spitzfindigkeiten, Beispielzeilen und Ausfülltabellen, kleine Teilaufgaben mit sichtbaren Punkten, ein durchgehendes Anwendungsszenario je Blatt und eine Fehlersuche, die bei einem beobachteten Symptom beginnt. Die Papierpunkte bleiben unverändert (60, bei den Blättern 5 und 6 je 50).

| Blatt | Szenario | Seiten Studierende / Musterlösung |
|---|---|---|
| 1 | Klimaschrank: Anzeigewerte, Temperaturen im Zweierkomplement, Messprotokoll im Speicher, Hand-/Automatikbetrieb als MUX, Regelabweichung, Registerspur | 7 / 11 |
| 2 | Drucksensor mit Korrektur Y = (A − B) + 4C: Registerspur, Statusmasken, Schieben, Immediates, Codierung, Fehlersuche im Speicherabzug | 8 / 11 |
| 3 | Frostwächter: Messreihe im Speicher, Teilzugriffe, Store-Codierung, Frostanzeige mit Branch, Zählschleife, Fehlersuche | 8 / 13 |
| 4 | Abfüllautomat: jal/ret, Registervertrag, Frame, Programmspur, drei fehlerhafte Fassungen, Ausbau mit zwei Aufrufen | 8 / 8 |
| 5 | Paketwaage: Ports vor der Flanke, Load/Store, Branch-Entscheidung, Fehlersuche ALUSrc beim Store, Taktperiode | 8 / 12 |
| 6 | Mini-Datenpfad: Steuerwerk bauen, Programm verfolgen, Verdrahtungsfehler, ALUOp-Ausbau | 8 / 11 |
| 7 | Sensorknoten am Wassertank: Speedup, Forwarding, Load-Use, Umordnen, zwei Fehlerbilder, Flush und Vorhersage | 7 / 11 |
| 8 | Pumpenstation: Gerätekarte, Füllstandsanzeige, Tasterabfrage mit Entprellen, Timer-Interrupt, Handler-Frame, Venus-Ausgabe | 9 / 14 |
| 9 | Lüfterregler eines Schaltschranks: Werkzeugkette, Schleifen und Arrays von C nach Assembler, Zustandsautomat, Fehlersuche, Stackframe, Datenpfad und Pipeline | 10 / 16 |

Kein Blatt verweist mehr auf das Repository. Programme, die in Ripes oder Venus laufen sollen, stehen vollständig im Blatt; reine Referenzlösungen stehen in der Musterlösung. Die Dateien beispiele/lab_0*_* sind gelöscht, die Notizen der Vorlesungen 1–9 beschreiben das jeweilige Blatt ohne Dateipfad. Bedienhinweise zu Ripes und Venus stammen aus der offiziellen Dokumentation (Ripes docs, Venus-Wiki der Linie 61c-teach) bzw. dem Ripes-Quellcode und sind im Blatt als versionsabhängig gekennzeichnet; einen eigenen Simulatorlauf gab es nicht.

Geprüft: Alle Zahlenwerte, Programmläufe, Fehlervarianten und Codierungen mit Python-Modellrechnungen (RV32I-Semantik, zyklengenaues Pipeline-Kursmodell für Blatt 7); C-Funktionen von Blatt 9 zusätzlich mit dem Host-gcc (kein Nachweis einer RISC-V-Übersetzung). Teilpunkte je Aufgabe summieren sich zur Aufgabenpunktzahl. Alle 18 PDF-Fassungen mit Quarto und XeLaTeX gebaut und Seite für Seite angesehen. Quizze: je 10 Fragen, 11 Felder, genau eine richtige Antwort, richtige Position auf 1–4 verteilt (je 2–3-mal), richtige Antwort nur in zwei Fragen allein am längsten, Kodierung und CRLF unverändert.
