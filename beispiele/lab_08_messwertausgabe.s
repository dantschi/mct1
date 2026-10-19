.data
.align 2
n: .word 17
praefix: .asciiz "Messwert: "
newline: .asciiz "\n"
.text
.globl main
main:
    la a1, praefix
    li a0, 4
    ecall
    la t0, n
    lw t1, 0(t0)
    slli t2, t1, 1
    add t2, t2, t1
    addi a1, t2, -4
    li a0, 1
    ecall
    la a1, newline
    li a0, 4
    ecall
    li a0, 10
    ecall
