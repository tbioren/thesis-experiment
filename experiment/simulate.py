import os
import subprocess
import numpy as np
from node import Node
import matplotlib.pyplot as plt
import concurrent.futures

# Genotype structure:
# [LUT: int16
# input0N: float32, input0S: float32, input0E: float32, input0W: float32, input0Scale: float32
# input1N: float32, input1S: float32, input1E: float32, input1W: float32, input1Scale: float32
# input2N: float32, input2S: float32, input2E: float32, input2W: float32, input2Scale: float32
# input3N: float32, input3S: float32, input3E: float32, input3W: float32, input3Scale: float32]
# Repeated for each node in the grid

def generate_verilog(genotype):
    nodes = []
    width = int(len(genotype) ** 0.5)
    
    def newIndex(index, north, south, east, west, scale):
        m = max(north, south, east, west)
        if m == north:
            return round(index - width*scale)
        elif m == south:
            return round(index + width*scale)
        elif m == east:
            return round(index + scale)
        elif m == west:
            return round(index - scale)
        else:
            return index  # self-loop if no direction is greater
        
    for i, gene in enumerate(genotype):
        lut = int(gene[0]) & 0xFFFF
        x = i % width
        y = i // width
        input0x = newIndex(i, gene[1], gene[2], gene[3], gene[4], gene[5]) % width
        input0y = newIndex(i, gene[1], gene[2], gene[3], gene[4], gene[5]) // width
        input1x = newIndex(i, gene[6], gene[7], gene[8], gene[9], gene[10]) % width
        input1y = newIndex(i, gene[6], gene[7], gene[8], gene[9], gene[10]) // width
        input2x = newIndex(i, gene[11], gene[12], gene[13], gene[14], gene[15]) % width
        input2y = newIndex(i, gene[11], gene[12], gene[13], gene[14], gene[15]) // width
        input3x = newIndex(i, gene[15], gene[16], gene[17], gene[18], gene[19]) % width
        input3y = newIndex(i, gene[15], gene[16], gene[17], gene[18], gene[19]) // width

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

def make_population(size, num_luts):
    population = {}
    for i in range(size):
        genotype = []
        for j in range(num_luts):
            lut = np.random.randint(0, 2**16)
            directions = np.random.normal(1, 1, 20)
            genotype.append([lut] + directions.tolist())
        population[i] = np.array(genotype)
    print(population[0])
    return population

def save_population_to_files(population, directory):
    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)
    for i, ind in population.items():
        filename = os.path.join(directory, f"individual_{i}.v")
        with open(filename, 'w') as f:
            verilog_code = generate_verilog(ind)
            f.write(verilog_code)
        
def mutate_population(population, rate=0.01):
    for i in population:
        genotype = population[i]
        for j in range(len(genotype)):
            # Mutate LUT
            if np.random.rand() < rate:
                genotype[j][0] = int(genotype[j][0]) ^ int((1 << np.random.randint(0,16)))
            # Mutate directions
            for d in range(1, 21):
                if np.random.rand() < rate:
                    genotype[j][d] += np.random.normal(0, 0.1)
        population[i] = genotype
    print(f"Individual 0: {population[0]}")

def evolve(population_size=32, genotype_length=25, generations=10, directory="./run"):
    def crossover(parent1, parent2):
        point = np.random.randint(1, genotype_length - 1)
        child = np.concatenate((parent1[:point], parent2[point:]))
        return child
    
    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)
    
    scorefile = os.path.join(directory, "scores.csv")
    with open(scorefile, 'w') as f:
        header = ",".join(["generation"] + [f"individual{i}" for i in range(population_size)]) + "\n"
        f.write(header)
    pop = make_population(population_size, genotype_length)
    for generation in range(generations):
        print(f"Generation {generation}")
        save_population_to_files(pop, os.path.join(directory, f"population_{generation}"))
        scores = simulate_directory(os.path.join(directory, f"population_{generation}"))
        print("Scores:", scores)
        print("Average score:", np.mean(list(scores.values())) if scores else 0)
        print("Best score:", max(scores.values()) if scores else 0)
        if scores:
            top_half = sorted(scores.items(), key=lambda kv: kv[1], reverse=True)[:population_size//2]
        else:
            print("No scores found.")
        if scorefile:
            with open(scorefile, 'a') as f:
                line = ",".join([str(generation)] + [str(scores.get(i, 0)) for i in range(population_size)]) + "\n"
                f.write(line)
        for ind in pop:
            if ind not in top_half:
                parent1 = top_half[np.random.randint(0, len(top_half))][0]
                parent2 = top_half[np.random.randint(0, len(top_half))][0]
                child_genotype = crossover(pop[parent1], pop[parent2])
                pop[ind] = child_genotype
        
        mutate_population(pop, rate=0.1)
        
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
    # evolve(population_size=64, genotype_length=9, generations=100, directory="./evolution_run_1")
    # synthesize_directory("./evolution_run_1/population_99")
    # pnr_directory("./evolution_run_1/population_99")
    try:
        evolve(population_size=4, genotype_length=1, generations=1, directory="./test_run")
    except Exception as e:
        print("An error occurred during evolution:", e)
    finally:
        synthesize_directory("./test_run/population_0")
        pnr_directory("./test_run/population_0")