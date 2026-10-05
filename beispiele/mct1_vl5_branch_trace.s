# Lehrbeispiel Einheit 5. beq bleibt im Basissubset.
# beq x0, x0, done fuehrt die Wege zusammen, ohne jal.
# Das ist eine Lehrkonstruktion, kein allgemeiner Ersatz fuer j.
# Bei C aus und 4-Byte-Instruktionen: Offset trace_beq -> taken = +12 Byte.
# Durchlauf A: t1=5, genommen, spaeter a0=10.
# Durchlauf B: t1=6, nicht genommen, spaeter a0=0xFFFFFFFF.
# Vor B neu assemblieren und Reset. Statisch geprueft.

    .text
    .globl main
main:
    li t0, 5
    li t1, 5
trace_beq:
    beq t0, t1, taken
not_taken:
    sub a0, t0, t1
    beq x0, x0, done
taken:
    add a0, t0, t1
done:
    li a7, 10
    ecall
