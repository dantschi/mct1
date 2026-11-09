# Abgleich mit dem DHBW-Quarto-Template

Stand: 9. November 2026.

## Herkunft und Prüfumfang

MCT1 wurde vom Template-Commit `7280ff5` vom 19. Juli 2026 abgeleitet. Der erste MCT1-Commit `5fb2a92` besitzt exakt denselben Git-Tree `ddc296273e514b533da0316656a82220595f7af9`. Die gemeinsame Basis ist deshalb über alle Dateiinhalte belegt, obwohl GitHub beim Erzeugen aus einem Template eine neue Commit-Historie anlegt.

Geprüft wurden alle 20 späteren Commits einschließlich eines Merge-Commits bis `578e3da` vom 7. November 2026. Der Merge-Commit `413275d` hat keinen zusätzlichen Tree-Unterschied gegenüber seinem fachlichen Elternstand. Vollständige Commit-Hashes und Datum stehen maschinenlesbar in [`.template/upstream.json`](../.template/upstream.json).

Alle 124 Netto-Dateideltas sind abgedeckt: direkt übernommen, nachvollziehbar an MCT1 angepasst oder als vollständige Autorenbeispiele ausgelagert. Zusätzlich wurden 324 vorhandene Kurs-, Abbildungs- und Beispieldateien auf unveränderte Inhalte geprüft.

## Übernommene Funktionen

- Versionsgebundene gemeinsame Toolchain und strikter Gesamtbuild: Website, sämtliche Handouts, Übungsblätter und Probeklausur in beiden Profilen. Nur frische, erfolgreiche Ergebnisse werden veröffentlicht; fehlende Pflichtausgaben blockieren den Deploy. Pull Requests erhalten Buildprüfungen und herunterladbare Artefakte.
- Livefigures einschließlich Fonts/WASM, WaveDrom, PlantUML/Kroki und Windows-SVG-Helfer. Mermaid bleibt nativ; Handout-Konfiguration und generischer Mermaid-Fit-Hook sind ergänzt.
- Zentrale `AGENTS.md`, Fachregeln, Bereichsregeln und sechs Autoren-Skills. Die sieben bisherigen Cursor-Regeldateien sind migriert. Terminologie, Transfer, Prüfungsvorbereitung und aktivierende Einstiegsfragen werden von den neuen Regeln und Arbeitsabläufen abgedeckt.
- Startcode-Projekte mit Manifest, getrenntem Starter-/Referenzvertrag, reproduzierbarem ZIP und erneuter Prüfung des entpackten Pakets. Das vollständige Python-Template-Beispiel wurde geprüft.
- Technische Dokumentation in `TEMPLATE.md`; README bleibt die MCT1-Kursstartseite und ergänzt Kursrahmen, beobachtbare Lernziele und Autorenlinks. `GLOSSAR.md` führt zur unveränderten kanonischen Tabelle `referenz/glossar.md`.

Allgemeine Template-Beispiele stehen bytegleich in `.template/examples/`. Die Übungsblattvorlage ist zusätzlich unter `labs/lab_template.qmd` verfügbar. Diese Dateien werden nicht als weitere MCT1-Unterrichtseinheiten veröffentlicht. Das Python-Beispiel benötigt Python 3.12.x und lässt sich getrennt mit dem dokumentierten Paketprüfer ausführen.

## Bewusst erhaltene MCT1-Anpassungen

Die 28 vorhandenen Folien-, Übungs- und Quizquellen bleiben bytegleich. Insbesondere bleiben die Wiederholung in Einheit 9, die 60-Minuten-Probeklausur und Einheit 8 unverändert. Der technische Auftrag ist keine erneute didaktische Überarbeitung aller Einheiten.

Kursname, Autor, URLs, Probeklausur und zusätzliche MCT1-Inhalte bleiben erhalten; allgemeine Template-Platzhalter werden nicht darübergeschrieben. Erhalten bleiben außerdem die PDF-Titelfoliennotizen samt richtiger Zählung, deutsche PDF-Sprache, Codefont-Fix, ungeteilte Notizboxen und das geprüfte optionale HTML-Handout mit `center:false`. Der neue `dhbwMermaidFit`-Hook ist zusätzlich zum bestehenden `mctMermaidFit`-Namen verfügbar.

