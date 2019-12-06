.data
    hello: .ascii "Hello world"

.text
main:
    ## übersetzung für die pseudobefehle :)


    # li $t1,1
    li		$t1,1 		# $t1=1
    #übersetzung :
    addi	$t0, $zero, 1		# $t0 = zero + 1

    # move $t0,$t1
    move 	$t0, $t1		# $t0 = $t1 
    #übersetzung :
    add	$t0, $zero,$t1 		# $t0 = zero + 1


    #set t1 =10 (making t1 bigger then t0 to test the following instructions :D )
    li  $t1,10

    ### hard one :o
    blt		$t0, $t1, run	# if $t0 < $t1 then goto run()
    #übersetzung:
    slt     $t3,$t0,$t1  #if t0<t1 then t3=1 else t3=0
    addi    $t4,$zero,1 #t4=1
    beq     $t3,$t4,run #if t3==t4 then goto run()

    close:
    #close the program
    addi    $v0,$zero,10
    syscall




run:
    la		$a0, hello		# load the address of the string to a0
    addi    $v0,$zero,4     # save the value 4 in v0 to performe a printf with the syscall
    syscall
    
    j   close				# jump to $ra (going back where we were :D)
    

    