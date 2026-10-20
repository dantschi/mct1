# Fachlicher Gesamtdurchgang MCT1

Stand: 20. Oktober 2026.

## Ergebnis und Umfang

Die fachliche Abfolge ist tragfähig: Datenrepräsentation und Logik → Registerbefehle → Speicher und Kontrollfluss → Funktionen und Stack → Datenpfad und Steuerung → Pipeline → I/O und Traps → C-Transfer und Zustandsautomat. Die Voraussetzungen werden schrittweise aufgebaut. Insbesondere benötigt die Einführung in C in Einheit 9 keinen vorherigen C-Kurs. Die Notizen erklären Herleitungen und Grenzen als begleitendes Skript.

Der Durchgang umfasst die neun Vorlesungen mit Abbildungen und Notizen, neun Übungsblätter einschließlich Lösungen, neun Quizdateien mit insgesamt 96 Fragen, die Probeklausur mit 20 Auswahlfragen und sechs weiteren Papieraufgaben sowie Kursvertrag, Glossar und Referenzprogramme. Die Präsentationen enthalten zusammen 489 Folien einschließlich der neun automatischen Titelfolien.

## Behobene Befunde

| Bereich | Befund und Korrektur |
|---|---|
| Registermodell, Einheiten 1 und 7 | Die pauschale Aussage, Lesen und Schreiben derselben Registernummer sei ausgeschlossen, widersprach zulässigen Befehlen wie `add t0,t0,t1`. Jetzt ist klar: Die Instruktion liest den alten Wert und schreibt an der Flanke. Die spätere Pipeline-Konvention betrifft die Verfügbarkeit eines WB-Werts beim Registerlesen in ID. |
| Datenpfad, Einheiten 5 und 6 | Der Kursvertrag führte `addi` noch als nicht ergänzten Befehl. Er unterscheidet jetzt das Sieben-Befehle-Ausgangsmodell und die tatsächlich hergeleitete Erweiterung um `addi` in Einheit 6. |
| Pipeline, Einheit 7 | Beim WB/ID-Sonderfall kommt der Wert nicht „zu spät“. Der Produzent ist im folgenden EX-Takt bereits aus MEM/WB verschwunden. Die Folie entspricht nun ihrer korrekten Notizerklärung und der vereinbarten Hazard-Behandlung. Ein missverständlicher Kommentar zur Addition des Registeroverheads im Sollwertskript wurde ebenfalls berichtigt. |
| Referenzbegriffe | Opcode und Immediate sind formatabhängig erklärt. Alignment wird als natürliche Ausrichtung mit umgebungsabhängiger Behandlung abweichender Adressen beschrieben. Eine Bubble ist ein ungültiger Pipeline-Eintrag; sie zählt nicht als abgeschlossene Programminstruktion. Stackausrichtung und `volatile` sind präzisiert. |
| Laborübergänge | Mehrere Folien und Notizen kündigten nach der letzten Übungsüberarbeitung noch die alten Aufgaben an. Die Übergänge verweisen jetzt auf Registerspur, Messkorrektur, Negativzählung, Versatzfunktion, Paketpfad, Bitprüfung, Vierer-Scheduling, Zweibit-Anzeige und Lüfterregler. Die jeweiligen Vorlesungsdemonstrationen bleiben als erklärte Beispiele erhalten. |
| C und Rückverweise, Einheit 9 | Die Ergebnisangabe gehört ausdrücklich zur Funktion `choose`; der Gleichheitsausdruck selbst liefert in C null oder eins. Die normale Funktionskonvention wird korrekt auf Einheit 4 zurückgeführt. Der Lüfterregler des Labors und das Code-Schloss der Vorlesung haben klar getrennte Übergangstabellen. |
| Probeklausur | Bei Fragen 3, 12 und 20 nannten die Erläuterungen falsche Antwortbuchstaben, während die hervorgehobenen Schlüssel bereits richtig waren. Erklärung und Schlüssel stimmen jetzt überein: 3 = B/D, 12 = B, 20 = A. Bei Frage 3 ist auch die Zuordnung des pegelgesteuerten Verhaltens zur falschen Option C korrigiert. |
| Ausgabeformate | Eine ältere Pipeline-SVG enthielt statt des Minuszeichens ein ungültiges Steuerzeichen; SVG und PDF sind repariert. Drei überlaufende Folien sind gestrafft. Die automatische Titelfolie von Einheit 5 hat passende Notizen erhalten. Die optionale HTML-Handout-Konfiguration verwendet regelkonform `center: false`. |
| PDF-Notizen | Der Handout-Filter übernahm ausschließlich Notizen aus dem Dokumentkörper. Die neun Notiztexte der automatischen Titelfolien fehlten dadurch in den Skripten. Er übernimmt jetzt auch `data-notes` aus den Titelmetadaten und zählt die Titelfolie mit, sodass die folgenden Foliennummern zur Präsentation passen. |

Die Übungsblätter behalten ihren unmittelbaren Aufgabenstart, die Papieraufgaben und ihre neuen Beispiele. Die Probeklausur bleibt bei 90 Punkten und einer geplanten Bearbeitungszeit von 90 Minuten. Der Zeitrahmen ist eine didaktische Schätzung; der Durchgang liefert keine empirische Bearbeitungszeit einer Studierendengruppe.

## Fachliche Gegenprüfungen

