.text
.globl main


tomato:
	addi $s0, $s0, 6
	jr   $ra

orange:
	addi $s1, $s0, 5
	addi $s2, $s0, 5
	addi $s3, $s0, 5
	addi $s4, $s0, 5
	addi $s5, $s0, 5
	jr $ra

main:
	ori $s0, $zero, 4
	jal tomato
	add $s1, $s0, $s0 
	add $s2, $s1, $s0
	jal orange