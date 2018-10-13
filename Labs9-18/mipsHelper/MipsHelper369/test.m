addi $t1, $zero, 6    # t1 = 6
nop 				# 5 nop instructions
nop				# in between each instruction
nop				# must be inserted 
nop				# later we will address this 
nop				# and remove all nops
addi $t2, $zero 8     # t2 = 8
nop
nop
nop
nop
nop
sub  $t3, t2, t1      # t3 = 8-6 = 2
nop
nop
nop
nop
nop
sll  $t4, $t3, 3      # t4 = 2 << 3 = 16
nop
nop
nop
nop
nop
srl  $t5, $t4, 2      # t5 = 4
