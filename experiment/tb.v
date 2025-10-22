`timescale 1ns/1ps

module tb;
    // Declare DUT inputs and tie them high
    reg in0 = 1'b1;
    reg in1 = 1'b1;
    reg in2 = 1'b1;
    reg in3 = 1'b1;
    reg in4 = 1'b1;
    reg in5 = 1'b1;
    reg in6 = 1'b1;
    reg in7 = 1'b1;
    reg in8 = 1'b1;
    reg in9 = 1'b1;

    // DUT outputs
    wire out0, out1, out2, out3, out4, out5, out6, out7, out8, out9;

    // Instantiate the device under test (DUT)
    cgp_module dut (
        .in0(in0),
        .in1(in1),
        .in2(in2),
        .in3(in3),
        .in4(in4),
        .in5(in5),
        .in6(in6),
        .in7(in7),
        .in8(in8),
        .in9(in9),
        .out0(out0),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4),
        .out5(out5),
        .out6(out6),
        .out7(out7),
        .out8(out8),
        .out9(out9)
    );

    // Simulation setup
    initial begin
        $dumpfile("tb.vcd");
        $dumpvars(0, tb);

        #1000; // Run for 1000 ns
        $finish;
    end

    // Monitor all outputs
    initial begin
        $monitor("Time = %0t | out0=%b out1=%b out2=%b out3=%b out4=%b out5=%b out6=%b out7=%b out8=%b out9=%b",
                 $time, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);
    end
endmodule
