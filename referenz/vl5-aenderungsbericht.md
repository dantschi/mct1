# Einheit 5: Änderungsbericht

## Didaktische Prüfung

Die bisherige Fassung enthielt 79 Notizblöcke. Viele wiederholten denselben Absatz über Werte vor der Flanke, ohne die jeweilige Folie als eigenständigen Skriptabschnitt zu erklären. Mehrere sichtbare Aussagen waren ungenauer als die Notizen: etwa fünf strikt aufeinanderfolgende Phasen, sofortige ALU-Ergebnisse, physikalischer Stromfluss in Ripes und unbeschränkte 32-Bit-Instruktionsbreite.

Die neue Fassung hat 48 inhaltliche Abschnitte mit jeweils eigenen Notizen; Reveal.js ergänzt die automatische Titelfolie. Der Aufbau führt vom Vorwissen aus Einheit 1–4 über Zustand und Leitungen zu Registerarithmetik, Load/Store, Branch, Gesamtbild und Timing. Ripes folgt erst nach der Erklärung des Lehrmodells.

Die Voraussetzungen sind ausdrücklich benannt. Pipeline-Hazards und die interne Steuerwerksherleitung werden nicht vorausgesetzt. Begriffe, Portbreiten, Rechenbeispiele und die Lösungen der Verständnischecks stehen in den Notizen. Damit bilden Folien und Notizen ein zusammenhängendes Skript.

## Fachliche Änderungen

- ISA-Wirkung und konkrete Mikroarchitektur bleiben getrennt. Basissubset unverändert: `add`, `sub`, `and`, `or`, `lw`, `sw`, `beq`.
- Befehlsbreite, kombinatorische Speicherlesezugriffe und flankengesteuertes Schreiben sind ausdrücklich Modellannahmen.
- Registernummern, Speicheradressen, Datenwerte, Auswahlbits und Freigaben werden getrennt erklärt.
- Der durchgängige `add`-Trace benutzt 50 und 100, die Load/Store-Folge 99 und 88. Vorbereitete Schreibwerte sind noch kein neuer Zustand.
- `add` und `sub` werden über `funct7` unterschieden. Ein Ergebnis null führt bei `sub` nicht zum Branch.
- I- und S-Immediate-Aufbereitung sowie negative Offsets sind erläutert. Der Store hat kein `rd` und verwendet RD2 direkt als Speicher-Schreibdaten.
- ImmGen setzt für B-Type zwölf codierte Bits und das implizite Bit 0 zum vorzeichenbehafteten 13-Bit-Byteoffset zusammen und erweitert auf 32 Bit. Kein zweiter Shift.
- PCSrc entsteht aus Branch UND Zero; beide PC-Kandidaten beziehen sich auf den alten PC.
- Don't Care beschreibt eine unerhebliche Auswahl, keinen unbekannten Simulationswert.
- Die bisherigen unbegründeten Gesamtzeiten sind durch nachvollziehbare Laufzeitannahmen ersetzt: `add` 5,5 ns, `lw` 7,3 ns, ideale gemeinsame Grenze etwa 137 MHz. Andere benötigte Wege sind ausdrücklich als nicht länger vorausgesetzt; keine Ripes-Messung.
- Die drei vorhandenen Assemblerdateien bleiben unverändert. Ripes-Setup, native Instruktionen, disassemblierte Adressen und die Funktion des Lehrmodells werden getrennt betrachtet.

## Abbildungen

Sieben neue SVG-/PDF-Paare erläutern Takt und Zustand, Fetch, ALUSrc, die Datenwege `add`/`lw`/`sw` und die Branch-Auswahl. Die drei Datenwegzeichnungen verwenden dieselbe Geometrie und heben die jeweils benötigten Verbindungen hervor.

Die bestehende Gesamtzeichnung `single-cycle-datapath.svg` samt PDF wurde erneuert. Ungültiges XML, missverständliche Abzweige und eine direkte Steuerleitung nach PCSrc sind behoben. Branch UND Zero ist als rechteckiges IEC-Gatter dargestellt; das AND-Symbol ist korrekt XML-escaped. Verbindungen sind orthogonal, Bauteile überlappen nicht, Leitungen laufen nicht durch Bauteile. Punkte kennzeichnen Verbindungen, Kreuzungen ohne Punkt bleiben getrennt.

Diese gemeinsame Gesamtzeichnung wird auch in Einheit 6 eingebunden; deren Quelltext wurde nicht geändert.

## Übung und Quiz

Das Übungsblatt enthält fünf eigenständig auf Papier lösbare Aufgaben mit zusammen 50 Punkten: Decodierung/Zustand, Load/Store mit negativem Offset und Bytebild, Branches, Steuerfehler und Timing. Ein sechster Aufgabenteil vergleicht Vorhersage und Ripes-Beobachtung. Musterlösungen erscheinen nur im Lösungsprofil. Die PDF-Ausgabe ist A4; Papieraufgaben beginnen jeweils auf einer eigenen Seite und enthalten Antwortflächen.

Das Quiz wurde von 10 auf 16 Fragen überarbeitet. Jede Frage hat genau eine richtige Antwort. Die richtigen Positionen sind mit jeweils vier Fragen gleich verteilt, ohne zyklische Reihenfolge. Die längste Antwort ist innerhalb einer Frage weniger als 1,35-mal so lang wie die kürzeste; die richtige Antwort ist nur in drei Fragen eine längste Antwort, einschließlich eines Gleichstands aller Optionen. Ablenkungsantworten greifen typische fachliche Fehler auf. Der Importaufbau mit Semikolon und UTF-8-BOM bleibt erhalten.

## Validierung

- Reveal.js erfolgreich gerendert: 49 Folien einschließlich automatischer Titelfolie, 48 eigene Notizblöcke.
- Alle Folien im Browser bei 1280 × 720 durchlaufen: keine übervollen Folien, fehlenden Bilder oder JavaScript-Fehler. Repräsentative Folien und PDF-Seiten visuell geprüft.
- Handout mit XeLaTeX erfolgreich gerendert; Notizen und Verständnischeck-Lösungen sind im Skript enthalten.
- Studierenden- und Lösungs-PDF erfolgreich gerendert und auf Aufgaben-/Lösungstrennung geprüft.
- SVGs als XML und hinsichtlich Geometrie geprüft; zugehörige PDFs erzeugt.
- Maschinenwörter `0x00628533` und `0x0044A503`, B-Type-Aufbereitung für +12 und −8, Registerergebnisse, Speicheradressen, Little-Endian-Bytes und Timing unabhängig nachgerechnet.
- Quiz-CSV, Korrektmarkierungen, Antwortpositionen und Längen geprüft.
- Vorhandenes `beispiele/sollwerte.py` erfolgreich ausgeführt; `git diff --check` ohne Befund.
- Nicht ausgeführt: interaktiver Ripes-Lauf. Dokumentierte Werte sind funktionale Erwartungen; versionsabhängige Ports und MUX-Codierungen sind im Labor abzulesen.

## Erzeugte lokale Ausgaben

- Folien: `_site/vorlesungen/05_single-cycle-datenpfad.html`
- Skript: `_handout/vorlesungen/05_single-cycle-datenpfad.pdf`
- Studierende: `labs/_output/lab_05_single-cycle-datenpfad-studierende.pdf`
- Musterlösung: `labs/_output/lab_05_single-cycle-datenpfad-musterloesung.pdf`

Diese Renderausgaben liegen in den vorhandenen ignorierten Build-Verzeichnissen.
