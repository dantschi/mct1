# Überarbeitung der Probeklausur

Stand: 14. Oktober 2026.

Die Probeklausur in labs/probeklausur.qmd ersetzt den bisherigen Aufbau mit 100 Punkten durch 90 Punkte für etwa 90 Minuten. Sie beginnt mit der gewünschten Aufgabenstellung. Die README nennt ebenfalls die neue Gesamtpunktzahl.

## Auswahlteil

20 Fragen mit jeweils vier eigenständigen Optionen und einem Punkt pro vollständig korrekter Auswahl. Fünf Fragen haben eine richtige Option, zehn haben zwei, vier haben drei und eine hat vier. Diese Verteilung steht nicht in der Studierendenfassung. Jede Antwortposition ist zehn- oder elfmal richtig; die Optionen sind ähnlich lang formuliert.

Die Fragen prüfen Anwendungen und typische Verwechslungen aus allen neun Einheiten: ISA und Mikroarchitektur, Zahleninterpretation, Logik und Register, RV32I und Instruktionsformate, Speicher und Branches, Aufrufkonvention, Datenpfad und Steuerwerk, Performance und Sprungvorhersage, MMIO und Polling, privilegierte Traps, Umgebungsdienste und Werkzeugkette. Die Regeln der Quizacademy-CSV mit genau einer richtigen Option gelten nicht für diesen Mehrfachauswahlteil.

## Papieraufgaben

Sechs Aufgaben mit insgesamt 70 Punkten: Zahlendarstellung und Logik (10), vollständige C-Arraysumme als RV32I-Blattfunktion (16), nativer Stacktrace (10), Datenpfad und Steuerwerk (12), Pipeline und Laufzeit (12), I/O und Zustandsmaschine (10). Die Richtzeiten entsprechen den Punkten und umfassen Lesen und Bearbeiten.

Anfangswerte, gültige Speicherbereiche, Aufrufkonvention, Pipeline-Zählgrenzen und Gerätevertrag stehen in der Klausur. Alle Aufgaben sind ohne Simulator oder Compiler lösbar. Die Musterlösung erklärt richtige und falsche MC-Optionen und enthält Rechenwege, Einzelpunkte, zulässige Alternativen und Hinweise zur Behandlung von Folgefehlern. Eine Themenübersicht steht ausschließlich in der Lösung.

90 Minuten sind eine didaktische Planung für vorbereitete Studierende, keine empirisch gemessene Bearbeitungszeit. Die C-Übersetzung bildet den größten zusammenhängenden Arbeitsblock. Der Auswahlteil ist für etwa eine Minute je Frage vorgesehen.

## Durchgeführte Prüfungen

- Genau 20 nummerierte Fragen, 80 Optionen, zulässige Mehrfachauswahl und exakter Eingangstext; Aufgaben- und Teilpunktsummen ergeben 90.
- Zahlenwerte, Erweiterung, Branchziele, jalr und Einbitvorhersage unabhängig nachgerechnet.
- Tatsächliche Assembler-Musterlösung mit einem funktionalen RV32I-Papiermodell für alle Längen 0 bis 4 und drei verschiedene Registerinitialisierungen geprüft: Ergebnisse, Zugriffszahl, Grenzen und Erhaltung der gesicherten Register.
- Nativen Stackcode einschließlich Sicherungsadressen, Rückkehrzustand und ausgelassener ra-Wiederherstellung funktional geprüft.
- Pipeline-Belegung mit Load-Use-Halt und Forwarding unabhängig berechnet und mit der Lösungstabelle verglichen; Laufzeit und Speedup nachgerechnet.
- Ereignisfreigabe, Mehrfachdruck und Zustandsfolge unabhängig berechnet.
- Studierenden- und Lösungs-PDF mit Quarto und XeLaTeX erzeugt (12 beziehungsweise 19 A4-Seiten); Seitenaufteilung, Schreibraum, Tabellen, Zeichencodierung und Trennung der Lösungen geprüft. Codeblöcke sind in beiden Fassungen für den Druck monochrom.

Die Prüfmodelle sind keine Venus- oder Ripes-Läufe und keine Hardwaremessungen. Generierte PDFs liegen lokal unter labs/_output/ und bleiben wie die übrigen Labor-Builds unversioniert.
