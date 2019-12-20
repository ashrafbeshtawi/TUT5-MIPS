#### code to translated from Maschine code to MIPS instructions
#   0x1004 | 0x00004020
#   0x1008 | 0x21080001
#   0x100c | 0x08000401

## first we read every thing in binary :D
# 0x1004 ---> 0001 0000 0000 0100   | 0x00004020  ----> 0000 0000 0000 0000 0100 0000 0010 0000
# 0x1008 ---> 0001 0000 0000 1000   | 0x21080001  ----> 0010 0001 0000 1000 0000 0000 0000 0001
# 0x100c ---> to_do                 | 0x08000401  ---->   to_do


## conver address to desimal
## first we read every thing in binary :D
# 4100   |  0000 0000 0000 0000 0100 0000 0010 0000
# 4104   |  0010 0001 0000 1000 0000 0000 0000 0001
# 4108   |   to_do

## read the op --> last 6 digits
##           op
# 4100   |  000000 00 0000 0000 0100 0000 0010 0000 --> op=0 --> this is r-rype instruction
# 4104   |  001000 01 0000 1000 0000 0000 0000 0001 --> op=8 --> this is addi 
# 4108   |   to_do

## writing the instructions in the right format

#         |op | rs| rt| rd| shamt| func|
#         |op | rs| rt|   immediate    |

# 4100   | 0 | 0 | 0 | 8 |  0   | 32   |   ##funct =32  ---> add
# 4104   | 8 | 8 | 8 |      1          |   
# 4108   |   to_do


# translating --->
# register number 8 is $t0
# register number 0 is $zero
#then ...
# 4100 | add $t0,$zero,$zero
# 4104 | addi $t0,$t0,1
# 4108 | to_do :)
