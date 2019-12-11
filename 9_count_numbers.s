.data
text : .ascii "a01b120b333"

.text
main:

la $a0,text  ### a0=address of the first char of text
jal  numberOfNumbers




move $t0,$v0 ##copy the result to t0

##exit
li $v0,10
syscall










## arguemnts : 
# a0 : char x
# return 
# $v0 : 1 if x is digit  and 0 if not
is_digit:
    li $v0,0  ##lets say the char is not a digit
    bgt $a0,57,return # if x>57 its not a digit
    blt $a0,48,return # if x<48 its not a digit

    li $v0,1 ## if we got here then 48<=x<=57 ---> is a digit

    return:
 
jr $ra


## arguemnts : 
# a0 : address of string
# return 
# $v0 : number of numbers in this string
numberOfNumbers:
    addi $sp,$sp,-20 # move the stack pointer 20 bytes down (allocating place for 5 register values)
    sw   $ra,0($sp) #storing the value of $ra in the first 4 bytes in the stack
    sw   $s0,4($sp) #storing the value of $s0 in the second 4 bytes in the stack 
    sw   $s1,8($sp) #storing the value of $s1 in the third 4 bytes in the stack
    sw   $s2,12($sp) #storing the value of $s2 in the forth 4 bytes in the stack
    sw   $s3,16($sp) #storing the value of $s3 in the fifth 4 bytes in the stack

    move $s0,$a0  ## s0 will store the address of the array now
    li $s1,0 ## we will use s1 as count
    li $s2,0 ## we will use s2 as lastCharIsDigit

    lb $a0,0($s0) ## load the first char to a0


    while:
    beq $a0,0,end_while  ## if text[i]=='\0' then end loop

        jal is_digit ##calling is_digit
        beq $v0,$zero,next_loop ## if the number is not a digit then go to the next loop
        beq $s2,1,next_loop  ## if last number was digit then go to the next loop (we counted this number already :D)

        ## if we got here that means that the number is digit and the last number was not a digit ---> increment count
        addi $s1,$s1,1 ## incrementing count

        next_loop:
        addi $s0,$s0,1 ## moving the pointer to the next char
        lb   $a0,0($s0) ## loading the next char to a0
        move $s2,$v0 ##lastCharIsDigit= is_digit(text[i]) -->to use it in the next round


    j while

    end_while:
    move $v0,$s1 ##v0=count 


    lw   $ra,0($sp) #load the value of $ra from the first 4 bytes in the stack
    lw   $s0,4($sp) #load the value of $s0 from the second 4 bytes in the stack 
    lw   $s1,8($sp) #load the value of $s1 from the third 4 bytes in the stack
    lw   $s2,12($sp) #load the value of $s1 from the forth 4 bytes in the stack
    lw   $s3,16($sp) #load the value of $s3 from the fifth 4 bytes in the stack
    addi $sp,$sp,20 # move the stack pointer 20 bytes up (freeing place for 5 register values)

    jr $ra ##return
