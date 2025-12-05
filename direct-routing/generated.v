
module chip (input io_0_1_0, input io_0_2_0, inout io_0_3_0, inout io_0_4_0, inout io_0_5_0, inout io_0_6_0, inout io_0_7_0, inout io_0_8_0, inout io_0_9_0, inout io_0_10_0, inout io_0_11_0, inout io_0_12_0, inout io_0_13_0, inout io_0_14_0, inout io_0_15_0, inout io_0_16_0, inout io_1_0_0, inout io_1_17_0, input io_2_0_0, inout io_2_17_0, input io_3_0_0, inout io_3_17_0, input io_4_0_0, inout io_4_17_0, input io_5_0_0, inout io_5_17_0, input io_6_0_0, inout io_6_17_0, input io_7_0_0, inout io_7_17_0, input io_8_0_0, inout io_8_17_0, inout io_9_0_0, inout io_9_17_0, input io_10_0_0, inout io_10_17_0, input io_11_0_0, inout io_11_17_0, input io_12_0_0, inout io_12_17_0, inout io_13_1_0, inout io_13_2_0, inout io_13_3_0, inout io_13_4_0, inout io_13_5_0, inout io_13_6_0, inout io_13_7_0, inout io_13_8_0, inout io_13_9_0, inout io_13_10_0, inout io_13_11_0, inout io_13_12_0, inout io_13_13_0, inout io_13_14_0, inout io_13_15_0, inout io_13_16_0);

wire n1, n2, io_0_1_0, n4, n5, n6, io_0_2_0, n8, io_0_3_0, n10;
wire io_0_4_0, n12, io_0_5_0, n14, io_0_6_0, n16, io_0_7_0, n18, io_0_8_0, n20;
wire io_0_9_0, n22, io_0_10_0, n24, io_0_11_0, n26, io_0_12_0, n28, io_0_13_0, n30;
wire io_0_14_0, n32, io_0_15_0, n34, io_0_16_0, n36, io_1_0_0, n38, n39, n40;
wire io_1_17_0, n42, io_2_0_0, n44, n45, n46, n47, io_2_17_0, n49, io_3_0_0;
wire n51, n52, n53, io_3_17_0, n55, io_4_0_0, n57, n58, n59, io_4_17_0;
wire n61, io_5_0_0, n63, n64, n65, io_5_17_0, n67, io_6_0_0, n70, n71;
wire n72, io_6_17_0, n74, io_7_0_0, n76, n77, n78, io_7_17_0, n80, io_8_0_0;
wire n82, n83, n84, n85, n86, n87, n88, n89, n90, n91;
wire n92, n93, n94, n95, n96, n97, n98, n99, n100, io_8_17_0;
wire n102, io_9_0_0, n104, n105, n106, n107, io_9_17_0, n109, io_10_0_0, n111;
wire n112, io_10_17_0, n114, io_11_0_0, n116, n117, n118, io_11_17_0, n120, io_12_0_0;
wire n122, n123, io_12_17_0, io_13_1_0, io_13_2_0, io_13_3_0, io_13_4_0, io_13_5_0, io_13_6_0, io_13_7_0;
wire io_13_8_0, io_13_9_0, io_13_10_0, io_13_11_0, io_13_12_0, io_13_13_0, io_13_14_0, io_13_15_0, io_13_16_0, open_0;
wire open_1, open_2, open_3, open_4, open_5, open_6, open_7, open_8, open_9, open_10;
wire open_11, open_12, open_13, open_14, open_15, open_16, open_17, open_18, open_19, open_20;
wire open_21, open_22, open_23, open_24, open_25, open_26, open_27, open_28, open_29, open_30;
wire open_31, open_32, open_33, open_34, open_35, open_36, open_37, open_38, open_39, open_40;
wire open_41, open_42, open_43, open_44, open_45, open_46, open_47, open_48, open_49, open_50;
wire open_51, open_52, open_53, open_54, open_55, open_56, open_57, open_58, open_59, open_60;
wire open_61, open_62, open_63, open_64, open_65, open_66, open_67, open_68, open_69, open_70;
wire open_71, open_72, open_73, open_74, open_75, open_76, open_77, open_78, open_79, open_80;
wire open_81, open_82, open_83, open_84, open_85, open_86, open_87, open_88, open_89, open_90;
wire open_91, open_92, open_93, open_94, open_95, open_96, open_97, open_98, open_99, open_100;
wire open_101, open_102, open_103, open_104, open_105, open_106, open_107, open_108, open_109, open_110;
wire open_111, open_112, open_113, open_114, open_115, open_116, open_117, open_118, open_119, open_120;
wire open_121, open_122, open_123, open_124, open_125, open_126, open_127, open_128, open_129, open_130;
wire open_131, open_132, open_133, open_134, open_135, open_136, open_137, open_138, open_139, open_140;
wire open_141, open_142, open_143, open_144, open_145, open_146, open_147, open_148, open_149, open_150;
wire open_151, open_152, open_153, open_154, open_155, open_156, open_157, open_158, open_159, open_160;
wire open_161, open_162, open_163, open_164, open_165, open_166, open_167, open_168, open_169, open_170;
wire open_171, open_172, open_173, open_174, open_175, open_176, open_177, open_178, open_179, open_180;
wire open_181, open_182, open_183, open_184, open_185, open_186, open_187, open_188, open_189, open_190;
wire open_191, open_192, open_193, open_194, open_195, open_196, open_197, open_198, open_199, open_200;
wire open_201, open_202, open_203, open_204, open_205, open_206, open_207, open_208, open_209, open_210;
wire open_211, open_212, open_213, open_214, open_215, open_216, open_217, open_218, open_219, open_220;
wire open_221, open_222, open_223, open_224, open_225, open_226, open_227, open_228, open_229, open_230;
wire open_231, open_232, open_233, open_234, open_235, open_236, open_237, open_238, open_239, open_240;
wire open_241, open_242, open_243, open_244, open_245, open_246, open_247, open_248, open_249, open_250;
wire open_251, open_252, open_253, n153, n154, n155, n156, n158, n159, n161;
wire n162, n163, n164, n165, n166, n167, n168, n169, n170, n171;
wire n172, n173, n174, n176, n177, n178, n180, n181, n183, n184;
reg n69 = 0, n157 = 0, n160 = 0, n175 = 0, n179 = 0, n182 = 0;
assign n162 = 0;
assign n165 = 0;
assign n168 = 0;

