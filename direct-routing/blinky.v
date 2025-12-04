// Reading file 'blinky.asc'..

module chip (input io_0_16_1, output io_1_33_0, output io_3_33_1, output io_7_33_1, output io_6_33_1, output io_5_33_1, output io_4_33_1, output io_4_33_0, output io_3_33_0);

// (0, 0, 'glb_netwk_6')
// (0, 12, 'span4_vert_t_14')
// (0, 13, 'span4_vert_b_14')
// (0, 14, 'span4_vert_b_10')
// (0, 15, 'span4_vert_b_6')
// (0, 16, 'fabout')
// (0, 16, 'io_1/D_IN_0')
// (0, 16, 'io_1/PAD')
// (0, 16, 'local_g1_2')
// (0, 16, 'span4_vert_b_2')
// (1, 15, 'neigh_op_tnl_2')
// (1, 15, 'neigh_op_tnl_6')
// (1, 16, 'neigh_op_lft_2')
// (1, 16, 'neigh_op_lft_6')
// (1, 17, 'neigh_op_bnl_2')
// (1, 17, 'neigh_op_bnl_6')
// (3, 28, 'lutff_global/clk')
// (4, 28, 'lutff_global/clk')
// (4, 29, 'lutff_global/clk')
// (4, 30, 'lutff_global/clk')
// (4, 31, 'lutff_global/clk')
// (4, 32, 'lutff_global/clk')

wire n2;
// (0, 1, 'logic_op_rgt_0')
// (0, 2, 'logic_op_bnr_0')
// (1, 0, 'logic_op_top_0')
// (1, 1, 'lutff_0/out')
// (1, 2, 'neigh_op_bot_0')
// (2, 0, 'logic_op_tnl_0')
// (2, 1, 'local_g0_0')
// (2, 1, 'lutff_0/in_0')
// (2, 1, 'neigh_op_lft_0')
// (2, 2, 'neigh_op_bnl_0')

reg io_1_33_0 = 0;
// (0, 29, 'span4_vert_t_13')
// (0, 30, 'span4_vert_b_13')
// (0, 31, 'span4_vert_b_9')
// (0, 32, 'span4_vert_b_5')
// (1, 33, 'io_0/D_OUT_0')
// (1, 33, 'io_0/PAD')
// (1, 33, 'local_g1_5')
// (1, 33, 'span4_horz_r_5')
// (2, 33, 'span4_horz_r_9')
// (3, 30, 'sp4_r_v_b_42')
// (3, 31, 'neigh_op_tnr_1')
// (3, 31, 'sp4_r_v_b_31')
// (3, 32, 'neigh_op_rgt_1')
// (3, 32, 'sp4_r_v_b_18')
// (3, 33, 'logic_op_bnr_1')
// (3, 33, 'span4_horz_r_13')
// (4, 29, 'sp4_v_t_42')
// (4, 30, 'sp4_v_b_42')
// (4, 31, 'neigh_op_top_1')
// (4, 31, 'sp4_v_b_31')
// (4, 32, 'local_g0_1')
// (4, 32, 'lutff_1/in_2')
// (4, 32, 'lutff_1/out')
// (4, 32, 'sp4_v_b_18')
// (4, 33, 'logic_op_bot_1')
// (4, 33, 'span4_horz_l_13')
// (4, 33, 'span4_vert_7')
// (5, 31, 'neigh_op_tnl_1')
// (5, 32, 'neigh_op_lft_1')
// (5, 33, 'logic_op_bnl_1')

wire n4;
// (0, 32, 'span4_horz_33')
// (1, 32, 'sp4_h_r_44')
// (2, 32, 'sp4_h_l_44')
// (2, 32, 'sp4_h_r_5')
// (3, 32, 'sp4_h_r_16')
// (4, 32, 'sp4_h_r_29')
// (5, 32, 'sp4_h_r_40')
// (6, 32, 'sp4_h_l_40')

wire n5;
// (1, 0, 'logic_op_tnr_0')
// (1, 1, 'local_g2_0')
// (1, 1, 'lutff_0/in_0')
// (1, 1, 'neigh_op_rgt_0')
// (1, 2, 'neigh_op_bnr_0')
// (2, 0, 'logic_op_top_0')
// (2, 1, 'lutff_0/out')
// (2, 2, 'neigh_op_bot_0')
// (3, 0, 'logic_op_tnl_0')
// (3, 1, 'neigh_op_lft_0')
// (3, 2, 'neigh_op_bnl_0')

reg io_3_33_1 = 0;
// (1, 33, 'span4_horz_r_1')
// (2, 33, 'span4_horz_r_5')
// (3, 30, 'neigh_op_tnr_7')
// (3, 31, 'neigh_op_rgt_7')
// (3, 32, 'neigh_op_bnr_7')
// (3, 33, 'io_1/D_OUT_0')
// (3, 33, 'io_1/PAD')
// (3, 33, 'local_g0_1')
// (3, 33, 'span4_horz_r_9')
// (4, 30, 'neigh_op_top_7')
// (4, 30, 'sp4_r_v_b_42')
// (4, 31, 'local_g0_7')
// (4, 31, 'lutff_7/in_2')
// (4, 31, 'lutff_7/out')
// (4, 31, 'sp4_r_v_b_31')
// (4, 32, 'neigh_op_bot_7')
// (4, 32, 'sp4_r_v_b_18')
// (4, 33, 'span4_horz_r_13')
// (5, 29, 'sp4_v_t_42')
// (5, 30, 'neigh_op_tnl_7')
// (5, 30, 'sp4_v_b_42')
// (5, 31, 'neigh_op_lft_7')
// (5, 31, 'sp4_v_b_31')
// (5, 32, 'neigh_op_bnl_7')
// (5, 32, 'sp4_v_b_18')
// (5, 33, 'span4_horz_l_13')
// (5, 33, 'span4_vert_7')

wire n7;
// (2, 27, 'neigh_op_tnr_4')
// (2, 28, 'neigh_op_rgt_4')
// (2, 29, 'neigh_op_bnr_4')
// (3, 27, 'neigh_op_top_4')
// (3, 28, 'local_g0_4')
// (3, 28, 'lutff_4/out')
// (3, 28, 'lutff_5/in_1')
// (3, 29, 'neigh_op_bot_4')
// (4, 27, 'neigh_op_tnl_4')
// (4, 28, 'neigh_op_lft_4')
// (4, 29, 'neigh_op_bnl_4')