## Einzelne Commits

| Commit | Umsetzung im aktuellen Checkout |
|---|---|
| `8381a64` | Workflow-Funktion übernommen und durch die neuere vollständige Buildpflicht aus ddc8350 ersetzt; Ausfall darf nicht mehr nur warnen. |
| `1314d07` | Mermaid-Fit, PDF-Filter, SVG-Helfer, 16:9- und Designregeln vorhanden. Styles unterscheiden sich nur in MCT-Kommentaren; Titelnotizen und deren Zählung bleiben als MCT-Erweiterung erhalten. |
| `c23b61c` | GitHub-Pages-Veröffentlichung bleibt aktiv; neuer Deploy-Job folgt erst auf erfolgreichen Gesamtbuild. |
| `2ea6e40` | DHBW-Logo vorhanden, Platzhalterlogo entfernt, Handout-/Materiallinks bleiben kursspezifisch. Abweichender Extension-Autor ist der MCT-Dozent. |
| `5e4e63a` | assets/images wird nicht mehr ignoriert; MCT-Abbildungen bleiben versioniert. Frühere temporäre MCT-Ausschlussmuster sind nicht übernommen. |
| `7c12e45` | UTF-8-Regel ist vollständig in vorlesungen/AGENTS.md enthalten. Allgemeine neutrale Template-Namen werden bei MCT-Titeln/Autorschaft absichtlich nicht über die Kursnamen geschrieben. |
| `efd484e` | Labprofile und generische Buildfähigkeit sind vorhanden. Beispielblatt unverändert unter .template/examples/labs/. A4, MCT-Default-Untertitel und Ignore-Regeln für verschachtelte Buildausgaben sind ergänzt; das eigenständige MCT-Labprojekt setzt ausdrücklich lang:de. |
| `9170284` | Livefigures samt Schriften/WASM importiert, pre-ast-Filter aktiv, Styles funktional identisch, Windows-SVG-Werkzeuge vorhanden. Website bleibt kursspezifisch; technische Anleitung ist für MCT1 eingerichtet. |
| `e589324` | folienblock bleibt unbreakable. MCT hält zusätzlich die bereits geprüften Notizboxen unbreakable und das HTML-Handout center:false. |
| `a1654f3` | Vollständige Notizregeln stehen im aktuellen vorlesungen/AGENTS.md. Upstream-Weiterentwicklung zur Erklärung bei Einführung statt mechanischer Wiederholung ist enthalten. |
| `9f73831` | CSV-/Fragenzahl-Regeln stehen im aktuellen quizacademy/AGENTS.md und im neuen Quiz-Skill/Validator. Keine vorhandene CSV verändert. |
| `4398e10` | Migration vollständig: AGENTS, vier Fachabschnitte und bereichsspezifische Regeln vorhanden; alte Cursor-Dateien entfernt. MCT-Fachvertrag, Literatur und Boolesche Notation zusätzlich erhalten. |
| `413275d` | Merge-Commit ohne weiteren Tree-Unterschied gegenüber 4398e10; keine separate Funktion auszulassen. |
| `ddc8350` | Pinned Setup/Aktivierung, vollständiger Builder und Tests sowie strikte Build-/Deploy-Jobs vorhanden. TeX-Support und lokale Fontconfig für das gepinnte Paket ergänzt; Chrome-Download benötigt weiterhin die vorbereitete Netzwerkfreigabe. |
| `8eec6c3` | Alle sechs Skills und gemeinsame Arbeitsweise bytegleich zu Upstream vorhanden; relative Verweise auf die lokalen Projektregeln und Vorlage gültig. |
| `be1a8f6` | Starter-/Referenz-/ZIP-Prüfung, Manifestregeln und Tests vorhanden. Vollständiges Python-Beispiel bytegleich unter .template/examples/code/labs/lab_02_suchen/ und zugehöriges Blatt im gleichen Beispielbaum; nicht als MCT-Unterricht ausgegeben. |
| `6a4bf0c` | Terminologieregel und Skill-Prüfanforderungen enthalten. GLOSSAR.md führt eindeutig zur bestehenden kanonischen MCT-Begrifftabelle referenz/glossar.md und übernimmt Pflegeregeln statt fremder Mutex-Lehrbeispiele. |
| `ed1aad3` | Lernziel-, Transfer-, Anspruchs- und Prüfungsbezug in AGENTS, Quizregeln und Skills vollständig enthalten, ohne vorhandene Materialien außerhalb des technischen Auftrags umzuschreiben. |
| `144b88c` | Regeln zur aktivierenden Einstiegsfrage vollständig in vorlesungen/AGENTS.md; aktuelles Starter-Kickoff bytegleich als Beispiel gesichert. Die Regel schließt automatische Umstrukturierung bei rein technischen Änderungen ausdrücklich aus. |
| `578e3da` | TEMPLATE.md vorhanden; README bleibt MCT-Kurshomepage mit unverändertem Include in index.qmd. README enthält Kursrahmen und Lernziele; TEMPLATE.md enthält die technische Anleitung und verweist auf getrennte Autorenbeispiele. |

