# Lehrbeispiel Einheit 3. If/Else, Venus-Exit a0=10.
# s1=7: t0=1 vor dem ecall. Fuer den zweiten Versuch s1 auf 8 setzen
# und neu starten: dann t0=2. Statisch geprueft.

    .text
    .globl main
main:
    li   s0, 7
    li   s1, 7
    bne  s0, s1, ElseBlock
    li   t0, 1
    j    EndIf
ElseBlock:
    li   t0, 2
EndIf:
    li   a0, 10
    ecall
