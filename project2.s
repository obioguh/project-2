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
    
    j invalid
    
afterLoop1:
    li $s4, 0
    add $s4, $s2, $zero
    
loop15:
    la $a1, input
    add $a1, $a1, $s4
    lb $al, 0($a1)
    
    li $t0, 10
    beq $a1, $t0, afterLoop15
    
    addi $s4, $s4, 1
    li $t0, 1000 
    slt $t0, $s4, $t0
    bne $t0, $zero, loop15
    
afterLoop15:
    
    li $s3, 0
    addi $s4, $s4, -1
    add $s3, $s3, $s4 
    
loop2:

    la $a1, input
    add $a1, $a1, $s3
    lb $a1, 0($a1) 
    
    li $t0, 32
    li$s5, 9
    seq $t0, $a1, $t0
    seq $s5, $a1, $s5
    or $t0, $t0, $s5
    beq $t0, $zero, afterLoop2
    
    #li $t0, 32
    #bne $a1, $t0, afterLoop2 # if ord(str[j] !=32: afterLoop2
    
    addi $s3, $s3, -1
    li $t1, -1
    sgt $t0, $s3, $t1
    bne $t0, $zero, loop2
    
afterLoop2:

    sub $t4, $s3, $s2
    slt $t1, $t4, $zero
    li $t2, 3
    sgt $t3, $t4, $t2
    or $t0, $t1, $t3
    bne $t0, $zero, invalid
    
    add $t7, $s3, $zero #count ($t7) = j
    addi $t5, $s2, -1
    sgt $t6, $t7, $t5
    beq $t6, $zero, back
    
    j subprogram
    #passes in inout as params
    #returns value as $s4
    
back:
    li $v0, 1
    addi $a0, $s4, 0
    syscall
    
    j exit
    
subprogram:
    li $s4, 0
    
    loop3:
    
        la $a1, input
        add $a1, $a1, $t7
        lb $s7, 0($a1) 
        
        jal asciiConverter # to convert from ascii to decimal value (c)
        # converter takes params $s7 and returns val $s7
        
        sub $s6, $s3, $t7
        jal power


   
