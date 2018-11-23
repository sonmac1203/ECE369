outFile = open(input("Output File: "), "w")

for i in range(256):
	outFile.write("            assign ReadData{0} = ReadData[{0}];\n".format(i))