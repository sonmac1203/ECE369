def find_str(s, char):
	index = 0

	if char in s:
		c = char[0]
		for ch in s:
			if ch == c:
				if s[index:index+len(char)] == char:
					return index

			index += 1

	return -1


inFile = open(input("Input File: "), "r")
outFile = open(input("Output File: "), "w")

a = 0

for line in inFile:
	dotWordLoc = find_str(line, ".word    ")
	
	if dotWordLoc is not -1:
		vals = line[dotWordLoc + 9:find_str(line, "#")]
		vals = [x for x in vals.strip().replace(", ",",").split(",") if (x is not " " and x is not "")]

		for item in vals:
			if item is not "\n":
				outFile.write("            memory[{0}] <= {1};\n".format(a, item))
				a += 1

inFile.close()
outFile.close()