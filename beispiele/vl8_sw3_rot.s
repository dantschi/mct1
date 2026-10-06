# SW3 aktiv -> erster Pixel rot, sonst schwarz.
# SWITCHES_0_BASE und LED_MATRIX_0_BASE muessen aus dem Ripes-Export stammen.
# Illustrative Lehrvorlage, in dieser Fassung nicht in Ripes ausgefuehrt.

.text
.globl main
main:
    li s1, SWITCHES_0_BASE
    li s2, LED_MATRIX_0_BASE
loop:
    lw t0, 0(s1)
    andi t1, t0, 8
    beq t1, zero, off
    li t2, 0x00FF0000
    j store
off:
    li t2, 0
store:
    sw t2, 0(s2)
    j loop
