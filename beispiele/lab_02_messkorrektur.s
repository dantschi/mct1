.text
.globl main
main:
    li t0, 12
    li t1, 19
    li t2, 5
    sub t3, t0, t1
    slli t4, t2, 2
    add t5, t3, t4
Ergebnis_pruefen:
    addi a1, t5, 0
    addi a0, x0, 1
    ecall
    addi a0, x0, 10
    ecall
