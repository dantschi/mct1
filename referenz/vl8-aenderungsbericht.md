# Einheit 8: Änderungsbericht

## Aufbau und Anschluss an Einheit 1–7

Die Vorlesung entwickelt Ein- und Ausgabe aus bekannten Bitmasken, Speicherbefehlen, Adressen, Registerrollen und Stackframes. Der neue Ablauf trennt drei Verträge: Befehlssatz und privilegierter Zustand, Plattform und Geräteregister sowie Dienste der Ausführungsumgebung.

1. MMIO-Zugriff, Registerkarte, Bereichsauswahl und Adressrechnung.
2. Schaltermaske, Farbwort und vollständige aktive beziehungsweise inaktive Ausgabe.
3. Periodisches Polling, Druck-Freigabe-Erkennung und Entprellung.
4. Traps, Privilegienstufen, CSRs, Freigaben, Kontextrettung und Rückkehr.
5. Environment Calls und getrennte Dienstverträge.
6. Vorhersage und Vergleich mit Ripes beziehungsweise Venus.

57 inhaltliche Abschnitte haben jeweils vollständige, eigene Skriptnotizen. Die automatische Titelfolie hat ebenfalls Speaker-Notizen; insgesamt sind es 58 Reveal-Folien. Die Notizen erklären lokale Begriffe, Formeln, Code, Diagramme, Ausgangswerte und Grenzen sowie die Lösungen der Kurzaufgaben. Neue CSR- und Privilegienbegriffe werden vor den Zustandsrechnungen eingeführt.

Port-Mapped-I/O-Vergleiche, pauschale Hersteller- und Leistungsbehauptungen sowie redundante Metaphern wurden durch die für diese Einheit nötige Herleitung ersetzt. Ein Betriebssystemkern, Interruptcontroller oder bereits bekanntes CSR-System wird nicht vorausgesetzt.

## Fachliche Korrekturen und Modellgrenzen

- Eine Speicheradresse kann RAM oder ein Gerät erreichen. Die Plattformkarte bestimmt das Ziel, zulässige Breite und Nebenwirkungen. Eine falsche Adresse landet nicht automatisch im Heap.
- Vier GiB möglicher 32-Bit-Byteadressraum sind nicht vier GiB eingebauter RAM. Beispieladressen bleiben ausdrücklich didaktische Annahmen.
- Der einfache Decoder für obere Hexziffer F erkennt nur einen Bereich. Weitere Adressbits und Zugriffssignale wählen das einzelne Register.
- Das Echo maskiert SW3 mit acht und erzeugt danach Rot oder Schwarz. Maskenergebnis, Pixeladresse und Farbwort sind verschiedene Größen; beide Ausgangszustände werden geschrieben.
- Der gelesene Ripes-LED-Matrix-Code benutzt 24 Farbbits mit vier Byte Registerabstand. Das numerische Wort `0x00RRGGBB` und seine Little-Endian-Bytefolge werden getrennt erklärt.
- Das Lauflicht verwendet acht Zellen und Offsets 0 bis 28; 32 ist eine exklusive Bytegrenze. Vor dem Weiterrücken wird der alte Pixel gelöscht.
- Der gelesene Ripes-D-Pad-Code enthält Druckspeicherung und Read-to-clear. Diese Eigenschaft wird nicht als Garantie jeder installierten Version ausgegeben. Papieraufgaben benennen reine Pegel ohne Lese-Nebenwirkung oder ihr eigenes Ereignisregister.
- Druck-Freigabe-Erkennung zählt einen gehaltenen Pegel einmal, filtert mechanisches Prellen aber nicht. Der Dreiprobenfilter ist ein diskretes Modell mit Anfangszustand; daraus folgt keine gemessene analoge Entprellzeit.
- Periodisches Polling kann zwischen anderer Arbeit erfolgen. Hundert Takte bei angenommenen 10 MHz ergeben zehn Mikrosekunden; eine Abfrage alle fünf Millisekunden belegt 0,2 Prozent. Kurze nicht gespeicherte Pulse können trotzdem verpasst werden.
- `volatile` betrifft Compilerzugriffe und ersetzt weder Cacheattribute noch Gerätevertrag, Atomarität oder Speicherordnung. Der C-Ausschnitt ist eine syntaktisch vollständige Wartefunktion mit ausdrücklich angenommener Geräteadresse; ein Compilerlauf wird nicht behauptet.
- Exceptions sind einem Befehl zugeordnet, Interrupts relativ zum Befehlsstrom asynchron. Intern gegen extern ist keine hinreichende Klassifikation. Ein Trap ist weder automatisch ein Fehler noch ein Prozesswechsel.
- Der privilegierte Teil ist ein RV32-M/U-Grundmodell ohne Delegation und verschachtelte Traps. Vectored wird nur in einer begrenzten Vergleichsaufgabe ergänzt. Unterstützte mtvec-Werte und geeigneter Stack sind ausdrücklich angenommen.
- CSRs sind weder eine zweite Integerregisterbank noch MMIO. Hardware sichert Adresse, Ursache und Status, nicht automatisch alle Programmdaten.
- mtvec trennt BASE und MODE. Direct verwendet BASE; Vectored verwendet für Interrupts BASE plus viermal Ursachencode, für synchrone Exceptions weiterhin BASE.
- mcause wird aus Interruptbit und Code gemeinsam interpretiert. `0x0000000B` bezeichnet M-ecall, `0x8000000B` den Machine External Interrupt.
- MIE in Bit 3 wird mit Maske acht über csrrs gesetzt. MPIE liegt in Bit 7, MPP in Bits 12:11. Ganze Status-Schreibversuche und maskierte Änderungen sind getrennt.
- Die Annahmeformel Pending UND Quellenfreigabe UND MIE gilt für das ausdrücklich bereits in M laufende Programm mit geklärter Ziel- und Prioritätswahl. Sie ist keine allgemeine Regel für niedrigere Modi. MIE gleich null verhindert keine synchronen Exceptions.
- Beim Eintritt werden bisheriges MIE nach MPIE und bisheriger Modus nach MPP übernommen. mret verwendet die gespeicherten Werte und setzt anschließend MPIE sowie MPP zurück. Aktueller Modus und nach der Rückkehr gespeichertes MPP sind getrennt.
- Ein Interrupt erhält die gespeicherte Fortsetzungsadresse. Nur ein bewusst konsumierter 32-Bit-ecall wird in der betreffenden Policy um vier Byte übersprungen; ein behebbarer Fehler kann erneut versucht werden.
- Der Leaf-Ausschnitt zeigt isoliert Registerrettung und Ursachenlesen. Er ist kein vollständiger Gerätehandler ohne Quittierung. Ein Unteraufruf verlangt unter anderem Rettung von ra, sieben t- und acht a-Registern: 64 Byte allein für diese sechzehn Wörter.
- ecall ist kein gewöhnlicher jal-Aufruf. Dienstregister, Rückgaben und Registererhaltung folgen dem Umgebungsvertrag. Die falsche Behauptung eines garantierten Endloslaufs in Venus sowie einer allgemeinen s0-Erhaltung wurde entfernt.
- Die Clobber-Papieraufgabe definiert einen fiktiven Vertrag ausdrücklich. Sie erfindet keine Venus-Nebenwirkungen. Rechenoperanden für aufeinanderfolgende Ausgabedienste können bewusst neu vorbereitet werden.

