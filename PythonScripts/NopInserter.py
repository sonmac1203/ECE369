inFile = open(input("Input File: "), "r")
outFile = open(input("Output File: "), "w")

for line in inFile:
	outFile.write(line)
	if line.strip() is not "" and line.strip()[0] is not "#" and line.strip()[0] is not "." and not ":" in line:
		outFile.write("   nop\n   nop\n   nop\n   nop\n")
