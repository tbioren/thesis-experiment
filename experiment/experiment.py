import numpy as np
import os
import subprocess
import time

# 0000 00 00 00 00 00 00 00 00
# LUT  0x 0y 1x 1y 2x 2y 3x 3y

class Node:
    """x, y, function, input0x input0y, input1x, input1y, input2x, input2y, input3x, input3y"""
    def __init__(self, x, y, function, input0x=None, input0y=None, input1x=None, input1y=None, input2x=None, input2y=None, input3x=None, input3y=None):
        self.x = x
        self.y = y
        self.function = function
        self.input0x = input0x
        self.input0y = input0y
        self.input1x = input1x
        self.input1y = input1y
        self.input2x = input2x
        self.input2y = input2y
        self.input3x = input3x
        self.input3y = input3y
    
    def to_verilog(self):
        def input_str(x, y):
            if x is None or y is None or (x == self.x and y == self.y):
                return "1'b0"
            elif self.x == 0:
                return f"in{y%10}"
            else:
                return f"x{x}_y{y}"
        # Adjust x coordinate based on FPGA physical layout
        adjusted_x = self.x
        if self.x < 5:
            adjusted_x = self.x + 1
        if 5 <= self.x < 18:
            adjusted_x = self.x + 2
        elif self.x >= 18:
            adjusted_x = self.x + 3
        
        return f"""
    (* keep, dont_touch *)
    (* BEL = "X{adjusted_x}/Y{int(self.y/8)+1}/lc{self.y%8}" *)
    SB_LUT4 #(
        .LUT_INIT(16'b{bin(self.function)[2:].zfill(16)[::-1]})
    ) lut_{self.x}_{self.y} (
        .O(x{self.x}_y{self.y}),
        .I0({input_str(self.input0x, self.input0y)}),
        .I1({input_str(self.input1x, self.input1y)}),
        .I2({input_str(self.input2x, self.input2y)}),
        .I3({input_str(self.input3x, self.input3y)})
    );"""

    def mutate(self, lut_rate=0.01, input_rate=0.1, x_radius=2, y_radius=5, none_weight=0.25):
        # Mutate the function with a certain probability
        flip_mask = 0
        for i in range(16):
            if np.random.rand() < lut_rate:
                flip_mask |= (1 << i)
        self.function ^= flip_mask

    def __repr__(self):
        return self.__str__()
    
def generate_verilog(genotype):
    nodes = []
    width = int(len(genotype) ** 0.5)
    for i, gene in enumerate(genotype):
        lut = gene & 0b11110000000000000000
        x = i % width
        y = i // width
        
        # Offsets
        input0x = (gene >> 14) & 0b11 - 2
        input0y = (gene >> 12) & 0b11 - 2
        input1x = (gene >> 10) & 0b11 - 2
        input1y = (gene >> 8) & 0b11 - 2
        input2x = (gene >> 6) & 0b11 - 2
        input2y = (gene >> 4) & 0b11 - 2
        input3x = (gene >> 2) & 0b11 - 2
        input3y = gene & 0b11 - 2

        # Actual Values
        input0x = x + input0x
        input0y = y + input0y
        input1x = x + input1x
        input1y = y + input1y
        input2x = x + input2x
        input2y = y + input2y
        input3x = x + input3x
        input3y = y + input3y

        nodes.append(Node(x, y, lut, input0x, input0y, input1x, input1y, input2x, input2y, input3x, input3y))
        
    
    outputs = []
    wires = []

    for node in nodes:
        if node.x == width - 1:
            outputs.append(f"x{node.x}_y{node.y}")
        else:
            wires.append(f"x{node.x}_y{node.y}")
            
    inputs = [f"in{i}" for i in range(width)]
    
    outputs = [f"x{width-1}_y{i}" for i in range(width)]
    
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
                ["nextpnr-ice40", "--up5k", "--json", filepath, "--asc", output_filepath, "--pcf", "./constraints.pcf", "--package", "sg48", "--pcf-allow-unconstrained"],
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
            
def simulate_directory(directory):
    for filename in os.listdir(directory):
        if filename.endswith("_sim.v"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace("_sim.v", "_sim.out"))
            subprocess.run(
                ["iverilog", filepath, "ice40_stubs.v", "tb.v", "-o", output_filepath],
                stdout=subprocess.DEVNULL,
                # stderr=subprocess.DEVNULL
            )
            
def population_to_bitstreams(population, directory):
    start_time = time.time()
    save_population_to_files(population, directory)
    synthesize_directory(directory)
    pnr_directory(directory)
    # Clean up intermediate files
    for filename in os.listdir(directory):
        if filename.endswith(".v") or filename.endswith(".rpt"):
            os.remove(os.path.join(directory, filename))
    print(f"Total time for bitstream generation: {time.time() - start_time} seconds")


def directory_to_simulation_verilog(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".asc"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace(".asc", "_sim.v"))
            os.system(f"icebox_vlog -n cgp_module {filepath} > {output_filepath}")

def simulate_population(population, directory):
    start_time = time.time()
    population_to_bitstreams(population, directory)
    directory_to_simulation_verilog(directory)
    simulate_directory(directory)
    # Clean up intermediate files
    for filename in os.listdir(directory):
        if filename.endswith(".v") or filename.endswith("_sim.v"):
            os.remove(os.path.join(directory, filename))
    print(f"Total time for simulation: {time.time() - start_time} seconds")
    
pop = make_population(10, 64)
simulate_population(pop, "./population")