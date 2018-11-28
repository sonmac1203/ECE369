.text
.globl main

#test code to test jal to jr
main: 
   
   addi $t0, $0, 0   
   jal testjal
   addi $t0, $0, 1
   j end

testjal: 
   jr $ra

end:
   j end
