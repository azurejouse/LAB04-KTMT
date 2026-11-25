        .data
prompt: .asciiz "Enter n: "
result: .asciiz "Fibonacci: "
space:  .asciiz " "
 
        .text
main:   la   $a0, prompt
        li   $v0, 4
        syscall
 
        li   $v0, 5           # ??c n
        syscall
        move $s0, $v0         # s0 = n
 
        la   $a0, result
        li   $v0, 4
        syscall
 
        li   $t0, 0           # F(i)   = 0
        li   $t1, 1           # F(i+1) = 1
        li   $t2, 0           # i = 0
 
loop:   bge  $t2, $s0, end    # i >= n thì d?ng
 
        move $a0, $t0         # in F(i)
        li   $v0, 1
        syscall
        la   $a0, space
        li   $v0, 4
        syscall
 
        addu $t3, $t0, $t1    # F(i+2) = F(i) + F(i+1)
        move $t0, $t1
        move $t1, $t3
        addi $t2, $t2, 1
        j    loop
 
end:    li   $v0, 10
        syscall