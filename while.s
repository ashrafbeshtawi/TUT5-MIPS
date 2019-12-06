.data


.text
main:

##test the while condition
while:
#while(t0!=t1) {...}
beq  $t0,$t1,end_loop #if t0==t1

##doing the loop instruction
## (do not forget to change the value of the loop_variable (else "endless loop :( ")) ##

j while #going back to the loop

end_loop: #exiting the loop

li $v0,10 #exit
syscall