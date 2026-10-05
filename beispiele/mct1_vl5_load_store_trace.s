# Lehrbeispiel Einheit 5. la/li/ecall sind Ripes-Setup.
# Zwei Woerter: 99 an B, 88 an B+4. B ist die echte Adresse von werte.
# lw a0, 4(s1) = 0x0044A503, wenn s1=x9 und a0=x10.
# Little Endian der Kursumgebung: 99 = 63 00 00 00, 88 = 58 00 00 00.
# Statisch geprueft, nicht in Ripes ausgefuehrt.

    .data
werte:
    .word 99, 88

    .text
    .globl main
main:
    la s1, werte
trace_lw:
    lw a0, 4(s1)
after_lw:
trace_sw:
    sw a0, 0(s1)
after_sw:
    li a7, 10
    ecall
