import os
import subprocess
import numpy as np
from node import Node

def generate_verilog(genotype):
    nodes = []
    width = int(len(genotype) ** 0.5)
    for i, gene in enumerate(genotype):

        lut = gene >> 16
        x = i % width
        y = i // width
        
        # Offsets
        input0x = int((gene >> 14) & 0b11) - 2
        input0y = int((gene >> 12) & 0b11) - 2
        input1x = int((gene >> 10) & 0b11) - 2
        input1y = int((gene >> 8) & 0b11) - 2
        input2x = int((gene >> 6) & 0b11) - 2
        input2y = int((gene >> 4) & 0b11) - 2
        input3x = int((gene >> 2) & 0b11) - 2
        input3y = int(gene & 0b11) - 2

        # Actual Values
        input0x = x + input0x
        input0y = y + input0y
        input1x = x + input1x
        input1y = y + input1y
        input2x = x + input2x
        input2y = y + input2y
        input3x = x + input3x
        input3y = y + input3y

        nodes.append(Node(width, x, y, lut, input0x, input0y, input1x, input1y, input2x, input2y, input3x, input3y))
        
    
    outputs = []
    wires = []

    for node in nodes:
        wires.append(f"x{node.x}_y{node.y}")
            
    inputs = [f"in{i}" for i in range(4)]
    outputs = [f"out{i}" for i in range(4)]
    
    verilog_lines = []
    verilog_lines.append(f"module cgp_module (")
    
    # Declare inputs and outputs
    verilog_lines.append("    (* keep *) input " + ", ".join(inputs) + ",")
    verilog_lines.append("    (* keep *) output " + ", ".join(outputs) + ");\n")
    verilog_lines.append("    (* keep *) wire " + ", ".join(wires) + ";\n")
    
    # Instantiate each node
    for node in nodes:
        verilog_lines.append(node.to_verilog())
    
    verilog_lines.append("\nendmodule")
    
    return "\n".join(verilog_lines)

def simulate_directory(directory):
    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)
    scores = {}
    for filename in os.listdir(directory):
        if filename.endswith(".v"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace(".v", "_sim"))
            subprocess.run(
                ["iverilog", "-o", output_filepath, filepath, "./ice40_stubs.v", "./tb.v"],
                stdout=subprocess.DEVNULL,
                # stderr=subprocess.DEVNULL
            )
            result = subprocess.run(
                ["vvp", output_filepath],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,
            )
            vvp_stdout = result.stdout.splitlines()[1]
            if "SCORE:" in vvp_stdout:
                score = float(vvp_stdout.split("SCORE:")[1].strip())
                # extract digits from filename (e.g. "individual_3.v" -> 3) and use as key
                num_str = ''.join(ch for ch in filename if ch.isdigit())
                if num_str:
                    scores[int(num_str)] = score
            subprocess.run(
                ["mv", "tb.vcd", output_filepath + ".vcd"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
    return scores

def make_population(size, genotype_length):
    return {i: np.random.randint(0, 2**32, size=genotype_length, dtype=np.uint32) for i in range(size)}
    # lut = 0x6996 << 16
    # return {i: np.random.randint(0, 2**16, size=genotype_length, dtype=np.uint32) | lut for i in range(size)}

def save_population_to_files(population, directory):
    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)
    for i, ind in population.items():
        filename = os.path.join(directory, f"individual_{i}.v")
        with open(filename, 'w') as f:
            verilog_code = generate_verilog(ind)
            f.write(verilog_code)
            
def cleanup_directory(directory):
    for filename in os.listdir(directory):
        filepath = os.path.join(directory, filename)
        os.remove(filepath)
        
def mutate_population(population, rate=0.01):
    for i in population:
        for j in range(len(population[i])):
            gene = population[i][j]
            for k in range(32):
                if np.random.rand() < rate:
                    gene ^= (1 << k)
            population[i][j] = gene

def evolve(population_size=32, genotype_length=25, generations=10):
    pop = make_population(population_size, genotype_length)
    for generation in range(generations):
        print(f"Generation {generation}")
        save_population_to_files(pop, f"./population_{generation}")
        scores = simulate_directory(f"./population_{generation}")
        print("Scores:", scores)
        print("Average score:", np.mean(list(scores.values())) if scores else 0)
        print("Best score:", max(scores.values()) if scores else 0)
        if scores:
            top_half = sorted(scores.items(), key=lambda kv: kv[1], reverse=True)[:population_size//2]
            # print("Top half:", top_half)
        else:
            print("No scores found.")
        
        for ind in pop:
            if ind not in top_half:
                parent = top_half[np.random.randint(0, len(top_half))][0]
                child_genotype = pop[parent].copy()
                pop[ind] = child_genotype
        
        mutate_population(pop, rate=0.01)
        
def synthesize_directory(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".v"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace(".v", ".rpt"))
            subprocess.run(
                ["yosys", "-p", f"read_verilog {filepath}; synth_ice40 -top cgp_module -json {output_filepath}"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )

def pnr_directory(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".rpt"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace(".rpt", ".asc"))
            subprocess.run(
                ["nextpnr-ice40", "--up5k", "--json", filepath, "--asc", output_filepath, "--pcf", "./constraints.pcf", "--package", "sg48", "--pcf-allow-unconstrained", "--force"],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL
            )
                
if __name__ == "__main__":     
    evolve(100, 4, 64)
    synthesize_directory("./population_63")
    pnr_directory("./population_63")