// IO Cell (8, 17, 0)

// IO Cell (13, 16, 0)

// IO Cell (0, 1, 0)
reg n141;
always @(posedge 0) n141 <= io_0_1_0;
assign n1 = n141;

// IO Cell (0, 12, 0)

// IO Cell (6, 0, 0)
reg n142;
always @(posedge 0) n142 <= io_6_0_0;
assign n63 = n142;

// IO Cell (9, 17, 0)

// IO Cell (13, 7, 0)

// IO Cell (0, 3, 0)

// IO Cell (7, 0, 0)
reg n143;
always @(posedge 0) n143 <= io_7_0_0;
assign n70 = n143;

// IO Cell (10, 17, 0)

// IO Cell (13, 9, 0)

// IO Cell (11, 17, 0)

// IO Cell (0, 16, 0)

// IO Cell (0, 14, 0)

// IO Cell (13, 11, 0)

// IO Cell (0, 7, 0)

// IO Cell (3, 0, 0)
reg n144;
always @(posedge 0) n144 <= io_3_0_0;
assign n45 = n144;

// IO Cell (0, 5, 0)

// IO Cell (6, 17, 0)

// IO Cell (13, 2, 0)

// IO Cell (13, 13, 0)

// IO Cell (4, 0, 0)
reg n145;
always @(posedge 0) n145 <= io_4_0_0;
assign n51 = n145;

// IO Cell (7, 17, 0)

// IO Cell (13, 15, 0)

// IO Cell (0, 11, 0)

// IO Cell (5, 0, 0)
reg n146;
always @(posedge 0) n146 <= io_5_0_0;
assign n57 = n146;

// IO Cell (13, 6, 0)

// IO Cell (13, 4, 0)

// IO Cell (12, 0, 0)
reg n147;
always @(posedge 0) n147 <= io_12_0_0;
assign n116 = n147;

// IO Cell (0, 9, 0)

// IO Cell (0, 2, 0)
reg n148;
always @(posedge 0) n148 <= io_0_2_0;
assign n5 = n148;

// IO Cell (0, 13, 0)

// IO Cell (3, 17, 0)

// IO Cell (13, 8, 0)

// IO Cell (0, 4, 0)

// IO Cell (0, 15, 0)

// IO Cell (1, 0, 0)