reg n8 = 0;
// (2, 27, 'neigh_op_tnr_5')
// (2, 28, 'neigh_op_rgt_5')
// (2, 29, 'neigh_op_bnr_5')
// (3, 25, 'sp4_r_v_b_46')
// (3, 26, 'sp4_r_v_b_35')
// (3, 27, 'neigh_op_top_5')
// (3, 27, 'sp4_r_v_b_22')
// (3, 28, 'local_g0_5')
// (3, 28, 'lutff_5/in_2')
// (3, 28, 'lutff_5/out')
// (3, 28, 'sp4_r_v_b_11')
// (3, 29, 'neigh_op_bot_5')
// (4, 24, 'sp4_v_t_46')
// (4, 25, 'sp4_v_b_46')
// (4, 26, 'sp4_v_b_35')
// (4, 27, 'neigh_op_tnl_5')
// (4, 27, 'sp4_v_b_22')
// (4, 28, 'local_g1_3')
// (4, 28, 'lutff_global/cen')
// (4, 28, 'neigh_op_lft_5')
// (4, 28, 'sp4_v_b_11')
// (4, 29, 'local_g2_5')
// (4, 29, 'lutff_0/in_1')
// (4, 29, 'neigh_op_bnl_5')

reg n9 = 0;
// (3, 27, 'neigh_op_tnr_6')
// (3, 28, 'neigh_op_rgt_6')
// (3, 29, 'neigh_op_bnr_6')
// (4, 27, 'neigh_op_top_6')
// (4, 28, 'local_g0_6')
// (4, 28, 'lutff_6/in_0')
// (4, 28, 'lutff_6/out')
// (4, 29, 'local_g1_6')
// (4, 29, 'lutff_1/in_2')
// (4, 29, 'neigh_op_bot_6')
// (5, 27, 'neigh_op_tnl_6')
// (5, 28, 'neigh_op_lft_6')
// (5, 29, 'neigh_op_bnl_6')

reg n10 = 0;
// (3, 28, 'neigh_op_tnr_2')
// (3, 29, 'neigh_op_rgt_2')
// (3, 30, 'neigh_op_bnr_2')
// (4, 28, 'neigh_op_top_2')
// (4, 29, 'local_g0_2')
// (4, 29, 'lutff_2/in_2')
// (4, 29, 'lutff_2/out')
// (4, 30, 'neigh_op_bot_2')
// (5, 28, 'neigh_op_tnl_2')
// (5, 29, 'neigh_op_lft_2')
// (5, 30, 'neigh_op_bnl_2')

reg n11 = 0;
// (3, 28, 'neigh_op_tnr_3')
// (3, 29, 'neigh_op_rgt_3')
// (3, 30, 'neigh_op_bnr_3')
// (4, 28, 'neigh_op_top_3')
// (4, 29, 'local_g0_3')
// (4, 29, 'lutff_3/in_2')
// (4, 29, 'lutff_3/out')
// (4, 30, 'neigh_op_bot_3')
// (5, 28, 'neigh_op_tnl_3')
// (5, 29, 'neigh_op_lft_3')
// (5, 30, 'neigh_op_bnl_3')

reg n12 = 0;
// (3, 28, 'neigh_op_tnr_4')
// (3, 29, 'neigh_op_rgt_4')
// (3, 30, 'neigh_op_bnr_4')
// (4, 28, 'neigh_op_top_4')
// (4, 29, 'local_g0_4')
// (4, 29, 'lutff_4/in_2')
// (4, 29, 'lutff_4/out')
// (4, 30, 'neigh_op_bot_4')
// (5, 28, 'neigh_op_tnl_4')
// (5, 29, 'neigh_op_lft_4')
// (5, 30, 'neigh_op_bnl_4')

reg n13 = 0;
// (3, 28, 'neigh_op_tnr_5')
// (3, 29, 'neigh_op_rgt_5')
// (3, 30, 'neigh_op_bnr_5')
// (4, 28, 'neigh_op_top_5')
// (4, 29, 'local_g0_5')
// (4, 29, 'lutff_5/in_2')
// (4, 29, 'lutff_5/out')
// (4, 30, 'neigh_op_bot_5')
// (5, 28, 'neigh_op_tnl_5')
// (5, 29, 'neigh_op_lft_5')
// (5, 30, 'neigh_op_bnl_5')

reg n14 = 0;
// (3, 28, 'neigh_op_tnr_6')
// (3, 29, 'neigh_op_rgt_6')
// (3, 30, 'neigh_op_bnr_6')
// (4, 28, 'neigh_op_top_6')
// (4, 29, 'local_g0_6')
// (4, 29, 'lutff_6/in_2')
// (4, 29, 'lutff_6/out')
// (4, 30, 'neigh_op_bot_6')
// (5, 28, 'neigh_op_tnl_6')
// (5, 29, 'neigh_op_lft_6')
// (5, 30, 'neigh_op_bnl_6')

reg n15 = 0;
// (3, 28, 'neigh_op_tnr_7')
// (3, 29, 'neigh_op_rgt_7')
// (3, 30, 'neigh_op_bnr_7')
// (4, 28, 'neigh_op_top_7')
// (4, 29, 'local_g0_7')
// (4, 29, 'lutff_7/in_2')
// (4, 29, 'lutff_7/out')
// (4, 30, 'neigh_op_bot_7')
// (5, 28, 'neigh_op_tnl_7')
// (5, 29, 'neigh_op_lft_7')
// (5, 30, 'neigh_op_bnl_7')

wire n16;
// (3, 29, 'neigh_op_tnr_0')
// (3, 30, 'neigh_op_rgt_0')
// (3, 31, 'neigh_op_bnr_0')
// (4, 29, 'neigh_op_top_0')
// (4, 30, 'local_g0_0')
// (4, 30, 'lutff_0/in_2')
// (4, 30, 'lutff_0/out')
// (4, 31, 'neigh_op_bot_0')
// (5, 29, 'neigh_op_tnl_0')
// (5, 30, 'neigh_op_lft_0')
// (5, 31, 'neigh_op_bnl_0')

