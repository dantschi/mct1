# Änderungsbericht zu Vorlesung 9

Stand: 13. Oktober 2026. Überarbeitet wurden Folien und Notizen in `vorlesungen/09_wrap-up-c-to-assembly.qmd`, die zugehörige Übung und das Quiz. Grundlage sind die Regeln unter `.cursor/rules/` und die Modellvereinbarungen in `referenz/kursvertrag.md`.

## Aufbau und Anschluss an Einheit 1–8

Die Einheit führt vom bekannten Register- und Speichermodell über C-Kontrollstrukturen zum vollständigen Code-Schloss:

1. Werkzeugkette, Zwischendateien, Host und Ziel.
2. C-Sprachschlüssel, Gleichheit, Schleifen und Arrayadressen.
3. Blattfunktion, weiterer Funktionsaufruf und Stackframe.
4. Schlossregeln, Rohmasken, Eingabeereignisse, Zustandsfunktion und Anzeige.
5. Rückblick auf Hauptsteuerung, Load-Use und systematische Fehleranalyse.

Ein zusätzlicher C-Sprachkurs wird für die gezeigten kleinen Beispiele nicht vorausgesetzt. Datentypen, Parameter, Zuweisung, Gleichheitsprüfung, Blöcke, Rückgabe, Zeiger und Arrayzugriffe werden an den Beispielen erklärt. Bekannte Inhalte aus Einheit 1–8 werden ausdrücklich zugeordnet. Compileroptimierung wird als mögliche Umsetzung besprochen, ohne konkrete Compilerausgaben zu erfinden.

Es gibt 48 Inhaltsfolien und eine automatisch erzeugte Titelfolie. Jede hat Notizen; die 48 Inhaltsnotizen bilden mit ihren Folienkarten ein Skript. Sie erklären lokale Begriffe, Registerrollen, Voraussetzungen, Abbildungen, Zwischenwerte, Fehlerfälle und die Lösung der Kurzaufgabe. Insgesamt enthalten diese Notizen rund 6.150 Wörter.

## Fachliche Korrekturen und Lehrprogramme

Die bisher unterschiedlichen Schlossregeln in Folien und Übung sind vereinheitlicht:

- UP, DOWN, RIGHT führen über S0, S1 und S2 nach S3.
- Eine falsche einzelne Codetaste setzt S0–S2 zurück.
- S3 bleibt bei Codetasten offen; LEFT setzt jeden Zustand nach S0.
- Ohne Ereignis bleibt ein gültiger Zustand erhalten.
- Ein ungültiger Zustandswert wird auch ohne Ereignis nach S0 korrigiert und tatsächlich zurückgeschrieben.

Rohmaske und Ereigniscode sind verschiedene Schnittstellen. Die Eingabefreigabe beginnt geschlossen. Eine vollständig leere Abfragegruppe gibt frei; die nächste nichtleere Gruppe verbraucht diese Freigabe. Ein Mehrfachdruck erzeugt kein Ereignis und darf nach teilweisem Loslassen nicht als neuer Einzeldruck zählen.

Das neue vollständige Lehrprogramm `beispiele/vl9_code_lock.s` liest jede D-Pad-Richtung einmal pro Gruppe. Seine Blattfunktionen trennen Lesen, Übergang und Farbzuordnung. Es enthält die unveränderte reine Referenzfunktion aus `vl9_next_state.s`, benötigt keine zusätzliche Include-Datei und läuft dauerhaft ohne Exit-Dienst. Gerätebasen stammen aus den zu prüfenden Ripes-Exports, nicht aus festen angenommenen Adressen.

Weitere neue Lehrdateien:

- `beispiele/vl9_sum_array.s`: vollständige Blattfunktion mit vorzeichenloser Längenprüfung und keinem Zugriff bei Länge null.
- `beispiele/vl9_calls.s`: `calc` und `double_plus_one` mit Sicherung von `ra` im 16-Byte-Frame.

