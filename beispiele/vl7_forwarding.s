# Lehrprogramme Einheit 7. Ripes: Dienst 10 in a7. Kein UI-Lauf in dieser Fassung.
# Relative Kernzählung beginnt beim IF der markierten Kernfolge.

.text
.globl main
main:
    addi t0, x0, 50
    addi t1, x0, 100
    addi t2, x0, 0
    addi a0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
Kern:
    add  t2, t0, t1
    sub  a0, t2, t0
Ablauf:
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi a7, x0, 10
    ecall