reg n17 = 0;
// (3, 29, 'neigh_op_tnr_1')
// (3, 30, 'neigh_op_rgt_1')
// (3, 31, 'neigh_op_bnr_1')
// (4, 29, 'neigh_op_top_1')
// (4, 30, 'local_g0_1')
// (4, 30, 'lutff_1/in_2')
// (4, 30, 'lutff_1/out')
// (4, 31, 'neigh_op_bot_1')
// (5, 29, 'neigh_op_tnl_1')
// (5, 30, 'neigh_op_lft_1')
// (5, 31, 'neigh_op_bnl_1')

reg n18 = 0;
// (3, 29, 'neigh_op_tnr_2')
// (3, 30, 'neigh_op_rgt_2')
// (3, 31, 'neigh_op_bnr_2')
// (4, 29, 'neigh_op_top_2')
// (4, 30, 'local_g0_2')
// (4, 30, 'lutff_2/in_2')
// (4, 30, 'lutff_2/out')
// (4, 31, 'neigh_op_bot_2')
// (5, 29, 'neigh_op_tnl_2')
// (5, 30, 'neigh_op_lft_2')
// (5, 31, 'neigh_op_bnl_2')

reg n19 = 0;
// (3, 29, 'neigh_op_tnr_3')
// (3, 30, 'neigh_op_rgt_3')
// (3, 31, 'neigh_op_bnr_3')
// (4, 29, 'neigh_op_top_3')
// (4, 30, 'local_g0_3')
// (4, 30, 'lutff_3/in_2')
// (4, 30, 'lutff_3/out')
// (4, 30, 'lutff_7/in_2')
// (4, 31, 'neigh_op_bot_3')
// (5, 29, 'neigh_op_tnl_3')
// (5, 30, 'neigh_op_lft_3')
// (5, 31, 'neigh_op_bnl_3')

reg n20 = 0;
// (3, 29, 'neigh_op_tnr_4')
// (3, 30, 'neigh_op_rgt_4')
// (3, 31, 'neigh_op_bnr_4')
// (4, 29, 'neigh_op_top_4')
// (4, 30, 'local_g0_4')
// (4, 30, 'lutff_4/in_2')
// (4, 30, 'lutff_4/out')
// (4, 31, 'neigh_op_bot_4')
// (5, 29, 'neigh_op_tnl_4')
// (5, 30, 'neigh_op_lft_4')
// (5, 31, 'neigh_op_bnl_4')

reg n21 = 0;
// (3, 29, 'neigh_op_tnr_5')
// (3, 30, 'neigh_op_rgt_5')
// (3, 31, 'neigh_op_bnr_5')
// (4, 29, 'neigh_op_top_5')
// (4, 30, 'local_g0_5')
// (4, 30, 'lutff_5/in_2')
// (4, 30, 'lutff_5/out')
// (4, 31, 'neigh_op_bot_5')
// (5, 29, 'neigh_op_tnl_5')
// (5, 30, 'neigh_op_lft_5')
// (5, 31, 'neigh_op_bnl_5')

reg n22 = 0;
// (3, 29, 'neigh_op_tnr_6')
// (3, 30, 'neigh_op_rgt_6')
// (3, 31, 'neigh_op_bnr_6')
// (4, 29, 'neigh_op_top_6')
// (4, 30, 'local_g0_6')
// (4, 30, 'lutff_6/in_2')
// (4, 30, 'lutff_6/out')
// (4, 31, 'neigh_op_bot_6')
// (5, 29, 'neigh_op_tnl_6')
// (5, 30, 'neigh_op_lft_6')
// (5, 31, 'neigh_op_bnl_6')

reg n23 = 0;
// (3, 29, 'neigh_op_tnr_7')
// (3, 30, 'neigh_op_rgt_7')
// (3, 31, 'neigh_op_bnr_7')
// (4, 29, 'neigh_op_top_7')
// (4, 30, 'local_g0_7')
// (4, 30, 'lutff_7/out')
// (4, 31, 'neigh_op_bot_7')
// (5, 29, 'neigh_op_tnl_7')
// (5, 30, 'neigh_op_lft_7')
// (5, 31, 'neigh_op_bnl_7')

reg io_7_33_1 = 0;
// (3, 30, 'neigh_op_tnr_2')
// (3, 31, 'neigh_op_rgt_2')
// (3, 31, 'sp4_h_r_9')
// (3, 32, 'neigh_op_bnr_2')
// (4, 30, 'neigh_op_top_2')
// (4, 31, 'lutff_2/out')
// (4, 31, 'sp4_h_r_20')
// (4, 32, 'neigh_op_bot_2')
// (5, 30, 'neigh_op_tnl_2')
// (5, 31, 'neigh_op_lft_2')
// (5, 31, 'sp4_h_r_33')
// (5, 32, 'neigh_op_bnl_2')
// (6, 31, 'sp4_h_r_44')
// (6, 32, 'sp4_r_v_b_44')
// (7, 31, 'sp4_h_l_44')
// (7, 31, 'sp4_v_t_44')
// (7, 32, 'sp4_v_b_44')
// (7, 33, 'io_1/D_OUT_0')
// (7, 33, 'io_1/PAD')
// (7, 33, 'local_g0_1')
// (7, 33, 'span4_vert_33')

reg io_6_33_1 = 0;
// (3, 30, 'neigh_op_tnr_3')
// (3, 31, 'neigh_op_rgt_3')
// (3, 32, 'neigh_op_bnr_3')
// (4, 28, 'sp4_r_v_b_42')
// (4, 29, 'sp4_r_v_b_31')
// (4, 30, 'neigh_op_top_3')
// (4, 30, 'sp4_r_v_b_18')
// (4, 31, 'lutff_3/out')
// (4, 31, 'sp4_r_v_b_7')
// (4, 32, 'neigh_op_bot_3')
// (4, 32, 'sp4_r_v_b_42')
// (5, 27, 'sp4_v_t_42')
// (5, 28, 'sp4_v_b_42')
// (5, 29, 'sp4_v_b_31')
// (5, 30, 'neigh_op_tnl_3')
// (5, 30, 'sp4_v_b_18')
// (5, 31, 'neigh_op_lft_3')
// (5, 31, 'sp4_v_b_7')
// (5, 31, 'sp4_v_t_42')
// (5, 32, 'neigh_op_bnl_3')
// (5, 32, 'sp4_v_b_42')
// (5, 33, 'span4_horz_r_1')
// (5, 33, 'span4_vert_31')
// (6, 33, 'io_1/D_OUT_0')
// (6, 33, 'io_1/PAD')
// (6, 33, 'local_g0_5')
// (6, 33, 'span4_horz_r_5')
// (7, 33, 'span4_horz_r_9')
// (8, 33, 'span4_horz_r_13')
// (9, 33, 'span4_horz_l_13')

