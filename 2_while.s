.data


.text
##### c code: #####
# int x=0;
# int y=100;
# int z=0;
# while(x<y){
#   z=z+2
#   x=x+1;
# }
#### end of code ###
main:

li $t0,0  #use t0 as x and set x=0
li $t1,100  #use t1 as y and set y=100
li $t2,0  #use t2 as z and set z=0

##going throw the loop
while:
#check if we should exit the loop ---> is x bigger or equal y
# if so then go to end_loop label
bge  $t0,$t1,end_loop #

## if we enter the loop

addi $t2,$t2,2 #set z=z+2
addi $t0,$t0,1 #set x=x+1

#start over again :)
j while 

# if we got here this means that x is now bigger or equal y ... so we are out of the loop
end_loop: 

#terminiating the programm
li $v0,10 
syscall