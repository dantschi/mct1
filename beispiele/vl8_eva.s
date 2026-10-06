# Venus: fester Eingangswert 21, Ausgabe 42 und Zeilenumbruch, dann Exit.
# n steht vor dem String, damit ein ausgerichtetes Datensegment nicht durch
# einen vorangehenden String verschoben wird. Nicht in Venus ausgefuehrt.

.data
n: .word 21
newline: .asciiz "\n"

.text
.globl main
main:
    la t0, n
    lw t1, 0(t0)
    slli a1, t1, 1
    li a0, 1
    ecall
    la a1, newline
    li a0, 4
    ecall
    li a0, 10
    ecall
