.text
.globl main

#test code to test jal to jr
main: 
   
   add $a0, $0, $0

   sw $0, 0($a0)
   sw $0, 4($a0)
   sw $0, 8($a0)
   sw $0, 12($a0)

   addi $s0, $0, 1
   sw $s0, 16($a0)
   
   addi $s0, $0, 2
   sw $s0, 20($a0)

   addi $s0, $0, 3
   sw $s0, 24($a0)

   addi $s0, $0, 4
   sw $s0, 28($a0)  
   
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0
   add $s0, $0, $0

   addi $s2, $s0, 2
   addi $s3, $s0, 2
   add $t6, $0, $0
   add $t7, $0, $0



# SAD Function 
sad:
   add  $t0, $0, $0                 # set sum to 0
   add  $t1, $0, $0                 # set outer loop variable j to 0
sadouterloop:                       # for(int j = 0; j < windowSizeY; j++){
   slt  $t3, $t1, $s2               # t3 = (j < windowSizeY)
   nop
   nop
   nop
   nop
   beq  $t3, $0, sadouterloopend    # if(t3 == 0) exit outer loop
   nop
   nop
   nop
   nop
   add  $t2, $0, $0                 # set inner loop variable i to 0
sadinnerloop:                       # for(int i = 0; i < windowSizeX; i++) {
   slt  $t3, $t2, $s3               # t3 = (i < windowSizeX)
   beq  $t3, $0, sadinnerloopend    # if(t3 == 0) exit inner loop
   add  $t3, $t1, $t6               # t3 = j + frameLoc[row]
   mul  $t3, $t3, $s1               # t3 = t3 * frameSizeX          
   add  $t3, $t3, $t2               # t3 = t3 + i
   add  $t3, $t3, $t7               # t3 = t3 + frameLoc[column]
   sll  $t3, $t3, 2                 # t3 = t3 * 4
   mul  $t4, $t1, $s3               # t4 = j * windowSizeX
   add  $t4, $t4, $t2               # t4 = t4 + i
   sll  $t4, $t4, 2                 # t4 = t4 * 4
   add  $t3, $a1, $t3               # t3 = &frame[t3]
   add  $t4, $a2, $t4               # t4 = &frame[t4]
   lw   $t3, 0($t3)                 # t3 = *t3
   lw   $t4, 0($t4)                 # t4 = *t4
   sub  $t3, $t3, $t4               # t3 = t3 - t4
   slt  $t4, $t3, $0                # t4 = (t3 < 0)
   beq  $t4, $0, absifend           # if(t4 != 0)
   addi $t5, $0, -1                 # t5 = -1
   mul  $t3, $t3, $t5               # t3 = t3 * -1
absifend:
   add  $t0, $t0, $t3               # sum = sum + t3
   addi $t2, $t2, 1                 # i++
   nop
   nop
   nop
   nop
   j    sadinnerloop                # goto inner loop start
sadinnerloopend:
   nop
   addi $t1, $t1, 1                 # j++
   nop
   nop
   nop
   nop
   j    sadouterloop                # got outer loop start
sadouterloopend:
   nop
   nop
   nop
# Test if SAD is a minimum value and update
   beq  $t0, $s6, lteqcurrmin       # if(new sad == current min)
   slt  $t1, $t0, $s6               # t2 = (new sad < current min)
   nop
   nop
   nop
   nop
   beq  $t1, $0, lteqcurrminend     # if(newsad <= min)
lteqcurrmin:
   add  $s6, $t0, $0                # store new minimum
   add  $v0, $t6, $0                # store new min x
   add  $v1, $t7, $0                # store new min y
lteqcurrminend:
   nop
   nop
   nop
   nop
   jr   $ra                         # jump to next vbsme command