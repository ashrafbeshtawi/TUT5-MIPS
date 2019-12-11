.data


.text
##### c code: #####
# int x=100;
# int y=50;
# int z=0;
# if(x>y){
#   z=1;
# }else{
#   z=2
#  }
#### end of code ###
main:
li $t0,100  #use t0 as x and set x=100
li $t1,50  #use t1 as y and set y=50
li $t2,0  #use t2 as z and set z=0
# if(x<=y){goto else_section}else { do the if_section}
ble $t0,$t1,else_section 

## if we got here then we did not jump ---> this means x is bigger than y ---> set z=1
li $t2,1

#exit the if_else section (we dont want to do the else section after doing the if section)
j  end_if_else

## if we got here thats mean that x is not bigger than y then just set z=2
else_section:

li $t2,2

##here is the end of the if_else section
end_if_else:

#close the program :D
li $v0,10
syscall


