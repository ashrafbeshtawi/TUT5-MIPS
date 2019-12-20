 ### this code meant not to be excuted :o
L :
lw $t2 , 0 ( $a0)
addi $a0 , $a0, 4
beq $t2 , $s0 , E
j L
E :
jr $ra

#############################################
############# Instructions  #################
#                       6 bits    5    5    5     5       6
#   R instruction :    | opcode | rs | rt | rd | shamt | funct |   ##example: add
#   I instruction :    | opcode | rs | rt |    immediate       |   ##example: addi / lw
#   J instruction :    | opcode |        address               |   ##example: j


# the translation of the code
#start point : line 1000
#each instruction : 4 bytes
#      | op | rs| rt |  immediate  |  
# 1000 | 35 | 4 | 10 |     0       | # lw $t2 , 0 ( $a0)  
# 1004 | 8  | 4 | 4  |     4       | # addi $a0 , $a0, 4  
# 1008 | 4  | 10| 16 |     1       | # beq $t2 , $s0 , E  
# 1012 | 2  |        250           | # j 1000 --> j L
# 1016 | 0  | 31| 0  | 0  | 0 | 8  | # jr $ra --> jr 31



### registers :
# $a0 : 4
# $t2 : 10
# $s0 : 16
# $ra : 31