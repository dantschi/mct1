# Einheit 4: Änderungsbericht und Abnahme

## Anschluss und Aufbau

Die Einheit setzt die überarbeiteten Vorlesungen 1–3 voraus: Registerarithmetik, Byteadressen, Load/Store, Sprünge und die Orientierung in den Aliasgruppen. C-Syntax, die Multiplikationserweiterung M und ein Betriebssystemmodell sind keine Pflichtvoraussetzungen. Der Einstieg erklärt eine Funktion als Rechenblock mit Eingaben, Ergebnis und dynamischem Rückweg.

Das durchgängige Beispiel ist `Calc(a,b)=2a+b`. Der Helfer Sum bildet zuerst a+b; Calc erhält das alte a, ruft Sum und addiert anschließend nochmals a. Dieses RV32I-Beispiel verbindet Rückkehradresse, Argumentübergabe, Registererhaltung und Frame, ohne die bisherige Integerbasis zu verlassen. Der Aufbau führt vom einzelnen Aufruf über die Registervereinbarung und den Stack zu verschachtelten Aufrufen und überprüfbaren Kontrollpunkten.

44 Inhaltsfolien und die automatische Titelfolie besitzen eigene Notizen. Die Inhaltsnotizen umfassen 6132 Wörter. Die früher oft schematischen Beispiel-/Denkfehler-/Kontrollfrage-Blöcke wurden durch zusammenhängende, folienspezifische Erklärungen ersetzt. Zahlen, Voraussetzungen, lokale Begriffe, Abbildungen und Musterlösungen werden unmittelbar erläutert. Das Skript-PDF enthält 29 A4-Seiten und 44 den Inhaltsfolien zugeordnete Notizblöcke. Eine lokale PDF-Einstellung hält die Lerntexte zusammen; globale Filter und Styles wurden nicht geändert.

## Fachliche Präzisierungen

- `jal` liefert Linkwert und Sprungziel aus dem alten PC. `ra=x1` ist ein Architekturregister mit Software-Rolle; vier Byte Befehlslänge bedeuten keine vier Takte.
- `jalr` liest die alte Registerbasis und den signed Zwölf-Bit-Offset, löscht anschließend nur Bit 0 des Ziels und schreibt einen neuen Linkwert nach rd. Quelle und Ziel dürfen gleich sein. Bit 0 zu löschen garantiert weder eine Vier-Byte-Grenze noch eine gültige Codeadresse.
- `ret` ist `jalr x0, 0(ra)`. Es springt über den aktuellen Rückweg, restauriert aber weder Ergebnis noch Sicherungen oder sp. Ein fehlendes ra-Backup kann im isolierten Beispiel einen ret-Selbstloop erzeugen.
- Die ABI-Aufrufkonvention ist eine Softwarevereinbarung, keine automatische Registersperre. Einfache Eingaben nutzen a0–a7, das hier betrachtete einzelne 32-Bit-Ergebnis a0. Venus-Dienste verwenden a0 anschließend als Dienstnummer und a1 als Druckargument.
- Caller-saved heißt nicht zugesichert erhalten, nicht automatisch gelöscht. Nur ein alter noch benötigter Wert muss erhalten werden; passende Registerwahl oder Neuberechnung kann ebenfalls genügen. Ein unveränderter Testlauf beweist keinen allgemeinen Vertrag.
- Callee-saved verlangt den Eintrittswert bei korrekter Rückkehr. Ein Register darf im Rumpf verändert werden; bloßes Lesen verlangt kein Backup. Das Resultat in a0 wird nicht blind mit dem alten Argument überschrieben.
- Calc ist gegenüber main Callee, gegenüber Sum Caller. Das Sichern des noch benötigten äußeren ra entspricht daher dessen caller-saved Rolle. Ein einmaliger Slot hält den äußeren Rückweg bis zum Epilog; erneutes Speichern des aktuellen ra auf denselben Slot kann ihn zerstören.
- Ein Frame ist nicht ein einzelner Slot. Drei Wörter benötigen zwölf Nutzbyte und passen im gewählten Modell in einen 16-Byte-Frame. Padding bleibt unbekannt. Slot zwölf ist eine Belegungswahl; ein passender Slot null kann ebenso gültig sein.
- Reservieren ist kein Store und Freigeben kein Löschen. Loads verwenden noch die richtige Framebasis, bevor sp restauriert wird. Ein Prolog −16 und Epilog +8 lässt sp bei S−8, auch wenn Resultat und Rückweg stimmen.
- Leaf bedeutet kein innerer Aufruf und nicht immer framefrei. Das einfache Verdopple braucht keinen Frame; ein Leaf mit verändertem s0 sichert dessen Eintrittswert dennoch.
- Verschachtelte Frames nutzen getrennte Adressen bei gleichen lokalen Offsets. Die Umgebung muss einen gültigen ausgerichteten Anfangsstack und ausreichenden Speicher bereitstellen. Eine Stackgrenze ist nicht allgemein eine Heapkollision.
- Rekursion ist optionale Reserve. SumDown benutzt nur Addition, hält n und ra pro nichtleerer Stufe getrennt und lässt den Basisfall null framefrei. Für n gleich drei entsteht Ergebnis sechs bei 48 Byte zusätzlicher Reserve.

