.data
.align 2
puffer: .word 0, 0
.text
.globl main
main:
    la s0, puffer
Beobachtung:
    addi t0, x0, -13
    addi t1, t0, 21
    or t2, t0, t1
    sw t2, 4(s0)
    lw t3, 4(s0)
    and t4, t3, t1
    beq t4, t1, Pass
    addi t5, x0, -1
    beq x0, x0, inspect
Pass:
    addi t5, t4, 4
inspect:
    beq x0, x0, inspect
