.text
.globl main
main:
    li s1, 77
    li a0, 19
    li a1, 6
    jal ra, Versatz
Ergebnis_pruefen:
    addi a1, a0, 0
    addi a0, x0, 1
    ecall
    addi a0, x0, 10
    ecall
Versatz:
    addi sp, sp, -16
    sw ra, 0(sp)
    sw s1, 4(sp)
    addi s1, a1, 0
    jal ra, Differenz
    sub a0, a0, s1
    lw s1, 4(sp)
    lw ra, 0(sp)
    addi sp, sp, 16
    ret
Differenz:
    sub a0, a0, a1
    ret