## Abbildungen

Elf neue SVG/PDF-Paare unter `assets/images/vl8-*` zeigen Gerätezugriff, IEC-Adressdecoder, Schaltermaske, Farbwort, Polling-Zeitdiagramm, Druck-Freigabe-Zustände, Dreiprobenfilter, mcause-Felder, IEC-Interruptfreigabe, vollständigen Trap-Zustandsdurchlauf und Handlerstack.

Die Grafiken wurden zunächst temporär erzeugt, auf XML, Projektpalette, Rechteckgrenzen und Leitungen durch Boxen geprüft und visuell kontrolliert. Schaltungen benutzen rechteckige IEC-Gatter, korrekt escaptes UND-Symbol und orthogonale Wege. Signaldiagramme und Zustandsverläufe zeigen räumliche beziehungsweise zeitliche Zusammenhänge statt bloßer Textkastensammlungen. PDF-Paare stammen aus denselben SVGs.

## Übung und Quiz

Sechs Papieraufgaben mit insgesamt 60 Punkten zur Selbsteinschätzung:

- Adresse, Auswahl und Farbwort: 12.
- Polling und Entprellung: 12.
- Trap-Ursache, Ziel und Fortsetzung: 12.
- Freigabebits und Statusänderungen: 10.
- Stack und unterbrochener Registerwert: 8.
- Dienst- und Funktionsvertrag: 6.

Alle enthalten begründete Musterlösungen im Profil `solution`. Die Studierendenfassung bietet Tabellen und eigenen Schreibraum auf der jeweiligen Aufgabenseite. Zwei praktische Aufgaben verwenden vorhandene Repository-Programme für Ripes-MMIO und Venus-Konsole; das Lauflicht und der zusätzliche Textpräfix sind optionale Vertiefungen.

Das Quiz behält zehn Fragen, elf semikolongetrennte Spalten, vier Optionen und genau eine richtige Antwort. Es prüft konkrete Unterscheidungen und Verallgemeinerungen. Genau zweimal ist die richtige Antwort allein am längsten; in allen anderen Fragen ist mindestens ein Distraktor länger. Das Verhältnis längster zu kürzester Option liegt jeweils unter 1,35. Richtige Positionen sind mit 3/3/2/2 verteilt. Erläuterungen bestehen aus ein oder zwei Sätzen; Felder enthalten keine Semikolons.

## Tatsächlich erfolgte Prüfungen

