.text
.globl main

#test code to test jal to jr
main: 
   			#i-type test
	addi $s0, $0, 1
	addi $s1, $0, 1
	beq $s1, $s0, checkone

testtwo:	#i-type test
nop
nop
nop
nop
	addi $s1, $0, 2
	addi $s2, $0, 2
	beq $s1, $s2, checktwo

testthree:	#r-type test
nop
nop
nop
nop
	addi $s0, $0, 3
	addi $s1, $0, 3
	add $s2, $s0, $s1
	add $s3, $s0, $s1
	beq $s3, $s2, checkthree

testfour:	#r-type test
nop
nop
nop
nop
	addi $s0, $0, 4
	addi $s1, $0, 4
	add $s3, $s0, $s1
	add $s2, $s0, $s1
	beq $s3, $s2, checkfour

testfive:
nop
nop
nop
nop

	addi $s0, $0, 5
	sw, $s0, 0($0)
	lw, $s1, 0($0)
	beq, $s1, $0, checkfive

end:
   j end

checkone:
	addi $s6, $0, 1
	j testtwo

checktwo:
	addi $s6, $0, 2
	j testthree

checkthree:
	addi $s6, $0, 3
	j testfour

checkfour:
	addi $s6, $0, 4
	j testfive

checkfive:
	addi $s6, $0, 5
	j end