## Abbildungen und vollständige Quellen

Elf neue native SVG/PDF-Paare unter `assets/images/vl4-*` zeigen alternative Aufrufwege, die beiden jal-Werte, jalr-Bitlöschung, Registererhaltung, drei Framelayouts, aktive Frames, ra-Lebensdauer, verschachtelte Rückwege und rekursive Summenrahmen. Die älteren, nun nicht eingebundenen Abbildungen bleiben für andere mögliche Referenzen erhalten. Temporäre Erzeugung, Geometrie- und Palettenprüfung gingen der Einbindung voraus.

Die vorhandenen Quellen `mct1_vl4_nested_calls_ok.s` und `mct1_vl4_ra_fehler.s` wurden auf die Prüfstellen und Modellbeschreibung abgestimmt. Neu sind vollständige Programme `mct1_vl4_leaf.s`, `mct1_vl4_caller_save.s` und die optionale `mct1_vl4_rekursive_summe.s`. Der Caller-Helfer verändert t0 ausdrücklich auf 999, damit das Backup nicht durch zufälliges Unverändertbleiben scheinbar überflüssig wird. Alle korrekten Hauptprogramme enden kontrolliert mit dem Kurs-Venus-Dienst 10. main ist jeweils Simulator-Einstieg und kein normal zurückkehrendes Callee.

## Übung, Quiz und Zeitplanung

Studierendenblatt und getrennte Musterlösung umfassen jeweils neun A4-Seiten. Sechs Papieraufgaben mit 60 Selbstkontrollpunkten prüfen Link-/Zieladressen, relative Verantwortlichkeiten, Nutzbedarf und Slots, einen vollständigen nativen Calc-Trace, isolierte Fehler sowie konkret überschriebenen caller-saved Inhalt. Die Calc-Lehrtabelle verwendet ausdrücklich angenommene native Adressen und keine behauptete Venus-Disassembly. Zustandsabfragen nennen ihren Vorher-/Nachher-Zeitpunkt. Die Studierendenfassung bietet beschreibbare Tabellen und enthält keine eingeblendeten Musterlösungen.

Die Rechneraufgabe umfasst einen Leaf und Calc mit vier Argumentpaaren. Ergebnis, Erhaltungssignal s0, Rückweg und sp werden getrennt protokolliert. Die alte verpflichtende Quadrat-/mul-Aufgabe ist durch den passenden RV32I-Ablauf ersetzt. Die optionale Rekursion liegt außerhalb des Pflichtzeitplans.

Die zehn Quizfragen und das unveränderte Schema mit elf Semikolonspalten bleiben erhalten. Jede Frage hat vier Optionen, genau eine richtige und eine Erklärung von ein bis zwei Sätzen. Die Aussagen sind in der Vorlesung behandelt. Die richtige Option ist dreimal allein am längsten und einmal allein am kürzesten; sonst ist sie kürzer als mindestens eine falsche Option. Das größte Längenverhältnis beträgt etwa 1,18, richtige Positionen verteilen sich auf 3/3/2/2. Neben Zeichenlängen wurden eindeutige Richtigkeit und plausible Verwechslungen geprüft.

