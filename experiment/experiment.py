import numpy as np
import os
import subprocess
import time

from node import Node
    
def generate_verilog(genotype):
    nodes = []
    width = int(len(genotype) ** 0.5)
    for i, gene in enumerate(genotype):
        lut = (gene & 0b11110000000000000000) >> 16
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
            
    inputs = [f"in{i}" for i in range(10)]
    outputs = [f"out{i}" for i in range(10)]
    
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
            
def make_population(size, genotype_length):
    return [np.random.randint(0, 2**20, size=genotype_length, dtype=np.uint32) for _ in range(size)]

def save_population_to_files(population, directory):
    for i, ind in enumerate(population):
        filename = f"{directory}/individual_{i}.v"
        with open(filename, 'w') as f:
            verilog_code = generate_verilog(ind)
            f.write(verilog_code)
            
def population_to_bitstreams(population, directory):
    start_time = time.time()
    save_population_to_files(population, directory)
    synthesize_directory(directory)
    pnr_directory(directory)
    print(f"Total time for bitstream generation: {time.time() - start_time} seconds")
    
# pop = make_population(10, 9)
# population_to_bitstreams(pop, "./population")

synthesize_directory("./population_99")
pnr_directory("./population_99")