## Validierung und Umgebungsgrenzen

- 68 Build-, Paket-, Quizvalidator-, Aktivierungs-, TeX-Konfigurations- und Lua-Pfadtests mit aktivierter gepinnter Toolchain erfolgreich, keine übersprungenen Tests; Bash- und Python-Syntax geprüft. CI führt diese Tests nach Einrichtung und Aktivierung der gemeinsamen Toolchain aus.
- Neun Quiz-CSV-Dateien mit insgesamt 90 Fragen bestehen den neuen Formatvalidator.
- Die Quelle des Python-Beispiels, Referenzlösung und das frisch entpackte ZIP erfüllen jeweils ihren exakten Prüfvertrag. Die vorhandenen TODOs bleiben unverändert.
- Website mit neuem Quarto 1.11.9 erfolgreich für zehn Quellen gebaut. Browserprüfung: neun Vorlesungen mit 480 Folien, 435 gesetzten MathJax-Ausdrücken und 93 Bildplatzierungen; keine fehlenden Notizen, Bilder oder JavaScriptfehler und keine tatsächlichen Inhaltsüberläufe. 37 repräsentative Screenshots sowie die Homepage wurden visuell geprüft. Ein interner MathJax-Strut auf VL7/Folie 17 wurde anhand des sichtbaren Wrappers und eines Screenshots als Geometrie-Fehlalarm eingegrenzt.
- Vollständiger Aufruf `python3 scripts/build-materials.py all` mit aktivierter gemeinsamer Toolchain erfolgreich: zehn Websitequellen, neun PDF-Handouts und zehn Aufgabenquellen in beiden Profilen. Insgesamt entstehen 29 Material-PDFs. Die finalen Folien-HTMLs sind bytegleich zur browsergeprüften Fassung.
- Alle neun Handouts mit 310 Seiten enthalten die erwarteten 480 Notizblöcke einschließlich der Titelfolien. 20 Seiten wurden tatsächlich visuell geprüft; die Textgrenzenprüfung über alle 310 Seiten ist unauffällig. Die neun veröffentlichten PDFs stimmen SHA-256-genau mit den sichtgeprüften Stagingdateien überein. Die vollständige Datenpfadübersicht in VL5 bleibt im erhaltenen Layout klein und profitiert von PDF-Zoom; dies ist keine neue Regression.
- Anschließend wurde für das eigenständige Labprojekt `lang: de` ergänzt und `python3 scripts/build-materials.py labs` erneut erfolgreich ausgeführt. Alle 20 Aufgaben-/Lösungs-PDFs wurden dabei neu erstellt. Prüfung der finalen 29 PDFs mit insgesamt 509 Seiten: deutsche PDF-Sprachmetadaten, keine Textspannen außerhalb des Seitenblatts, keine Unicode-Ersatzzeichen, korrekte Zuordnung der Aufgaben zu beiden Profilen und Musterlösungsmarkierungen ausschließlich in der Lösungsfassung. Öffentliche PDFs und Kompatibilitätskopien stimmen bytegenau überein. Die Probeklausur behält 60 Minuten, 60 Punkte und ihre bisherige Store-Transferaufgabe.
- Aus den finalen Aufgaben- und Lösungsfassungen wurden 23 Seiten visuell geprüft, einschließlich beider Probeklausur-Deckblätter und der Store-Codierungsaufgabe mit vollständiger Musterlösung. Zusammen mit den Handouts sind dies 43 tatsächlich sichtgeprüfte PDF-Seiten, ohne neue Layoutmängel. Die übrigen Seiten wurden automatisch auf Textgrenzen und Ersatzzeichen geprüft; eine vollständige Sichtprüfung jeder Seite und ein erneuter fachlicher Gesamtdurchgang werden nicht behauptet.
- WaveDrom offline in vier Verzeichnistiefen als einzelne HTML-Dokumente und als Website gerendert; die relativen Bildpfade und die mitveröffentlichte Cachedatei sind korrekt. Alle vier Einzelansichten wurden im Browser unter einem URL-Unterpfad mit erfolgreich geladenem SVG geprüft und ein Screenshot visuell kontrolliert. Der Import enthielt einen Fehler bei der Auflösung relativer Cachepfade; dieser sowie die auf zwei Elternverzeichnisse begrenzte Cache-Suche sind korrigiert und durch 14 Lua-Regressionstests abgesichert.

