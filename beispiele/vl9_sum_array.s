# Manuelle RV32I-Lehrfunktion, kein eigenstaendiges Programm.
# a0: Basis eines gueltigen int-Arrays; a1: vorzeichenlose Laenge n.
# Ergebnis a0: Summe. Kein Zugriff fuer n=0.
# C-Vergleich: Alle vorzeichenbehafteten Zwischensummen sind darstellbar.
# ABI: nur a0 und t0..t5 veraendert, kein Stackframe.

.text
.globl sum_array
sum_array:
    mv t0, a0
    li t1, 0
    li t2, 0
sum_array_loop:
    bgeu t1, a1, sum_array_end
    slli t3, t1, 2
    add t4, t0, t3
    lw t5, 0(t4)
    add t2, t2, t5
    addi t1, t1, 1
    j sum_array_loop
sum_array_end:
    mv a0, t2
    ret
