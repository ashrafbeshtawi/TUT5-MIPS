.data


.text

##### c code: #####
# int x=0;
# for(int i=0;i<=10;i++){
#   x=x+1;
# }
#### end of code ###

main:

li $t0,0  #use t0 as i and set i=0
li $t1,0  #use t1 as x and set x=0
li $t2,10 # set t2=10 to use it as exit_condition :)

# going in the loop
for:
#first test the exit condition 
# if(i>10){ exit_loop }
bgt $t0,$t2,exit_loop
#else we increment x ---> x=x+1
addi $t1,$t1,1

#increment the loop variable ---> i=i+1
addi $t0,$t0,1 
# jump to the for_label and do everything again  
j for


# when we reach this section that means that are out of the loop :D
exit_loop:

#i think i am gonna just  terminate the programm here :(
li $v0,10
syscall
