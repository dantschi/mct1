# Musterlösung zu Einheit 3 und Laboraufgabe 7: Summe = 150.
# Kurs-Venus: Druck a0=1, Argument a1; Ende a0=10.
# Prüfpunkt Ergebnis_pruefen liegt VOR mv a1, s0: s0=150, t0=5.
# Voraussetzung: 0 <= N <= 5; t1 enthält die Anzahl N.
# N=0: kein lw, Summe 0. N=1: ein lw, Summe 10.
# N=5: fünf lw, sechs Tests, s1 danach Basis+20; kein Load dort.
# Modellvorhersagen, keine Venus-Messung. s-Register im Hauptprogramm.

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
Ergebnis_pruefen:
    mv   a1, s0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
