.data
.align 2
werte: .word 12, 30, 0, 42
.text
.globl main
main:
    la s0, werte
    li t5, 99
start:
    lw t1, 0(s0)
    lw t2, 4(s0)
    add t3, t1, t2
    sw t3, 8(s0)
    lw t4, 12(s0)
    beq t3, t4, treffer
kein_treffer:
    add t5, x0, x0
    beq x0, x0, fertig
treffer:
    add t5, t3, x0
fertig:
    beq x0, x0, fertig
