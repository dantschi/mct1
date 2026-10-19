.data
.align 2
messwerte: .word -5, 8, -2, 7, -1, 0
.text
.globl main
main:
    la s1, messwerte
    addi t0, x0, 0
    addi t1, x0, 6
    addi s0, x0, 0
Loop:
    bgeu t0, t1, Ergebnis_pruefen
    lw t2, 0(s1)
    bge t2, x0, Next
    addi s0, s0, 1
Next:
    addi s1, s1, 4
    addi t0, t0, 1
    jal x0, Loop
Ergebnis_pruefen:
    addi a1, s0, 0
    addi a0, x0, 1
    ecall
    addi a0, x0, 10
    ecall
