filename = input("Input Filename: ")

infile = None
try:
	infile = open(filename, "r")
except:
	print("Error: File Not Found")
	exit()

print("\n")

loc = 0
for line in infile:
	line = line.split(" ")[0]
	print("Memory[" + str(loc) + "] = 32'h" + line + ";")
	loc += 1