- Zahleninterpretation, Vorzeichen- und Nullerweiterung, Little Endian, effektive Adressen, signed/unsigned Vergleiche, Immediate-Grenzen und elf ausgewählte native Codierungen unabhängig nachgerechnet.
- Datenpfad- und Steuertabellen einschließlich `addi`, Don't Care und zusätzlicher fehlerhafter Schreibwirkungen abgeglichen. Die internen Steuercodes bleiben ausdrücklich Modellentscheidungen.
- Laufzeiten, Füllung und Leerung, Forwarding-Priorität, Load-Use-Stall, WB/ID-Sonderfall und Branch-Flush anhand des jeweiligen Zeitmodells geprüft. Die veröffentlichten Pipeline-Raster und Scheduling-Folgen der Übungen wurden zusätzlich unabhängig berechnet.
- Trap-Adressen, `mcause`, `mstatus`, `mepc` und `mret` unter dem vereinbarten M/U-Modell geprüft. Gerätekarte, normale Funktions-ABI und Venus-Dienstvertrag bleiben getrennt.
- Alle 32 Vorlesungs-Assemblerquellen in 173 funktionalen Modellfällen geprüft: Ergebnisse, Varianten, Null-Länge, Grenzen, Registererhaltung, Rekursion, beide Kopien der Schloss-Übergangsfunktion, alle 16 Eingabemasken und vollständige Gerätefolgen. Das absichtlich falsche `ra`-Beispiel bleibt als Fehlerbeispiel erkennbar.
- Alle zwölf Labor-Assemblerquellen erneut im funktionalen Modell geprüft, einschließlich Varianten, Ausgabe nach Diensten ohne vorausgesetzte Datenregistererhaltung und vollständiger Lüfterfolgen. Die beiden C-Dateien wurden mit dem Hostcompiler gebaut und ihre Funktionen geprüft; die neue Labor-C-Datei umfasst dabei 69 Fälle.
- Alle 96 Quizfragen fachlich mit den behandelten Regeln abgeglichen. CSV-Struktur, vier Optionen und genau eine als richtig markierte Antwort geprüft. Bei den Zehnerquizzes ist die richtige Antwort nur zwei- bis dreimal allein am längsten; beim Quiz mit 16 Fragen zweimal. Die 20 Probeklausurfragen erlauben dagegen wie gefordert mehrere richtige Antworten; alle Schlüssel stimmen mit ihren Erläuterungen überein.
- `python beispiele/sollwerte.py` erfolgreich ausgeführt. Relative Dateiverweise, UTF-8, Steuerzeichen und alle 130 SVG-Dateien geprüft. Bei allen 130 SVG/PDF-Paaren stimmen die ausgewählten längsten Beschriftungen auch in der PDF-Fassung überein.

## Ausgabeprüfung

Die Website mit allen neun Präsentationen wurde erfolgreich neu erzeugt. Im Browser wurden alle 489 Folien mit gesetzten Formeln auf Überlauf und vorhandene Notizen geprüft; nach den Korrekturen gab es keine entsprechenden Befunde. Geänderte Laborübergänge, Registerbank, Pipeline-Sonderfall und Datenpfadübersicht wurden zusätzlich anhand von Screenshots kontrolliert.

Die unveränderten 18 Übungs-PDFs wurden erneut auf A4-Format, Aufgabenfolge, Textgrenzen und Trennung von Aufgaben und Lösungen geprüft. Keine Befunde. Die beiden Probeklausur-PDFs wurden neu gebaut: zwölf Seiten für Studierende, 19 Seiten einschließlich Lösungen; die korrigierten Erläuterungen sind in der Lösungsfassung enthalten.

Alle neun PDF-Skripte wurden nach der Filterkorrektur erneut mit Quarto und XeLaTeX gebaut. Die Prüfung bestätigt die Anfänge aller 480 Inhaltsnotizen sowie aller neun Titelnotizen, A4-Format, passende Foliennummern und keine Textüberschreitungen am Seitenrand. Die ersten Seiten wurden zusätzlich visuell kontrolliert. Die Skripte umfassen zusammen 307 Seiten. Auch das optionale HTML-Handout wurde für Einheit 5 erfolgreich gebaut. `git diff --check` ist ohne Befund.

## Grenzen des Nachweises

Die Programmprüfungen verwenden ein funktionales RV32I-Papiermodell, keinen Venus- oder Ripes-Lauf und keine echte Disassembly. Pseudoinstruktionsadressen darin sind synthetisch; native Lehradressrechnungen werden gesondert behandelt. Pipelinezeiten sind ausdrücklich Modellrechnungen. Geräteadressen und versionsabhängiges Verhalten müssen wie in den praktischen Aufgaben vorgesehen in der eingesetzten Simulatorversion geprüft werden.

Die C-Prüfungen verwenden den Hostcompiler; es wird kein RISC-V-Cross-Compilerlauf behauptet. Privilegierte Traps wurden als Zustandsmodell geprüft. Die Browserprüfung lud MathJax über die verifizierende System-TLS-Verbindung, weil Chromium dem Zertifikat des Cloud-Proxys nicht vertraute; die Zertifikatsprüfung wurde nicht abgeschaltet.

Ältere Änderungsberichte dokumentieren ihren jeweiligen Bearbeitungsstand. Für die hier korrigierten Übergänge und Modellformulierungen gilt dieser neue Bericht zusammen mit dem aktuellen Kursvertrag.
