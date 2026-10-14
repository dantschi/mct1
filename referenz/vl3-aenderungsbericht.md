# Einheit 3: Änderungsbericht

## Aufbau und Anschluss an das Vorwissen

Die Vorlesung setzt nur die überarbeiteten Einheiten 1 und 2 voraus: Byteadressen, Hexdarstellung, Zweierkomplement, Registerrollen, bitweise Logik, unmittelbare Konstanten sowie Registerarithmetik. Arrays, Pointer, Speicherbefehle und Kontrollfluss werden in dieser Einheit eingeführt. Die Pflichtaufgaben benötigen keine C-Syntax, Funktionsaufrufe oder Kenntnisse eines Betriebssystems.

Der neue Aufbau folgt einem durchgängigen Beispiel mit fünf 32-Bit-Wörtern: `[10,20,30,40,50]`. Zuerst werden Adresse, Index und Inhalt getrennt, dann ganze Wörter gelesen und geschrieben. Teilzugriffe führen die bekannte Vorzeichen-/Nullerweiterung fort. Erst nach der Befehlswirkung folgen I- und S-Codierung. Bedingte Sprünge und ein unbedingter Jump bauen Entscheidungen auf; eine kopfgesteuerte Schleife verbindet diese mit den Speicherzugriffen.

54 Inhaltsfolien und die automatische Titelfolie besitzen eigene Notizen. Die 54 Inhaltsnotizen umfassen 7581 Wörter. Die zuvor häufig wiederholten allgemeinen Absätze wurden durch folienspezifische Erklärungen, Rechnungen, Abbildungsbeschreibungen, Voraussetzungen und Musterlösungen ersetzt. Auch Abschnitts- und Aufgabenfolien erhalten zusammenhängenden Lerntext. Das Skript-PDF enthält 36 A4-Seiten mit Folienkarten und 54 zugeordneten Notizblöcken. Eine lokale PDF-Einstellung hält die Notizblöcke zusammen; dadurch werden am Seitenwechsel keine Textzeilen am oberen Rand abgeschnitten. Globale Filter und Styles wurden dafür nicht geändert.

## Fachliche und didaktische Präzisierungen

- Ein Pointer ist ein als Adresse verwendetes Registermuster. `la` lädt die Labeladresse, `lw` den gespeicherten Inhalt. Eine Zahl in ein Register zu schreiben legt keine Speicherregion an.
- Arrays zählen Elemente, Adressoffsets Byte. Für 32-Bit-Wörter gilt Basis plus viermal Index. Bei variablen Indizes werden Offset und Adresse explizit gebildet; alternativ wandert ein Pointer. Beide Bewegungen dürfen nicht doppelt addiert werden.
- Die effektive Adresse ist der alte Basisinhalt plus vorzeichenerweiterter Zwölf-Bit-Byteoffset. Auch `lbu` verwendet einen signed Adressoffset. Ein Load schreibt die Adresse nicht in sein Zielregister und verändert die Basis nicht.
- Bei `sw` ist das erste Register die Datenquelle, nicht das Ziel. Store-Ziel sind die adressierten Byte. Registerquellen und Nachbarbytes bleiben unverändert.
- Alignment betrifft Basis plus Offset. Ein gerader Offset kann bei ungerader Basis unzureichend sein; eine ungerade Basis kann mit passendem Offset eine ausgerichtete Adresse ergeben. Zugänglichkeit aller Byte und Ausrichtung sind unabhängige Voraussetzungen. Ein universeller Alignment-Trap wird nicht behauptet.
- Little Endian betrifft die Reihenfolge der Byte eines Worts, nicht die Bitreihenfolge innerhalb eines Bytes. Angenommene Adressen wie `0x1000` sind Lehrwerte, keine zugesicherte Venus-Datenbasis.
- `lb` und `lh` definieren durch Vorzeichenerweiterung das ganze Zielregister; `lbu` und `lhu` erweitern mit Nullen. Kein Load setzt ein leeres Register voraus oder hinterlässt unbekannte obere Bits. `sb`/`sh` kürzen dagegen auf die unteren Datenbits und benötigen keine zusätzliche unsigned Variante.
- Load-I-Format und Store-S-Format werden aus den Registerrollen hergeleitet. Ein Store hat kein `rd`. Seine beiden Immediate-Teile werden erst zu zwölf Bit verbunden und dann signed gelesen. Feste Registerfeldpositionen werden ohne erfundene Flächen- oder Zeitangaben begründet.
- Branches vergleichen alte Registerinhalte und wählen die nächste Befehlsadresse. Sie erzeugen kein allgemeines Vergleichsergebnisregister oder architektonisches Vergleichsflag. Signed und unsigned Vergleiche ordnen identische Muster unterschiedlich.
- Ein genommener Branch zählt den Byteoffset ab der Branch-Instruktion, nicht ab PC plus vier. Der rekonstruierte B-Offset enthält das implizite Bit null bereits; ein zweites Verdoppeln wäre falsch. Die vollständige B-Bitverteilung ist für diese Pflichtaufgaben nicht erforderlich.
- `j` ist ein unbedingter Jump und kann für die hier nahen Ziele nativ als `jal x0, Ziel` entwickelt werden. Der Linkwert wird verworfen. Unbedingtheit bedeutet keine absolute Adressierung; ein Jump ist kein Programmabschluss.
- Die Gleichheitsentscheidung benutzt `bne` zum Else-Block. Ursprüngliche Bedingung und genommener Branch sind deshalb verschieden. Das fehlende `j` nach Then wird als eigener Fehlerfall nachvollzogen.
- Die Schleife testet vor dem Load. Bei null Elementen bleiben Summe und Pointer unverändert, ohne einen gelesenen Datenwert zu benötigen. Die Beziehung zwischen Zähler, Pointer und bisheriger Summe wird als Schleifeninvariante erklärt. Für fünf Elemente gibt es fünf Loads, aber sechs Tests.
- Die Programmvorbedingung beschränkt die Anzahl auf die tatsächlich deklarierten Daten. Ein ausgerichteter Pointer hinter dem Array darf am Endtest im Register stehen, wird dort aber nicht mehr gelesen.
- Die Rechensumme liegt durchgängig in `s0` und wird am Prüfpunkt vor den Venus-Diensten beurteilt. Danach geht sie direkt nach `a1`. `a0` wählt die Dienste 1 und 10 und wird nicht zwischenzeitlich als Summenvariable verwendet. Eine allgemeine Registererhaltung durch beliebige Umgebungsdienste wird nicht angenommen.

