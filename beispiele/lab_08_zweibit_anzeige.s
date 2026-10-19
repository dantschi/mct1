# RV32I-Ripes: SWITCHES_0_BASE und LED_MATRIX_0_BASE aus echtem Plattformexport.
# Mindestens zwei aktive High-Schalter und zwei Pixel, Format 0x00RRGGBB.
.text
.globl main
main:
    li s1, SWITCHES_0_BASE
    li s2, LED_MATRIX_0_BASE
Loop:
    lw t0, 0(s1)
    andi t1, t0, 3
    li t3, 3
    beq t1, t3, Yellow
    li t3, 2
    beq t1, t3, Blue
    li t2, 0
    jal x0, Store
Yellow:
    li t2, 0x00C0C000
    jal x0, Store
Blue:
    li t2, 0x000000C0
Store:
    sw t2, 4(s2)
    jal x0, Loop
