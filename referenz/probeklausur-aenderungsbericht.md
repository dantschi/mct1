# Probeklausur: Kurzfassung für 60 Minuten

Stand: 4. November 2026.

Die Probeklausur in `labs/probeklausur.qmd` wurde von 90 auf 60 Minuten und von 90 auf 60 Punkte gekürzt. Sie enthält jetzt zehn statt 20 Multiple-Choice-Fragen und sechs kürzere Papieraufgaben mit 50 Punkten. Stoffumfang bleiben ausschließlich Vorlesung 1–7 und deren Wiederholung in Einheit 9. Die Einleitung unterscheidet ausdrücklich den Auswahlteil in Aufgabe 1 von den Papieraufgaben 2–7 und deren Bewertung.

## Umfang und tatsächliche Entlastung

| Aufgabe | Schwerpunkt | Punkte | Richtzeit |
|:---:|:---|---:|---:|
| 1 | Zehn Multiple-Choice-Fragen | 10 | 10 min |
| 2 | Zahlendarstellung und Logik | 8 | 8 min |
| 3 | Array und Schleife in RV32I | 10 | 10 min |
| 4 | Funktionsaufruf und Stacktrace | 8 | 8 min |
| 5 | Datenpfad und Steuerwerk | 8 | 8 min |
| 6 | Pipeline und Laufzeit | 10 | 10 min |
| 7 | Maschinencode und Bytefolge | 6 | 6 min |
| | Summe | 60 | 60 min |

Die Kürzung reduziert den Bearbeitungsumfang:

- Die zehn ausgewählten MC-Fragen decken ISA, Bitmuster, Logik und Registerflanke, Immediates, Speichererweiterung, Branches, ABI, ALU-Steuerung, Laufzeit und Forwarding ab.
- In Aufgabe 2 entfällt die zusätzliche Register-Zeittabelle; das Konzept bleibt in MC-Frage 3 enthalten.
- In Aufgabe 3 ersetzen sechs gezielte Lücken das vollständige Schreiben einer Assemblerfunktion. Die Aufgaben zu Nullfall, Loads und Byteadressierung bleiben erhalten.
- In Aufgabe 4 entfallen die zusätzlichen Begründungen zu Framegröße und Sicherung. Zustands- und Speichertrace sowie der fehlerhafte Rückkehrlink bleiben prüfbar.
- Aufgabe 5 beschränkt sich auf zwei Steuerzeilen und die Branchentscheidung. Das Abschreiben interner ALU-Codes und der zusätzliche Fehler-Load entfallen.
- Aufgabe 6 fragt neben Raster und Forwarding nur noch Taktzahl, Laufzeit und Speedup ab; zusätzliche Endwerte und der endliche CPI entfallen.
- Aufgabe 7 enthält eine Store-Transferaufgabe mit Adressrechnung, S-Format-Codierung und Bytefolge. Die Gesamtbewertung bleibt bei sechs Punkten.

Die Musterlösungen und Teilpunkte sind entsprechend gekürzt und neu zugeordnet. Bei Folgefehlern wird korrektes Weiterarbeiten weiterhin getrennt bewertet. Die Punkte sind an der geplanten Bearbeitungszeit ausgerichtet; 60 Minuten sind ein didaktischer Richtwert für vorbereitete Studierende einschließlich Lesen und Rechnen.

## Korrekturen aus dem Review vom 4. November

- Das Deckblatt begrenzt die Alles-oder-nichts-Bewertung auf die zehn MC-Fragen. Die Papieraufgaben haben ihre ausgewiesenen Punkte und erlauben Teilpunkte; die früher pauschale Aussage zu allen Teilaufgaben entfällt.
- Frage 10 heißt neutral „Forwarding“. Die Antwortoptionen und der Schlüssel bleiben unverändert.
- In Aufgabe 3 ist für die dritte Lücke ausdrücklich auch `a0` beziehungsweise `x10` mit voller Punktzahl zulässig. Das Argumentregister hält bis zum Schleifenende dieselbe Basis wie `t0`; erst die Rückgabe überschreibt es.
- Aufgabe 6 behält das bisherige Beispiel und Raster. Die Musterlösung erklärt ausdrücklich, warum der jüngere Produzent `addi` für `add` maßgeblich ist und der gleichzeitige WB/ID-Aufenthalt von `lw` und `add` keinen weiteren Stall erzeugt. Die Aufgabe benötigt keine besondere WB/ID-Kurskonvention mehr.
- Aufgabe 7 ersetzt das vorlagenähnliche `addi`-Codieren: Aus zwei Arrayindizes werden Zieladresse und signed-Byteoffset abgeleitet, eine native Store-Instruktion gewählt und ohne vorgedrucktes Feldschema im S-Format codiert. Der Datenwert 13, Registernummern, Datenadresse und Bytes des Instruktionsworts sind zu unterscheiden. Die Teilpunkte sind 1 + 4 + 1, weiterhin insgesamt sechs.

