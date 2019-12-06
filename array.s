.data
my_array : .word 10 12 13 33
len : .word 4

.text
main:
 la		$a0, my_array		
 lw     $a1,len 
 jal    sum

# print the result
move    $a0,$v0
li $v0,1
syscall

 
 



#exit :D
li $v0,10
syscall


#a0: address of the array
#a1: len of the array
sum:
#set v0 = 0 
addi $v0,$zero,0
addi $t0,$zero,0 #loop variable
move $t1,$a0
#start the loop:
loop:
bge $t0,$a1,return
lw  $t2,0($t1) #load the value
add $v0,$v0,$t2 #increment the sum
addi $t1,$t1,4 #increment the address (move the pointer to the next value)
addi $t0,$t0,1 #increment the loop variable 
j loop


return:
jr		$ra					# jump to $ra

