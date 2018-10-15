filename = input("Input Filename: ")

infile = None
try:
	infile = open(filename, "r")
except:
	print("Error: File Not Found")
	exit()

print("\n")

linetoavoid = 'nop'

for line in infile:
	if line.strip() != linetoavoid:	
		print(line)
