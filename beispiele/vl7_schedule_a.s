# Variante A: Load-Use zwischen lw und add. Variante B steht in vl7_schedule_b.s.
.data
.align 2
array:
    .word 42

.text
.globl main
main:
    la   s1, array
    addi a5, x0, 0
    addi t0, x0, 0
    addi a0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
Kern:
    lw   t0, 0(s1)
    add  a0, t0, t0
    addi a5, a5, 1
Ablauf:
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi x0, x0, 0
    addi a7, x0, 10
    ecall
