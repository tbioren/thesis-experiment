import os
import subprocess

def directory_to_simulation_verilog(directory):
    for filename in os.listdir(directory):
        if filename.endswith(".v"):
            filepath = os.path.join(directory, filename)
            output_filepath = os.path.join(directory, filename.replace(".v", "_sim"))
            subprocess.run(
                ["iverilog", "-o", output_filepath, filepath, "./ice40_stubs.v", "./tb.v"],
                # stdout=subprocess.DEVNULL,
                # stderr=subprocess.DEVNULL
            )
            subprocess.run(
                ["vvp", output_filepath],
                # stdout=subprocess.DEVNULL,
                # stderr=subprocess.DEVNULL
            )
            subprocess.run(
                ["mv", "tb.vcd", output_filepath + ".vcd"],
                # stdout=subprocess.DEVNULL,
                # stderr=subprocess.DEVNULL
            )

directory_to_simulation_verilog("./population")