# Vollstaendiges manuelles RV32I-Lehrprogramm fuer Ripes.
# Ein D-Pad und eine LED-Matrix einrichten und Exports pruefen:
# D_PAD_0_BASE, LED_MATRIX_0_BASE. Keine festen Basisadressen!
# D-Pad: Wortoffsets UP=0, DOWN=4, LEFT=8, RIGHT=12.
# Pro Gruppe jedes Register einmal lesen, niedrigstes Bit verwenden.
# LED-Pixel 0: dokumentiertes RGB-Format 0x00RRGGBB.
# Start: S0, Eingabe gesperrt bis zur ersten vollstaendig leeren Gruppe.
# Mehrfachdruck verbraucht eine Gruppe ohne Ereignis; Loslassen erforderlich.
# Keine physikalische Entprellung; vier Lesezugriffe sind nicht atomar.
# s0=Zustand, s1=D-Pad-Basis, s2=LED-Basis, s3=Freigabe (0/1).
# main kehrt nie zurueck. Alle Hilfsfunktionen sind Blattfunktionen
# und erhalten s0..s11 sowie sp. Kein ecall, kein Stackframe.

.text
.globl main
main:
    li s0, 0
    li s1, D_PAD_0_BASE
    li s2, LED_MATRIX_0_BASE
    li s3, 0
main_loop:
    mv a0, s1
    call read_sample
    mv t0, a0
    li a1, 0
    beq s3, zero, wait_release
    beq t0, zero, update
    li s3, 0
    li t1, 1
    beq t0, t1, event_up
    li t1, 2
    beq t0, t1, event_down
    li t1, 8
    beq t0, t1, event_right
    li t1, 4
    beq t0, t1, event_reset
    j update
wait_release:
    bne t0, zero, update
    li s3, 1
    j update
event_up:
    li a1, 1
    j update
event_down:
    li a1, 2
    j update
event_right:
    li a1, 3
    j update
event_reset:
    li a1, 4
update:
    mv a0, s0
    call next_state
    mv s0, a0
    call state_colour
    sw a0, 0(s2)
    j main_loop

# a0=D-Pad-Basis -> a0=Maske U:1, D:2, L:4, R:8.
# Noch keine Ereignisse erzeugen. Alle vier Richtungen einmal lesen.
read_sample:
    lw t0, 0(a0)
    andi t0, t0, 1
    lw t1, 4(a0)
    andi t1, t1, 1
    slli t1, t1, 1
    lw t2, 8(a0)
    andi t2, t2, 1
    slli t2, t2, 2
    lw t3, 12(a0)
    andi t3, t3, 1
    slli t3, t3, 3
    or t0, t0, t1
    or t0, t0, t2
    or a0, t0, t3
    ret

# a0=gueltiger Zustand 0..3 -> a0=RGB-Wort fuer Pixel 0.
state_colour:
    beq a0, zero, colour_red
    li t0, 1
    beq a0, t0, colour_yellow
    li t0, 2
    beq a0, t0, colour_blue
    li a0, 0x0000FF00
    ret
colour_red:
    li a0, 0x00FF0000
    ret
colour_yellow:
    li a0, 0x00FFFF00
    ret
colour_blue:
    li a0, 0x000000FF
    ret

# Manuelle Lehrfunktion. a0 = Zustand 0..3, a1 = Ereignis 0..4.
# 0 keine Aktion, 1 UP, 2 DOWN, 3 RIGHT, 4 RESET.
# Ergebnis in a0. Kein Frame, keine s-Register. Kein Venus-Dienst.

next_state:
    li t0, 3
    bgtu a0, t0, next_zero
    li t0, 4
    beq a1, t0, next_zero
    beq a1, zero, next_keep
    beq a0, zero, from_s0
    li t0, 1
    beq a0, t0, from_s1
    li t0, 2
    beq a0, t0, from_s2
    li a0, 3
    ret
from_s0:
    li t0, 1
    beq a1, t0, next_one
    j next_zero
from_s1:
    li t0, 2
    beq a1, t0, next_two
    j next_zero
from_s2:
    li t0, 3
    beq a1, t0, next_three
    j next_zero
next_keep:
    ret
next_zero:
    li a0, 0
    ret
next_one:
    li a0, 1
    ret
next_two:
    li a0, 2
    ret
next_three:
    li a0, 3
    ret