## Multiple Choice

Jede Frage hat vier eigenständige Optionen; eine, mehrere oder alle können richtig sein. Nur die vollständig richtige Auswahl erhält einen Punkt. Es gibt weder Teilpunkte noch Punktabzug. Die Quizacademy-Regel mit genau einer richtigen Option gilt nicht für diese ausdrücklich verlangte Mehrfachauswahl.

Der Schlüssel lautet: 1 A/D, 2 A/B/C/D, 3 A/D, 4 B, 5 B/C, 6 A/C, 7 B/C, 8 D, 9 A/C/D, 10 B/C/D.

Zwei Fragen haben eine richtige Option, fünf haben zwei, zwei haben drei und eine hat vier. A und B sind je fünfmal richtig, C und D je sechsmal. Diese Verteilung steht nicht in der Studierendenfassung. Richtige und falsche Antworten sind sowohl kurz als auch lang; ihre mittleren Längen betragen ungefähr 57 beziehungsweise 64 Zeichen. Ein systematischer Längenhinweis wurde nicht gefunden.

## Prüfungen

- Eindeutiger Geltungsbereich der Bewertungsregeln, zehn nummerierte Fragen mit 40 Optionen, Schlüssel sowie Aufgaben- und Teilpunktsummen geprüft: insgesamt 60 Punkte.
- Unabhängiges fachliches Review bestätigt Stoffabdeckung, eindeutige Fragestellungen und tatsächliche Verringerung des Arbeitsumfangs.
- 66 funktionale, numerische und strukturelle Prüfgruppen bestanden.
- Ausgefüllter Lückencode stimmt mit der Musterfunktion überein. Die beiden Basisvarianten `t0` und `a0` wurden für alle fünf Längen null bis vier und jeweils drei verschiedene Registerinitialisierungen geprüft: 30 Fälle mit korrekten Ergebnissen, genau `n` gültigen Loads und eingehaltenem Register- und Stackvertrag.
- Stacktrace und fehlende `ra`-Wiederherstellung, Steuerzeilen und Branchziel `0x3FF4` sowie Gesamtlauf mit 118 Takten / 236 ns / Speedup ungefähr 3,39 nachgerechnet.
- Das A6-Raster mit acht Takten und einer Load-Use-Blase wurde mit beiden Registerbankkonventionen geprüft: Beide Varianten leiten den Loadwert in EX-Takt 5 aus MEM/WB und das jüngere `addi`-Ergebnis in EX-Takt 6 aus EX/MEM weiter. Eine Kontrollfolge mit echtem WB/ID-Konflikt benötigt dagegen neun beziehungsweise acht Takte und bestätigt die wirksame Modellumschaltung.
- Neue A7: Zieladresse `0x6008`, Offset −12, Instruktion `sw a2, -12(s1)`, Codierung `0xFEC4AA23` und Little-Endian-Bytes `23 AA C4 FE` einschließlich Rückdecodierung geprüft. Ein funktionaler Store-Test überschreibt ausschließlich das geforderte Arrayelement mit 13 und verändert kein Register.
- Beide PDF-Fassungen mit Quarto und XeLaTeX erzeugt: zehn A4-Seiten für Studierende und 17 A4-Seiten Musterlösung; Aufgaben, Lösungen, Tabellen, Schreibraum und Seitenränder geprüft. Die Studierendenfassung enthält keine Lösungen.
- UTF-8 und `git diff --check` geprüft. Die README nennt 60 Minuten und 60 Punkte.

Die funktionalen Prüfungen sind unabhängige Papiermodelle, keine Simulator- oder RISC-V-Toolchain-Läufe. Die PDF-Dateien sind Build-Artefakte und bleiben unversioniert. Der vorhandene GitHub-Workflow erzeugt `labs/probeklausur.pdf` und `labs/probeklausur-musterloesung.pdf` für die Kurswebsite.
