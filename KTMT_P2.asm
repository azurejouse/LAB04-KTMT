        .data
msg:    .asciiz "The factorial of 10 is "

        .text
main:   li   $a0, 10          # n = 10
        jal  fact
        move $t0, $v0         # c?t k?t qu?

        la   $a0, msg
        li   $v0, 4
        syscall
        move $a0, $t0
        li   $v0, 1
        syscall

        li   $v0, 10
        syscall

fact:   addi $sp, $sp, -8     # c?p 2 ô: $ra và $a0
        sw   $ra, 4($sp)      # l?u ??a ch? quay v?
        sw   $a0, 0($sp)      # l?u n

        slti $t0, $a0, 1      # t0 = (n < 1)
        beq  $t0, $zero, L1   # n >= 1 -> ?i nhánh ?? quy

        li   $v0, 1           # n < 1: return 1
        addi $sp, $sp, 8      # pop (không c?n khôi ph?c vì ch?a ??i $ra, $a0)
        jr   $ra

L1:     addi $a0, $a0, -1     # n - 1
        jal  fact             # fact(n-1), k?t qu? trong $v0
        lw   $a0, 0($sp)      # khôi ph?c n c?a l?n g?i này
        lw   $ra, 4($sp)      # khôi ph?c ??a ch? quay v?
        addi $sp, $sp, 8
        mul  $v0, $a0, $v0    # n * fact(n-1)
        jr   $ra