.data
    message: .asciiz "Enter a string: "
    gotHere: .asciiz "Got here \n"
    invalidStr: .asciiz "Invalid input"
    input: .space 1001
    nexx: .asciiz " - "
    
.text
main:
    li $t0, 2846337 
