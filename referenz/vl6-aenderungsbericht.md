# Einheit 6: Änderungsbericht

## Fachliche und didaktische Prüfung

Die bisherige Fassung enthielt viele sehr kleine Einzelschritte, wiederholte Metaphern und Widersprüche zwischen sichtbaren Folien und präziseren Notizen. Insbesondere wurden Opcode-Erkennung und vollständige Befehlsprüfung vermischt, zwei kombinatorische Steuerfunktionen als zwangsläufig effizienter dargestellt und falsche Speicherzugriffe in der Übung als zufälliger Müll beschrieben.

Die neue Fassung hat 52 inhaltliche Abschnitte mit jeweils ausgearbeiteten Notizen. Hinzu kommt die automatisch erzeugte Titelfolie mit eigenen Sprechernotizen. Das Vorwissen aus Einheit 1–5 ist ausdrücklich benannt; Karnaugh-Veitch-Minimierung, Mikroprogrammentwurf und Pipeline-Kenntnisse werden nicht vorausgesetzt.

Der rote Faden lautet: Befehlsfelder → Hauptsignale aus der Befehlswirkung → ALU-Detailsteuerung → addi-Erweiterung → Boolesche Bedingungen und Fehlerfolgen → funktionaler Vergleich mit Ripes.

Die Notizen erläutern Begriffe, Abkürzungen, Feldbedeutungen, Abbildungen und Rechnungen lokal. Beispiele und Verständnischecks enthalten begründete Lösungen. Mit den sichtbaren Folien bilden sie einen begleitenden Lerntext; sie beschränken sich nicht auf Stichpunktwiederholungen.

## Modell und fachliche Änderungen

- Ausgangspunkt bleibt das sieben Befehle umfassende Datenpfadmodell aus Einheit 5.
- `addi` wird erst im eigenen Transferabschnitt mit Erkennung, Immediate-Auswahl und Register-Rückschreibweg ausdrücklich ergänzt.
- Die vereinfachte Hauptsteuerung setzt gültig erkannte Befehle voraus. Ein Opcode-Familienerkenner ersetzt keine vollständige Prüfung von Funktionsfeldern, Speicherbreite oder Branch-Art.
- Sieben benannte Hauptsignale ergeben acht Bits; PCSrc ist weiterhin Branch UND Zero und kein unabhängiger Hauptsteuerungsausgang.
- ALUOp und ALUControl sind unterschiedliche interne Kurscodierungen, keine zusätzlichen RISC-V-ISA-Felder.
- Bit 30 unterscheidet nur unter den passenden Voraussetzungen `add` und `sub`. Bei `addi` gehört es zum Immediate; das Beispiel +1024 zeigt, dass ein gesetztes Bit weder generell negativ noch eine Subtraktionskennung ist.
- Die Booleschen Bedingungen für Quellenwahl und Freigaben werden aus gültig erkannten, gegenseitig ausschließenden Gruppen hergeleitet.
- Zwei zulässige MemtoReg-Realisierungen zeigen die konkrete Freiheit bei Don't Care. X, unbekannter Simulationswert und hochohmiger Zustand bleiben getrennt.
- Die Fehlerbeispiele bestimmen Speicheradresse, Schreibdaten und gegebenenfalls zusätzliches Register exakt. Sie sind gedachte Decoderänderungen, keine Behauptung eines Ripes-Fehlers oder eines zwingenden Absturzes.
- LUT beziehungsweise ROM und Mikroprogramm sind getrennt erklärt; RISC-V schreibt die interne Umsetzung nicht vor. Größen- oder Geschwindigkeitsgewinne werden ohne konkreten Entwurf nicht behauptet.
- Das vorhandene Programm `beispiele/vl6_mux_beobachter.s` bleibt unverändert. Setup, betrachtete Instruktionen und simulatorabhängiger Exit werden getrennt.

## Abbildungen

Sieben neue SVG-/PDF-Paare zeigen:

1. Befehlsfelder und ihre Verbraucher.
2. Den Store-Opcode-Erkenner mit Negationsgliedern und UND-Gatter.
3. Die Trennung von Quellenauswahl und Registerfreigabe.
4. Hauptsteuerung, ALUOp und Detailsteuerung.
5. Die Bedeutung von Bit 30 im addi-Immediate.
6. Die ODER-Bedingung für RegWrite.
7. Den bestimmten Speicherzugriff bei falschem MemWrite.

