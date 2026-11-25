 .data
msg1:   .asciiz "(a + b) - (c + d) = "
msg2:   .asciiz "\ne - f = "
 
        .text
main:   li $s0, 10            # a
        li $s1, 4             # b
        li $s2, 3             # c
        li $s3, 2             # d
        li $s4, 20            # e
        li $s5, 5             # f
 
        move $a0, $s0
        move $a1, $s1
        move $a2, $s2
        move $a3, $s3
 
        addi $sp, $sp, -8     # ??y e, f lên stack
        sw   $s4, 0($sp)      # e
        sw   $s5, 4($sp)      # f
        jal  proc_example
        addi $sp, $sp, 8      # caller d?n tham s?
 
        move $t0, $v0
        move $t1, $v1
 
        la $a0, msg1
        li $v0, 4
        syscall
        move $a0, $t0
        li $v0, 1
        syscall
 
        la $a0, msg2
        li $v0, 4
        syscall
        move $a0, $t1
        li $v0, 1
        syscall
 
        li $v0, 10
        syscall
 
proc_example:
        addi $sp, $sp, -8     # l?u $s0, $s1
        sw   $s0, 4($sp)
        sw   $s1, 0($sp)
        # lúc này e ? 8($sp), f ? 12($sp)
 
        add  $t0, $a0, $a1
        add  $t1, $a2, $a3
        sub  $s0, $t0, $t1    # s0 = (a+b)-(c+d)
 
        lw   $t2, 8($sp)      # e
        lw   $t3, 12($sp)     # f
        sub  $s1, $t2, $t3    # s1 = e - f
 
        move $v0, $s0
        move $v1, $s1
 
        lw   $s1, 0($sp)
        lw   $s0, 4($sp)
        addi $sp, $sp, 8
        jr   $ra