| Prüfung | Ergebnis |
|:---|:---|
| Quarto-Reveal-Render | Erfolgreich, 58 Folien |
| Chromium bei 1280 × 720 | Alle Folien geprüft; keine Bildfehler, fehlenden Notizen, vertikalen oder horizontalen Überläufe oder JavaScript-Fehler |
| Formeln und repräsentative Bildschirmbilder | MathJax tatsächlich geladen; Schaltungen, Tabellen, Code und zentrale Beispiele visuell geprüft |
| Handout mit XeLaTeX | Erfolgreich, 36 A4-Seiten, alle 57 Skriptnotizblöcke enthalten |
| Übung für Studierende / Musterlösung | Erfolgreich, jeweils neun A4-Seiten; Lösungen getrennt, Schreibraum und Tabellen geprüft |
| PDF-Textgrenzen | Text innerhalb der geprüften Seitenränder |
| UTF-8, lokale Abkürzungen und Notizzuordnung | Geprüft, kein BOM oder Ersatzzeichen; Code und Grafiktexte einbezogen |
| Rechnerische Lehrmodelle | Decoderkombinationen, alle vier Schalterbits, Pixelgrenzen, Farben und Endianness geprüft |
| Ereignis- und Zeitmodelle | Pollingzeit, kurzer Puls, Druck-Freigabe, Dreiprobenfilter und isoliertes Read-to-clear geprüft |
| Trap- und Stackmodelle | Ursachen, Direct/Vectored, Statusbits, Eintritt, mret, Fortsetzung, Sicherungsadressen und Framegrößen geprüft |
| Funktionale Interpretation der vier vl8-Quellen | Erwartete Ausgaben, alle sechzehn Schalterkombinationen und zwei Lauflichtumlaufe geprüft |
| `python3 beispiele/sollwerte.py` | Erfolgreich |
| Quizschema und Antwortlängen | Erfolgreich |
| `git diff --check` | Erfolgreich |

Die Browserprüfung lud MathJax über den vorhandenen HTTPS-Proxy der Cloud-Umgebung. Projektkonfiguration und Darstellungsregeln wurden dafür nicht verändert. Quarto verwendet die vorab erzeugten Grafik-PDFs; Hinweise auf übersprungene SVG-Konvertierung sind erwartbar.

Quellenprüfung: Die offiziellen Ripes-MMIO- und Environment-Call-Dokumente, die Gerätemodelle für Switches, LED Matrix und D-Pad, die Venus-Environmental-Calls-Tabelle und der Machine-Kapitelquelltext der RISC-V-Spezifikation wurden gelesen. Sie belegen die dort beschriebenen Verträge, keinen UI-Lauf und keine identische Semantik jeder Installation:

- [Ripes MMIO](https://github.com/mortbopet/Ripes/blob/master/docs/mmio.md)
- [Ripes Environment Calls](https://github.com/mortbopet/Ripes/blob/master/docs/ecalls.md)
- [Ripes LED-Matrix](https://github.com/mortbopet/Ripes/blob/master/src/io/ioledmatrix.cpp)
- [Ripes Switches](https://github.com/mortbopet/Ripes/blob/master/src/io/ioswitches.cpp)
- [Ripes D-Pad](https://github.com/mortbopet/Ripes/blob/master/src/io/iodpad.cpp)
- [Venus Environmental Calls](https://github.com/61c-teach/venus/wiki/Environmental-Calls)
- [RISC-V Machine-Kapitel](https://github.com/riscv/riscv-isa-manual/blob/main/src/priv/machine.adoc)

Ripes, Venus und eine RISC-V-Toolchain wurden nicht ausgeführt. Funktionale Quelleninterpretation, hergeleitete Zustandsmodelle und Renderprüfungen werden nicht als Hardware- oder Simulatorläufe ausgegeben. la/li-Expansionen, konkrete Geräteadressen, globale Laufzeiten und eine allgemeine Venus-Registererhaltung bleiben außerhalb der nachgewiesenen Ergebnisse.

Ausgaben:

- `_site/vorlesungen/08_io-systemarchitektur.html`
- `_handout/vorlesungen/08_io-systemarchitektur.pdf`
- `labs/_output/lab_08_io-systemarchitektur-studierende.pdf`
- `labs/_output/lab_08_io-systemarchitektur-musterloesung.pdf`

## Einteilung für vier Schulstunden

Mögliche Auswahl für 180 Minuten Unterrichtszeit:

- 90 Minuten Erklärungen und integrierte Kurzaufgaben.
- 45 Minuten gemeinsame Papierarbeit mit Aufgaben 1, 3 und 5.
- 25 Minuten Werkzeugvergleich mit Schalter-Pixel-Echo und vorbereiteter Venus-Ausgabe.
- 15 Minuten Quiz und Besprechung.
- 5 Minuten Abschluss.

Die übrigen Papieraufgaben, Vectored-Vertiefung, Lauflicht und Textpräfix eignen sich als Reserve oder Nachbereitung. Vollständige Bearbeitung aller Aufgaben braucht zusätzliche Zeit. Die Angaben sind Planungsschätzungen, keine gemessenen Unterrichtszeiten; Pausen sind gesondert zu berücksichtigen.
