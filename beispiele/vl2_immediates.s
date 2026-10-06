# Masken und grosse Konstanten. Statisch geprueft.
# s1=5, s2=0x85, s3=0xFFFFFF5A, s4=2048, s5=50000
# s8 = 0x12345ABC AND 0xFFF = 0xABC
# s-Register hier nur im Hauptprogramm, keine Funktionskonvention.

    .text
    .globl main
main:
    li   s0, 0xA5
    andi s1, s0, 0x0F
    ori  s2, s1, 0x80
    xori s3, s0, -1
    li   s4, 2048
    li   s5, 50000
    li   s6, 0x12345ABC
    li   s7, 4095
    and  s8, s6, s7
Ergebnis_pruefen:
    li   a0, 10
    ecall
