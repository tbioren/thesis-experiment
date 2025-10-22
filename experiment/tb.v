`timescale 1ns/1ps

module tb;
    // Declare wires and regs
    reg clk = 0;
    reg reset = 0;

    // Declare outputs from DUT
    wire out_0;

    // Instantiate the device under test (DUT)
    // Replace `cgp_module` with your top module name
    cgp_module dut (
        .clk(clk),
        .reset(reset),
        .out_0(out_0)
    );

    // Clock generation (optional)
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        $dumpfile("tb.vcd");     // VCD waveform dump
        $dumpvars(0, tb);

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Run for a while
        #100;

        // Finish simulation
        $finish;
    end

    // Monitor only out_0
    initial begin
        $monitor("Time = %0t | out_0 = %b", $time, out_0);
    end
endmodule
