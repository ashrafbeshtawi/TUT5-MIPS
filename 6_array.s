.data
## the array and its length
my_array : .word 10 12 12 23
len : .word 4

.text
##### pseudocode: #####
#   int a=sum(my_array,4);
#
#
# int sum(int table [ ] , int n) {
# int sum = 0 ;
#
# for(int i= 0; i < n ; i++ ){
# sum += table[i]
# }
#
# return sum ;
# }
#### end of code ###
main:
## calling the function sum()
 la		$a0, my_array # storing the ADDRESS of the first element in the array (call by refrence)
 lw     $a1,len #storing the VALUE of the length of the array
 jal    sum

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
#$v0 : the sum of all elements in the array
sum:
#set v0 = 0 
addi $v0,$zero,0
addi $t0,$zero,0 #loop variable
move $t1,$a0
#start the loop:
loop:
bge $t0,$a1,return #if t0>len then exit the loop
lw  $t2,0($t1) #load the value
add $v0,$v0,$t2 #increment the sum
addi $t1,$t1,4 #increment the address (move the pointer to the next value) (4 bytes = 1 word)
addi $t0,$t0,1 #increment the loop variable 
j loop


return:
jr		$ra					# jump to $ra

