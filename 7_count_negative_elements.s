.data
## the array and its length
my_array : .word 10 0 -12 50
len : .word 4

.text
##### pseudocode: #####
#   int a=countNegatives(my_array,4);
#
#
# int countNegatives(int table [ ] , int n) {
# int count = 0 ;
# int i ;
#
# for (i= 0; i < n ; i++ ){
# if(table[i] < 0 ) {
# count++;
# }
# }
#
# return count ;
# }
#### end of code ###
main:
## calling the function countNegatives()
 la		$a0, my_array # storing the ADDRESS of the first element in the array (call by refrence)
 lw     $a1,len #storing the VALUE of the length of the array
 jal    countNegatives

# print the result
move    $a0,$v0
li $v0,1
syscall

 
 



#exit :D
li $v0,10
syscall

##arguemnts
#a0: address of the array
#a1: len of the array
##return :
#$v0 : the count of all negative elements in the array
countNegatives:

addi $v0,$zero,0 #set v0 = 0 
addi $t0,$zero,0 #loop variable
move $t1,$a0 #t1=a0
#start the loop:
loop:
bge $t0,$a1,return  #if t0>len then exit the loop
addi $t0,$t0,1 #increment the loop variable 
lw  $t2,0($t1) #load the value
addi $t1,$t1,4 #increment the address (move the pointer to the next value) (4 bytes = 1 word)
bge  $t2,$zero,loop  ## if t2>=0 (positive)  then { continue; }

##else :: means the value is negative
addi $v0,$v0,1 #increment the sum

j loop


return:
jr		$ra					# jump to $ra

