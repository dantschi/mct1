# Lehrwerte zu Einheit 1

Didaktische Sollwerte, keine Hardwaremessungen. Jede Bitbreite und Lesart ist ausdrücklich angegeben. Little Endian und positive Registerflanke sind Festlegungen der Kursumgebung beziehungsweise des Lehrmodells.

## Binär und Hexadezimal

- $42_{10}=0010\,1010_2=\mathtt{0x2A}$ bei acht Bit.
- $85_{10}=0101\,0101_2=\mathtt{0x55}$ bei acht Bit.
- `0xDA3F` entspricht `1101 1010 0011 1111` bei 16 Bit.
- Ein Byte hat zwei Hexziffern, ein 32-Bit-RISC-V-Word acht.

## Zweierkomplement

- Acht Bit: `0x05` → invertiert `0xFA` → plus eins `0xFB`.
- `0xFB` ist vorzeichenlos 251, als Acht-Bit-Zweierkomplement −5.
- Vorzeichenerweiterung: `0xFFFFFFFB`. Nullerweiterung: `0x000000FB`.
- `0x55` → `0xAA` → `0xAB`. Letzteres ist vorzeichenlos 171 oder als Acht-Bit-Zweierkomplement −85.
- Vorzeichenerweiterung von `0xAB`: `0xFFFFFFAB`.
- Der kleinste Acht-Bit-Wert −128, `0x80`, bleibt bei modularer Negation `0x80`. Das mathematische Gegenstück +128 passt nicht.
- Zweimalige modulare Negation erhält jedes Ausgangsmuster, einschließlich `0x80`.

## Übertrag und Signed-Überlauf, acht Bit

| Rechnung | Untere acht Bit | Übertrag | Signed-Überlauf |
|---|---|---:|---|
| `0x7F + 1` | `0x80` | 0 | Ja |
| `0xFF + 1` | `0x00` | 1 | Nein |

## Bytes von 0x12345678 ab angenommener Adresse 0x1000

| Adresse | Little Endian | Big Endian |
|---|---|---|
| `0x1000` | `0x78` | `0x12` |
| `0x1001` | `0x56` | `0x34` |
| `0x1002` | `0x34` | `0x56` |
| `0x1003` | `0x12` | `0x78` |

Für `0xAABBCCDD` lautet die Folge DD, CC, BB, AA beziehungsweise AA, BB, CC, DD. `0x1000` ist für vier Byte natürlich ausgerichtet, `0x1001` nicht. $2^{32}$ Byteadressen umfassen vier GiB Adressraum, unabhängig vom installierten RAM.

## Auswahl und Addition

- Multiplexer mit S gleich null wählt A, mit S gleich eins B.
- Volladdierer: $A+B+C_{\mathrm{in}}=S+2C_{\mathrm{out}}$.
- Bei drei Einsen sind S und C_out beide eins. Ein Halbaddierer hat keinen C_in.
- Vier-Bit-Addition `0110 + 0101` mit C0 gleich null ergibt `1011`, vorzeichenlos elf, finaler Übertrag null.
- Vier-Bit-Subtraktion sieben minus drei: `0111 + 1100 + 1 = 10100`. Gespeichert werden `0100`, vier. Nur der erste Carry-Eingang ist eins.

## Register und Zeit

- Angenommene Periode zehn Nanosekunden entspricht 100 Megahertz.
- Wortregister, Anfang Q gleich drei: aktive Flanken mit (D, WE) gleich (5, 1), (7, 0), (9, 1) liefern Q gleich fünf, fünf, neun.
- Änderungen ohne aktive Flanke ändern Q im gewählten Modell nicht.
- Bei erfüllten Setup-/Hold-Bedingungen gilt der neue Ausgang nach der Clock-to-Q-Verzögerung.

## Registeraddition

`beispiele/vl1_registeraddition.s` ist ein vollständiges manuelles Ripes-Lehrprogramm. Die ersten drei Rechenanweisungen erzeugen x5 gleich sieben, x6 gleich drei und x7 gleich zehn; x0 bleibt null. Die anschließende Schleife erhält diese Datenregister. Ein tatsächlicher Ripes-Lauf muss separat protokolliert werden.
