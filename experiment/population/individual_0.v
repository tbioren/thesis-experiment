module cgp_module (
    (* keep *) input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9,
    (* keep *) output out0, out1, out2, out3, out4, out5, out6, out7, out8, out9);

    (* keep *) wire x0_y0, x1_y0, x2_y0, x0_y1, x1_y1, x2_y1, x0_y2, x1_y2, x2_y2;


        (* keep, dont_touch *)
        (* BEL = "X1/Y1/lc0" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000001100)
        ) lut_x0_y0 (
        .O(x0_y0),
        .I0(in1),
        .I1(in0),
        .I2(in9),
        .I3(in9)
        );

        (* keep, dont_touch *)
        (* BEL = "X2/Y1/lc0" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000001110)
        ) lut_x1_y0 (
        .O(x1_y0),
        .I0(1'b0),
        .I1(1'b0),
        .I2(1'b0),
        .I3(1'b0)
        );

        (* keep, dont_touch *)
        (* BEL = "X3/Y1/lc0" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000000101)
        ) lut_out0 (
        .O(out0),
        .I0(x0_y1),
        .I1(1'b0),
        .I2(1'b0),
        .I3(1'b0)
        );

        (* keep, dont_touch *)
        (* BEL = "X1/Y1/lc1" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000001101)
        ) lut_x0_y1 (
        .O(x0_y1),
        .I0(in9),
        .I1(in9),
        .I2(in9),
        .I3(in2)
        );

        (* keep, dont_touch *)
        (* BEL = "X2/Y1/lc1" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000000100)
        ) lut_x1_y1 (
        .O(x1_y1),
        .I0(1'b0),
        .I1(x2_y0),
        .I2(x1_y1),
        .I3(x1_y0)
        );

        (* keep, dont_touch *)
        (* BEL = "X3/Y1/lc1" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000001011)
        ) lut_out1 (
        .O(out1),
        .I0(x2_y1),
        .I1(x1_y0),
        .I2(1'b0),
        .I3(x1_y2)
        );

        (* keep, dont_touch *)
        (* BEL = "X1/Y1/lc2" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000000001)
        ) lut_x0_y2 (
        .O(x0_y2),
        .I0(in0),
        .I1(in1),
        .I2(in2),
        .I3(in0)
        );

        (* keep, dont_touch *)
        (* BEL = "X2/Y1/lc2" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000000001)
        ) lut_x1_y2 (
        .O(x1_y2),
        .I0(1'b0),
        .I1(1'b0),
        .I2(x1_y2),
        .I3(x2_y0)
        );

        (* keep, dont_touch *)
        (* BEL = "X3/Y1/lc2" *)
        SB_LUT4 #(
        .LUT_INIT(16'b0000000000000110)
        ) lut_out2 (
        .O(out2),
        .I0(1'b0),
        .I1(x0_y1),
        .I2(1'b0),
        .I3(x1_y1)
        );

endmodule