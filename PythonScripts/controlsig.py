a = open("sigs.csv", "r")
b = open("sigCode.txt", "w")

for line in a:
	
	line = line.split(",")
	
	if line[0] == "Instruction":
		continue

	b.write("// " + str(line[0]) + "\n")
	
	if line[1] != "X":
		b.write("ALUSrc <= " + str(line[1]) + ";\n")

	if line[2] != "X":	
		b.write("RegDst <= " + str(line[2]) + ";\n")
		
	if line[3] != "X":
		b.write("RegWrite <= " + str(line[3]) + ";\n")
		
	b.write("ALUOp <= " + str(line[4]) + ";\n")
		
	if line[5] != "X":
		b.write("MemRead <= " + str(line[5]) + ";\n")
		
	if line[6] != "X":
		b.write("MemWrite <= " + str(line[6]) + ";\n")
		
	if line[7] != "X":
		b.write("MemToReg <= " + str(line[7]) + ";\n")
	
	b.write("//PCSrc <=  ;\n\n\n")