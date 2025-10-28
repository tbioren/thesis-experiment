`timescale 1ns/1ps

module tb;
    reg [3:0] in;
    wire out;
    integer i;
    real total_distance = 0;
    real total = 0;
    real score;

    // DUT
    cgp_module dut (
        .in0(in[0]), .in1(in[1]),
        .in2(in[2]), .in3(in[3]),
        .out0(out)
    );

    // Expected XOR function
    function expected;
        input [3:0] v;
        expected = v[0] ^ v[1] ^ v[2] ^ v[3];
    endfunction

    // Compute Hamming distance between two bits
    function integer hamming_bit;
        input a, b;
        hamming_bit = (a !== b) ? 1 : 0;
    endfunction

    initial begin
        // Enable VCD dump
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        // Loop through all 16 input patterns
        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #5; // wait for signals to propagate

            // add 1 if the bits differ
            total_distance = total_distance + hamming_bit(out, expected(in));
            total = total + 1;

            #5; // keep each input stable for 10 ns total
        end

        score = 1.0 - (1.0 * total_distance / total);
        if(score == 0.5) score = 0.0;
        $display("SCORE: %0.10f", score);

        #10; // give VCD time to record last transition
        $finish;
    end
endmodule