reg io_5_33_1 = 0;
// (3, 30, 'neigh_op_tnr_4')
// (3, 31, 'neigh_op_rgt_4')
// (3, 32, 'neigh_op_bnr_4')
// (4, 30, 'neigh_op_top_4')
// (4, 30, 'sp4_r_v_b_36')
// (4, 31, 'local_g0_4')
// (4, 31, 'lutff_4/in_2')
// (4, 31, 'lutff_4/out')
// (4, 31, 'sp4_r_v_b_25')
// (4, 32, 'neigh_op_bot_4')
// (4, 32, 'sp4_r_v_b_12')
// (5, 29, 'sp4_v_t_36')
// (5, 30, 'neigh_op_tnl_4')
// (5, 30, 'sp4_v_b_36')
// (5, 31, 'neigh_op_lft_4')
// (5, 31, 'sp4_v_b_25')
// (5, 32, 'neigh_op_bnl_4')
// (5, 32, 'sp4_v_b_12')
// (5, 33, 'io_1/D_OUT_0')
// (5, 33, 'io_1/PAD')
// (5, 33, 'local_g0_1')
// (5, 33, 'span4_vert_1')

reg io_4_33_1 = 0;
// (3, 30, 'neigh_op_tnr_5')
// (3, 30, 'sp4_r_v_b_39')
// (3, 31, 'neigh_op_rgt_5')
// (3, 31, 'sp4_r_v_b_26')
// (3, 32, 'neigh_op_bnr_5')
// (3, 32, 'sp4_r_v_b_15')
// (4, 29, 'sp4_v_t_39')
// (4, 30, 'neigh_op_top_5')
// (4, 30, 'sp4_v_b_39')
// (4, 31, 'local_g0_5')
// (4, 31, 'lutff_5/in_2')
// (4, 31, 'lutff_5/out')
// (4, 31, 'sp4_v_b_26')
// (4, 32, 'neigh_op_bot_5')
// (4, 32, 'sp4_v_b_15')
// (4, 33, 'io_1/D_OUT_0')
// (4, 33, 'io_1/PAD')
// (4, 33, 'local_g1_2')
// (4, 33, 'span4_vert_2')
// (5, 30, 'neigh_op_tnl_5')
// (5, 31, 'neigh_op_lft_5')
// (5, 32, 'neigh_op_bnl_5')

reg io_4_33_0 = 0;
// (3, 30, 'neigh_op_tnr_6')
// (3, 31, 'neigh_op_rgt_6')
// (3, 32, 'neigh_op_bnr_6')
// (4, 25, 'sp12_v_t_23')
// (4, 26, 'sp12_v_b_23')
// (4, 27, 'sp12_v_b_20')
// (4, 28, 'sp12_v_b_19')
// (4, 29, 'sp12_v_b_16')
// (4, 30, 'neigh_op_top_6')
// (4, 30, 'sp12_v_b_15')
// (4, 31, 'local_g0_6')
// (4, 31, 'lutff_6/in_2')
// (4, 31, 'lutff_6/out')
// (4, 31, 'sp12_v_b_12')
// (4, 32, 'neigh_op_bot_6')
// (4, 32, 'sp12_v_b_11')
// (4, 33, 'io_0/D_OUT_0')
// (4, 33, 'io_0/PAD')
// (4, 33, 'local_g0_0')
// (4, 33, 'span12_vert_8')
// (5, 30, 'neigh_op_tnl_6')
// (5, 31, 'neigh_op_lft_6')
// (5, 32, 'neigh_op_bnl_6')

reg io_3_33_0 = 0;
// (3, 31, 'neigh_op_tnr_0')
// (3, 32, 'neigh_op_rgt_0')
// (3, 33, 'io_0/D_OUT_0')
// (3, 33, 'io_0/PAD')
// (3, 33, 'local_g0_0')
// (3, 33, 'logic_op_bnr_0')
// (4, 31, 'neigh_op_top_0')
// (4, 32, 'local_g0_0')
// (4, 32, 'lutff_0/in_2')
// (4, 32, 'lutff_0/out')
// (4, 33, 'logic_op_bot_0')
// (5, 31, 'neigh_op_tnl_0')
// (5, 32, 'neigh_op_lft_0')
// (5, 33, 'logic_op_bnl_0')

wire n30;
// (4, 8, 'neigh_op_tnr_2')
// (4, 9, 'neigh_op_rgt_2')
// (4, 10, 'neigh_op_bnr_2')
// (5, 8, 'neigh_op_top_2')
// (5, 9, 'lutff_2/out')
// (5, 10, 'neigh_op_bot_2')
// (6, 8, 'neigh_op_tnl_2')
// (6, 9, 'local_g0_2')
// (6, 9, 'lutff_0/in_2')
// (6, 9, 'neigh_op_lft_2')
// (6, 10, 'neigh_op_bnl_2')

wire n31;
// (4, 29, 'lutff_1/cout')
// (4, 29, 'lutff_2/in_3')

wire n32;
// (4, 29, 'lutff_2/cout')
// (4, 29, 'lutff_3/in_3')

wire n33;
// (4, 29, 'lutff_3/cout')
// (4, 29, 'lutff_4/in_3')

wire n34;
// (4, 29, 'lutff_4/cout')
// (4, 29, 'lutff_5/in_3')

wire n35;
// (4, 29, 'lutff_5/cout')
// (4, 29, 'lutff_6/in_3')

wire n36;
// (4, 29, 'lutff_6/cout')
// (4, 29, 'lutff_7/in_3')

