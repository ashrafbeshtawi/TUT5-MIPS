.data


.text
main:

bge $t0,$t1,else_section  # if (t0<t1) { #do something#} else if (t0>=t1){go to else_section}

 ##doing something

j  end_if_else
else_section:

##else instructions 


end_if_else:

#close the program
li $v0,10
syscall


