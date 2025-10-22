`timescale 1ns/1ps

module tb;
    reg [3:0] in;
    wire out;
    integer i;
    integer score = 0;
    integer total = 0;

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

    initial begin
        // Enable VCD dump
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        // Loop through all 16 input patterns
        for (i = 0; i < 16; i = i + 1) begin
            in = i;
            #5; // wait for signals to propagate
            total = total + 1;
            if (out === expected(in))
                score = score + 1;
            #5; // keep each input stable for 10 ns total
        end

        $display("SCORE: %0.10f", 1.0 * score / total);

        #10; // give VCD time to record last transition
        $finish;
    end
endmodule