// IO Cell (4, 17, 0)

// IO Cell (13, 10, 0)

// IO Cell (0, 6, 0)

// IO Cell (11, 0, 0)
reg n149;
always @(posedge 0) n149 <= io_11_0_0;
assign n111 = n149;

// IO Cell (2, 0, 0)
reg n150;
always @(posedge 0) n150 <= io_2_0_0;
assign n38 = n150;

// IO Cell (5, 17, 0)

// IO Cell (13, 1, 0)

// IO Cell (8, 0, 0)
reg n151;
always @(posedge 0) n151 <= io_8_0_0;
assign n76 = n151;

// IO Cell (9, 0, 0)

// IO Cell (12, 17, 0)

// IO Cell (13, 12, 0)

// IO Cell (0, 8, 0)

// IO Cell (10, 0, 0)
reg n152;
always @(posedge 0) n152 <= io_10_0_0;
assign n105 = n152;

// IO Cell (13, 3, 0)

// IO Cell (0, 10, 0)

// IO Cell (13, 14, 0)

// IO Cell (1, 17, 0)

// IO Cell (13, 5, 0)

// IO Cell (2, 17, 0)

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_1 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_0, open_1, open_2, open_3, open_4, open_5, open_6, n46, open_8, open_9, open_10, open_11, open_12, open_13, open_14, n44}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_1 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_15, open_16, open_17, open_18, open_19, open_20, open_21, n106, open_23, open_24, open_25, open_26, open_27, open_28, open_29, n104}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_3 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_30, open_31, open_32, open_33, open_34, open_35, open_36, open_37, open_38, open_39, open_40, open_41, open_42, open_43, open_44, open_45}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_3 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_46, open_47, open_48, open_49, open_50, open_51, open_52, open_53, open_54, open_55, open_56, open_57, open_58, open_59, open_60, open_61}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_5 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_62, open_63, open_64, open_65, open_66, open_67, open_68, open_69, open_70, open_71, open_72, open_73, open_74, open_75, open_76, open_77}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_5 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_78, open_79, open_80, open_81, open_82, open_83, open_84, open_85, open_86, open_87, open_88, open_89, open_90, open_91, open_92, open_93}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_7 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_94, open_95, open_96, open_97, open_98, open_99, open_100, open_101, open_102, open_103, open_104, open_105, open_106, open_107, open_108, open_109}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_7 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_110, open_111, open_112, open_113, open_114, open_115, open_116, open_117, open_118, open_119, open_120, open_121, open_122, open_123, open_124, open_125}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_9 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_126, open_127, open_128, open_129, open_130, open_131, open_132, open_133, open_134, open_135, open_136, open_137, open_138, open_139, open_140, open_141}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_9 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_142, open_143, open_144, open_145, open_146, open_147, open_148, open_149, open_150, open_151, open_152, open_153, open_154, open_155, open_156, open_157}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_11 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_158, open_159, open_160, open_161, open_162, open_163, open_164, open_165, open_166, open_167, open_168, open_169, open_170, open_171, open_172, open_173}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_11 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_174, open_175, open_176, open_177, open_178, open_179, open_180, open_181, open_182, open_183, open_184, open_185, open_186, open_187, open_188, open_189}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_13 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_190, open_191, open_192, open_193, open_194, open_195, open_196, open_197, open_198, open_199, open_200, open_201, open_202, open_203, open_204, open_205}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_13 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_206, open_207, open_208, open_209, open_210, open_211, open_212, open_213, open_214, open_215, open_216, open_217, open_218, open_219, open_220, open_221}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_3_15 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_222, open_223, open_224, open_225, open_226, open_227, open_228, open_229, open_230, open_231, open_232, open_233, open_234, open_235, open_236, open_237}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

