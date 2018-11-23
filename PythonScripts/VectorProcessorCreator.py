outFile = open(input("Output File: "), "w")

#WIRES
outFile.write("wire [31:0] ")

#Add all AD wires
for i in range(256):
	outFile.write("AD{0}_in_A,\n            AD{0}_in_B,\n            ".format(i))

#Add all adder wires
i = 128
while(i > 0):
	for j in range(i):
		outFile.write("Adder{0}_{1}_in_A,\n            Adder{0}_{1}_in_B,\n            ".format(i, j))
	i = int(i/2)

outFile.write("SAD_out;\n\n")


#Add memory modules
outFile.write("            MassReadDataMemory MRDM_0(MemAddress, WriteData, Clk, MemWrite, MemRead")

for i in range(256):
	outFile.write(", AD{0}_in_A".format(i))

outFile.write(");\n            MassReadWindowMemory MRWM_0(WindowAddress, WriteData, Clk, MemWrite, MemRead")

for i in range(256):
	outFile.write(", AD{0}_in_B".format(i))

outFile.write(");\n\n")

#Add Absolute Difference Modules
for i in range(128):
	outFile.write("            AbsoluteDifference AD{0}(AD{0}_in_A, AD{0}_in_B, Adder128_{1}_in_A);\n".format(2*i, i))
	outFile.write("            AbsoluteDifference AD{0}(AD{0}_in_A, AD{0}_in_B, Adder128_{1}_in_B);\n".format(2*i + 1, i))

#Add Adder Modules
outFile.write("\n\n")

i = 64
while(i > 0):
	for j in range(i):
		outFile.write("            Adder Adder_{0}_{1}(Adder{0}_{1}_in_A, Adder{0}_{1}_in_B, Adder{2}_{3}_in_A);\n".format(i*2, j*2, i, j))
		outFile.write("            Adder Adder_{0}_{1}(Adder{0}_{1}_in_A, Adder{0}_{1}_in_B, Adder{2}_{3}_in_B);\n".format(i*2, j*2 + 1, i, j))		
	i = int(i/2)

outFile.write("            Adder Adder_1_0(Adder1_0_in_A, Adder1_0_in_B, SAD_out);")

outFile.close()