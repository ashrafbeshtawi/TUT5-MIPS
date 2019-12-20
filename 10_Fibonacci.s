.data



.text
##### pseudocode: #####
# int x=10;
# int y= fib(x);
# 
# 
#   
# int fib(int n)
# {
# if (n < 2 )
# return n ;
# else
# return fib(n−1) + fib(n−2 );
# }
#### end of code ###

main:
li $t0,100  #use t0 as x and set x=10
li $t1,0  #use t1 as y and set y=0

move $a0,$t0  #set a0=x  (see the definition of fib)
jal		fib	# jump to fib function and save this address in the register $ra

move $t1,$v0   #set y=$v0 ---> y= fib(x)

#closing the programms
li $v0,10
syscall



## fib:
## argument : x --> saved in $a0
## return : z saved in $v0
fib:
    bge $a0,2,recursive  ### if n>=2 then we need recursive calls
    ## if we got here then n<=2
    move $v0,$a0 ##return n
    jr $ra

    recursive:
    addi $sp,$sp,-20 # move the stack pointer 20 bytes down (allocating place for 5 register values)
    sw   $ra,0($sp) #storing the value of $ra in the first 4 bytes in the stack
    sw   $s0,4($sp) #storing the value of $s0 in the second 4 bytes in the stack 
    sw   $s1,8($sp) #storing the value of $s1 in the third 4 bytes in the stack
    sw   $s2,12($sp) #storing the value of $s2 in the forth 4 bytes in the stack
    sw   $s3,16($sp) #storing the value of $s3 in the fifth 4 bytes in the stack

    move $s0,$a0 ### s0 has our n now
    addi $a0,$a0,-1 ## n=n-1
    jal fib  #calling fib(n-1)
    move $s1,$v0  # s1=fib(n-1)

    move $a0,$s0 ## a0=n
    addi $a0,$a0,-2 ## n=n-2
    jal  fib   ## call fib(n-2)
    move $s2,$v0  ## s2=fib(n-2)

    add $s3,$s2,$s1 ## s3=fib(n-1)+fib(n-2)
    move $v0,$s3 ##v0=s3 :D 


    lw   $ra,0($sp) #load the value of $ra from the first 4 bytes in the stack
    lw   $s0,4($sp) #load the value of $s0 from the second 4 bytes in the stack 
    lw   $s1,8($sp) #load the value of $s1 from the third 4 bytes in the stack
    lw   $s2,12($sp) #load the value of $s1 from the forth 4 bytes in the stack
    lw   $s3,16($sp) #load the value of $s3 from the fifth 4 bytes in the stack
    addi $sp,$sp,20 # move the stack pointer 20 bytes up (freeing place for 5 register values)

    jr   $ra       ## return to the address which saved in ra register

    

