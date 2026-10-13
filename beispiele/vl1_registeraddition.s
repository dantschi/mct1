# Vollstaendiges manuelles RV32I-Lehrprogramm fuer Ripes.
# Voraussetzungen: RV32I-Prozessormodell, keine Ein-/Ausgabegeraete.
# Nach den ersten drei Anweisungen: x5=7, x6=3, x7=10, x0=0.
# main ist der Einstieg. Die Schleife dient dem Halten zur Inspektion.
# Kein Systemdienst, keine Behauptung ueber einen ausgefuehrten Ripes-Lauf.

.text
.globl main
main:
    addi x5, x0, 7
    addi x6, x0, 3
    add x7, x5, x6
inspect:
    j inspect
