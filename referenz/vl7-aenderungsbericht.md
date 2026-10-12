# Einheit 7: Änderungsbericht

## Aufbau und Anschluss an Einheit 1–6

Die Vorlesung führt vom bekannten Single-Cycle-Datenpfad und Steuerwerk zur zeitlichen Überlappung. Der Ablauf ist jetzt:

1. Befehlszählung, Laufzeitformel, Latenz und Durchsatz.
2. Fünf Stufen, Registergrenzen und gemeinsam gespeicherte Daten und Steuersignale.
3. Registerabhängigkeiten, Forwarding und Auswahl des jüngsten passenden Ergebnisses.
4. Load-Use-Stall, Bubble und zulässiges Scheduling.
5. Branch-Entscheidung, Flush, Kosten und einfache Vorhersagen.
6. Papierprognose, dokumentierte Ripes-Konfiguration und funktionaler Vergleich.

60 inhaltliche Folienabschnitte haben jeweils eigene zusammenhängende Skriptnotizen. Die zusätzliche automatische Titelfolie hat ebenfalls Speaker-Notizen: insgesamt 61 Reveal-Folien. Die Notizen erklären lokale Begriffe und Abkürzungen, Abbildungen, Ausgangswerte, Rechenwege, Gültigkeitsgrenzen und Übungslösungen. Redundante kurze Abschnitte und übertriebene Aussagen wurden zusammengeführt beziehungsweise ersetzt.

Vorausgesetzt werden Register und Logik aus Einheit 1, Maschinenbefehle aus Einheit 2, Speicher und Branches aus Einheit 3, Registerrollen aus Einheit 4 sowie Datenpfad und Steuerung aus Einheit 5–6. Compiler-Scheduling und Sprungvorhersage werden neu eingeführt. Der Zweibitzähler ist als Vertiefung gekennzeichnet.

## Fachliche Präzisierungen

- Fünf Stufen sind eine gewählte Mikroarchitektur, keine RISC-V-Vorschrift. Eine Pipeline ist kein Überholen von Instruktionen und kein elektrischer Zusammenstoß.
- Dynamisch abgeschlossene Maschineninstruktionen bilden die Befehlszahl. Labels, Hardware-Bubbles und verworfene Einträge zählen nicht dazu. Pseudoinstruktionen werden nicht ungeprüft als ein Maschinenbefehl gezählt.
- Latenz, stationärer Durchsatz und Gesamtzeit einer endlichen Folge sind getrennte Größen. Füllung und Leerung werden zusammen einmal als vier Zusatztakte berücksichtigt.
- Lehrzeiten: 200, 100, 150, 250 und 100 ps reine Logik plus 20 ps effektiver Registeroverhead je Taktpfad. Single Cycle: 820 ps; Pipeline-Takt: 270 ps; isolierte Pipeline-Latenz: 1350 ps. Für zwanzig unabhängige Befehle ergibt sich 16400 gegen 6480 ps und ein Speedup von etwa 2,53. Der Grenzwert langer Folgen ist etwa 3,04, nicht fünf.
- Forwarding prüft Gültigkeit, tatsächliche Register-Schreibwirkung, Ziel ungleich x0, benutzte Quellen, Verfügbarkeit und Vorrang des jüngeren Produzenten. EX/MEM eines Loads enthält die Adresse, nicht das Wort. Ein jüngerer noch nicht bereiter Load darf keinen älteren passenden Wert durchlassen.
- Register-Forwarding und ALUSrc-Auswahl zwischen Register und Immediate bleiben getrennt. Die Grafik zeigt einen Operandenweg, keinen vollständigen Datenpfad; Store-Daten sind eigens zu behandeln. Selektorcodes werden nicht als Ripes-Portwerte behauptet.
- Die Registerbankkonvention des Kursvertrags bleibt ausdrücklich erhalten: kein wirksames Schreiben und Lesen desselben Registers im selben Takt. Ohne Forwarding entstehen beim unmittelbaren Rechenpaar drei Zusatztakte. Bei gleichzeitiger WB- und ID-Nutzung reichen allein die EX-Forwarding-Pfade nicht; ohne weiteren Lesebypass muss auch dieser Sonderfall erkannt und gehalten werden.
- Die dreizeilige Papierfolge verwendet nach dem Load `addi t1, t0, 1` und danach `add t2, t1, t1`. Sie benötigt genau einen Stall und acht Takte; beide letzten Operanden kommen aus EX/MEM. Eine zusätzliche t0-Quelle hätte unter der gewählten Registerbankkonvention einen weiteren Konflikt erzeugt.
- Load-Use hält PC und IF/ID, setzt eine ungültige Bubble nach ID/EX und lässt ältere Instruktionen weiterlaufen. Eine Bubble ist kein zusätzlicher NOP-Befehl. Die echte NOP `addi x0, x0, 0` zählt bei Ausführung als Instruktion.
- Ein in EX entschiedener genommener beq invalidiert zwei jüngere Einträge vor Zustandswirkungen. In Takt 4 startet das Ziel; die falschen Einträge sind dann bereits ungültig. Der Branch und ältere richtige Arbeit bleiben erhalten.
- Zwei Korrekturzyklen gelten für dieses sequenzielle Fetch-Modell mit bereiten Branch-Operanden. Frühe ID-Entscheidung, fehlende Zielinformation oder Datenabhängigkeiten verändern die Rechnung.
- Die Zusatzkostenformel setzt nicht überlappende Kosten voraus. Branches gehören bereits zur abgeschlossenen Befehlszahl; Fehlpfad-Instruktionen werden nicht zusätzlich hineingezählt.
- Scheduling vergleicht dieselben nötigen Instruktionen und Endwerte. Die vorhandene unabhängige Zählererhöhung wird verschoben. Eine zusätzliche Instruktion oder geänderte Load-Adresse liefert keinen fairen Vergleich.
- Ein- und Zweibitvorhersagen nennen Anfangszustand, Aktualisierung und tatsächliche Folge. Richtung und Zieladresse werden getrennt. Eine konkrete Predictor-Implementierung in Ripes wird nicht vorausgesetzt.