wire n37;
// (4, 29, 'lutff_7/cout')
// (4, 30, 'carry_in')
// (4, 30, 'carry_in_mux')
// (4, 30, 'lutff_0/in_3')

wire n38;
// (4, 30, 'lutff_0/cout')
// (4, 30, 'lutff_1/in_3')

wire n39;
// (4, 30, 'lutff_1/cout')
// (4, 30, 'lutff_2/in_3')

wire n40;
// (4, 30, 'lutff_2/cout')
// (4, 30, 'lutff_3/in_3')

wire n41;
// (4, 30, 'lutff_3/cout')
// (4, 30, 'lutff_4/in_3')

wire n42;
// (4, 30, 'lutff_4/cout')
// (4, 30, 'lutff_5/in_3')

wire n43;
// (4, 30, 'lutff_5/cout')
// (4, 30, 'lutff_6/in_3')

wire n44;
// (4, 30, 'lutff_6/cout')
// (4, 30, 'lutff_7/in_3')

wire n45;
// (4, 31, 'local_g0_1')
// (4, 31, 'lutff_1/in_2')

wire n46;
// (4, 31, 'local_g0_2')
// (4, 31, 'lutff_2/in_2')

wire n47;
// (4, 31, 'local_g0_3')
// (4, 31, 'lutff_3/in_2')

wire n48;
// (4, 31, 'lutff_0/cout')
// (4, 31, 'lutff_1/in_3')

wire n49;
// (4, 31, 'lutff_1/cout')
// (4, 31, 'lutff_2/in_3')

wire n50;
// (4, 31, 'lutff_2/cout')
// (4, 31, 'lutff_3/in_3')

wire n51;
// (4, 31, 'lutff_3/cout')
// (4, 31, 'lutff_4/in_3')

wire n52;
// (4, 31, 'lutff_4/cout')
// (4, 31, 'lutff_5/in_3')

wire n53;
// (4, 31, 'lutff_5/cout')
// (4, 31, 'lutff_6/in_3')

wire n54;
// (4, 31, 'lutff_6/cout')
// (4, 31, 'lutff_7/in_3')

wire n55;
// (4, 31, 'lutff_7/cout')
// (4, 32, 'carry_in')
// (4, 32, 'carry_in_mux')
// (4, 32, 'lutff_0/in_3')

wire n56;
// (4, 32, 'lutff_0/cout')
// (4, 32, 'lutff_1/in_3')

wire n57;
// (5, 7, 'neigh_op_tnr_1')
// (5, 8, 'neigh_op_rgt_1')
// (5, 9, 'neigh_op_bnr_1')
// (6, 7, 'neigh_op_top_1')
// (6, 8, 'lutff_1/out')
// (6, 9, 'local_g0_1')
// (6, 9, 'lutff_0/in_1')
// (6, 9, 'neigh_op_bot_1')
// (7, 7, 'neigh_op_tnl_1')
// (7, 8, 'neigh_op_lft_1')
// (7, 9, 'neigh_op_bnl_1')

wire n58;
// (5, 8, 'neigh_op_tnr_0')
// (5, 9, 'neigh_op_rgt_0')
// (5, 10, 'neigh_op_bnr_0')
// (6, 8, 'neigh_op_top_0')
// (6, 9, 'lutff_0/out')
// (6, 10, 'neigh_op_bot_0')
// (7, 8, 'neigh_op_tnl_0')
// (7, 9, 'local_g0_0')
// (7, 9, 'lutff_0/in_0')
// (7, 9, 'neigh_op_lft_0')
// (7, 10, 'neigh_op_bnl_0')

wire n59;
// (6, 7, 'neigh_op_tnr_0')
// (6, 8, 'neigh_op_rgt_0')
// (6, 9, 'local_g0_0')
// (6, 9, 'lutff_0/in_0')
// (6, 9, 'neigh_op_bnr_0')
// (7, 7, 'neigh_op_top_0')
// (7, 8, 'lutff_0/out')
// (7, 9, 'neigh_op_bot_0')
// (8, 7, 'neigh_op_tnl_0')
// (8, 8, 'neigh_op_lft_0')
// (8, 9, 'neigh_op_bnl_0')

wire n60;
// (6, 8, 'neigh_op_tnr_3')
// (6, 9, 'local_g2_3')
// (6, 9, 'lutff_0/in_3')
// (6, 9, 'neigh_op_rgt_3')
// (6, 10, 'neigh_op_bnr_3')
// (7, 8, 'neigh_op_top_3')
// (7, 9, 'lutff_3/out')
// (7, 10, 'neigh_op_bot_3')
// (8, 8, 'neigh_op_tnl_3')
// (8, 9, 'neigh_op_lft_3')
// (8, 10, 'neigh_op_bnl_3')

wire n61;
// (8, 9, 'neigh_op_tnr_0')
// (8, 10, 'neigh_op_rgt_0')
// (8, 11, 'neigh_op_bnr_0')
// (9, 9, 'local_g0_0')
// (9, 9, 'lutff_0/in_0')
// (9, 9, 'neigh_op_top_0')
// (9, 10, 'lutff_0/out')
// (9, 11, 'neigh_op_bot_0')
// (10, 9, 'neigh_op_tnl_0')
// (10, 10, 'neigh_op_lft_0')
// (10, 11, 'neigh_op_bnl_0')

wire n62;
// (12, 8, 'neigh_op_tnr_2')
// (12, 9, 'neigh_op_rgt_2')
// (12, 10, 'neigh_op_bnr_2')
// (13, 8, 'neigh_op_top_2')
// (13, 9, 'lutff_2/out')
// (13, 10, 'neigh_op_bot_2')
// (14, 8, 'neigh_op_tnl_2')
// (14, 9, 'local_g0_2')
// (14, 9, 'lutff_0/in_2')
// (14, 9, 'neigh_op_lft_2')
// (14, 10, 'neigh_op_bnl_2')

wire n63;
// (12, 10, 'neigh_op_tnr_0')
// (12, 11, 'neigh_op_rgt_0')
// (12, 12, 'neigh_op_bnr_0')
// (13, 10, 'local_g0_0')
// (13, 10, 'lutff_0/in_0')
// (13, 10, 'neigh_op_top_0')
// (13, 11, 'lutff_0/out')
// (13, 12, 'neigh_op_bot_0')
// (14, 10, 'neigh_op_tnl_0')
// (14, 11, 'neigh_op_lft_0')
// (14, 12, 'neigh_op_bnl_0')

