filename = "07240628_1633.txt"
with open(filename,"r") as file:
    lines = file.readlines()
with open(filename,"w") as file:
    for line in lines:
        if line.endswith("C001\n"): 
            line = line.split("C001")[0]
            file.write("0"*(4-len(line))+line+"\n")