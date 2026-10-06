# Umlaufendes gruenes Lauflicht, 1x8 Pixel, Offsets 0..28.
# LED_MATRIX_0_BASE aus dem Export. 10000 Iterationen sind keine belegte Wartezeit.
# In dieser Fassung nicht in Ripes ausgefuehrt.

.text
.globl main
main:
    li s0, LED_MATRIX_0_BASE
    li s1, 8
    slli s2, s1, 2
    li s3, 0
    li s4, 0x0000FF00
clear:
    add t0, s0, s3
    sw zero, 0(t0)
    addi s3, s3, 4
    bltu s3, s2, clear
    li s3, 0
display:
    add t0, s0, s3
    sw s4, 0(t0)
    li t1, 10000
delay:
    addi t1, t1, -1
    bne t1, zero, delay
    sw zero, 0(t0)
    addi s3, s3, 4
    bltu s3, s2, display
    li s3, 0
    j display
