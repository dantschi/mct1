.data
.align 2
slot:
    .word 0

.text
.globl main
main:
    la   s1, slot
    addi t0, x0, 1
    addi t1, x0, 1
    addi t2, x0, 77
    addi t3, x0, 0
    addi a0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
Kern:
    beq  t0, t1, Ziel
    sw   t2, 0(s1)
    addi t3, x0, 99
Ziel:
    addi a0, x0, 7
Ablauf:
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi a7, x0, 10
    ecall
