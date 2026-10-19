.data
.align 2
paket: .word -24, 17, 0, 0x11223344
.text
.globl main
main:
    la s2, paket
    addi s2, s2, 12
    li a2, 40
    li a1, 22
    li a3, 99
    li t0, -24
trace_or:
    or a3, a2, a1
trace_load:
    lw a2, -12(s2)
trace_store:
    sw a2, -4(s2)
trace_beq:
    beq a2, t0, taken
not_taken:
    or a4, x0, x0
    beq x0, x0, inspect
taken:
    or a4, t0, x0
inspect:
    beq x0, x0, inspect
