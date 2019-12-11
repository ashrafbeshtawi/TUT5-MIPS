.data



.text
##### pseudocode: #####
# int x=0;
# int y= add_one(x);
# 
# 
#   
#  int add_one(int x){
#   return x+1;
#  }
#### end of code ###

main:
li $t0,0  #use t0 as x and set x=0
li $t1,0  #use t1 as y and set y=0

move $a0,$t0  #set a0=x  (see the definition of add_one)
jal		add_one	# jump to add_one function and save this address in the register $ra

move $t1,$v0   #set y=$v0 ---> y= add_one(x)

#closing the programms
li $v0,10
syscall



## add_one:
## argument : x --> saved in $a0
## return : z saved in $v0
add_one:
    addi $v0,$a0,1 ## set z=x+1
    jr   $ra       ## return to the address which saved in ra register

    

