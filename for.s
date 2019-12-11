.data


.text

main:

li $t0,0  #loop var


for:
li $t1,10
bgt $t0,$t1,exit_loop

######
move $a0,$t0
li $v0,1
syscall
#####

addi $t0,$t0,1 #increment the loop var
j for



exit_loop:
