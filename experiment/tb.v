`timescale 1ns/1ps

module tb;
    reg [3:0] in;
    wire out0, out1, out2, out3;
    reg [3:0] out_vec;
    reg [3:0] exp_vec;
    integer i, bit;
    real total_distance = 0;
    real total_bits = 0;
    real score;

    // DUT
    cgp_module dut (
        .in0(in[0]), .in1(in[1]),
        .in2(in[2]), .in3(in[3]),
        .out0(out0), .out1(out1),
        .out2(out2), .out3(out3)
    );

    // Expected 4-bit sum for a 2-bit + 2-bit adder
    function [3:0] expected;
        input [3:0] v;
        reg [1:0] A, B;
        reg [3:0] S;
        begin
            A = v[1:0];
            B = v[3:2];
            S = A + B;
            expected = S;
        end
    endfunction

    // Hamming distance for one bit
    function integer hamming_bit;
        input a, b;
        begin
            hamming_bit = (a !== b) ? 1 : 0;
        end
    endfunction

    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #5;

            // Capture outputs into a vector (LSB = out0)
            out_vec = {out3, out2, out1, out0};
            exp_vec = expected(in);

            // Compare bit by bit
            for (bit = 0; bit < 4; bit = bit + 1) begin
                total_distance = total_distance + hamming_bit(out_vec[bit], exp_vec[bit]);
                total_bits = total_bits + 1;
            end

            #5;
        end

        score = 1.0 - (1.0 * total_distance / total_bits);
        if (score == 0.5) score = 0.0; // discourage trivial outputs
        $display("SCORE: %0.10f", score);

        #10;
        $finish;
    end
endmodule
