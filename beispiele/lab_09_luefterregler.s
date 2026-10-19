# Vollstaendiges RV32I-Lehrprogramm fuer Ripes.
# Echte Exports D_PAD_0_BASE und LED_MATRIX_0_BASE erforderlich.
# D-Pad-Wortoffsets UP=0, DOWN=4, LEFT=8, RIGHT=12; niedrigstes Bit.
# Farbe 0x00RRGGBB, Pixel 0. Keine Motoransteuerung.
# s0=Stufe, s1=Freigabe, s2=D-Pad-Basis, s3=LED-Basis.
# Keine Stackframes: main kehrt nie zurueck, alle Helfer sind Leafs.
.text
.globl main
main:
    li s0, 0
    li s1, 0
    li s2, D_PAD_0_BASE
    li s3, LED_MATRIX_0_BASE
Poll:
    mv a0, s2
    jal ra, read_mask
    mv t4, a0
    li a1, 0
    beq t4, x0, Release
    beq s1, x0, Update
    li s1, 0
    li t0, 1
    beq t4, t0, Plus
    li t0, 2
    beq t4, t0, Minus
    li t0, 4
    beq t4, t0, Stop
    jal x0, Update
Release:
    li s1, 1
    jal x0, Update
Plus:
    li a1, 1
    jal x0, Update
Minus:
    li a1, 2
    jal x0, Update
Stop:
    li a1, 3
Update:
    mv a0, s0
    jal ra, next_level
    mv s0, a0
    jal ra, level_colour
    sw a0, 0(s3)
    jal x0, Poll

read_mask:
    lw t0, 0(a0)
    lw t1, 4(a0)
    lw t2, 8(a0)
    lw t3, 12(a0)
    andi t0, t0, 1
    andi t1, t1, 1
    andi t2, t2, 1
    andi t3, t3, 1
    slli t1, t1, 1
    slli t2, t2, 2
    slli t3, t3, 3
    or t0, t0, t1
    or t0, t0, t2
    or a0, t0, t3
    ret

next_level:
    li t0, 2
    bltu t0, a0, LevelZero
    li t0, 3
    beq a1, t0, LevelZero
    li t0, 1
    beq a1, t0, Increase
    li t0, 2
    beq a1, t0, Decrease
    ret
Increase:
    li t0, 2
    beq a0, t0, Keep
    addi a0, a0, 1
    ret
Decrease:
    beq a0, x0, Keep
    addi a0, a0, -1
Keep:
    ret
LevelZero:
    li a0, 0
    ret

level_colour:
    li t0, 1
    beq a0, t0, Slow
    li t0, 2
    beq a0, t0, Fast
    li a0, 0
    ret
Slow:
    li a0, 0x000000C0
    ret
Fast:
    li a0, 0x00C0C0C0
    ret
