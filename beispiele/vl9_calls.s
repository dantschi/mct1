# Zwei manuelle RV32I-Lehrfunktionen, kein eigenstaendiger Programmeinstieg.
# a0: int-Parameter und Ergebnis, normale ILP32-Aufrufkonvention.
# Voraussetzung: gueltiger, 16-Byte-ausgerichteter Stack.
# Beim Vergleich mit C muessen Verdopplung und Addition definiert sein.

.text
.globl double_plus_one
.globl calc
double_plus_one:
    addi sp, sp, -16
    sw ra, 12(sp)
    call calc
    addi a0, a0, 1
    lw ra, 12(sp)
    addi sp, sp, 16
    ret
calc:
    slli a0, a0, 1
    ret
