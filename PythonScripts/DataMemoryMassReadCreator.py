outFile = open(input("Output File: "), "w")

for i in range(256):
	outFile.write("ReadData{0}, ".format(i))



outFile.write("\n\n        always @ (*) begin\n");
outFile.write("        if (MemRead)    begin\n")

for i in range(256):
	outFile.write("            ReadData{0} <= memory[Address[11:2] + {0}];\n".format(i))

outFile.write("        end\n")
outFile.write("        else begin\n")

for i in range(256):
	outFile.write("            ReadData{0} = 0;\n".format(i))

outFile.write("      end\nend")