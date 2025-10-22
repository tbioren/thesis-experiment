module cgp_module (
    (* keep *) input in0, in1, in2, in3,
    (* keep *) output x3_y0, x3_y1, x3_y2, x3_y3);

    (* keep *) wire x0_y0, x1_y0, x2_y0, x0_y1, x1_y1, x2_y1, x0_y2, x1_y2, x2_y2, x0_y3, x1_y3, x2_y3;


    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000110100010)
    ) lut_0_0 (
        .O(x0_y0),
        .I0(1'b0),
        .I1(in0),
        .I2(1'b0),
        .I3(1'b0)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1101011101010101)
    ) lut_1_0 (
        .O(x1_y0),
        .I0(x0_y1),
        .I1(x0_y0),
        .I2(x0_y2),
        .I3(x0_y3)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1111101100110111)
    ) lut_2_0 (
        .O(x2_y0),
        .I0(x1_y0),
        .I1(x0_y3),
        .I2(x0_y1),
        .I3(x0_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0110101100001100)
    ) lut_3_0 (
        .O(x3_y0),
        .I0(1'b0),
        .I1(x2_y0),
        .I2(x2_y0),
        .I3(x1_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0100100100000100)
    ) lut_0_1 (
        .O(x0_y1),
        .I0(in1),
        .I1(in3),
        .I2(in1),
        .I3(in1)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1001110101010111)
    ) lut_1_1 (
        .O(x1_y1),
        .I0(1'b0),
        .I1(1'b0),
        .I2(x0_y1),
        .I3(x0_y3)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0111001110011011)
    ) lut_2_1 (
        .O(x2_y1),
        .I0(x1_y0),
        .I1(1'b0),
        .I2(1'b0),
        .I3(x0_y1)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1110100011100111)
    ) lut_3_1 (
        .O(x3_y1),
        .I0(x1_y2),
        .I1(1'b0),
        .I2(x1_y0),
        .I3(x2_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1101000010111000)
    ) lut_0_2 (
        .O(x0_y2),
        .I0(in2),
        .I1(1'b0),
        .I2(1'b0),
        .I3(in3)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0111011011010110)
    ) lut_1_2 (
        .O(x1_y2),
        .I0(1'b0),
        .I1(x0_y3),
        .I2(1'b0),
        .I3(1'b0)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1110011111001001)
    ) lut_2_2 (
        .O(x2_y2),
        .I0(x1_y3),
        .I1(x1_y3),
        .I2(x0_y0),
        .I3(x1_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1111100010001010)
    ) lut_3_2 (
        .O(x3_y2),
        .I0(x2_y0),
        .I1(x1_y0),
        .I2(1'b0),
        .I3(x1_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1110010101110000)
    ) lut_0_3 (
        .O(x0_y3),
        .I0(in0),
        .I1(1'b0),
        .I2(in0),
        .I3(in0)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1011111011001010)
    ) lut_1_3 (
        .O(x1_y3),
        .I0(x0_y3),
        .I1(x0_y3),
        .I2(x0_y3),
        .I3(x0_y3)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0010001101101001)
    ) lut_2_3 (
        .O(x2_y3),
        .I0(1'b0),
        .I1(x0_y3),
        .I2(1'b0),
        .I3(x0_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b1101111011110001)
    ) lut_3_3 (
        .O(x3_y3),
        .I0(x2_y3),
        .I1(x1_y2),
        .I2(1'b0),
        .I3(1'b0)
    );

endmodule