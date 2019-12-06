.data



.text


main:
li  $a0,10 #set a number to be printed :D
jal		print_number				# jump to print_number and save position to $ra


#closing the programms
li $v0,10
syscall

### arg : a0: number to print
# no return required
print_number:
    li $v0,1 #the code to print a number
    syscall #calling the operating system 
    jr	$ra					# going back to the caller
    

