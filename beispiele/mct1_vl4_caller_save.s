# Einheit 4: Caller schützt den nach dem Aufruf noch benötigten t0-Wert.
# Voraussetzung: gültiger 16-Byte-ausgerichteter Anfangsstack S.
# Ergebnis_pruefen: a0=35, t0=5, sp=S. Helfer setzt t0 absichtlich 999.
# Kurs-Venus: Druckdienst a0=1, Wert a1; Exit a0=10.
# main endet mit Exit und ist kein normal zurückkehrendes Callee.
# Werte sind Modellvorhersagen, keine Venus-Messung.
    .text
    .globl main
main:
    li   t0, 5
    addi sp, sp, -16
    sw   t0, 12(sp)
    li   a0, 15
    jal  ra, VerdoppleMitTemp
    lw   t0, 12(sp)
    addi sp, sp, 16
    add  a0, a0, t0
Ergebnis_pruefen:
    mv   a1, a0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
VerdoppleMitTemp:
    slli a0, a0, 1
    li   t0, 999
    ret