wire n64;
// (13, 7, 'neigh_op_tnr_0')
// (13, 8, 'neigh_op_rgt_0')
// (13, 9, 'neigh_op_bnr_0')
// (14, 7, 'neigh_op_top_0')
// (14, 8, 'lutff_0/out')
// (14, 9, 'local_g0_0')
// (14, 9, 'lutff_0/in_0')
// (14, 9, 'neigh_op_bot_0')
// (15, 7, 'neigh_op_tnl_0')
// (15, 8, 'neigh_op_lft_0')
// (15, 9, 'neigh_op_bnl_0')

wire n65;
// (13, 9, 'neigh_op_tnr_1')
// (13, 10, 'neigh_op_rgt_1')
// (13, 11, 'neigh_op_bnr_1')
// (14, 9, 'local_g0_1')
// (14, 9, 'lutff_0/in_1')
// (14, 9, 'neigh_op_top_1')
// (14, 10, 'lutff_1/out')
// (14, 11, 'neigh_op_bot_1')
// (15, 9, 'neigh_op_tnl_1')
// (15, 10, 'neigh_op_lft_1')
// (15, 11, 'neigh_op_bnl_1')

wire n66;
// (14, 8, 'neigh_op_tnr_3')
// (14, 9, 'local_g2_3')
// (14, 9, 'lutff_0/in_3')
// (14, 9, 'neigh_op_rgt_3')
// (14, 10, 'neigh_op_bnr_3')
// (15, 8, 'neigh_op_top_3')
// (15, 9, 'lutff_3/out')
// (15, 10, 'neigh_op_bot_3')
// (16, 8, 'neigh_op_tnl_3')
// (16, 9, 'neigh_op_lft_3')
// (16, 10, 'neigh_op_bnl_3')

wire n67;
// (14, 16, 'neigh_op_tnr_0')
// (14, 17, 'neigh_op_rgt_0')
// (14, 18, 'neigh_op_bnr_0')
// (15, 16, 'neigh_op_top_0')
// (15, 17, 'lutff_0/out')
// (15, 18, 'neigh_op_bot_0')
// (16, 16, 'neigh_op_tnl_0')
// (16, 17, 'local_g0_0')
// (16, 17, 'lutff_0/in_0')
// (16, 17, 'neigh_op_lft_0')
// (16, 18, 'neigh_op_bnl_0')

wire n68;
// (15, 16, 'neigh_op_tnr_0')
// (15, 17, 'local_g2_0')
// (15, 17, 'lutff_0/in_0')
// (15, 17, 'neigh_op_rgt_0')
// (15, 18, 'neigh_op_bnr_0')
// (16, 16, 'neigh_op_top_0')
// (16, 17, 'lutff_0/out')
// (16, 18, 'neigh_op_bot_0')
// (17, 16, 'neigh_op_tnl_0')
// (17, 17, 'neigh_op_lft_0')
// (17, 18, 'neigh_op_bnl_0')

wire n69;
// (4, 29, 'lutff_0/cout')

wire n70;
// (4, 30, 'lutff_7/cout')

wire n71;
// (6, 9, 'lutff_0/lout')

wire n72;
// (4, 30, 'lutff_2/lout')

wire n73;
// (4, 30, 'lutff_5/lout')

wire n74;
// (2, 1, 'lutff_0/lout')

wire n75;
// (7, 9, 'lutff_0/out')

wire n76;
// (7, 9, 'lutff_0/lout')

wire n77;
// (7, 9, 'lutff_3/lout')

wire n78;
// (4, 29, 'lutff_0/out')

wire n79;
// (4, 29, 'lutff_0/lout')

wire n80;
// (4, 29, 'carry_in_mux')

// Carry-In for (4 29)
assign n80 = 1;

wire n81;
// (4, 29, 'lutff_6/lout')

wire n82;
// (4, 29, 'lutff_3/lout')

wire n83;
// (4, 31, 'lutff_0/out')

wire n84;
// (4, 31, 'lutff_0/lout')

wire n85;
// (4, 31, 'lutff_6/lout')

wire n86;
// (4, 31, 'lutff_3/lout')

wire n87;
// (3, 28, 'lutff_4/lout')

wire n88;
// (15, 9, 'lutff_3/lout')

wire n89;
// (9, 10, 'lutff_0/lout')

wire n90;
// (1, 1, 'lutff_0/lout')

wire n91;
// (13, 11, 'lutff_0/lout')

wire n92;
// (4, 30, 'lutff_1/lout')

wire n93;
// (4, 30, 'lutff_4/lout')

wire n94;
// (4, 32, 'lutff_1/lout')

wire n95;
// (4, 30, 'lutff_7/lout')

wire n96;
// (7, 8, 'lutff_0/lout')

wire n97;
// (13, 9, 'lutff_2/lout')

wire n98;
// (4, 29, 'lutff_2/lout')

wire n99;
// (4, 29, 'lutff_5/lout')

wire n100;
// (4, 31, 'lutff_2/lout')

wire n101;
// (15, 17, 'lutff_0/lout')

wire n102;
// (4, 31, 'lutff_5/lout')

wire n103;
// (16, 17, 'lutff_0/lout')

wire n104;
// (4, 28, 'lutff_6/lout')

wire n105;
// (14, 9, 'lutff_0/out')

wire n106;
// (14, 9, 'lutff_0/lout')

wire n107;
// (13, 10, 'lutff_0/out')

wire n108;
// (13, 10, 'lutff_0/lout')

wire n109;
// (4, 30, 'lutff_0/lout')

wire n110;
// (4, 30, 'lutff_6/lout')

wire n111;
// (4, 30, 'lutff_3/lout')

wire n112;
// (4, 32, 'lutff_0/lout')

wire n113;
// (9, 9, 'lutff_0/out')

wire n114;
// (9, 9, 'lutff_0/lout')

wire n115;
// (5, 9, 'lutff_2/lout')

wire n116;
// (4, 29, 'lutff_1/out')

