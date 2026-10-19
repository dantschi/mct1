.data
.align 2
daten: .word 0, -9
.text
.globl main
main:
    la s0, daten
    li t1, 30
    li a5, 1
    li a6, 99
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
Kern:

    lw t2, 4(s0)
    sub a0, t1, t2
    addi a5, a5, 2
    xor a6, a6, a6

Ende_Kern:
    beq x0, x0, Ende_Kern