Die gepinnte Chrome-Version 157 ist durch den Cloudproxy noch nicht herunterladbar; für die dokumentierte Browserprüfung wurde das vorhandene Chromium 151 verwendet. Externe Google-Fonts antworten im Cloudnetz mit 403, deshalb wurden die vorgesehenen Ersatzschriften genutzt. MathJax wurde mit TLS-prüfendem curl und System-CA geladen, ohne Zertifikatsprüfungen abzuschalten.

Der ursprüngliche TinyTeX-Pin enthält weder `luatexbase.sty` noch `ngerman.ldf`. Der erste Gesamtbuild scheiterte daran. Das gemeinsame Setup ergänzt `luatexbase`, `ctablestack`, `selnolig`, deutsches Babel und Trennressourcen aus den beiden SHA-256-geprüften Debian-Paketen `texlive-luatex` und `texlive-lang-german`, Version `2026.20260911-1`. Die Prüfsummen wurden anhand signierter Debian-Paketmetadaten geprüft. Anschließend registriert `scripts/configure-tex.sh` die deutschen Muster lokal und baut die beiden benötigten Formate neu; dadurch verwendet Babel tatsächlich deutsche statt englischer Muster. Beide TeX-Engines bestehen den deutschen PDF-Smoke-Test ohne Trennmusterwarnung. Ein Marker sichert die wiederholbare Nachrüstung vorhandener Installationen. Lokale Fontconfig stellt die mitgelieferten OpenType-Schriften für XeTeX bereit und erhält die System-Ersatzschriften. Es erfolgen keine unversionierten `tlmgr`-Updates. Ein erneuter regulärer Setup-Aufruf installiert die Renderwerkzeuge und scheitert erst am blockierten Chrome-Download; ein vollständiger Setup-Erfolg wird deshalb nicht behauptet.

Für `storage.googleapis.com` (gepinntes Chrome-Archiv) und `kroki.io` (PlantUML bei Cache-Miss) wurde ein Umgebungsentwurf gespeichert. Dieser ändert noch nicht die aktive Netzwerkpolicy; dafür sind Prüfung, Speichern und Veröffentlichung in den Umgebungseinstellungen erforderlich. Die aktiven MCT1-Materialien enthalten derzeit keine Mermaid-/WaveDrom-/PlantUML-Renderblöcke, sondern vorhandene SVG-/PDF-Paare.
