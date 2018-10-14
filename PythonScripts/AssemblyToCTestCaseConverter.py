infile = open("asmInput", "r")
outfile = open("cOutput", "w")

testnum = -1

for line in infile:
	line = line.strip()
	
	#Empty string
	if line == '':
		continue

	#Comment line
	if line[0] == "#":
		#First comment
		if 'test' in line:
			if testnum >= 0:
				outfile.write("};\n\n\tresults[" + str(testnum) + "] = result" + str(testnum) +";\n\tasizes[" + str(testnum) + "] = asize" + str(testnum) + ";\n\tframes[" + str(testnum) + "] = frame" + str(testnum) + ";\n\twindows[" + str(testnum) + "] = window" + str(testnum) + ";\n\n")

			testnum += 1
			outfile.write("/*\n*\n* Test " + str(testnum) + "\n*\n*/\n\n")
		outfile.write("\t//" + line[2:] + '\n')

		#Result values
		if 'result' in line:
			splitItems = line.split()[-2:]
			outfile.write("\n\tint result" + str(testnum) + "[] = {" + " ".join(splitItems) + "};")

	#asize
	elif 'asize' in line:
		splitItems = line.split()
		outfile.write("\n\tint asize" + str(testnum) + "[] = {" + " ".join(splitItems[2:6]) + "};\n")

	#frame start
	elif 'frame' in line:
		splitItems = line.split()
		outfile.write("\n\tint frame" + str(testnum) + "[] = {" + " ".join(splitItems[2:]))

	#window start
	elif 'window' in line:
		splitItems = line.split()
		outfile.write("};\n\tint window" + str(testnum) + "[] ={" + " ".join(splitItems[2:]))

	#Line of continued values
	elif '.word' in line:
		outfile.write("\n\t\t\t\t\t" + line[9:])