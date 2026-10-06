# Venus-Lehrkonvention: Dienstnummer in a0, erstes Argument in a1.
# Dienst 4 druckt einen nullterminierten String, Dienst 10 beendet.
# In dieser Fassung nicht in Venus ausgefuehrt.

.data
msg: .asciiz "Hello World!\n"

.text
.globl main
main:
    la a1, msg
    li a0, 4
    ecall
    li a0, 10
    ecall