## Abbildungen und Beispiele

14 neue native SVG-Abbildungen und passende PDF-Fassungen liegen unter `assets/images/vl3-*`. Sie zeigen Arraybereiche, getrennte Adress-/Datenwege von Load und Store, Indexskalierung, natürliche Ausrichtung, Byteerweiterung, Teilstore, S-Felder und Immediate-Rekonstruktion, Branch-Wege, Zahlenordnungen, Entscheidungswege, Schleifenwege und einen konkreten Schleifenzustand.

Die bestehenden vollständigen Quellen `vl3_wordzugriff.s`, `vl3_teilzugriffe.s`, `vl3_if_else.s` und `vl3_array_summe.s` sind vorhanden und auf die neuen Prüfstellen abgestimmt. Alle besitzen einen kontrollierten Venus-Abschluss. Die Kommentare beschreiben Modellvorhersagen. Die Summe hat ihren Prüfpunkt unmittelbar vor `mv a1, s0`; die Entscheidung besitzt ebenfalls einen benannten Prüfpunkt. S-Register werden hier im Hauptprogramm benutzt, ohne einen Funktionsaufruf zu modellieren.

## Papierübung und Zeitplanung

Studierendenblatt und getrennte Musterlösung umfassen jeweils neun A4-Seiten. Aufgaben 1–6 bieten 60 Selbstkontrollpunkte und beschreibbare Tabellen beziehungsweise Rechenflächen. Sie behandeln einen vollständigen Load-Rechnung-Store-Trace, Ausrichtung und gültige Regionen, Byte-/Halbwortzustände, S-Codierung in beide Richtungen, native Entscheidungswege mit konkreten Befehlsadressen und die gesamte Schleifenfolge einschließlich Endtest und leerem Fall. Nötige Alias- und Codierreferenzen stehen im Blatt; unbekannte Anfangswerte werden nicht stillschweigend null gesetzt.

Aufgabe 7 implementiert und prüft die Array-Summe in Venus. Zu vergleichen sind Anzahl, Summe, Pointerabstand und tatsächlich ausgeführte Loads. Die Fälle N gleich null, eins und fünf werden durch negative Daten ergänzt. Die optionale Vertiefung nutzt die vorhandenen Teilzugriffs- und Entscheidungsprogramme.

Planungsannahme für vier Schulstunden zu je 45 Minuten: 76 Minuten Vorlesung und Rückfragen, 54 Minuten Papierarbeit, 30 Minuten Venus, zehn Minuten Quiz und zehn Minuten Auswertung. Die optionale Vertiefung liegt außerhalb dieser 180 Minuten. Die Zeiten sind didaktische Schätzungen und keine gemessenen Bearbeitungszeiten; bei höherem Unterstützungsbedarf kann Aufgabe 4 nachbesprochen werden.

## Quiz

Die bestehende Fragenzahl zehn und das CSV-Schema mit elf Semikolonspalten bleiben erhalten. Jede Frage enthält vier Optionen und genau eine richtige Antwort. Die Fragen prüfen Adresse gegenüber Inhalt, effektive Ausrichtung, signed Offset gegenüber unsigned Daten, Teilstores, S-Feldrollen, Entscheidungspfad, Vergleichsart, PC-Bezugspunkt und leere Schleifen. Alle Aussagen sind in der Vorlesung behandelt.

