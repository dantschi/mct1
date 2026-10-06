.text
.globl main
main:
    addi t0, x0, 10
    addi a0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
Loop:
    addi t0, t0, -1
    bne  t0, x0, Loop
Danach:
    addi a0, x0, 7
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi a7, x0, 10
    ecall
