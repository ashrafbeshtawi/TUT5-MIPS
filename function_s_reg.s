.data
new_line : .ascii "\n"

.text

main:
li $a0,10
jal		sub_function
move $t0,$v0
move $t1,$v1

##start printing :)

#print the first arg
move $a0,$t0
li $v0,1
syscall

## print new line
li $v0,4
la $a0,new_line
syscall

#print the second argument
move $a0,$t1
li $v0,1
syscall




# exit 
li $v0,10
syscall




#argument:
# a0 : number
#return :
# $v0 : number+2
# $v1 : number*2
sub_function:
# this function will call another function to increment the value  by 2
# this function will call another function to multiply the value by 2

#first save parameter we got in a0#

#1 move the stack pointer down
addi $sp,$sp,-12 # -12 is the place for a single word
sw   $ra,0($sp) #save the value in ra in the stack
sw   $s0,4($sp) #save the value in s0 in the stack
sw   $s1,8($sp) #save the value in s1 in the stack

move $s0,$a0 #now we can use the register s0 and save the value in a0 in s0

#lets call the first function
move $a0,$s0 #loading the value from s0
jal add_2 #calling the function
move $s1,$v0 #save th returned value from the function in s1 (saved register)

#lets call the second function
move $a0,$s0 #loading the value from s0
jal mult_2 #calling the function
move $v1,$v0 #saving the value from v0 (returned value) in v1

###last thing to do###
###we have to move the returned value from  s1 to v0 to return it###
move $v0,$s1 #done :p

lw   $ra,0($sp) #load the value of ra from the stack
lw   $s0,4($sp) #load the value of s0 from the stack
lw   $s1,8($sp) #load the value of s1 from the stack
addi $sp,$sp,12 # -8 is the place for a single word

jr		$ra					# jump to $ra



#argument:
# a0 : number
#return :
# $v0 : number+2
add_2:
addi $v0,$a0,2
jr		$ra					# jump to $ra

#argument:
# a0 : number
#return :
# $v0 : number+2
mult_2:
li $t0,2 #set t0=2
mult	$a0, $t0			# performing a0*2
mflo	$v0					# v0= a0*2 (the lease significant 32 bits)
jr		$ra					# jump to $ra
