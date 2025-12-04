# Node Genotype Layout:
# ----------------
# 0 - 2  | Input 0 (3 bits encoding TileDirection)
# 3 - 5  | Input 1 (3 bits encoding TileDirection)
# 6 - 8  | Input 2 (3 bits encoding TileDirection)
# 9 - 11 | Input 3 (3 bits encoding TileDirection)
# 12 - 31 | LUT Init (20 bits)

import os
import subprocess
import numpy as np
from dataclasses import dataclass
import random
from config_gen import TileDirection, generate_tile

@dataclass
class Config:
    lut_size: int = 20
    node_size: int = lut_size + 12  # 32 total bits
    mutation_rate: float = 0.01
    num_nodes: int = 16
    population_size: int = 32
    generations: int = 10

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

def decode_direction(bits):
    """Convert 3-bit integer (0-7) to TileDirection."""
    if bits < 0 or bits > 7:
        return TileDirection.NULL
    return DIRECTION_MAP[bits]

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
    input0 = decode_direction((gene >> 0) & 0x7)
    input1 = decode_direction((gene >> 3) & 0x7)
    input2 = decode_direction((gene >> 6) & 0x7)
    input3 = decode_direction((gene >> 9) & 0x7)

    # Extract 20-bit LUT init (bits 12-31)
    lut_init = (gene >> 12) & 0xFFFFF

    return input0, input1, input2, input3, lut_init

def generate_tile_from_gene(x, y, gene):
    """Generate a tile configuration from a 32-bit gene."""
    input0, input1, input2, input3, lut_init = decode_genotype(gene)
    return generate_tile(x, y, input0, input1, input2, input3, lut_init)

def generate_asc_config(genotype):
    """
    Generate ASCII bitstream configuration from genotype.

    Args:
        genotype: Array of genes, one per node

    Returns:
        String containing the ASCII bitstream
    """
    # For now, generate tiles for all nodes
    tiles = []
    for gene in genotype:
        tile = generate_tile_from_gene(gene)
        tiles.append(tile)

    # TODO: Format tiles into proper ASCII bitstream format
    # This will need to match the iCE40 ASCII format
    return tiles

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
    print(f"Individual 0: {population[0]}")
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
    print("Initial Population:")
    print(generate_tile_from_gene(population[0][0]))