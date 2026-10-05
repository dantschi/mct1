# Lehrbeispiel Einheit 3, RV32I, ILP32, Little Endian, Venus.
# Exit: li a0, 10 / ecall. Statisch geprueft, nicht in Venus ausgefuehrt.
# Erwartung am Label Ergebnis_pruefen: s0=30, t0=12, t1=42.
# Array danach: 10, 20, 30, 42, 50.

    .data
myArray:
    .word 10, 20, 30, 40, 50
    .text
    .globl main
main:
    la   s1, myArray
    lw   s0, 8(s1)
    li   t0, 12
    add  t1, s0, t0
    sw   t1, 12(s1)
Ergebnis_pruefen:
    li   a0, 10
    ecall
