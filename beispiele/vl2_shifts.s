# Shifts, RV32I. Statisch geprueft.
# t0=-3=0xFFFFFFFD, sra/srai um 1 -> 0xFFFFFFFE = -2
# srl um 1 -> 0x7FFFFFFE
# sll mit Register 32: effektive Weite 0, t6 bleibt -3

    .text
    .globl main
main:
    li   t0, -3
    li   t1, 1
    sra  t2, t0, t1
    srl  t3, t0, t1
    srai t4, t0, 1
    li   t5, 32
    sll  t6, t0, t5
Ergebnis_pruefen:
    li   a0, 10
    ecall