Die richtige Antwort ist dreimal allein am längsten und einmal allein am kürzesten. Bei allen übrigen Fragen ist sie kürzer als mindestens eine falsche Option. Das größte Verhältnis zwischen längster und kürzester Option einer Frage beträgt etwa 1,18. Richtige Positionen verteilen sich auf 3/3/2/2. Plausible Verwechslungen und eindeutige Richtigkeit wurden zusätzlich zur Zeichenprüfung geprüft.

## Tatsächlich erfolgte Prüfungen

- Reveal.js-Präsentation, Skript-PDF sowie Studierenden- und Lösungs-PDF erfolgreich mit Quarto erzeugt.
- Alle 55 Browserfolien einschließlich Titel bei 1280 × 720 geprüft: vollständige Notizen und Bilder, gesetzte Formeln, keine horizontalen/vertikalen Überläufe und keine JavaScript-Fehler. Repräsentative Folien zusätzlich visuell geprüft.
- SVGs zunächst temporär erzeugt: XML und Palette, nicht überlappende Boxen, orthogonale Leitungen ohne Durchquerung von Boxen geprüft. PNG-Ansichten und gerenderte Folien-/PDF-Seiten visuell kontrolliert. Die Pointermarkierung wurde so verschoben, dass sie kein Adresslabel durchläuft.
- PDFs auf A4 und Text innerhalb der geprüften Ränder kontrolliert. Alle sieben Pflichtaufgaben beginnen auf eigener Seite, die optionale Aufgabe ebenfalls. Musterlösungen sind im Studierendenblatt ausgeblendet. Das Skript enthält 54 Notizblöcke; deren Randproblem wurde vor dem finalen Rendern behoben.
- UTF-8 ohne BOM, Ersetzungszeichen oder unzulässige Steuerzeichen, lokale Begriffe, Quellenpfade und 14 SVG/PDF-Paare geprüft. `git diff --check` bestanden.
- Codierungen unabhängig durch Binärfeldverbindung und inverse Bitmasken geprüft: `lw t0, 8(s1) = 0x0084A283`, `sw t0, 12(s1) = 0x0054A623`, `sw t0, -4(s1) = 0xFE54AE23`, `sw t1, -8(s1) = 0xFE64AC23`. Alle 4096 signed Zwölf-Bit-Offsets und 1024 Store-Quellenkombinationen geprüft.
- Alle 256 Byte- und 65536 Halbwort-Erweiterungsmuster sowie Little-Endian-Bytezustände, Ausrichtung und signed/unsigned Relationsumformungen geprüft.
- Die vier tatsächlichen Programmquellen in einem funktionalen RV32I-Modell mit Byte-Speicher interpretiert. Wortprogramm: Array danach 10, 20, 30, 42, 50. Teilprogramm: Register- und Storewerte einschließlich unveränderter Quellbytes korrekt. Entscheidung: vier gleiche/ungleiche und negative Eingabebelegungen korrekt.
- Summenprogramm: 58 Modellläufe mit allen gültigen Prefixlängen mehrerer Datenfolgen, leerem Fall, negativen Werten und Überlaufmustern. Registerzustände am Prüfpunkt, Loadadressen, unveränderte Eingabedaten, N+1 Tests und Schleifeninvariante geprüft. Ausgabe/Exit zusätzlich bei absichtlich zerstörten Registern nach dem modellierten Druckdienst geprüft.
- Tatsächliche Papier-Codeblöcke und die kleine Summenschleife aus den Folien interpretiert. Native Entscheidungswege, Byteänderungen und Endtest nachgerechnet. Bestehender Checker `python beispiele/sollwerte.py` bestanden.
- CSV auf Spalten, Typ, Antwortzahl, Korrektheitswerte, Längen und Positionen geprüft.

## Grenzen und Quellen

Das funktionale Modell belegt die dokumentierte Befehlswirkung und den Venus-Dienstvertrag; es ist kein Venus-Lauf, keine RISC-V-Assemblierung und keine Hardwarezeitmessung. Der direkte Zugriff auf Kurs-Venus scheiterte in der Cloud am CONNECT-Tunnel mit Status 403. Konkrete Labeladressen, Bedienoberfläche und tatsächliche Pseudoexpansion werden daher im Labor selbst protokolliert und nicht als beobachtet behauptet. Keine zusätzliche Toolchain wurde allein für die Notizregel installiert.

Grundlagen: `referenz/kursvertrag.md`; Harris/Harris, *Digital Design and Computer Architecture — RISC-V Edition*; Patterson/Hennessy, *Computer Organization and Design: The Hardware/Software Interface — RISC-V Edition*. Der Dienstvertrag ist in der in den Folien verlinkten Venus-Dokumentation nachvollziehbar.
