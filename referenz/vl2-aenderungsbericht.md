# Einheit 2: Änderungsbericht

## Didaktischer Aufbau

Die Einheit knüpft ausschließlich an Vorlesung 1 an: Bit- und Hexdarstellung, Zweierkomplement, bitweise Logik, Register, Addition sowie Byteadressen. C-Kenntnisse, Funktionsaufrufe und Speicherbefehle sind keine Voraussetzung. Statt bereits am Anfang Operationsfelder und fortgeschrittene Erweiterungen einzuführen, folgt die Vorlesung nun der Reihenfolge Maschinenmodell → Register und Syntax → Registerrechnungen → unmittelbare Konstanten → Codierung/Decodierung → Simulatorarbeit.

Die ausführlichen historischen und plattformbezogenen Exkurse wurden auf eine begründete Einordnung von RISC-V und seiner Erweiterbarkeit reduziert. Die Pflichtinhalte enthalten 51 Inhaltsfolien sowie die automatisch erzeugte Titelfolie. Alle 52 Browserfolien besitzen eigene Notizen. Die 51 Inhaltsnotizen umfassen 6649 Wörter und erklären Ausgangszustände, Begriffe, Rechnungen, Abbildungen, Gültigkeitsgrenzen und Aufgabenlösungen in zusammenhängender Prosa. Die Titelfolie erläutert zusätzlich Voraussetzungen und Arbeitsweise. Das PDF mit Folienkarten und zugeordneten Notizen umfasst 31 A4-Seiten.

## Fachliche Präzisierungen

- ISA, Mikroarchitektur, Assemblertext, Übersetzungswerkzeug und Maschinenwort werden getrennt. Feste Befehlslänge und Simulator-Step begründen keine Aussage über Hardwaretakte.
- Architekturregisternummern und aktuelle Inhalte sind verschiedene Größen. Aliasnamen wie `t0` und `x5` wählen dieselbe Registerstelle; sie sind keine separaten oder zwingend physischen Register.
- Ziel und Quelle dürfen dieselbe Registerstelle bezeichnen. Jede Instruktion liest ihre alten Quellen; die nächste Instruktion sieht das neue Ergebnis. Schreibversuche nach `x0` werden verworfen.
- Addition und Subtraktion liefern die unteren 32 Bit. Signed Überlauf, Carry und ein architektonisches Statusflag sind unterschiedliche Begriffe. Die Papieraufgabe verbindet die aus Einheit 1 bekannten Grenzen mit 32-Bit-Beispielen.
- Logische Operationen sind bitweise. Die Maske `-1` wird auch bei `xori` von zwölf auf 32 Einsen vorzeichenerweitert. Die positive Maske 4095 benötigt ein Register statt eines normalen signed Immediate.
- Registershifts verwenden die unteren fünf Weitenbits. Eine direkt codierte Weite 32 ist bei RV32I hingegen unzulässig. Logisches und arithmetisches Rechtsschieben negativer Muster werden getrennt; arithmetisches Schieben rundet hier nach unten.
- Das normale Rechen-Immediate reicht von −2048 bis 2047. Für die Ersetzung einer konstanten Subtraktion durch `addi` muss auch die negierte Konstante in diesen Bereich passen. Shift-Immediates enthalten zusätzlich Funktionsinformation.
- Codieren und Decodieren werden als Gegenrichtungen vollständig ausgearbeitet. Opcode `0110011` allein genügt nicht für `add` oder `sub`. Registerfelder enthalten Nummern. Feldgrenzen und Hex-Vierergruppen stimmen nicht allgemein überein.
- Numerisches Wort und Little-Endian-Bytefolge bleiben getrennt. Angenommene Adressen wie `0x1000` sind ausdrücklich Lehrwerte, keine behaupteten Venus-Startadressen.
- ABI-Registerrollen dienen zunächst der Orientierung. Die vollständige Aufrufkonvention folgt in Einheit 4. Venus-Dienste sind ein eigener Umgebungsvertrag: `a0` wählt den Dienst, `a1` enthält den Druckwert. Die Musterprogramme enden mit Dienst 10.

Die zwölf neuen Abbildungen liegen als native SVG und zugehörige PDF in `assets/images/vl2-*`. Sie zeigen Registerquellen und Ziel, Aliasidentität, Instruktionsadressen, Bitmasken, beide Shiftarten, Vorzeichenerweiterung, R-/I-Feldbreiten, eine vollständige Codierung, eine gültige `li`-Lehrentwicklung und die Abhängigkeiten der Gleichung. Acht-Bit-Schiebemodelle sind ausdrücklich von den vollständigen 32-Bit-Werten abgegrenzt. Die älteren, nun nicht mehr eingebundenen Abbildungen bleiben für mögliche andere Referenzen erhalten.

## Übung und Zeitplanung

Das Blatt und seine getrennte Musterlösung umfassen jeweils neun A4-Seiten. Sechs Papieraufgaben mit insgesamt 60 Selbstkontrollpunkten behandeln Registertraces, Moduloarithmetik, Carry/Überlauf, Masken, Shiftweiten, Immediate-Grenzen, R-/I-Codierung in beide Richtungen und Instruktionsadressen. Benötigte Codiertabellen und Aliaszuordnungen stehen im Blatt. Die Studierendenfassung bietet beschreibbare Tabellen und Rechenfläche; sie enthält keine eingeblendeten Musterlösungen.

