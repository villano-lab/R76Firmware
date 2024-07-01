with open("resource_explorer.txt","r") as file:
    lines = file.readlines()
with open("resource_explorer_modified.txt","w") as file:
    for line in lines:
        if line.endswith("C001\n"): 
            file.write(line[:4]+"\n")