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