Die siebte Aufgabe setzt die Gleichung `Y = (A + B) - (C + D)` in Venus um. Sie verlangt eine Vorhersage, den Vergleich am Prüfpunkt vor der Ausgabe, vier Eingabefälle und einen kontrollierten Programmabschluss. Das beobachtete Toolprotokoll ist selbst einzutragen. Die vollständige Quelle `beispiele/vl2_gleichung.s` sowie die ergänzenden Programme `vl2_shifts.s` und `vl2_immediates.s` sind vorhanden und auf die neuen Aufgaben abgestimmt. Eine optionale Vertiefung behandelt zusätzliche Shiftrechnungen und die tatsächlich beobachtete Pseudoexpansion.

Planungsannahme für vier Schulstunden zu je 45 Minuten: 75 Minuten Vorlesung einschließlich Rückfragen, 55 Minuten Papierarbeit, 30 Minuten Venus, zehn Minuten Quiz und zehn Minuten Auswertung. Die optionale Vertiefung liegt außerhalb dieser 180 Minuten. Diese Zeiten sind didaktische Schätzungen, keine gemessenen Bearbeitungszeiten. Bei größerem Unterstützungsbedarf kann Aufgabe 6 nachbesprochen werden.

## Quiz

Die Fragenzahl zehn und das bestehende CSV-Schema mit elf Semikolonspalten bleiben erhalten. Jede Frage hat vier Optionen und genau eine richtige Antwort. Inhaltlich prüfen sie Zustandsänderung, Aliasnamen, Überlauf, Shiftarten und -weiten, Maskencodierung, Venus-Dienste, Registerfelder, Instruktionsadressen und Vorzeichenerweiterung; alle Aussagen sind in den Folien behandelt.

Die richtige Antwort ist zweimal allein am längsten und einmal allein am kürzesten. In allen übrigen Fällen ist sie kürzer als mindestens eine falsche Option. Die größte Längendifferenz innerhalb einer Frage beträgt ein Verhältnis von etwa 1,25. Richtige Positionen verteilen sich auf 3/3/2/2. Zusätzlich zur Zeichenprüfung wurden die Optionen auf eindeutige Richtigkeit und plausible Verwechslungen geprüft; die längeren Antworten tragen keinen wiederkehrenden Hinweiszusatz.

## Tatsächlich erfolgte Prüfung

- Quarto-Ausgaben: Reveal.js-Präsentation, PDF mit Folien und Notizen sowie Studierenden- und Lösungs-PDF erfolgreich erzeugt.
- Browserprüfung aller 52 Folien bei 1280 × 720: vollständige Notizen, zwölf geladene Abbildungen, gesetzte Formeln, keine horizontalen oder vertikalen Überläufe und keine JavaScript-Fehler. Repräsentative Folien wurden zusätzlich visuell geprüft.
- Abbildungen: temporäre Erzeugung, XML- und Palettenprüfung, nicht überlappende Boxen sowie orthogonale Leitungen ohne Durchquerung von Boxen. PNG-Ansichten und die gerenderten Folien/PDF-Seiten wurden kontrolliert.
- PDFs: A4, Text innerhalb der geprüften Ränder, Aufgaben jeweils auf eigener Seite, Lösungstrennung und 51 den Inhaltsfolien zugeordnete Notizen. Die zu lange Feldangabe in Aufgabe 6 wurde vor dem finalen Rendern umgebrochen.
- Quellen: UTF-8 ohne BOM, Ersetzungszeichen oder unzulässige Steuerzeichen; lokale Begriffsdefinitionen, Abbildungsreferenzen und SVG/PDF-Paare geprüft. `git diff --check` bestanden.
- Numerik: feste R-Wörter `0x015A04B3`, `0x415A04B3`, `0x007302B3`, `0x406283B3`, `0x407302B3`; I-Wörter `0xFFC30293` und `0xFF930393`; Bytefolgen, Überlaufbeispiele, Masken und Shift-Grenzfälle unabhängig nachgerechnet.
- Codierungsmodelle: 32768 Registerkombinationen und sämtliche 4096 signed Zwölf-Bit-Immediates samt Vorzeichenerweiterung geprüft. Der vorhandene Sollwertchecker `python beispiele/sollwerte.py` besteht ebenfalls.
- Die drei tatsächlichen Assemblerquellen wurden funktional interpretiert. Die Gleichung liefert für die vier Eingabebelegungen 10, 0, −6 und 0. Registerwerte am Prüfpunkt und der Abschluss wurden geprüft. Das Druckbeispiel aus den Folien liefert im Dienstmodell 42. Ausgabe und Ende funktionieren auch bei absichtlichem Überschreiben temporärer Register durch den modellierten Druckdienst.
- CSV: Spalten, Typ, Antwortzahl, Korrektheitswerte, Längen und Positionen geprüft.

## Nachweisgrenzen und Quellen

Die funktionale Interpretation ist ein Rechenmodell der Befehlswirkung und des dokumentierten Venus-Dienstvertrags. Sie ist kein Venus-Lauf, keine RISC-V-Assemblierung und keine Zeitmessung. Der direkte Abruf der Kurs-Venus-Seite lieferte in der Cloud HTTP 403. Die konkrete Oberfläche, eine exakte Assemblerdiagnose und die tatsächliche `li`-Expansion wurden deshalb nicht als beobachtet behauptet; sie werden im Labor geprüft. Die gezeigte Entwicklung von `li 2048` über `lui` und `addi -2048` ist eine nachgerechnete gültige Lehrfolge.

Fachliche Grundlage: `referenz/kursvertrag.md`, Harris/Harris, *Digital Design and Computer Architecture — RISC-V Edition*, und Patterson/Hennessy, *Computer Organization and Design: The Hardware/Software Interface — RISC-V Edition*. Der Umgebungsvertrag ist zusätzlich über die in den Folien verlinkte Venus-Dokumentation nachvollziehbar.