## Abbildungen

Neun neue SVG/PDF-Paare unter `assets/images/vl7-*` zeigen Waschsalon-Zeitdiagramm, Stufenzeiten, Registergrenzen, ideales Raster, Forwarding-Raster und Operandenpfade, Load-Use-Raster, Branch-Flush und Zweibitzähler.

Die Grafiken verwenden die Projektpalette, orthogonale Datenwege und echte Zeit- beziehungsweise Zustandsbeziehungen. SVGs wurden zunächst temporär erzeugt, auf XML, Palette, Grenzen, überlappende Rechtecke und Leitungen durch Boxen geprüft, rasterisiert und visuell kontrolliert. Die Taktleitung läuft nicht durch Registerbezeichnungen. Die PDF-Paare stammen aus denselben SVGs.

## Übung und Quiz

Sechs Papieraufgaben mit insgesamt 60 Punkten zur Selbsteinschätzung: Laufzeit 12, Load-Use-Raster 12, Forwarding 8, Flush und Gesamtkosten 10, Scheduling 10, Vorhersage 8. Alle haben ausgearbeitete Lösungen im Profil `solution`. Die Studierendenfassung enthält Schreibraum auf der Aufgabenseite und ein ausreichend großes Raster; das Ripes-Protokoll hat eine eigene Seite.

Die Ripes-Aufgabe verwendet die vorhandenen Programme `vl7_forwarding.s`, `vl7_loaduse.s`, `vl7_flush.s` sowie `vl7_schedule_a.s` und `vl7_schedule_b.s`. Beobachtung und hergeleitete Erwartung werden getrennt; Version, Modell, Datenquelle und Abschlusszeitpunkt gehören zum Protokoll.

