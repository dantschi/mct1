# Optionale Reserve Einheit 4, ausschließlich RV32I.
# SumDown(n): Summe 1 bis n; Vorbedingung 0 <= n <= 6.
# Anfangsstack S gültig und 16-Byte-ausgerichtet; 16*n Byte Reserve.
# Basisfall n=0: Leaf ohne Frame; sonst eigener ra-/s0-Frame.
# Ergebnis_pruefen für n=3: a0=6, s0=99, sp=S.
# Kurs-Venus: Druck a0=1, Wert a1; Exit a0=10.
# Werte sind Modellvorhersagen, keine Venus-Messung.
    .text
    .globl main
main:
    li   s0, 99
    li   a0, 3
    jal  ra, SumDown
Ergebnis_pruefen:
    mv   a1, a0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
SumDown:
    beq  a0, x0, Base
    addi sp, sp, -16
    sw   ra, 12(sp)
    sw   s0, 8(sp)
    mv   s0, a0
    addi a0, a0, -1
    jal  ra, SumDown
    add  a0, a0, s0
    lw   s0, 8(sp)
    lw   ra, 12(sp)
    addi sp, sp, 16
    ret
Base:
    li   a0, 0
    ret