Die Logiksymbole verwenden rechteckige IEC-Gatter und Ausgangskreise für Negation. SVG-XML, rechtwinklige Leitungen und Bauteilgeometrie wurden geprüft; Leitungen laufen nicht durch Bauteile. Abbildungen und repräsentative Browseransichten wurden visuell kontrolliert.

## Übung und Quiz

Die Übung enthält fünf eigenständig auf Papier lösbare Aufgaben mit insgesamt 50 Punkten: Haupttabelle, ALU-Decodierung, Boolesche Bedingungen, Fehlerfolgen und Branch-Entscheidung. Die Aufgaben beginnen jeweils auf eigener Seite und enthalten Antwortflächen. Eine zusätzliche Ripes-Aufgabe verwendet das vorhandene Beobachterprogramm.

Die zehn Quizfragen bleiben gemäß `dhbw-quizfragen.mdc` erhalten. Jede Frage hat vier Optionen und genau eine richtige Antwort. Die Optionen verwenden fachlich naheliegende Verwechslungen aus dieser Vorlesung. Genau zwei richtige Antworten sind allein am längsten; in den übrigen Fragen ist die richtige Antwort kürzer als mindestens eine falsche. Die korrekten Positionen sind mit 3/2/3/2 Fragen verteilt. Das Importformat bleibt unverändert und die Felder enthalten keine Semikolons.

## Durchgeführte Prüfungen

- Quarto-Rendering von Reveal.js und Skript-PDF mit XeLaTeX erfolgreich.
- 53 Reveal.js-Folien einschließlich Titelfolie haben Notizen.
- Browserprüfung bei 1280 × 720: keine vertikalen oder horizontalen Inhaltsüberläufe, fehlenden Bilder oder JavaScript-Fehler.
- Die externe MathJax-Formeldarstellung wurde im Testbrowser über den vorhandenen HTTPS-Proxy abgerufen; Formeln wurden tatsächlich gesetzt und visuell geprüft. Die Anwendungskonfiguration wurde dafür nicht geändert.
- Studierenden-PDF und Musterlösung erfolgreich erstellt: A4, Aufgaben und Antwortfelder geprüft, Lösungen nur im Lösungsprofil.
- Maschinenwort `0xFFB00293` über seine Felder nachgerechnet; alle zwölf Bit breiten Immediate-Werte für mehrere Anfangswerte auf korrekte Vorzeichenerweiterung und Addition geprüft.
- Opcode-Bedingung, Boolesche Gruppenbedingungen, Don't-Care-Realisierungen und konkrete Fehlerfolgen unabhängig nachgerechnet.
- Das vorhandene Assemblerbeispiel als ausdrücklich vereinfachtes Lehrmodell ab `Beobachtung` bis `Pruefpunkt` nachvollzogen: sieben betrachtete Instruktionen, Registerwerte 5/10/10/1 und Speicherwort 10.
- Quiz-CSV, Korrektmarkierungen, Antwortlängen, Fragenzahl, UTF-8 und logische Notation geprüft.
- Vorhandenes `beispiele/sollwerte.py` erfolgreich; `git diff --check` ohne Befund.

Nicht ausgeführt: interaktiver Ripes-Lauf und Assemblerprüfung mit einer RISC-V-Toolchain. Konkrete Ripes-Portnamen, Codierungen und Disassembly-Adressen sind weiterhin im eigenen Laborprotokoll abzulesen. Die Python-Modellrechnung ist kein Ersatz für diesen Simulatorlauf.

## Vorschlag für vier Schulstunden

Für 180 Minuten Unterricht: etwa 90 Minuten Erklärung mit Verständnischecks, 40 Minuten Papieraufgaben 1/2/4, 25 Minuten Ripes, 15 Minuten Quizbesprechung und 10 Minuten Ergebnissicherung. Papieraufgaben 3 und 5 eignen sich dann als Reserve beziehungsweise Nachbereitung. Das sind didaktische Zeitansätze, keine erprobte Unterrichtsmessung; zusätzliche Pausen sind nicht enthalten.

## Lokale Renderausgaben

- `_site/vorlesungen/06_steuerwerk.html`
- `_handout/vorlesungen/06_steuerwerk.pdf`
- `labs/_output/lab_06_steuerwerk-studierende.pdf`
- `labs/_output/lab_06_steuerwerk-musterloesung.pdf`

Diese Ausgaben liegen in den vorhandenen ignorierten Build-Verzeichnissen. Quellen und die neuen SVG-/PDF-Paare sind die vorgesehenen Repository-Änderungen.
