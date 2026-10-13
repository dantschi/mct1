# Änderungsbericht zu Vorlesung 1

Stand: 13. Oktober 2026. Überarbeitet wurden `vorlesungen/01_kickoff.qmd`, `labs/lab_01_datenrepraesentation-logik.qmd` und `quizacademy/quiz_01_einleitung_und_grundlagen.csv`. Grundlage sind die Regeln unter `.cursor/rules/` und der gemeinsame Kursvertrag.

## Einstieg und Aufbau

Die erste Einheit setzt kein Wissen aus späteren Einheiten und keine Programmiersprache voraus. Benötigt werden elementare Rechnungen und das schrittweise Lesen einfacher Tabellen; Stellengewichte und Zweierpotenzen werden erklärt.

Die bisherige Fassung mit 98 Folien wurde auf 66 Inhaltsfolien plus automatisch erzeugte Titelfolie gestrafft. Wiederholte Themenübersichten und schematische Kurznotizen wurden durch eine zusammenhängende Lernfolge ersetzt:

1. Verhalten, Schnittstelle und Hardwareumsetzung unterscheiden.
2. Bits, Breiten, Stellenwerte und Hexadezimal einführen.
3. Vorzeicheninterpretation, Zweierkomplement und Grenzen berechnen.
4. Adresse, Byteordnung, Ausrichtung und Adressraum trennen.
5. Grundgatter, Wahrheitstabelle und Multiplexer verbinden.
6. Halb-/Volladdierer, Carrykette, Subtraktion und Rechenwerk entwickeln.
7. Laufzeit, Zustand, aktive Flanke und Schreibfreigabe erklären.
8. Registerbank, Additionsschritt und Speicherzugriffe zusammenführen.

Die Carry-Lookahead-Folie ist als Vertiefung gekennzeichnet. Der Ripes-Versuch ist optional. Die Voraussetzungen für Einheit 2 – Register, Auswahl, Rechenwerk, Übernahme und Speicherwege – bleiben enthalten.

## Notizen als Skript

Alle 67 Browserfolien haben passende Notizen. Die 66 Inhaltsnotizen umfassen rund 7.900 Wörter. Sie erläutern lokale Begriffe, Abkürzungen, Formeln und Codebezeichner, beschreiben die Leserichtung und Farben der Abbildungen und enthalten Rechenwege sowie Lösungen der Kurzaufgaben.

Insbesondere werden Breite, Muster und Zahlenwert getrennt. Für Rechnungen und Traces sind Anfangswerte, Interpretation und Zeitannahmen genannt. Neue Begriffe werden eingeführt, statt Kenntnisse aus dem weiteren Kurs vorauszusetzen. Das Handout enthält alle 66 Notizblöcke zusammen mit den Folienkarten und kann als begleitendes Skript verwendet werden.

## Fachliche Korrekturen

- Kombinatorische Logik liefert nach endlicher Laufzeit und Stabilisierung die Funktion der aktuellen Eingänge. „Unmittelbar“ wurde in der Übung korrigiert.
- Sequenziell bedeutet gespeicherten Zustand, nicht allgemein Taktpflicht. Ein pegelgesteuertes Latch und unser flankengesteuertes Register werden unterschieden.
- Die steigende Flanke und Schreibfreigabe gehören zum Lehrmodell, nicht zu einer universellen RISC-V-Vorschrift.
- Zweimalige modulare Negation stellt **jedes** Ausgangsmuster wieder her, einschließlich des kleinsten Zweierkomplementwerts. Dessen positives mathematisches Gegenstück ist trotzdem nicht darstellbar.
- Übertrag und Signed-Überlauf werden an `0x7F+1` und `0xFF+1` getrennt geprüft.
- Little Endian ist die Kursfestlegung. Byteordnung kehrt keine Bits im Byte um und bestimmt nicht die Adressausrichtung.
- Ein 32-Bit-Byteadressraum umfasst vier GiB und ist keine Aussage über installierten Arbeitsspeicher.
- Die ALU-Steuercodes sind interne Beispielcodes. Die Nullerkennung ist ein kombinatorisches Signal und kein vorgeschriebenes gespeichertes RV32I-Flag.
- Ein Additionsbefehl schreibt sein Registerziel. Er ist kein Daten-Store.
- Registernummern, Werte und Byteadressen sowie gemeinsame Adressräume und gemeinsame Zugriffspfade werden unterschieden.

## Abbildungen und Lehrdateien

17 neue native SVGs mit PDF-Paaren unter `assets/images/vl1-*.{svg,pdf}` zeigen:

- Abstrakte Schnittstelle und mögliche Umsetzung.
- Bitgewichte, Zweierkomplementbildung und Byteordnung.
- Rechteckige IEC-Grundgatter, Multiplexer und Halb-/Volladdierer.
- Carrykette und arithmetisch-logische Einheit.
- Flip-Flop, Setup-/Hold-Fenster, Registerrückführung und Zeittrace.
- Registerbank mit Ergebnisrückführung sowie Speicherzugriffswege.

Schaltungen verwenden orthogonale Leitungen, sichtbare Verzweigungen, weiße Gatter und die vorgegebene Palette. UND-Symbole sind XML-konform escapet. Temporäre SVGs wurden auf XML, Boxengrenzen, überlappende Boxen und Leitungen durch Bausteine geprüft. Zeitfenster und Flankenmarkierungen sind bewusst Zeitannotationen. Alle Diagramme wurden visuell kontrolliert. Die PDFs wurden aus denselben finalen SVGs erzeugt.

