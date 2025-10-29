import re

with open("log.txt", "r") as in_f:
    lines = in_f.readlines()
    with open("clean_log.csv", "w") as out_f:
        out_f.write("Generation,Best Fitness,Average Fitness\n")
        for i in range(0, len(lines), 4):
            group = lines[i:i+4]
            if len(group) < 4:
                continue
            generation = re.sub(r'[^0-9]', '', group[0].strip())
            best = re.sub(r'[^0-9.-]', '', group[2].strip())
            average = re.sub(r'[^0-9.-]', '', group[3].strip())
            out_f.write(f"{generation},{best},{average}\n")