# Lehrbeispiel Einheit 4, RV32I, ILP32.
# Korrektes Programm: main -> Calc -> Sum.
# Werte sind didaktische Lehrwerte, keine Messung.
#
# Venus (Kurslink thaumicmekanism.github.io/venus, Linie 61c-teach/venus):
# Einstiegssymbol main, .globl main.
# Exit in dieser Kurskonvention: li a0, 10 / ecall.
# Der Simulator stellt beim Start einen Stack-Bereich bereit.
# Der konkrete Anfangswert von sp heisst hier S und ist durch 16 teilbar.
# Diese Datei wurde statisch geprueft, nicht in Venus ausgefuehrt.
#
# main ist der Simulator-Einstieg und endet mit ecall.
# main ist hier kein normal mit ret zurueckkehrendes Callee.
# Calc und Sum erfuellen den gezeigten Integer-Aufrufvertrag.

    .text
    .globl main
main:
    li s0, 99               # Eintrittswert, den Calc erhalten muss
    li a0, 5                # erstes Argument
    li a1, 10               # zweites Argument
    jal ra, Calc
main_after_calc:
    mv s1, a0               # Ergebnis 20 vor dem Exit sichtbar sichern
    li a0, 10               # Dienstnummer: Venus exit, kein Rechenergebnis
    ecall

Calc:
    addi sp, sp, -16
    sw ra, 12(sp)           # eigene Rueckkehradresse zu main
    sw s0, 8(sp)            # urspruenglicher Wert 99
    mv s0, a0               # urspruengliches Argument 5 wird noch benoetigt
    jal ra, Sum
calc_after_sum:
    add a0, a0, s0          # 15 + 5 = 20
    lw s0, 8(sp)            # Eintrittswert 99 wiederherstellen
    lw ra, 12(sp)           # Rueckkehradresse main_after_calc
    addi sp, sp, 16
    ret

Sum:
    add a0, a0, a1          # 5 + 10 = 15
    ret