`beispiele/vl1_lehrwerte.md` enthält die zugehörigen Sollwerte. Das neue `beispiele/vl1_registeraddition.s` ist ein vollständiges manuelles RV32I-Ripes-Lehrprogramm mit Einstieg und Inspektionsschleife. Es erzeugt x5 gleich sieben, x6 gleich drei und x7 gleich zehn und verwendet keinen Systemdienst. Ein eigener Simulatorlauf wird dadurch nicht behauptet.

## Übung und Quiz

Sechs Papieraufgaben ergeben 60 Übungspunkte:

| Thema | Punkte |
|---|---:|
| Binär und Hexadezimal | 10 |
| Zweierkomplement und Überlauf | 12 |
| Byteordnung und Adressen | 10 |
| Logik und Multiplexer, einschließlich Schaltungsskizze | 10 |
| Volladdierer und Carrykette | 8 |
| Flanke, Freigabe und Register | 10 |

Die Aufgaben verlangen Rechenwege, begründete Entscheidungen und Zustandsvorhersagen. Breite Tabellen und eigene Schreibflächen ermöglichen handschriftliche Lösungen. Studierendenfassung und Musterlösung sind getrennt. Die Punkte und Aufgabentypen dienen der Klausurvorbereitung, ohne verbindliche Prüfungsregeln festzulegen.

Das Quiz behält zehn Fragen, elf semikolongetrennte Spalten, vier Optionen und genau eine richtige Antwort. Richtige Positionen sind 3/3/2/2 verteilt. Die richtige Antwort ist zweimal allein am längsten, einmal allein am kürzesten und in den übrigen Fragen weder allein am längsten noch allein am kürzesten. Bei allen übrigen Fragen ist mindestens ein Distraktor länger. Das Verhältnis längster zu kürzester Option liegt jeweils unter 1,35. Erläuterungen bestehen aus ein oder zwei Sätzen.

## Tatsächlich erfolgte Prüfungen

| Prüfung | Ergebnis |
|---|---|
| Reveal-Render | Erfolgreich, 67 Browserfolien |
| Chromium bei 1280 × 720 | Keine Bildfehler, fehlenden Notizen, Überläufe oder JavaScript-Fehler |
| MathJax und Sichtkontrolle | Formeln geladen, 29 repräsentative Bildschirmbilder und alle Diagramme kontrolliert |
| Skript mit XeLaTeX | 39 A4-Seiten, alle 66 Inhaltsnotizen enthalten |
| Studierendenfassung / Musterlösung | Je acht A4-Seiten, Lösungstrennung und Schreibflächen kontrolliert |
| PDF-Textgrenzen | Innerhalb der geprüften Seitenränder |
| UTF-8 und lokale Definitionen | Geprüft, einschließlich Code und Grafiktexten |
| Zweierkomplement | Alle 256 Acht-Bit-Muster für Negation und Erweiterung geprüft |
| Numerische Beispiele | Hex, Überlauf, Byteordnung, Ausrichtung, Adressraum und Frequenz geprüft |
| MUX und Volladdierer | Je alle acht Eingangskombinationen geprüft |
| Vier-Bit-Addierermodelle | 512 Additionen einschließlich Startübertrag und 256 Subtraktionen geprüft |
| Registermodell | 64 Kombinationen sowie beide vollständigen Übungstraces geprüft |
| Tatsächliche Assemblerquelle | Funktional interpretiert: Initialisierung, Summe zehn und Erhaltung in der Schleife |
| `python beispiele/sollwerte.py` | Erfolgreich |
| Quizschema, Antwortlängen und Positionen | Erfolgreich |
| `git diff --check` | Erfolgreich |

Die funktionalen Modelle wurden gegen Stellenwertrechnung, numerische Addition und die angegebenen Solltraces verglichen. Sie sind kein Nachweis einer konkreten Gatterschaltung unter physikalischen Verzögerungen. Das Assemblerprogramm wurde nicht mit Ripes oder einer RISC-V-Toolchain ausgeführt. Es werden keine Simulatorbeobachtungen, Pseudobefehlsexpansionen oder gemessenen Hardwarezeiten behauptet.

## Möglicher Ablauf für vier Schulstunden

Eine Auswahl für 180 Minuten Unterrichtszeit:

| Abschnitt | Minuten |
|---|---:|
| Erklärung und integrierte Kurzaufgaben | 105 |
| Ausgewählte Teile aus Papieraufgaben 1, 2, 4 und 6 mit Besprechung | 55 |
| Quiz und Auswertung | 15 |
| Abschluss | 5 |
| **Summe** | **180** |

Die übrigen Papieraufgaben, Carry-Lookahead und der vorbereitete Ripes-Versuch dienen als Reserve oder Nachbereitung. Eine vollständige Bearbeitung aller Aufgaben benötigt zusätzliche Zeit. Die Angaben sind Planungsschätzungen; Pausen und eine eventuelle Installation kommen hinzu.

Erzeugte Ausgaben:

- `_site/vorlesungen/01_kickoff.html`
- `_handout/vorlesungen/01_kickoff.pdf`
- `labs/_output/lab_01_datenrepraesentation-logik-studierende.pdf`
- `labs/_output/lab_01_datenrepraesentation-logik-musterloesung.pdf`
