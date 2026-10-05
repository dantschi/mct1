# Lehrbeispiel Einheit 3. Little Endian. Venus-Exit a0=10.
# Statisch geprueft, nicht in Venus ausgefuehrt.
# byteValues 0x007FFF80 liegt als 80 FF 7F 00.
# halfValue 0x00008000 beginnt mit Halfword 0x8000.
# Am Pruefpunkt:
# t0=0xFFFFFF80, t1=0x00000080, t2=0xFFFFFFFF, t3=0x000000FF, t4=0x0000007F
# t5=0xFFFF8000, t6=0x00008000, a2 bleibt 0x11223344
# target: 0xAAAAAA44 und 0xBBBB3344

    .data
byteValues:
    .word 0x007FFF80
halfValue:
    .word 0x00008000
target:
    .word 0xAAAAAAAA, 0xBBBBBBBB
    .text
    .globl main
main:
    la   s1, byteValues
    lb   t0, 0(s1)
    lbu  t1, 0(s1)
    lb   t2, 1(s1)
    lbu  t3, 1(s1)
    lb   t4, 2(s1)
    la   s1, halfValue
    lh   t5, 0(s1)
    lhu  t6, 0(s1)
    la   s2, target
    li   a2, 0x11223344
    sb   a2, 0(s2)
    sh   a2, 4(s2)
Ergebnis_pruefen:
    li   a0, 10
    ecall
