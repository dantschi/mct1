.text
.globl main
main:
    addi x9, x0, 12
    addi x10, x0, 6
    addi x11, x0, 8
    add x9, x10, x11
    add x0, x9, x10
inspect:
    jal x0, inspect
