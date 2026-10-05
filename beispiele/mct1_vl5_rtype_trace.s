# Lehrbeispiel Einheit 5. li/ecall sind Ripes-Setup, nicht das Basissubset.
# Exit nach der Ripes-Konvention dieser Einheit: Dienst 10 in a7.
# Statisch geprueft, nicht in Ripes ausgefuehrt.
# add a0, t0, t1 mit t0=x5, t1=x6, a0=x10: Codierung 0x00628533.

    .text
    .globl main
main:
    li t0, 50
    li t1, 100
trace_add:
    add a0, t0, t1
after_add:
    li a7, 10
    ecall
