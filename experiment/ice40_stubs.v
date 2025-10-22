// Minimal behavioral models for iCE40 primitives

// 4-input LUT
module SB_LUT4 #(parameter [15:0] LUT_INIT = 16'h0000) (
    input I0, I1, I2, I3,
    output O
);
    assign O = LUT_INIT[{I3, I2, I1, I0}];
endmodule
