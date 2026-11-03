# Änderungsbericht zu Vorlesung 9

Stand: 3. November 2026. Vorlesung 9, Übung und Quiz wurden vollständig als Wiederholung der ersten sieben Vorlesungen neu erstellt. Grundlage sind die Regeln unter `.cursor/rules/` und die Modellvereinbarungen in `referenz/kursvertrag.md`.

## Umfang und Aufbau

Der Foliensatz enthält genau 38 Folien einschließlich automatischer Titelfolie. Alle Folien besitzen Notizen; die 37 Inhaltsnotizen erklären Begriffe, Annahmen, Abbildungen, Rechenwege und die Lösungen der Selbsttests als zusammenhängendes Wiederholungsskript.

| Folien | Inhalt |
|---|---|
| 1–4 | Orientierung, gemeinsame Annahmen, ISA / ABI / Mikroarchitektur |
| 5–9 | Zahlendarstellung, Zweierkomplement, Überlauf, Logik, Register |
| 10–13 | RV32I-Operationen, Immediates, Pseudobefehle, R-/I-Codierung |
| 14–18 | Byteordnung, Zugriffsbreiten, Arrays, S-/B-Felder, Schleifen |
| 19–22 | Aufruf, Rückkehr, Registerverantwortung und Stackframes |
| 23–26 | Single-Cycle-Datenpfad, Load / Store / Branch, kritischer Pfad |
| 27–29 | Steuertabelle, ALU-Steuerung, Don't Care und Fehlerwirkung |
| 30–37 | Performance, Pipeline, Forwarding, Stalls, Flush und Vorhersage |
| 38 | Selbstkontrolle und Übergang zu Übung und Quiz |

Die früheren Inhalte zu Compiler-Werkzeugkette, C-Übersetzung und Abschlussprojekt werden in diesen drei Materialien nicht mehr unterrichtet oder geprüft. Vorlesung 8 einschließlich ihrer Übung und ihres Quiz bleibt bytegleich unverändert. Die neue Wiederholung setzt ausschließlich Vorlesung 1–7 voraus.

Vier bereits bekannte Abbildungen aus Vorlesung 1, 5 und 7 erläutern Registerübernahme, Single-Cycle-Zustandsänderung, Load-Datenweg und Forwarding. Neue Zahlenbeispiele, ein Idealraster, ein Load-Use-Raster und eine Vorhersagetabelle ergänzen sie. Die zugehörigen SVG-/PDF-Paare werden unverändert wiederverwendet.

Die bisherigen Dateinamen bleiben für stabile Website-Links erhalten. README und Kursstartseite zeigen über die eingebundene Kursübersicht den neuen Titel und Schwerpunkt.

## Übung und Quiz

Übung 9 beginnt unmittelbar mit sieben Papieraufgaben, insgesamt 90 Übungspunkte bei ungefähr 90 Minuten Bearbeitungszeit. Sie verwendet andere Beispiele als die Folien:

1. Bitmuster, Logik und Register: 12 Punkte.
2. RV32I codieren und decodieren: 12 Punkte.
3. Speicher und Schleife verfolgen: 14 Punkte.
4. Aufruf und Stackframe reparieren: 14 Punkte.
5. Datenpfad und Steuersignale: 14 Punkte.
6. Aus einer Tabelle wird Steuerlogik: 10 Punkte.
7. Pipeline, Laufzeit und Vorhersage: 14 Punkte.

Die Studierendenfassung enthält Schreibflächen und ein leeres Stufenraster. Das Profil `solution` enthält vollständige Musterlösungen mit Teilpunkten und Begründungen. Ein Simulator oder Compiler wird für die Aufgaben nicht benötigt.

Das Quiz behält zehn Fragen im unveränderten CSV-Schema mit elf semikolongetrennten Spalten, vier Optionen und genau einer richtigen Antwort. Die Themen reichen von Zahlendarstellung und Logik über ISA, Speicher, Kontrollfluss und ABI bis zu Datenpfad, Steuerung und Performance. Der Schlüssel lautet B, D, C, A, D, C, D, B, C, A. Nur bei Frage 6 und 8 ist die richtige Antwort allein am längsten.

Die bestehende Probeklausur wurde nicht geändert. Sie enthält weiterhin zusätzliche Themen aus Vorlesung 8 und der früheren Einheit 9; diese sind kein Bestandteil der neuen Wiederholung und des neuen Übungsblatts.

## Tatsächlich erfolgte Prüfungen

| Prüfung | Ergebnis |
|---|---|
| Reveal-Render und Chromium bei 1280 × 720 | 38 Folien, alle Notizen, keine Inhaltsüberläufe oder JavaScriptfehler |
| Abbildungen und Mathematik im Browser | Vier Bilder geladen, 55 MathJax-Ausdrücke gesetzt; alle Folien als Screenshots kontrolliert |
| Handout mit XeLaTeX | 32 A4-Seiten; Titelnotizen und alle 37 Inhaltsnotizen einschließlich Anfang und Ende enthalten |
| Übung und Musterlösung mit XeLaTeX | Acht bzw. zehn A4-Seiten; Lösungen nur im Lösungsprofil, Schreibflächen und Ränder geprüft |
| PDF-Textgrenzen | Keine Überschreitungen der geprüften Seitenränder |
| Funktionales Papiermodell und taktweises Pipelinemodell | 39 Prüfgruppen zu Zahlen, Codierungen, Register-/Speichertraces, Aufrufen, Steuerung und Pipeline bestanden |
| Quiz | Schema, Schlüssel, Rechenergebnisse, Antwortlängen und UTF-8 geprüft |
| Vorlesung 8 / Übung 8 / Quiz 8 | SHA-256-Vergleich vor und nach der Änderung identisch |
| Quelltexte | UTF-8 ohne BOM, keine Ersatz-/Steuerzeichen; `git diff --check` erfolgreich |

Die Assemblerausschnitte und Zeitraster wurden als unabhängige funktionale beziehungsweise taktweise Lehrmodelle geprüft, nicht mit einer RISC-V-Toolchain oder Ripes ausgeführt. Zeitwerte sind ausdrücklich angenommene Lehrwerte. Der Browser setzte MathJax mit über das Systemvertrauen geprüften CDN-Dateien; externe Google-Fonts waren im Cloudnetz nicht erreichbar, deshalb wurden die vorgesehenen Ersatzschriften verwendet.

Die veröffentlichten Ausgabepfade bleiben unverändert:

- `vorlesungen/09_wrap-up-c-to-assembly.html`
- `vorlesungen/09_wrap-up-c-to-assembly-handout.pdf`
- `labs/lab_09_wrap-up-state-machine.pdf`
- `labs/lab_09_wrap-up-state-machine-musterloesung.pdf`

Die PDF-Dateien sind Build-Artefakte. Der vorhandene GitHub-Workflow erzeugt und veröffentlicht sie aus den Quellen.
