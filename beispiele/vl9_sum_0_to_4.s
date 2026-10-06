# Manuelle RV32I-Lehruebersetzung, kein Compileroutput.
# Ergebnis a0 = 10. t0 und t1 werden veraendert. Kein Frame.

sum_0_to_4:
    li a0, 0
    li t0, 0
    li t1, 5
sum_0_to_4_loop:
    bge t0, t1, sum_0_to_4_end
    add a0, a0, t0
    addi t0, t0, 1
    j sum_0_to_4_loop
sum_0_to_4_end:
    ret
