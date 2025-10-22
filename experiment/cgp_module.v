module cgp_module (
    (* keep *) input in0, in1, in2, in3,
    (* keep *) output x3_y0, x3_y1, x3_y2, x3_y3);

    (* keep *) wire x0_y0, x1_y0, x2_y0, x0_y1, x1_y1, x2_y1, x0_y2, x1_y2, x2_y2, x0_y3, x1_y3, x2_y3;


    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000001)
    ) lut_0_0 (
        .O(x0_y0),
        .I0(in1),
        .I1(in0),
        .I2(in0),
        .I3(in1)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000001111)
    ) lut_1_0 (
        .O(x1_y0),
        .I0(x2_y0),
        .I1(x1_y0),
        .I2(x2_y1),
        .I3(x1_y1)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000101)
    ) lut_2_0 (
        .O(x2_y0),
        .I0(x3_y0),
        .I1(x3_y1),
        .I2(x2_y0),
        .I3(x3_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc0" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000000000000001)
    ) lut_3_0 (
        .O(x3_y0),
        .I0(x3_y0),
        .I1(x3_y0),
        .I2(x4_y1),
        .I3(x3_y0)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000001)
    ) lut_0_1 (
        .O(x0_y1),
        .I0(in1),
        .I1(in2),
        .I2(in2),
        .I3(in1)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000101)
    ) lut_1_1 (
        .O(x1_y1),
        .I0(x2_y2),
        .I1(x2_y2),
        .I2(x1_y2),
        .I3(x1_y2)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000001001)
    ) lut_2_1 (
        .O(x2_y1),
        .I0(x2_y2),
        .I1(x2_y1),
        .I2(x2_y1),
        .I3(x2_y1)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc1" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000000000000)
    ) lut_3_1 (
        .O(x3_y1),
        .I0(x4_y2),
        .I1(x3_y2),
        .I2(x4_y1),
        .I3(x3_y2)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000011)
    ) lut_0_2 (
        .O(x0_y2),
        .I0(in3),
        .I1(in2),
        .I2(in2),
        .I3(in3)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000000000000001)
    ) lut_1_2 (
        .O(x1_y2),
        .I0(x2_y2),
        .I1(x1_y2),
        .I2(x1_y2),
        .I3(x1_y3)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000111)
    ) lut_2_2 (
        .O(x2_y2),
        .I0(x2_y2),
        .I1(x3_y3),
        .I2(x2_y2),
        .I3(x2_y3)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc2" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000000000000101)
    ) lut_3_2 (
        .O(x3_y2),
        .I0(x3_y2),
        .I1(x4_y3),
        .I2(x3_y2),
        .I3(x4_y2)
    );

    (* keep, dont_touch *)
    (* BEL = "X1/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b0000000000000000011)
    ) lut_0_3 (
        .O(x0_y3),
        .I0(in3),
        .I1(in3),
        .I2(in3),
        .I3(in4)
    );

    (* keep, dont_touch *)
    (* BEL = "X2/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000111)
    ) lut_1_3 (
        .O(x1_y3),
        .I0(x1_y3),
        .I1(x2_y4),
        .I2(x1_y3),
        .I3(x1_y4)
    );

    (* keep, dont_touch *)
    (* BEL = "X3/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000001)
    ) lut_2_3 (
        .O(x2_y3),
        .I0(x3_y3),
        .I1(x3_y4),
        .I2(x2_y3),
        .I3(x3_y4)
    );

    (* keep, dont_touch *)
    (* BEL = "X4/Y1/lc3" *)
    SB_LUT4 #(
        .LUT_INIT(16'b00000000000000000111)
    ) lut_3_3 (
        .O(x3_y3),
        .I0(x3_y3),
        .I1(x4_y3),
        .I2(x4_y4),
        .I3(x3_y3)
    );

endmodule