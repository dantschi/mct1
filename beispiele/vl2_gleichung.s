# Musterlösung zur Gleichung in Vorlesung 2 und Laboraufgabe 7.
# Kurs-Venus: a0 Dienst, a1 Druckwert, Ende a0=10.
# Prüfpunkt Ergebnis_pruefen VOR addi a1: t4=15, t5=5, t6=10.
# Varianten (A,B,C,D): (0,0,0,0) -> 0, (5,1,10,2) -> -6,
# (-5,10,3,2) -> 0. Nach Änderungen neu assemblieren und starten.
# Die angegebenen Werte sind Modellvorhersagen, keine Venus-Messung.

    .text
    .globl main
main:
    li   t0, 5
    li   t1, 10
    li   t2, 3
    li   t3, 2
    add  t4, t0, t1
    add  t5, t2, t3
    sub  t6, t4, t5
Ergebnis_pruefen:
    addi a1, t6, 0
    li   a0, 1
    ecall
    li   a0, 10
    ecall
