# Einheit 4: Leaf-Funktion ohne Frame, RV32I.
# Kurs-Venus: Argument/Ergebnis a0, Druckdienst a0=1 mit Wert a1,
# Exit a0=10. Ergebnis_pruefen: a0=30 für Eingabe 15.
# Werte sind Modellvorhersagen, keine Venus-Messung.
    .text
    .globl main
main:
    li   a0, 15
    jal  ra, Verdopple
Ergebnis_pruefen:
    mv   a1, a0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
Verdopple:
    slli a0, a0, 1
    ret
