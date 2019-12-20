.data
    hello: .ascii "Hello world"

.text
main:
    ## übersetzung von Pseudobefehlen :)

    ## pseudo-instruction:
    ## target : if(t0<t1) then{ goto run }
    #pseudo:
    blt $t0,$t1,run
    #Übersetung:
    slt $t2,$t0,$t1  ## if(t0<t1) then {t2=1} else {t2=0}
    bne $t2,$zero,run  ## if(t2!=0) then {goto run}
    beq		$t0, $t1, target	# if $t0 == $t1 then target





    ## pseudo-instruction:
    ## target : if(t0<=t1) then{ goto run }
    #pseudo:
    ble $t0,$t1,run
    #Übersetung:
    slt $t2,$t1,$t0  ## if(t0>t1) then {t2=1} else {t2=0}
    beq $t2,$zero,run  ## if(t2==0) then {goto run}


    ## pseudo-instruction:
    ## target : if(t0>t1) then{ goto run }
    #pseudo:
    bgt $t0,$t1,run
    #Übersetung:
    slt $t2,$t1,$t0 ## if(t1<t0) then {t2=1} else {t2=0}
    bne $t2,$zero,run  ## if(t2!=0) then {goto run}


    ## pseudo-instruction:
    ## target : if(t0>=t1) then{ goto run }
    #pseudo:
    bge $t0,$t1,run
    #Übersetung:
    slt $t2,$t0,$t1 ## if(t0<t1) then {t2=1} else {t2=0}
    beq $t2,$zero,run  ## if(t2==0) then {goto run}

    immediate:

    ## pseudo-instruction:
    ## target : t0=0xA756E1C7 ( Hexadezimal :D )
    #pseudo:
    li $t0,0xA756E1C7
    #Übersetung:
    lui $t4,0xA756 ## t0=0xA756 (the first 2 bytes) (load upper immediate instruction)
    ori $t4,$t4,0xE1C7  ## t0=t0 || 0xE1C7 (the last 2 bytes) 


    close:
    #close the program
    addi    $v0,$zero,10
    syscall




run:
    la		$a0, hello		# load the address of the string to a0
    addi    $v0,$zero,4     # save the value 4 in v0 to performe a printf with the syscall
    syscall                 # calling the OS to print the string on the screen
    
    j   immediate				# jump to immediate 
    

    