.data
    message: .asciiz "Enter a string: "
    gotHere: .asciiz "Got here \n"
    invalidStr: .asciiz "Invalid input"
    input: .space 1001
    nexx: .asciiz " - "
    
.text
main:
    li $t0, 2846337 
    li $t1, 11
    div $t0, $t1
    mfhi $t0
    addi $s0, $t0, 26 # $s0 += 26 ----> N
    addiu $s1, $s0, -10 # $s1 = N - 10 ---> M
    
    li $v0, 4
    la $a0, message
    syscall