Planungsannahme für vier Schulstunden: 70 Minuten Vorlesung einschließlich Rückfragen, 55 Minuten Papierarbeit, 35 Minuten Venus, zehn Minuten Quiz und zehn Minuten Auswertung. Die Summe ist 180 Minuten. Die Zeiten sind didaktische Schätzungen, keine gemessenen Bearbeitungszeiten; Aufgabe 5 kann bei höherem Unterstützungsbedarf nachbesprochen werden.

## Tatsächlich erfolgte Prüfungen

- Reveal.js-Präsentation, Skript-PDF sowie Studierenden- und Lösungs-PDF mit Quarto erzeugt. Alle 45 Browserfolien einschließlich Titel bei 1280 × 720 geprüft: vollständige Notizen, elf geladene Abbildungen, gesetzte Formeln, keine Überläufe oder JavaScript-Fehler. Repräsentative Folien und PDF-Seiten visuell geprüft.
- SVGs auf XML, strikte Palette, nicht überlappende Boxen und orthogonale Leitungen ohne Boxdurchquerungen kontrolliert. Die rekursive Abbildung erhielt mehr Raum unter dem letzten Frame, sodass die Rückgabefolge lesbar getrennt ist.
- PDFs: A4, Text innerhalb der geprüften Ränder, eigene Seiten für alle sieben Pflichtaufgaben und die optionale Reserve, Lösungstrennung sowie 44 Notizblöcke geprüft.
- UTF-8 ohne BOM, Ersetzungszeichen oder unzulässige Steuerzeichen, lokale Begriffe, Quellenpfade und alle SVG/PDF-Paare geprüft. `git diff --check` bestanden.
- Funktionale jal-/jalr-Proben prüfen alten PC, verworfenen Link, gleiche Registerquelle und Linkziel sowie Bit-0-Löschung. Die native Calc-Tabelle und sechs abgefragten Nachzustände wurden unabhängig interpretiert; Slotwörter bei 0x1FF8 und 0x1FFC stimmen.
- Calc: 28 Modellläufe mit kleinen und großen Vorzeichen-/Überlaufmustern, verschiedenen übrigen Eintrittsregistern und einem Sum-Helfer, der a1 sowie alle t-Register ausdrücklich verändert. Resultat, s-Register, sp, Rückwege und getrennte Sicherungen korrekt.
- Leaf und Callerbackup: Ergebnis 30 beziehungsweise 35, Zustand vor dem Dienst, Druckargument und Exit geprüft; auch nach absichtlichem Zerstören von Registern durch den modellierten Druckdienst funktioniert der Abschluss.
- Rekursion für n gleich null bis sechs: Summen, maximale Reserve 16n, getrennte Slots und Erhaltung aller normalen Rückkehren geprüft. Die Fehlerdatei wurde mit begrenzter Schrittzahl interpretiert und erreicht wiederholt calc_bad_return, nicht die Fortsetzung in main.
- Framegrößen, Padding, Adressen, Freigabefehler und die alternativen Caller-Rechnungen 35, 1029 und 20 nachgerechnet. Vorhandener Checker `python beispiele/sollwerte.py` bestanden.
- CSV-Spalten, Typ, Antwortanzahl, Korrektheitswerte, Längen und Positionen geprüft.

## Nachweisgrenzen und Quellen

Das funktionale Modell belegt Befehlswirkung, Erhaltung und Dienstvertrag, keine tatsächliche RISC-V-Assemblierung oder Pseudoexpansion. Der direkte Kurs-Venus-Zugriff scheiterte in der Cloud am CONNECT-Tunnel mit Status 403. Ein konkreter Venus-Lauf, seine Labeladressen und die Bedienoberfläche werden daher nicht als beobachtet behauptet; sie werden im Labor protokolliert. Keine zusätzliche Toolchain wurde allein zur Erfüllung der Notizregel installiert. Keine Hardwarezeit wurde gemessen.

Grundlage: `referenz/kursvertrag.md`, Harris/Harris, *Digital Design and Computer Architecture — RISC-V Edition*, Patterson/Hennessy, *Computer Organization and Design: The Hardware/Software Interface — RISC-V Edition*, und der dokumentierte Dienstvertrag der Kurs-Venus-Linie.
