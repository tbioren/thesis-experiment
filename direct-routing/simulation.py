# Node Genotype Layout:
# ----------------
# 0 - 1  | Input 0 (3 bits encoding TileDirection)
# 2 - 3  | Input 1 (3 bits encoding TileDirection)
# 4 - 5  | Input 2 (3 bits encoding TileDirection)
# 6 - 7  | Input 3 (3 bits encoding TileDirection)
# 8 - 27 | LUT Init (20 bits)

# TODO: If a RAM tile separates 2 tiles, use an sp4_h net to connect them.
#       This means setting B1[46] in the left tile and telling the right tile to connect to relevant span

import math
import os
import subprocess
import numpy as np
from dataclasses import dataclass, field
import random
from config_improved import TileDirection, generate_tile

@dataclass
class Config:
    lut_size: int = 20
    node_size: int = lut_size + 8  # 28 total bits
    mutation_rate: float = 0.01
    num_nodes: int = 30
    population_size: int = 10
    generations: int = 10
    board_width: int = 10
    logic_tiles: list[tuple[int, int]] = field(default_factory=lambda: [(c, r) for r in range(18) for c in range(14) if r not in {0, 17} and c not in {0, 3, 10, 13}]) # This generates the coords of all the logic tiles (I know it's awful)
    ram_tiles: list[tuple[int, int]] = field(default_factory=lambda: [(c, r) for r in range(18) for c in (3, 10) if r not in {0, 17}])
    io_tiles: list[tuple[int, int]] = field(default_factory=lambda: [(c, r) for r in range(18) for c in range(14) if (r in (0, 17) or c in (0, 13)) and (c, r) not in [(0,0), (13,0), (13,17), (0,17)]])
    ram_columns: list = field(default_factory=lambda: [3, 10])
    
# Mapping from 3-bit integer to TileDirection
DIRECTION_MAP = [
    TileDirection.BOT,
    TileDirection.TOP,
    TileDirection.LFT,
    TileDirection.RGT,
    TileDirection.BNL,
    TileDirection.BNR,
    TileDirection.TNL,
    TileDirection.TNR,
]

INPUT_COVERAGE = {
    0: [TileDirection.BOT, TileDirection.TOP, TileDirection.LFT, TileDirection.BNR],
    1: [TileDirection.BOT, TileDirection.TOP, TileDirection.LFT, TileDirection.BNR],
    2: [TileDirection.RGT, TileDirection.BNL, TileDirection.TNL, TileDirection.TNR],
    3: [TileDirection.RGT, TileDirection.BNL, TileDirection.TNL, TileDirection.TNR],
}

def decode_direction(input_num, bits):
    """Convert 3-bit integer (0-7) to TileDirection."""
    if bits < 0 or bits > 7:
        return TileDirection.NULL
    return INPUT_COVERAGE[input_num][bits]

def encode_direction(direction):
    """Convert TileDirection to 3-bit integer (0-7)."""
    try:
        return DIRECTION_MAP.index(direction)
    except ValueError:
        return 0

def decode_genotype(gene):
    """
    Decode a 32-bit gene into tile configuration.

    Returns:
        (input0, input1, input2, input3, lut_init)
    """
    # Extract 3-bit direction encodings
    input0 = decode_direction(0, (gene >> 0) & 0x3)
    input1 = decode_direction(1, (gene >> 2) & 0x3)
    input2 = decode_direction(2, (gene >> 4) & 0x3)
    input3 = decode_direction(3, (gene >> 6) & 0x3)

    # Extract 20-bit LUT init (bits 12-31)
    lut_init = (gene >> 12) & 0xFFFFF

    return input0, input1, input2, input3, lut_init

def generate_tile_from_gene(x, y, gene, output=False, past_ram=False):
    """Generate a tile configuration from a 32-bit gene."""
    input0, input1, input2, input3, lut_init = decode_genotype(gene)
    return generate_tile(x, y, input0, input1, input2, input3, lut_init, output, past_ram)

