.text
.globl main

#test code to test jal to jr
main: 
   
   addi $t0, $0, 0   
   jal testjal
returnjal:   
   addi $t0, $0, 1
   j end

testjal: 
   j returnjal

end:
   j end
