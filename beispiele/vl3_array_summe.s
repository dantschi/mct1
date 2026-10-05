# Lehrbeispiel Einheit 3. Summe 10+20+30+40+50 = 150.
# Venus: Druck a0=1, Argument a1; Ende a0=10.
# Haltepunkt Ergebnis_pruefen liegt VOR mv a1, a0: dort a0=s0=150, t0=5.
# Danach ist a0 die Dienstnummer. s0 bleibt 150.
# N=0: kein lw, Summe 0. N=1: Summe 10. Statisch geprueft.

    .data
myArray:
    .word 10, 20, 30, 40, 50
    .text
    .globl main
main:
    la   s1, myArray
    li   t0, 0
    li   t1, 5
    li   s0, 0
Loop:
    bge  t0, t1, Done
    lw   t2, 0(s1)
    add  s0, s0, t2
    addi s1, s1, 4
    addi t0, t0, 1
    j    Loop
Done:
    mv   a0, s0
Ergebnis_pruefen:
    mv   a1, a0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
