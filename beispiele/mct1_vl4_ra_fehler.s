# ABSICHTLICH FEHLERHAFT. Nicht als Vorlage verwenden.
# Lehrbeispiel: ungesichertes ra erzeugt einen ret-Selbstloop.
# Kein Frame, damit der ra-Fehler nicht mit einem sp-Fehler vermischt wird.
# Statisch geprueft, nicht in Venus ausgefuehrt.
#
# Erwartung: Sum_bad.ret erreicht calc_bad_return.
# Dort springt ret wieder auf calc_bad_return, weil ra diese Adresse behaelt.
# main_after_calc_bad wird nie erreicht.
# Die Uebung mit wenigen Steps ansehen, nicht endlos mit Run laufen lassen.

    .text
    .globl main
main:
    jal ra, Calc_bad
main_after_calc_bad:
    li a0, 10
    ecall

Calc_bad:
    jal ra, Sum_bad
calc_bad_return:
    ret

Sum_bad:
    ret