def generate_asc_config(genotype):
    """
    Generate ASCII bitstream configuration from genotype.

    Args:
        genotype: Array of genes, one per node

    Returns:
        String containing the ASCII bitstream
    """
    
    def blank_io(x, y):
        return f".io_tile {x} {y}\n" + \
                "000000000000000000\n" + \
                "000000110000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000010000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n" + \
                "000000000000000000\n"
    
    def blank_ram(x, y):
        return f".ram{'t' if y % 2 == 0 else 'b'}_tile {x} {y}\n" + "\n".join(["0"*42 for _ in range(16)])
    
    def blank_logic(x, y):
        return f".logic_tile {x} {y}\n" + "\n".join(["0"*54 for _ in range(16)])
    
    config = Config()
    asc = ".comment direct routing generated\n.device 1k\n"
    for i in range(len(genotype)):
        x, y = config.logic_tiles[i]
        gene = genotype[i]
        output = ((i+1) % config.board_width == 0)
        past_ram = (x-1) in config.ram_columns
        tile = generate_tile_from_gene(x, y, gene, output, past_ram)
        asc += tile + "\n"
        
    for i in range(len(genotype), len(config.logic_tiles)):
        x, y = config.logic_tiles[i]
        tile = blank_logic(x, y)
        asc += tile + "\n"

    for x, y in config.io_tiles:
        tile = blank_io(x, y)
        asc += tile + "\n"
        
    for x, y in config.ram_tiles:
        tile = blank_ram(x, y)
        asc += tile + "\n"
        
    return asc

def make_population(size, num_nodes):
    """Create initial random population."""
    population = {}
    for i in range(size):
        genotype = []
        for j in range(num_nodes):
            # Random 32-bit gene
            gene = np.random.randint(0, 2**32, dtype=np.uint32)
            genotype.append(gene)
        population[i] = np.array(genotype, dtype=np.uint32)
    # print(f"Individual 0: {population[0]}")
    return population

def save_population_to_files(population, directory):
    """Save population configurations to ASCII files."""
    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)
    for i, ind in population.items():
        filename = os.path.join(directory, f"individual_{i}.asc")
        with open(filename, 'w') as f:
            tiles = generate_asc_config(ind)
            # TODO: Write proper ASCII format
            f.write(f"# Individual {i}\n")
            for tile_idx, tile in enumerate(tiles):
                f.write(f"# Tile {tile_idx}\n")
                for bank in tile:
                    f.write(''.join(bank) + '\n')

def mutate_population(population, rate=0.01):
    """Mutate population by flipping random bits."""
    for i in population:
        genotype = population[i]
        for j in range(len(genotype)):
            # Mutate by flipping random bits
            if np.random.rand() < rate:
                bit_to_flip = np.random.randint(0, 32)
                genotype[j] = genotype[j] ^ (1 << bit_to_flip)
        population[i] = genotype
    print(f"Individual 0 after mutation: {population[0]}")

def simulate_directory(directory):
    """
    Simulate all configurations in a directory.

    TODO: Implement actual FPGA simulation or testing
    For now, returns random scores.
    """
    scores = {}
    for filename in os.listdir(directory):
        if filename.endswith(".asc"):
            # Extract individual number from filename
            num_str = ''.join(ch for ch in filename if ch.isdigit())
            if num_str:
                # TODO: Replace with actual simulation/testing
                scores[int(num_str)] = np.random.rand()
    return scores

def evolve(population_size=32, num_nodes=16, generations=10, directory="./run"):
    """Run evolutionary algorithm."""
    def crossover(parent1, parent2):
        point = np.random.randint(1, num_nodes - 1)
        child = np.concatenate((parent1[:point], parent2[point:]))
        return child

    if not os.path.isdir(directory):
        os.makedirs(directory, exist_ok=True)

    scorefile = os.path.join(directory, "scores.csv")
    with open(scorefile, 'w') as f:
        header = ",".join(["generation"] + [f"individual{i}" for i in range(population_size)]) + "\n"
        f.write(header)

    pop = make_population(population_size, num_nodes)

    for generation in range(generations):
        print(f"\nGeneration {generation}")
        gen_dir = os.path.join(directory, f"population_{generation}")
        save_population_to_files(pop, gen_dir)

        scores = simulate_directory(gen_dir)
        print("Scores:", scores)
        print("Average score:", np.mean(list(scores.values())) if scores else 0)
        print("Best score:", max(scores.values()) if scores else 0)

        if scores:
            top_half = sorted(scores.items(), key=lambda kv: kv[1], reverse=True)[:population_size//2]
        else:
            print("No scores found.")
            break

        # Save scores
        with open(scorefile, 'a') as f:
            line = ",".join([str(generation)] + [str(scores.get(i, 0)) for i in range(population_size)]) + "\n"
            f.write(line)

        # Breed next generation
        for ind in pop:
            if ind not in [k for k, v in top_half]:
                parent1 = top_half[np.random.randint(0, len(top_half))][0]
                parent2 = top_half[np.random.randint(0, len(top_half))][0]
                child_genotype = crossover(pop[parent1], pop[parent2])
                pop[ind] = child_genotype

        mutate_population(pop, rate=0.01)

if __name__ == "__main__":
    config = Config()
    population = make_population(config.population_size, config.num_nodes)
    # print("Initial Population:")
    print(generate_asc_config(population[0]))