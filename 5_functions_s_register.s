.data


.text
##### pseudocode: #####
# int x=0;
# int y= add_ten(x);
# 
# 
#   
#  int add_one(int x){
#   return x+1;
#  }
#
# int add_ten(x){
#   int z=0;
#   for(int i=0;i<10;i++){
#       z=add_one(z);
#   }   
# }
#### end of code ###

main:

li $t0,9  #use t0 as x and set x=0
li $t1,0  #use t1 as y and set y=0

move $a0,$t0  #set a0=x  (see the definition of add_ten)
jal		add_ten	# jump to add_ten function and save this address in the register $ra

move $t1,$v0   #set y=$v0 ---> y= add_ten(x)



##exit programm
li $v0,10
syscall



## add_one:
## argument : x --> saved in $a0
## return : z saved in $v0
add_one:
    addi $v0,$a0,1 ## set z=x+1
    jr   $ra       ## return to the address which saved in ra register



## add_ten:
## argument : x --> saved in $a0
## return : z saved in $v0

## to know : we are going to call the function add_one 10 times with a while_loop
## so the problem is really that as we jumped in line number 29 we saved the address of 
## the next line in the register $ra (to get back to it when we are done with the function)
## but now inside the add_ten function we are going to call another function -add_one (in line 84)
## which will also save the address of the next line in $ra so we lose the old address 
## which was stored there in line 29 ....
## sloution : store the value of $ra in the stack before doing any another function call
## and load it again when are you done with the sub_functions (add_one) and then you can terminate
## your function add_ten 

add_ten:
    addi $sp,$sp,-12 # move the stack pointer 12 bytes down (allocating place for 3 register values)
    sw   $ra,0($sp) #storing the value of $ra in the first 4 bytes in the stack
    sw   $s0,4($sp) #storing the value of $s0 in the second 4 bytes in the stack 
    sw   $s1,8($sp) #storing the value of $s1 in the third 4 bytes in the stack

    ## to know : we stored the values of s0 and s1 in stack because we need to use them and
    ## thier values should never be changed after the call of a function so we store its
    ## values inthe stack then we use them and before we end our function we load thier 
    ## old values again :D

    move $s0,$a0  ## s0=a0 (s0 is saved register and its value is not changed after calling sub_function)
    li $s1,0     ## s1=0 loop variable

    for:  # see 3_for.s for more info about for loop
    li $t0,10 #set t0=10 (to test our condition)
    bge $s1,$t0,end_for_loop ## if s1 is bigger or equal 10 then exit loop
    
    #if we got here then s1 is smaller than 10 ...
    move $a0,$s0  #a0=s0
    jal  add_one  # v0=add_one(x)
    move $s0,$v0  #s0=v0

    addi $s1,$s1,1 # s2=s2+1 (loop variable)
    j for

    end_for_loop:
    #if we got here then the loop is over ----> s0=x+10 :D
    move $v0,$s0 #v0=s0 (see definition of this function)

    ## load values from stack


    lw   $ra,0($sp) #load the value of $ra from the first 4 bytes in the stack
    lw   $s0,4($sp) #load the value of $s0 from the second 4 bytes in the stack 
    lw   $s1,8($sp) #load the value of $s1 from the third 4 bytes in the stack
    addi $sp,$sp,12 # move the stack pointer 12 bytes up (free place for 3 register values)


    jr   $ra       ## return to the address which saved in ra register
