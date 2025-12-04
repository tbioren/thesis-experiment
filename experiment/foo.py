import subprocess
import os

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
    synthesize_directory("./evolution_run_99/population_99")
    pnr_directory("./evolution_run_99/population_99")