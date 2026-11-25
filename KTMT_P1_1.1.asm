        .data
prompt: .asciiz "Enter one number: "
msg:    .asciiz "Number + 1 = "
 
        .text
main:   jal getInt
        move $s0, $v0          # $s0 = s? nh?p vào
 
        move $a0, $s0          # truy?n tham s? cho showInt
        jal showInt
 
        j exit
 
getInt: li $v0, 4
        la $a0, prompt
        syscall
        li $v0, 5
        syscall
        jr $ra
 
showInt:
        addi $t0, $a0, 1       # t0 = n + 1
        la $a0, msg
        li $v0, 4              # in chu?i
        syscall
        move $a0, $t0
        li $v0, 1              # in s? nguyên
        syscall
        jr $ra
 
exit:   li $v0, 10             # k?t thúc ch??ng trình
        syscall