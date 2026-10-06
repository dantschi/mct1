# Lehrwerte Einheit 1

Alle Zahlen sind Lehrwerte. Annahmen: feste genannte Bitbreite, Zweierkomplement für signed Werte, Little Endian nur als Kursumgebung.

## Darstellung

- 42 = 0x2A = 00101010 bei acht Bit.
- 0xDA3F = 1101 1010 0011 1111.
- 0xCAFEBABE = 1100 1010 1111 1110 1011 1010 1011 1110.
- 0xFB ist unsigned 251 und signed acht Bit minus 5.
- Vorzeichenerweiterung: 0xFFFFFFFB. Nullerweiterung: 0x000000FB.
- Vier Bit: 1000 bleibt bei modularer Negation 1000 und bedeutet signed minus 8. 0111 ist plus 7.

## Übertrag und Overflow, acht Bit

- 0x7F plus 1 wird 0x80. Carry-Out ist 0, signed Overflow liegt vor.
- 0xFF plus 1 wird 0x00. Carry-Out ist 1. Signed ist das minus 1 plus 1 gleich 0.

## Bytes ab illustrativer Adresse 0x100 für 0x12345678

| Adresse | Little Endian | Big Endian |
|---------|---------------|------------|
| 0x100 | 0x78 | 0x12 |
| 0x101 | 0x56 | 0x34 |
| 0x102 | 0x34 | 0x56 |
| 0x103 | 0x12 | 0x78 |

## Volladdierer

A, B und Cin ergeben S und Cout. Die Summe A+B+Cin entspricht S plus 2 mal Cout. Bei drei Einsen sind S und Cout beide 1. Ein Halbaddierer hat kein Cin.

## Vier-Bit-Addition 0111 plus 0001

Ergebnis 1000. Unsigned 8, signed Vier-Bit-Zweierkomplement minus 8. Cout der obersten Stelle ist 0.

## Vier-Bit-Subtraktion 7 minus 3

NOT von 0011 ist 1100. Nur C0 ist 1. Die unteren vier Bits sind 0100.

## Registerbank

Anfang: x5 gleich 7, x6 gleich 3, x7 gleich 0. Nach add x7, x5, x6 und Schreibflanke mit WE3 gleich 1 ist x7 gleich 10. x0 bleibt 0.
