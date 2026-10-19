# Manuelle RV32I-Blattfunktion, kein eigenstaendiges Programm.
# a0: Arraybasis, a1: unsigned Laenge 0..6, Ausgabe a0.
# Elemente an geraden Indizes werden addiert; gueltige Region vorausgesetzt.
.text
.globl sum_even_positions
sum_even_positions:
    mv t0, a0
    li t1, 0
    li t2, 0
Loop:
    bgeu t1, a1, Ende
    slli t3, t1, 2
    add t4, t0, t3
    lw t5, 0(t4)
    add t2, t2, t5
    addi t1, t1, 2
    jal x0, Loop
Ende:
    mv a0, t2
    ret
