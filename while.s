.data


.text
main:

##test the while condition
while:
beg  $t0,$t1,end_loop

##doing the loop instruction
## (do not forget to change the value of the loop_variable (else "endless loop :( ")) ##

j while #going back to the loop

end_loop: #exiting the loop

li $v0,10
syscall