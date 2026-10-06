# Lehrprogramm Einheit 6, Ripes-Konvention: Dienstnummer in a7, Exit mit 10.
# Lehrwerte. la kann mehrere native Instruktionen erzeugen.
# Haltepunkt Beobachtung: nach der Zeigerinitialisierung.
# Haltepunkt Pruefpunkt: t0=5, t1=10, t2=10, t3=1, Speicherwort=10.

.data
.align 2
slot:
    .word 0

.text
.globl main
main:
    la s1, slot

Beobachtung:
    addi t0, x0, 5
    add  t1, t0, t0
    sw   t1, 0(s1)
    lw   t2, 0(s1)
    beq  t0, t1, Falsch_angenommen
    addi t3, x0, 1
    beq  t1, t2, Pruefpunkt

Falsch_angenommen:
    addi t3, x0, 99

Pruefpunkt:
    addi a7, x0, 10
    ecall
