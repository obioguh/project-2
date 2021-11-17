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
    
    li $v0, 4
    la $a0, input
    li $a1, 1001
    syscall
    
    li $s2, 0 # ---> i
    
loop1:
    la $a1, input
    add $a1, $a1, $s2
    lb $a1, 0($a1) 
    
    li $t0, 32
    li $s5, 9
    seq $t0, $a1, $t0
    seq $s4, $a1, $s4
    or $t0, $t0, $s5
    beq $t0, $zero, afterLoop1
    
    addi $s2, $s2, 1
    li $t1, 1001
    slt $t0, $s2, $t1
    bne $t0, $zero, loop1
    
   