wire n117;
// (4, 29, 'lutff_1/lout')

wire n118;
// (4, 29, 'lutff_4/lout')

reg n119 = 0;
// (4, 31, 'lutff_1/out')

wire n120;
// (4, 31, 'lutff_1/lout')

wire n121;
// (4, 29, 'lutff_7/lout')

wire n122;
// (4, 31, 'lutff_4/lout')

wire n123;
// (14, 10, 'lutff_1/lout')

wire n124;
// (3, 28, 'lutff_5/lout')

wire n125;
// (4, 31, 'lutff_7/lout')

wire n126;
// (14, 8, 'lutff_0/lout')

wire n127;
// (6, 8, 'lutff_1/lout')

assign n71  = /* LUT    6  9  0 */ 1'b0;
assign n77  = /* LUT    7  9  3 */ 1'b0;
assign n79  = /* LUT    4 29  0 */ 1'b0;
assign n88  = /* LUT   15  9  3 */ 1'b0;
assign n89  = /* LUT    9 10  0 */ 1'b0;
assign n91  = /* LUT   13 11  0 */ 1'b0;
assign n96  = /* LUT    7  8  0 */ 1'b0;
assign n97  = /* LUT   13  9  2 */ 1'b0;
assign n106 = /* LUT   14  9  0 */ 1'b0;
assign n115 = /* LUT    5  9  2 */ 1'b0;
assign n117 = /* LUT    4 29  1 */ 1'b0;
assign n123 = /* LUT   14 10  1 */ 1'b0;
assign n126 = /* LUT   14  8  0 */ 1'b0;
assign n127 = /* LUT    6  8  1 */ 1'b0;
assign n72  = /* LUT    4 30  2 */ (n39 ? !n18 : n18);
assign n73  = /* LUT    4 30  5 */ (n42 ? !n21 : n21);
assign n74  = /* LUT    2  1  0 */ 1'b0;
assign n76  = /* LUT    7  9  0 */ 1'b0;
assign n81  = /* LUT    4 29  6 */ (n35 ? !n14 : n14);
assign n82  = /* LUT    4 29  3 */ (n32 ? !n11 : n11);
assign n84  = /* LUT    4 31  0 */ 1'b0;
assign n85  = /* LUT    4 31  6 */ (n53 ? !io_4_33_0 : io_4_33_0);
assign n86  = /* LUT    4 31  3 */ (n50 ? !n47 : n47);
assign n87  = /* LUT    3 28  4 */ 1'b1;
assign n90  = /* LUT    1  1  0 */ 1'b0;
assign n92  = /* LUT    4 30  1 */ (n38 ? !n17 : n17);
assign n93  = /* LUT    4 30  4 */ (n41 ? !n20 : n20);
assign n94  = /* LUT    4 32  1 */ (n56 ? !io_1_33_0 : io_1_33_0);
assign n95  = /* LUT    4 30  7 */ 1'b0;
assign n98  = /* LUT    4 29  2 */ (n31 ? !n10 : n10);
assign n99  = /* LUT    4 29  5 */ (n34 ? !n13 : n13);
assign n100 = /* LUT    4 31  2 */ (n49 ? !n46 : n46);
assign n101 = /* LUT   15 17  0 */ 1'b0;
assign n102 = /* LUT    4 31  5 */ (n52 ? !io_4_33_1 : io_4_33_1);
assign n103 = /* LUT   16 17  0 */ 1'b0;
assign n104 = /* LUT    4 28  6 */ !n9;
assign n108 = /* LUT   13 10  0 */ 1'b0;
assign n109 = /* LUT    4 30  0 */ n16;
assign n110 = /* LUT    4 30  6 */ (n43 ? !n22 : n22);
assign n111 = /* LUT    4 30  3 */ (n40 ? !n19 : n19);
assign n112 = /* LUT    4 32  0 */ (n55 ? !io_3_33_0 : io_3_33_0);
assign n114 = /* LUT    9  9  0 */ 1'b0;
assign n118 = /* LUT    4 29  4 */ (n33 ? !n12 : n12);
assign n120 = /* LUT    4 31  1 */ (n48 ? !n45 : 1'b0);
assign n121 = /* LUT    4 29  7 */ (n36 ? !n15 : n15);
assign n122 = /* LUT    4 31  4 */ (n51 ? !io_5_33_1 : io_5_33_1);
assign n124 = /* LUT    3 28  5 */ (n8 ? !n7 : n7);
assign n125 = /* LUT    4 31  7 */ (n54 ? !io_3_33_1 : io_3_33_1);
assign n40  = /* CARRY  4 30  2 */ (1'b0 & n18) | ((1'b0 | n18) & n39);
assign n43  = /* CARRY  4 30  5 */ (1'b0 & n21) | ((1'b0 | n21) & n42);
assign n69  = /* CARRY  4 29  0 */ (n8 & 1'b0) | ((n8 | 1'b0) & n80);
assign n36  = /* CARRY  4 29  6 */ (1'b0 & n14) | ((1'b0 | n14) & n35);
assign n33  = /* CARRY  4 29  3 */ (1'b0 & n11) | ((1'b0 | n11) & n32);
assign n54  = /* CARRY  4 31  6 */ (1'b0 & io_4_33_0) | ((1'b0 | io_4_33_0) & n53);
assign n51  = /* CARRY  4 31  3 */ (1'b0 & n47) | ((1'b0 | n47) & n50);
assign n39  = /* CARRY  4 30  1 */ (1'b0 & n17) | ((1'b0 | n17) & n38);
assign n42  = /* CARRY  4 30  4 */ (1'b0 & n20) | ((1'b0 | n20) & n41);
assign n70  = /* CARRY  4 30  7 */ (1'b0 & n19) | ((1'b0 | n19) & n44);
assign n32  = /* CARRY  4 29  2 */ (1'b0 & n10) | ((1'b0 | n10) & n31);
assign n35  = /* CARRY  4 29  5 */ (1'b0 & n13) | ((1'b0 | n13) & n34);
assign n50  = /* CARRY  4 31  2 */ (1'b0 & n46) | ((1'b0 | n46) & n49);
assign n53  = /* CARRY  4 31  5 */ (1'b0 & io_4_33_1) | ((1'b0 | io_4_33_1) & n52);
assign n44  = /* CARRY  4 30  6 */ (1'b0 & n22) | ((1'b0 | n22) & n43);
assign n41  = /* CARRY  4 30  3 */ (1'b0 & n19) | ((1'b0 | n19) & n40);
assign n56  = /* CARRY  4 32  0 */ (1'b0 & io_3_33_0) | ((1'b0 | io_3_33_0) & n55);
assign n31  = /* CARRY  4 29  1 */ (1'b0 & n9) | ((1'b0 | n9) & n69);
assign n34  = /* CARRY  4 29  4 */ (1'b0 & n12) | ((1'b0 | n12) & n33);
assign n49  = /* CARRY  4 31  1 */ (1'b0 & n45) | ((1'b0 | n45) & n48);
assign n37  = /* CARRY  4 29  7 */ (1'b0 & n15) | ((1'b0 | n15) & n36);
assign n52  = /* CARRY  4 31  4 */ (1'b0 & io_5_33_1) | ((1'b0 | io_5_33_1) & n51);
assign n55  = /* CARRY  4 31  7 */ (1'b0 & io_3_33_1) | ((1'b0 | io_3_33_1) & n54);
/* FF  6  9  0 */ assign n58 = n71;
/* FF  4 30  2 */ always @(posedge io_0_16_1) if (1'b1) n18 <= 1'b0 ? 1'b0 : n72;
/* FF  4 30  5 */ always @(posedge io_0_16_1) if (1'b1) n21 <= 1'b0 ? 1'b0 : n73;
/* FF  2  1  0 */ assign n5 = n74;
/* FF  7  9  0 */ assign n75 = n76;
/* FF  7  9  3 */ assign n60 = n77;
/* FF  4 29  0 */ assign n78 = n79;
/* FF  4 29  6 */ always @(posedge io_0_16_1) if (1'b1) n14 <= 1'b0 ? 1'b0 : n81;
/* FF  4 29  3 */ always @(posedge io_0_16_1) if (1'b1) n11 <= 1'b0 ? 1'b0 : n82;
/* FF  4 31  0 */ assign n83 = n84;
/* FF  4 31  6 */ always @(posedge io_0_16_1) if (1'b1) io_4_33_0 <= 1'b0 ? 1'b0 : n85;
/* FF  4 31  3 */ always @(posedge io_0_16_1) if (1'b1) io_6_33_1 <= 1'b0 ? 1'b0 : n86;
/* FF  3 28  4 */ assign n7 = n87;
/* FF 15  9  3 */ assign n66 = n88;
/* FF  9 10  0 */ assign n61 = n89;
/* FF  1  1  0 */ assign n2 = n90;
/* FF 13 11  0 */ assign n63 = n91;
/* FF  4 30  1 */ always @(posedge io_0_16_1) if (1'b1) n17 <= 1'b0 ? 1'b0 : n92;
/* FF  4 30  4 */ always @(posedge io_0_16_1) if (1'b1) n20 <= 1'b0 ? 1'b0 : n93;
/* FF  4 32  1 */ always @(posedge io_0_16_1) if (1'b1) io_1_33_0 <= 1'b0 ? 1'b0 : n94;
/* FF  4 30  7 */ always @(posedge io_0_16_1, posedge 1'b0) if (1'b0) n23 <= 1'b0; else if (1'b1) n23 <= n95;
/* FF  7  8  0 */ assign n59 = n96;
/* FF 13  9  2 */ assign n62 = n97;
/* FF  4 29  2 */ always @(posedge io_0_16_1) if (1'b1) n10 <= 1'b0 ? 1'b0 : n98;
/* FF  4 29  5 */ always @(posedge io_0_16_1) if (1'b1) n13 <= 1'b0 ? 1'b0 : n99;
/* FF  4 31  2 */ always @(posedge io_0_16_1) if (1'b1) io_7_33_1 <= 1'b0 ? 1'b0 : n100;
/* FF 15 17  0 */ assign n67 = n101;
/* FF  4 31  5 */ always @(posedge io_0_16_1) if (1'b1) io_4_33_1 <= 1'b0 ? 1'b0 : n102;
/* FF 16 17  0 */ assign n68 = n103;
/* FF  4 28  6 */ always @(posedge io_0_16_1) if (n8) n9 <= 1'b0 ? 1'b0 : n104;
/* FF 14  9  0 */ assign n105 = n106;
/* FF 13 10  0 */ assign n107 = n108;
/* FF  4 30  0 */ assign n16 = n109;
/* FF  4 30  6 */ always @(posedge io_0_16_1) if (1'b1) n22 <= 1'b0 ? 1'b0 : n110;
/* FF  4 30  3 */ always @(posedge io_0_16_1) if (1'b1) n19 <= 1'b0 ? 1'b0 : n111;
/* FF  4 32  0 */ always @(posedge io_0_16_1) if (1'b1) io_3_33_0 <= 1'b0 ? 1'b0 : n112;
/* FF  9  9  0 */ assign n113 = n114;
/* FF  5  9  2 */ assign n30 = n115;
/* FF  4 29  1 */ assign n116 = n117;
/* FF  4 29  4 */ always @(posedge io_0_16_1) if (1'b1) n12 <= 1'b0 ? 1'b0 : n118;
/* FF  4 31  1 */ always @(posedge io_0_16_1) if (1'b1) n119 <= 1'b0 ? 1'b0 : n120;
/* FF  4 29  7 */ always @(posedge io_0_16_1) if (1'b1) n15 <= 1'b0 ? 1'b0 : n121;
/* FF  4 31  4 */ always @(posedge io_0_16_1) if (1'b1) io_5_33_1 <= 1'b0 ? 1'b0 : n122;
/* FF 14 10  1 */ assign n65 = n123;
/* FF  3 28  5 */ always @(posedge io_0_16_1) if (1'b1) n8 <= 1'b0 ? 1'b0 : n124;
/* FF  4 31  7 */ always @(posedge io_0_16_1) if (1'b1) io_3_33_1 <= 1'b0 ? 1'b0 : n125;
/* FF 14  8  0 */ assign n64 = n126;
/* FF  6  8  1 */ assign n57 = n127;

endmodule