Die Funktionsdateien sind ausdrücklich keine eigenständigen Programme. Vorzeichenbehafteter C-Überlauf wird von Maschinenrechnung modulo $2^{32}$ unterschieden. Arraygrenzen, signed/unsigned-Vergleiche, Rücksprungadresse, Registerverantwortung und Stackausrichtung werden begründet. Das Pipelinebeispiel verwendet den Kursvertrag: fünf Stufen, Forwarding, ein Load-Use-Stall und sieben Takte für das isolierte Zweierfragment.

## Abbildungen

Neun neue native SVGs mit passenden PDF-Paaren unter `assets/images/vl9-*.{svg,pdf}` zeigen Werkzeugkette, If-Else-Graph, Schleifenphasen, Arrayadressen, Stackframe, Zustandsgraph, Ereignisaufbereitung, Schloss-Trace und Load-Use-Pipeline.

XML, Palette, Boxengrenzen und orthogonale Leitungsführung wurden vor der Übernahme in temporären Dateien geprüft. Die Abbildungen wurden als PNGs und im Browser visuell kontrolliert; die PDFs stammen aus denselben SVGs. Ausgelassene Zustandskanten sind benannt und durch die vollständige Übergangstabelle ergänzt. Farben, Leserichtung, Pfeile und Zeilen der Traces sind in den Notizen erläutert.

## Übung und Quiz

Die Übung enthält sechs Papieraufgaben mit 60 Übungspunkten: Werkzeugkette 10, Kontrollfluss 12, Array 12, Aufruf/Stack 8, Zustandsmaschine 10, Datenpfad/Pipeline 8. Sie bieten klausurähnliche Rechen-, Übersetzungs-, Trace- und Begründungsaufgaben. Punkte und Aufgabentypen legen keine verbindlichen Klausurregeln fest.

Die Studierendenfassung hat eigene Schreibflächen und ausreichend breite Tabellen für handschriftliche Zustands- und Pipelinetraces. Das Profil `solution` enthält vollständige Musterlösungen. Die praktische Aufgabe verwendet das vollständige Schlossprogramm, benennt Geräteprüfungen und verlangt Soll-/Ist-Vergleiche einschließlich Halten, Mehrfachdruck, Rücksetzen und Zustandsreparatur. Eine andere Codefolge und ein dokumentierter Compilervergleich sind Zusatzaufgaben.

Das Quiz behält zehn Fragen und das bestehende Schema mit elf semikolongetrennten Spalten. Jede Frage hat vier Optionen und genau eine richtige Antwort. Die richtige Antwort ist zweimal allein am längsten und sonst kürzer als mindestens ein Distraktor. Das Verhältnis längster zu kürzester Option liegt jeweils unter 1,35; richtige Positionen sind 3/3/2/2 verteilt. Alle Erläuterungen bestehen aus ein oder zwei Sätzen.

## Tatsächlich erfolgte Prüfungen