SB_RAM40_4K #(
  .READ_MODE(0),
  .WRITE_MODE(0),
) ram40_10_15 (
  .WADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RADDR({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .MASK({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .WDATA({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}),
  .RDATA({open_238, open_239, open_240, open_241, open_242, open_243, open_244, open_245, open_246, open_247, open_248, open_249, open_250, open_251, open_252, open_253}),
  .WE(1'b0),
  .WCLKE(1'b1),
  .WCLK(1'b0),
  .RE(1'b0),
  .RCLKE(1'b1),
  .RCLK(1'b0)
);

assign n159 = /* LUT    6  2  0 */ 1'b0;
assign n166 = /* LUT    7  2  0 */ 1'b0;
assign n169 = /* LUT    4  2  0 */ 1'b0;
assign n170 = /* LUT    5  2  0 */ 1'b0;
assign n174 = /* LUT   12  2  0 */ 1'b0;
assign n177 = /* LUT    2  2  0 */ 1'b0;
assign n178 = /* LUT    1  2  0 */ 1'b0;
assign n181 = /* LUT    8  2  0 */ 1'b0;
assign n184 = /* LUT    9  2  0 */ 1'b0;
assign n156 = /* LUT   12  1  0 */ (n111 ? !n117 : (n111 ? n122 : (n117 ? 1'b0 : n122)));
assign n158 = /* LUT    2  1  0 */ (n44 ? (n39 ? !n45 : n45) : (n4 ? (n39 ? n45 : 1'b0) : 1'b1));
assign n161 = /* LUT    8  1  0 */ (n70 ? (n82 ? (n77 ? 1'b1 : n69) : (n77 ? 1'b0 : n69)) : (n82 ? n69 : (n77 ? 1'b0 : !n69)));
assign n164 = /* LUT    1  1  0 */ (n5 ? n1 : (n1 ? n38 : 1'b1));
assign n167 = /* LUT    9  1  0 */ (n104 ? (n104 ? n105 : (n83 ? n105 : 1'b0)) : (n104 ? n83 : (n83 ? n105 : !n105)));
assign n172 = /* LUT   11  1  0 */ (n106 ? (n84 ? n104 : (n104 ? !n116 : 1'b1)) : (n84 ? !n104 : n104));
assign n173 = /* LUT    7  1  0 */ (n64 ? (n63 ? (n76 ? !n70 : 1'b0) : (n76 ? n70 : 1'b0)) : (n63 ? !n70 : (n76 ? 1'b1 : !n70)));
assign n176 = /* LUT    6  1  0 */ (n58 ? n70 : (n70 ? 1'b1 : !n63));
assign n180 = /* LUT    4  1  0 */ (n46 ? (n45 ? 1'b1 : (n57 ? 1'b1 : n52)) : (n45 ? !n52 : (n57 ? n52 : !n52)));
assign n183 = /* LUT    5  1  0 */ (n51 ? (n51 ? 1'b0 : (n58 ? n58 : !n58)) : (n51 ? n58 : (n58 ? n58 : 1'b1)));
assign n153 = /* CARRY  8  1  0 */ (n77 & n82) | ((n77 | n82) & n162);
assign n154 = /* CARRY  1  1  0 */ (n1 & n5) | ((n1 | n5) & n165);
assign n155 = /* CARRY  9  1  0 */ (n83 & n104) | ((n83 | n104) & n168);
/* FF 12  1  0 */ assign n84 = n156;
/* FF  2  1  0 */ always @(posedge 1'b0) if (1'b1) n157 <= 1'b0 ? 1'b0 : n158;
/* FF  6  2  0 */ assign n64 = n159;
/* FF  8  1  0 */ always @(posedge 1'b0) if (1'b1) n160 <= 1'b0 ? 1'b1 : n161;
/* FF  1  1  0 */ assign n163 = n164;
/* FF  7  2  0 */ assign n71 = n166;
/* FF  9  1  0 */ assign n82 = n167;
/* FF  4  2  0 */ assign n52 = n169;
/* FF  5  2  0 */ assign n58 = n170;
/* FF 11  1  0 */ assign n171 = n172;
/* FF  7  1  0 */ always @(posedge 1'b0) if (1'b1) n69 <= 1'b0 ? 1'b0 : n173;
/* FF 12  2  0 */ assign n117 = n174;
/* FF  6  1  0 */ always @(posedge 1'b0) if (1'b1) n175 <= 1'b0 ? 1'b1 : n176;
/* FF  2  2  0 */ assign n39 = n177;
/* FF  1  2  0 */ assign n4 = n178;
/* FF  4  1  0 */ always @(posedge 1'b0, posedge 1'b0) if (1'b0) n179 <= 1'b0; else if (1'b1) n179 <= n180;
/* FF  8  2  0 */ assign n77 = n181;
/* FF  5  1  0 */ always @(posedge 1'b0) if (1'b1) n182 <= 1'b0 ? 1'b1 : n183;
/* FF  9  2  0 */ assign n83 = n184;

endmodule

