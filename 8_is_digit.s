.data
text : .ascii "a01b"

.text

##### c code: #####
# char x[4]="a01b";
# int test= is_digit(x[0]) // is_digit should return 0
# int test_2= is_digit(x[1]) // is_digit should return 1
# 
# int is_digit(char c){
#   if(c>=48 && c<=57){
#       return 1;
#   }
#   return 0;
# } 
#### end of code ###

main:
addi $sp,$sp,-4
sw $s0,0($sp)

la  $t0,text  ## load the address of the first element in the array to t0
lb  $a0,0($t0) ##load text[0] to a0
jal is_digit  ## calling is digit

move $s0,$v0   ## s0 = is_digit(text[0])

la  $t0,text  ## load the address of the first element in the array to t0
addi $t0,$t0,1  ## go to the second char in the array (second byte)
lb  $a0,0($t0) ##load text[1] to a0
jal is_digit  ## calling is digit

move $t0,$s0 # t0= is_digit(text[0])
move $t1,$v0 # t1= is_digit(text[1])


lw $s0,0($sp)
addi $sp,$sp,4
## exit 
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