| Prüfung | Ergebnis |
|---|---|
| Reveal-Render und Chromium bei 1280 × 720 | 49 Folien, keine Bildfehler, fehlenden Notizen, Überläufe oder JavaScript-Fehler |
| MathJax, Grafiken, Tabellen und Code | Geladen und repräsentativ visuell geprüft |
| Skript mit XeLaTeX | 30 A4-Seiten, alle 48 Inhaltsnotizen enthalten |
| Studierendenfassung und Musterlösung | Je zehn A4-Seiten, getrennte Lösungen und Schreibflächen geprüft |
| PDF-Textgrenzen | Innerhalb der geprüften Seitenränder |
| UTF-8, Notizzuordnung und lokale Abkürzungen | Geprüft, einschließlich Code und Grafiktexten |
| Reine Zustandsfunktion | 35 Zustands-/Ereigniskombinationen einschließlich drei ungültiger Zustandswerte |
| Vollständiges Schloss als funktionales Modell | 1.024 Maskenpaar-/Zustandsfälle, alle 16 Masken, vier Lesezugriffe pro Gruppe, Freigabe, Farben und Speicherung |
| Zusätzliche Schloss-Traces | Start mit gehaltener Taste, Halten, Mehrfachdruck, teilweise Freigabe, Codefolge, falsche Taste, LEFT, Zustandsreparatur |
| Array- und Aufruffunktionen als funktionales Modell | Summen, Null-Länge ohne Zugriff, Registererhaltung, Stackadresse, Wiederherstellung von sp und ra |
| Vorhandene C-Datei mit Host-GCC | Mit Warnungen als Fehler sowie Address-/UndefinedBehaviorSanitizer kompiliert und ausgeführt, erwartete Ergebnisse bestanden |
| `python beispiele/sollwerte.py` | Erfolgreich |
| Quizschema, Länge und Positionen | Erfolgreich |
| `git diff --check` | Erfolgreich |

Die Assemblerquellen wurden funktional mit einem unabhängigen Tabellen- und Freigabemodell verglichen. Pseudobefehle wurden nach ihrer Wirkung interpretiert, nicht assembliert oder getaktet. Der Host-C-Test prüft die vorhandenen Funktionen mit 32-Bit-int; er ist kein Nachweis für RV32-Code oder ein vollständiges ILP32-Zielsystem.

Ripes und eine RISC-V-Toolchain wurden nicht ausgeführt. Daher werden weder Simulatorbeobachtungen, konkrete Pseudobefehlsexpansionen noch gemessene Laufzeiten behauptet. Die praktische Geräteprüfung bleibt Bestandteil der Übung.

Die bereits dokumentierten offiziellen Quellen wurden für MMIO, LED-Format und D-Pad-Lesesemantik herangezogen:

- [Ripes MMIO und Geräteexports](https://github.com/mortbopet/Ripes/blob/master/docs/mmio.md)
- [Ripes D-Pad](https://github.com/mortbopet/Ripes/blob/master/src/io/iodpad.cpp)
- [Ripes LED-Matrix](https://github.com/mortbopet/Ripes/blob/master/src/io/ioledmatrix.cpp)

Der dokumentierte D-Pad-Quellstand liefert einen gehaltenen oder seit dem letzten Lesen erfassten Druck und löscht den gespeicherten Druckindikator beim Lesen. Vier aufeinanderfolgende Richtungszugriffe sind keine atomare Momentaufnahme. Die Freigaberegel bezieht sich auf die gewonnene Abfragegruppe und ersetzt keine physikalische Entprellung. Installationsversion und Exports müssen geprüft werden.

## Möglicher Ablauf für vier Schulstunden

Eine Auswahl für 180 Minuten Unterrichtszeit:

| Abschnitt | Minuten |
|---|---:|
| Erklärung und integrierte Kurzaufgaben | 90 |
| Papierarbeit, ausgewählte Teile aus Aufgaben 1, 3 und 5 | 35 |
| Praktischer Basistest mit vorbereiteter Ripes-Installation | 35 |
| Quiz und Besprechung | 15 |
| Abschluss | 5 |
| **Summe** | **180** |

Die übrigen Papieraufgaben, ausführlichen Zusatztests, andere Codefolge und das Compilerexperiment dienen als Reserve oder Nachbereitung. Die vollständige Bearbeitung aller Materialien benötigt zusätzliche Zeit. Die Angaben sind Planungsschätzungen; Installation und Pausen kommen gegebenenfalls hinzu.

Erzeugte Ausgaben:

- `_site/vorlesungen/09_wrap-up-c-to-assembly.html`
- `_handout/vorlesungen/09_wrap-up-c-to-assembly.pdf`
- `labs/_output/lab_09_wrap-up-state-machine-studierende.pdf`
- `labs/_output/lab_09_wrap-up-state-machine-musterloesung.pdf`