Das Quiz behält zehn Fragen und das unveränderte Schema mit elf semikolongetrennten Spalten, vier Optionen und genau einer richtigen Antwort. Die Fragen prüfen Verwechslungen und konkrete Folgerungen. Genau zweimal ist die richtige Antwort allein am längsten; sonst ist mindestens ein Distraktor länger. Das Verhältnis längster zu kürzester Option bleibt je Frage unter 1,35. Richtige Antwortpositionen sind mit 3/3/2/2 verteilt. Erläuterungen haben ein oder zwei Sätze; Felder enthalten keine Semikolons.

## Tatsächlich erfolgte Prüfungen

| Prüfung | Ergebnis |
|:---|:---|
| Quarto-Reveal-Render | Erfolgreich, 61 Folien |
| Chromium bei 1280 × 720 | Alle Folien geprüft; keine Bildfehler, fehlenden Notizen, vertikalen oder horizontalen Überläufe oder JavaScript-Fehler |
| Formeldarstellung und repräsentative Bildschirmbilder | MathJax tatsächlich geladen und Formeln dargestellt; Bilder, Tabellen und zentrale Beispiele visuell kontrolliert |
| Handout-PDF mit XeLaTeX | Erfolgreich, 36 A4-Seiten, alle 60 Skriptnotizblöcke vorhanden |
| Übung für Studierende / Musterlösung | Erfolgreich, jeweils neun A4-Seiten; Lösungen getrennt, Platz und Raster visuell geprüft |
| PDF-Textgrenzen | Text innerhalb der geprüften Seitenränder |
| UTF-8, Notizzuordnung und lokale Abkürzungen | Geprüft, kein BOM oder Ersatzzeichen; Abbildungsbegriffe einbezogen |
| Eigenständige taktweise Lehrsimulation | Forwarding, Stall-Raster, jüngster Produzent, x0, WB/ID-Sonderfall, jüngerer Load, Flush und Scheduling mit passenden Ergebnissen geprüft |
| Funktionale Interpretation der sechs vorhandenen vl7-Quellen | Sollwerte geprüft; la funktional als Adresse behandelt, keine Maschinenexpansion oder Laufzeit daraus behauptet |
| Laufzeit- und Predictor-Rechnungen | Unabhängig nachgerechnet |
| `python3 beispiele/sollwerte.py` | Erfolgreich |
| Quizschema und Antwortlängen | Erfolgreich |
| `git diff --check` | Erfolgreich |

Quarto verwendet beim PDF-Render die bereits erzeugten Grafik-PDFs; die Hinweise auf übersprungene SVG-Konvertierung sind erwartbar. Die Browserprüfung lud MathJax über den vorhandenen HTTPS-Proxy der Cloud-Umgebung. Die Projektkonfiguration wurde dafür nicht verändert.

Ausgaben:

- `_site/vorlesungen/07_performance-pipelining.html`
- `_handout/vorlesungen/07_performance-pipelining.pdf`
- `labs/_output/lab_07_performance-pipelining-studierende.pdf`
- `labs/_output/lab_07_performance-pipelining-musterloesung.pdf`

Ripes und eine RISC-V-Toolchain wurden nicht ausgeführt. Die Prüfungen sind Renderprüfungen, rechnerische Kontrollen und explizite Lehrmodelle; sie belegen keinen Hardwarelauf oder konkrete Ripes-Portcodes, Farben, la-Expansionen und globale Simulatorzyklen.

## Einteilung für vier Schulstunden

Für 180 Minuten Unterrichtszeit bietet sich folgende Auswahl an:

- 90 Minuten Erklärungen und integrierte Kurzaufgaben.
- 45 Minuten gemeinsame Papierarbeit mit Aufgaben 1, 2 und 4.
- 25 Minuten Ripes mit Schwerpunkt Forwarding, Load Use und Flush.
- 15 Minuten Quiz mit Besprechung.
- 5 Minuten Abschluss und offene Fragen.

Die übrigen Papieraufgaben, der Zweibitzähler und der ausführliche Scheduling-Vergleich dienen als Reserve oder Nachbereitung. Vollständige Bearbeitung aller Aufgaben benötigt zusätzlich Zeit. Die Angaben sind Planungsschätzungen, keine gemessenen Unterrichtszeiten; Pausen sind gesondert zu berücksichtigen.
