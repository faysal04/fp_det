////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: Ethernet_Virtex6.v
// /___/   /\     Timestamp: Wed Feb 18 12:48:40 2026
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg/Ethernet_Virtex6.ngc ./tmp/_cg/Ethernet_Virtex6.v 
// Device	: 6vlx240tff1156-1
// Input file	: ./tmp/_cg/Ethernet_Virtex6.ngc
// Output file	: ./tmp/_cg/Ethernet_Virtex6.v
// # of Modules	: 1
// Design Name	: Ethernet_Virtex6
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module Ethernet_Virtex6 (
  rx_axi_clk, glbl_rstn, rx_axis_mac_tuser, gmii_tx_en, tx_axi_rstn, gmii_tx_er, tx_collision, rx_axi_rstn, tx_axis_mac_tlast, tx_retransmit, 
tx_axis_mac_tuser, rx_axis_mac_tvalid, rx_statistics_valid, tx_statistics_valid, rx_axis_mac_tlast, speed_is_10_100, gtx_clk, rx_reset_out, 
tx_reset_out, tx_axi_clk, gmii_rx_dv, gmii_rx_er, tx_axis_mac_tready, tx_axis_mac_tvalid, pause_req, tx_statistics_vector, pause_val, 
rx_statistics_vector, gmii_rxd, tx_ifg_delay, tx_axis_mac_tdata, rx_axis_mac_tdata, gmii_txd
)/* synthesis syn_black_box syn_noprune=1 */;
  input rx_axi_clk;
  input glbl_rstn;
  output rx_axis_mac_tuser;
  output gmii_tx_en;
  input tx_axi_rstn;
  output gmii_tx_er;
  output tx_collision;
  input rx_axi_rstn;
  input tx_axis_mac_tlast;
  output tx_retransmit;
  input tx_axis_mac_tuser;
  output rx_axis_mac_tvalid;
  output rx_statistics_valid;
  output tx_statistics_valid;
  output rx_axis_mac_tlast;
  output speed_is_10_100;
  input gtx_clk;
  output rx_reset_out;
  output tx_reset_out;
  input tx_axi_clk;
  input gmii_rx_dv;
  input gmii_rx_er;
  output tx_axis_mac_tready;
  input tx_axis_mac_tvalid;
  input pause_req;
  output [31 : 0] tx_statistics_vector;
  input [15 : 0] pause_val;
  output [27 : 0] rx_statistics_vector;
  input [7 : 0] gmii_rxd;
  input [7 : 0] tx_ifg_delay;
  input [7 : 0] tx_axis_mac_tdata;
  output [7 : 0] rx_axis_mac_tdata;
  output [7 : 0] gmii_txd;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire NlwRenamedSig_OI_rx_reset_out;
  wire NlwRenamedSig_OI_tx_reset_out;
  wire NlwRenamedSig_OI_tx_axis_mac_tready;
  wire NlwRenamedSig_OI_tx_retransmit;
  wire NlwRenamedSig_OI_tx_collision;
  wire NlwRenamedSig_OI_speed_is_10_100;
  wire \BU2/N56 ;
  wire \BU2/N54 ;
  wire \BU2/N52 ;
  wire \BU2/N50 ;
  wire \BU2/N48 ;
  wire \BU2/N47 ;
  wire \BU2/N46 ;
  wire \BU2/N44 ;
  wire \BU2/N42 ;
  wire \BU2/N40 ;
  wire \BU2/N38 ;
  wire \BU2/N36 ;
  wire \BU2/N34 ;
  wire \BU2/N32 ;
  wire \BU2/N30 ;
  wire \BU2/U0/tx_axi_shim/_n0270_inv ;
  wire \BU2/N17 ;
  wire \BU2/N23 ;
  wire \BU2/N16 ;
  wire \BU2/N21 ;
  wire \BU2/U0/tx_axi_shim/tx_data_0_rstpot_468 ;
  wire \BU2/U0/tx_axi_shim/tx_data_1_rstpot_467 ;
  wire \BU2/U0/tx_axi_shim/tx_data_2_rstpot_466 ;
  wire \BU2/U0/tx_axi_shim/tx_data_3_rstpot_465 ;
  wire \BU2/U0/tx_axi_shim/tx_data_4_rstpot_464 ;
  wire \BU2/U0/tx_axi_shim/tx_data_5_rstpot_463 ;
  wire \BU2/U0/tx_axi_shim/tx_data_6_rstpot_462 ;
  wire \BU2/U0/tx_axi_shim/tx_data_7_rstpot_461 ;
  wire \BU2/U0/tx_axi_shim/tx_ack_wire_tx_state[3]_OR_29_o ;
  wire \BU2/N19 ;
  wire \BU2/U0/rx_axi_shim/rx_frame_complete_rstpot_458 ;
  wire \BU2/U0/tx_axi_shim/force_end_rstpot_457 ;
  wire \BU2/U0/rx_axi_shim/rx_mac_tuser_rstpot_456 ;
  wire \BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_rstpot_455 ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_rstpot_454 ;
  wire \BU2/U0/tx_axi_shim/no_burst_rstpot_453 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_rstpot_452 ;
  wire \BU2/U0/INT_RX_STATISTICS_VALID_rstpot_451 ;
  wire \BU2/U0/INT_TX_STATISTICS_VALID_rstpot_450 ;
  wire \BU2/U0/tx_axi_shim/two_byte_tx_rstpot_449 ;
  wire \BU2/U0/tx_axi_shim/tlast_reg_448 ;
  wire \BU2/U0/tx_axi_shim/ignore_packet_glue_set_447 ;
  wire \BU2/U0/tx_axi_shim/tx_data_valid_glue_set_446 ;
  wire \BU2/U0/tx_axi_shim/early_underrun_glue_set_445 ;
  wire \BU2/U0/tx_axi_shim/early_deassert_glue_set_444 ;
  wire \BU2/U0/tx_axi_shim/force_assert_443 ;
  wire \BU2/U0/tx_axi_shim/force_assert_glue_set_442 ;
  wire \BU2/U0/tx_axi_shim/force_burst1_441 ;
  wire \BU2/U0/tx_axi_shim/force_burst1_glue_set_440 ;
  wire \BU2/U0/tx_axi_shim/force_burst2_439 ;
  wire \BU2/U0/tx_axi_shim/force_burst2_glue_set_438 ;
  wire \BU2/U0/MATCH_FRAME_INT_437 ;
  wire \BU2/U0/MATCH_FRAME_INT_glue_set_436 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_en1 ;
  wire \BU2/N10 ;
  wire \BU2/U0/tx_axi_shim/tx_underrun_glue_set ;
  wire \BU2/U0/tx_axi_shim/early_underrun_432 ;
  wire \BU2/N8 ;
  wire \BU2/N6 ;
  wire \BU2/N4 ;
  wire \BU2/U0/tx_axi_shim/two_byte_tx_428 ;
  wire \BU2/U0/tx_axi_shim/early_deassert_427 ;
  wire \BU2/N2 ;
  wire \BU2/U0/tx_axi_shim/force_end_425 ;
  wire \BU2/U0/rx_axi_shim/rx_frame_complete_424 ;
  wire \BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ;
  wire \BU2/U0/tx_axi_shim/tlast_reg_glue_set ;
  wire \BU2/U0/tx_axi_shim/ignore_packet_420 ;
  wire \BU2/U0/tx_axi_shim/no_burst_419 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ;
  wire \BU2/U0/tx_axi_shim/tx_ack_wire ;
  wire \BU2/U0/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_108_o ;
  wire \BU2/U0/SYNC_TX_RESET_I/R3_415 ;
  wire \BU2/U0/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_108_o ;
  wire \BU2/U0/SYNC_RX_RESET_I/R3_413 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress_r_412 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_409 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r2_392 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1_391 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r2_390 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r1_389 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_tx_stats_byte_valid_AND_6_o ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_385 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_PWR_18_o_MUX_33_o ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<0>1 ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_from_mac_inv ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<1>1 ;
  wire \BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_11_o ;
  wire \BU2/U0/rx_axi_shim/next_rx_state[1]_rx_enable_AND_13_o ;
  wire \BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ;
  wire \BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ;
  wire \BU2/U0/rx_axi_shim/rx_state_FSM_FFd2-In ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_REQ_reg_361 ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd2_344 ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_equal_13_o ;
  wire \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ;
  wire \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o ;
  wire \BU2/U0/tx_axi_shim/tx_ack_reg_332 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_ignore_packet_OR_48_o_331 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd9_322 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_37_o ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd6-In ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_70_o ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd7-In_313 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd3-In_311 ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd5_310 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_71_o ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_PWR_20_o_equal_74_o ;
  wire \BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ;
  wire \BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_72_o ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<0> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<1> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<2> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<3> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<4> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<5> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<6> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<7> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<8> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<9> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<10> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<11> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<12> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<13> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<14> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<15> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<16> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<17> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<18> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<19> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<20> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<21> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<22> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<23> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<24> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<25> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<26> ;
  wire \BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<27> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<0> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<1> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<2> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<3> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<4> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<5> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<6> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<7> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<8> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<9> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<10> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<11> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<12> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<13> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<14> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<15> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<16> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<17> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<18> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<19> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<20> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<21> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<22> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<23> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<24> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<25> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<26> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<27> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<28> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<29> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<30> ;
  wire \BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<31> ;
  wire \BU2/U0/SYNC_TX_RESET_I/R2_244 ;
  wire \BU2/U0/SYNC_TX_RESET_I/R1_243 ;
  wire \BU2/U0/INT_TX_RST_ASYNCH ;
  wire \BU2/U0/SYNC_RX_RESET_I/R2_241 ;
  wire \BU2/U0/SYNC_RX_RESET_I/R1_240 ;
  wire \BU2/U0/INT_RX_RST_ASYNCH ;
  wire \BU2/U0/RX_BAD_FRAME ;
  wire \BU2/U0/INT_GLBL_RST ;
  wire \BU2/U0/TX_STATS_SHIFT ;
  wire \BU2/U0/GMII_TX_ER_INT ;
  wire \BU2/U0/RX_STATS_SHIFT_VLD ;
  wire \BU2/U0/TX_STATS_SHIFT_VLD ;
  wire \BU2/U0/tx_axi_shim/tx_data_valid_185 ;
  wire \BU2/U0/tx_axi_shim/tx_underrun_184 ;
  wire \BU2/U0/PAUSE_REQ_INT ;
  wire \BU2/U0/RX_GOOD_FRAME ;
  wire \BU2/U0/GMII_TX_EN_INT ;
  wire \BU2/U0/RX_DATA_VALID ;
  wire \BU2/U0/TX_ACK ;
  wire \BU2/U0/TX_STATS_BYTEVLD ;
  wire \BU2/N1 ;
  wire \BU2/mdc_out ;
  wire \BU2/mdio_tri ;
  wire \BU2/mdio_out ;
  wire \BU2/txcharisk ;
  wire \BU2/txchardispval ;
  wire \BU2/txchardispmode ;
  wire \BU2/syncacqstatus ;
  wire \BU2/powerdown ;
  wire \BU2/mgttxreset ;
  wire \BU2/mgtrxreset ;
  wire \BU2/loopbackmsb ;
  wire \BU2/encommaalign ;
  wire \BU2/aninterrupt ;
  wire \BU2/tx_axi_clk_out ;
  wire \BU2/N0 ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTTXCLIENTCLKOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTMIIMRDY_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_DCRHOSTDONEIR_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXFRAMEDROP_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXDVLDMSW_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXCLIENTCLKOUT_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXSTATSBYTEVLD_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRACK_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACPHYTXCLK_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<0>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_EMACDCRDBUS<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<31>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<30>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<29>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<28>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<27>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<26>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<25>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<24>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<23>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<22>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<21>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<20>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<19>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<18>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<17>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<16>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<15>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<14>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<13>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<12>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<11>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<10>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<9>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<8>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<7>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<6>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<5>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<4>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<3>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<2>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<1>_UNCONNECTED ;
  wire \NLW_BU2/U0/v6_emac_HOSTRDDATA<0>_UNCONNECTED ;
  wire [7 : 0] gmii_txd_2;
  wire [7 : 0] rx_axis_mac_tdata_3;
  wire [27 : 6] NlwRenamedSig_OI_rx_statistics_vector;
  wire [5 : 0] rx_statistics_vector_4;
  wire [7 : 0] tx_axis_mac_tdata_5;
  wire [7 : 0] tx_ifg_delay_6;
  wire [31 : 0] NlwRenamedSig_OI_tx_statistics_vector;
  wire [15 : 0] pause_val_7;
  wire [7 : 0] gmii_rxd_8;
  wire [3 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 ;
  wire [3 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 ;
  wire [3 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 ;
  wire [3 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 ;
  wire [1 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r ;
  wire [1 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count ;
  wire [1 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/Result ;
  wire [1 : 0] \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count ;
  wire [7 : 0] \BU2/U0/rx_axi_shim/rx_data_reg ;
  wire [15 : 0] \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg ;
  wire [3 : 0] \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr ;
  wire [3 : 0] \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result ;
  wire [7 : 0] \BU2/U0/tx_axi_shim/tx_data_hold ;
  wire [6 : 0] \BU2/U0/RX_STATS_SHIFT ;
  wire [15 : 0] \BU2/U0/PAUSE_VAL_INT ;
  wire [7 : 0] \BU2/U0/GMII_TXD_INT ;
  wire [7 : 0] \BU2/U0/RX_DATA ;
  wire [7 : 0] \BU2/U0/tx_axi_shim/tx_data ;
  assign
    tx_statistics_vector[31] = NlwRenamedSig_OI_tx_statistics_vector[31],
    tx_statistics_vector[30] = NlwRenamedSig_OI_tx_statistics_vector[30],
    tx_statistics_vector[29] = NlwRenamedSig_OI_tx_statistics_vector[29],
    tx_statistics_vector[28] = NlwRenamedSig_OI_tx_statistics_vector[28],
    tx_statistics_vector[27] = NlwRenamedSig_OI_tx_statistics_vector[27],
    tx_statistics_vector[26] = NlwRenamedSig_OI_tx_statistics_vector[26],
    tx_statistics_vector[25] = NlwRenamedSig_OI_tx_statistics_vector[25],
    tx_statistics_vector[24] = NlwRenamedSig_OI_tx_statistics_vector[24],
    tx_statistics_vector[23] = NlwRenamedSig_OI_tx_statistics_vector[23],
    tx_statistics_vector[22] = NlwRenamedSig_OI_tx_statistics_vector[22],
    tx_statistics_vector[21] = NlwRenamedSig_OI_tx_statistics_vector[21],
    tx_statistics_vector[20] = NlwRenamedSig_OI_tx_statistics_vector[20],
    tx_statistics_vector[19] = NlwRenamedSig_OI_tx_statistics_vector[19],
    tx_statistics_vector[18] = NlwRenamedSig_OI_tx_statistics_vector[18],
    tx_statistics_vector[17] = NlwRenamedSig_OI_tx_statistics_vector[17],
    tx_statistics_vector[16] = NlwRenamedSig_OI_tx_statistics_vector[16],
    tx_statistics_vector[15] = NlwRenamedSig_OI_tx_statistics_vector[15],
    tx_statistics_vector[14] = NlwRenamedSig_OI_tx_statistics_vector[14],
    tx_statistics_vector[13] = NlwRenamedSig_OI_tx_statistics_vector[13],
    tx_statistics_vector[12] = NlwRenamedSig_OI_tx_statistics_vector[12],
    tx_statistics_vector[11] = NlwRenamedSig_OI_tx_statistics_vector[11],
    tx_statistics_vector[10] = NlwRenamedSig_OI_tx_statistics_vector[10],
    tx_statistics_vector[9] = NlwRenamedSig_OI_tx_statistics_vector[9],
    tx_statistics_vector[8] = NlwRenamedSig_OI_tx_statistics_vector[8],
    tx_statistics_vector[7] = NlwRenamedSig_OI_tx_statistics_vector[7],
    tx_statistics_vector[6] = NlwRenamedSig_OI_tx_statistics_vector[6],
    tx_statistics_vector[5] = NlwRenamedSig_OI_tx_statistics_vector[5],
    tx_statistics_vector[4] = NlwRenamedSig_OI_tx_statistics_vector[4],
    tx_statistics_vector[3] = NlwRenamedSig_OI_tx_statistics_vector[3],
    tx_statistics_vector[2] = NlwRenamedSig_OI_tx_statistics_vector[2],
    tx_statistics_vector[1] = NlwRenamedSig_OI_tx_statistics_vector[1],
    tx_statistics_vector[0] = NlwRenamedSig_OI_tx_statistics_vector[0],
    pause_val_7[15] = pause_val[15],
    pause_val_7[14] = pause_val[14],
    pause_val_7[13] = pause_val[13],
    pause_val_7[12] = pause_val[12],
    pause_val_7[11] = pause_val[11],
    pause_val_7[10] = pause_val[10],
    pause_val_7[9] = pause_val[9],
    pause_val_7[8] = pause_val[8],
    pause_val_7[7] = pause_val[7],
    pause_val_7[6] = pause_val[6],
    pause_val_7[5] = pause_val[5],
    pause_val_7[4] = pause_val[4],
    pause_val_7[3] = pause_val[3],
    pause_val_7[2] = pause_val[2],
    pause_val_7[1] = pause_val[1],
    pause_val_7[0] = pause_val[0],
    rx_statistics_vector[27] = NlwRenamedSig_OI_rx_statistics_vector[27],
    rx_statistics_vector[26] = NlwRenamedSig_OI_rx_statistics_vector[26],
    rx_statistics_vector[25] = NlwRenamedSig_OI_rx_statistics_vector[25],
    rx_statistics_vector[24] = NlwRenamedSig_OI_rx_statistics_vector[24],
    rx_statistics_vector[23] = NlwRenamedSig_OI_rx_statistics_vector[23],
    rx_statistics_vector[22] = NlwRenamedSig_OI_rx_statistics_vector[22],
    rx_statistics_vector[21] = NlwRenamedSig_OI_rx_statistics_vector[21],
    rx_statistics_vector[20] = NlwRenamedSig_OI_rx_statistics_vector[20],
    rx_statistics_vector[19] = NlwRenamedSig_OI_rx_statistics_vector[19],
    rx_statistics_vector[18] = NlwRenamedSig_OI_rx_statistics_vector[18],
    rx_statistics_vector[17] = NlwRenamedSig_OI_rx_statistics_vector[17],
    rx_statistics_vector[16] = NlwRenamedSig_OI_rx_statistics_vector[16],
    rx_statistics_vector[15] = NlwRenamedSig_OI_rx_statistics_vector[15],
    rx_statistics_vector[14] = NlwRenamedSig_OI_rx_statistics_vector[14],
    rx_statistics_vector[13] = NlwRenamedSig_OI_rx_statistics_vector[13],
    rx_statistics_vector[12] = NlwRenamedSig_OI_rx_statistics_vector[12],
    rx_statistics_vector[11] = NlwRenamedSig_OI_rx_statistics_vector[11],
    rx_statistics_vector[10] = NlwRenamedSig_OI_rx_statistics_vector[10],
    rx_statistics_vector[9] = NlwRenamedSig_OI_rx_statistics_vector[9],
    rx_statistics_vector[8] = NlwRenamedSig_OI_rx_statistics_vector[8],
    rx_statistics_vector[7] = NlwRenamedSig_OI_rx_statistics_vector[7],
    rx_statistics_vector[6] = NlwRenamedSig_OI_rx_statistics_vector[6],
    rx_statistics_vector[5] = rx_statistics_vector_4[5],
    rx_statistics_vector[4] = rx_statistics_vector_4[4],
    rx_statistics_vector[3] = rx_statistics_vector_4[3],
    rx_statistics_vector[2] = rx_statistics_vector_4[2],
    rx_statistics_vector[1] = rx_statistics_vector_4[1],
    rx_statistics_vector[0] = rx_statistics_vector_4[0],
    gmii_rxd_8[7] = gmii_rxd[7],
    gmii_rxd_8[6] = gmii_rxd[6],
    gmii_rxd_8[5] = gmii_rxd[5],
    gmii_rxd_8[4] = gmii_rxd[4],
    gmii_rxd_8[3] = gmii_rxd[3],
    gmii_rxd_8[2] = gmii_rxd[2],
    gmii_rxd_8[1] = gmii_rxd[1],
    gmii_rxd_8[0] = gmii_rxd[0],
    tx_collision = NlwRenamedSig_OI_tx_collision,
    tx_retransmit = NlwRenamedSig_OI_tx_retransmit,
    tx_ifg_delay_6[7] = tx_ifg_delay[7],
    tx_ifg_delay_6[6] = tx_ifg_delay[6],
    tx_ifg_delay_6[5] = tx_ifg_delay[5],
    tx_ifg_delay_6[4] = tx_ifg_delay[4],
    tx_ifg_delay_6[3] = tx_ifg_delay[3],
    tx_ifg_delay_6[2] = tx_ifg_delay[2],
    tx_ifg_delay_6[1] = tx_ifg_delay[1],
    tx_ifg_delay_6[0] = tx_ifg_delay[0],
    tx_axis_mac_tdata_5[7] = tx_axis_mac_tdata[7],
    tx_axis_mac_tdata_5[6] = tx_axis_mac_tdata[6],
    tx_axis_mac_tdata_5[5] = tx_axis_mac_tdata[5],
    tx_axis_mac_tdata_5[4] = tx_axis_mac_tdata[4],
    tx_axis_mac_tdata_5[3] = tx_axis_mac_tdata[3],
    tx_axis_mac_tdata_5[2] = tx_axis_mac_tdata[2],
    tx_axis_mac_tdata_5[1] = tx_axis_mac_tdata[1],
    tx_axis_mac_tdata_5[0] = tx_axis_mac_tdata[0],
    rx_axis_mac_tdata[7] = rx_axis_mac_tdata_3[7],
    rx_axis_mac_tdata[6] = rx_axis_mac_tdata_3[6],
    rx_axis_mac_tdata[5] = rx_axis_mac_tdata_3[5],
    rx_axis_mac_tdata[4] = rx_axis_mac_tdata_3[4],
    rx_axis_mac_tdata[3] = rx_axis_mac_tdata_3[3],
    rx_axis_mac_tdata[2] = rx_axis_mac_tdata_3[2],
    rx_axis_mac_tdata[1] = rx_axis_mac_tdata_3[1],
    rx_axis_mac_tdata[0] = rx_axis_mac_tdata_3[0],
    speed_is_10_100 = NlwRenamedSig_OI_speed_is_10_100,
    rx_reset_out = NlwRenamedSig_OI_rx_reset_out,
    tx_reset_out = NlwRenamedSig_OI_tx_reset_out,
    gmii_txd[7] = gmii_txd_2[7],
    gmii_txd[6] = gmii_txd_2[6],
    gmii_txd[5] = gmii_txd_2[5],
    gmii_txd[4] = gmii_txd_2[4],
    gmii_txd[3] = gmii_txd_2[3],
    gmii_txd[2] = gmii_txd_2[2],
    gmii_txd[1] = gmii_txd_2[1],
    gmii_txd[0] = gmii_txd_2[0],
    tx_axis_mac_tready = NlwRenamedSig_OI_tx_axis_mac_tready;
  VCC   VCC_0 (
    .P(N1)
  );
  GND   GND_1 (
    .G(N0)
  );
  INV   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_from_mac_inv1_INV_0  (
    .I(\BU2/U0/GMII_TX_EN_INT ),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_from_mac_inv )
  );
  INV   \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mcount_tx_en_count_xor<0>11_INV_0  (
    .I(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [0]),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<0>1 )
  );
  INV   \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mcount_tx_byte_count_xor<0>11_INV_0  (
    .I(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [0]),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result [0])
  );
  INV   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/TX_STATS_BYTEVLD_inv1_INV_0  (
    .I(\BU2/U0/TX_STATS_BYTEVLD ),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv )
  );
  INV   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mcount_tx_stats_bytevld_ctr_xor<0>11_INV_0  (
    .I(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [0])
  );
  INV   \BU2/U0/INT_GLBL_RST1_INV_0  (
    .I(glbl_rstn),
    .O(\BU2/U0/INT_GLBL_RST )
  );
  LUT6 #(
    .INIT ( 64'h1000100010000000 ))
  \BU2/U0/rx_axi_shim/rx_mac_tuser_rstpot  (
    .I0(\BU2/U0/MATCH_FRAME_INT_437 ),
    .I1(NlwRenamedSig_OI_rx_reset_out),
    .I2(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I3(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I4(\BU2/U0/RX_DATA_VALID ),
    .I5(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .O(\BU2/U0/rx_axi_shim/rx_mac_tuser_rstpot_456 )
  );
  LUT6 #(
    .INIT ( 64'h082A080808080808 ))
  \BU2/U0/tx_axi_shim/ignore_packet_glue_set  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/ignore_packet_420 ),
    .I2(tx_axis_mac_tlast),
    .I3(NlwRenamedSig_OI_tx_axis_mac_tready),
    .I4(tx_axis_mac_tuser),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/U0/tx_axi_shim/ignore_packet_glue_set_447 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFF8A ))
  \BU2/U0/rx_axi_shim/rx_frame_complete_rstpot  (
    .I0(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .I1(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I2(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I3(\BU2/U0/RX_BAD_FRAME ),
    .I4(\BU2/U0/RX_GOOD_FRAME ),
    .O(\BU2/U0/rx_axi_shim/rx_frame_complete_rstpot_458 )
  );
  LUT4 #(
    .INIT ( 16'hABA8 ))
  \BU2/U0/tx_axi_shim/two_byte_tx_rstpot  (
    .I0(tx_axis_mac_tlast),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 ),
    .I3(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .O(\BU2/U0/tx_axi_shim/two_byte_tx_rstpot_449 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFCFEFFFFFCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_valid_glue_set_F  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/force_assert_443 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/N10 ),
    .I4(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o ),
    .I5(\BU2/N56 ),
    .O(\BU2/N46 )
  );
  LUT4 #(
    .INIT ( 16'h0444 ))
  \BU2/U0/tx_axi_shim/tx_data_valid_glue_set_F_SW0  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ),
    .I1(\BU2/U0/tx_axi_shim/tx_data_valid_185 ),
    .I2(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .O(\BU2/N56 )
  );
  LUT6 #(
    .INIT ( 64'h000000A0CCCCCCEC ))
  \BU2/U0/tx_axi_shim/early_underrun_glue_set  (
    .I0(tx_axis_mac_tuser),
    .I1(\BU2/U0/tx_axi_shim/early_underrun_432 ),
    .I2(NlwRenamedSig_OI_tx_axis_mac_tready),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I5(\BU2/U0/tx_axi_shim/tx_ack_wire_tx_state[3]_OR_29_o ),
    .O(\BU2/U0/tx_axi_shim/early_underrun_glue_set_445 )
  );
  LUT6 #(
    .INIT ( 64'h0055555500404040 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_rstpot  (
    .I0(NlwRenamedSig_OI_tx_reset_out),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I2(pause_req),
    .I3(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .I4(\BU2/N54 ),
    .I5(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd2_344 ),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_rstpot_454 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_rstpot_SW0  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [3]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2]),
    .O(\BU2/N54 )
  );
  LUT6 #(
    .INIT ( 64'h00202020FFFF2020 ))
  \BU2/U0/tx_axi_shim/early_deassert_glue_set  (
    .I0(\BU2/U0/tx_axi_shim/tx_data_valid_185 ),
    .I1(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I2(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I4(tx_axis_mac_tvalid),
    .I5(\BU2/N52 ),
    .O(\BU2/U0/tx_axi_shim/early_deassert_glue_set_444 )
  );
  LUT4 #(
    .INIT ( 16'hEFFF ))
  \BU2/U0/tx_axi_shim/early_deassert_glue_set_SW0  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I2(NlwRenamedSig_OI_tx_axis_mac_tready),
    .I3(tx_axis_mac_tlast),
    .O(\BU2/N52 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF028A028A028A ))
  \BU2/U0/tx_axi_shim/force_burst1_glue_set  (
    .I0(\BU2/U0/tx_axi_shim/force_burst1_441 ),
    .I1(NlwRenamedSig_OI_speed_is_10_100),
    .I2(\BU2/U0/TX_ACK ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .I4(\BU2/N50 ),
    .I5(\BU2/U0/tx_axi_shim/tlast_reg_448 ),
    .O(\BU2/U0/tx_axi_shim/force_burst1_glue_set_440 )
  );
  LUT6 #(
    .INIT ( 64'hAAAA888088808880 ))
  \BU2/U0/tx_axi_shim/force_burst1_glue_set_SW1  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ),
    .I5(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .O(\BU2/N50 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF800080008000 ))
  \BU2/U0/tx_axi_shim/force_burst2_glue_set  (
    .I0(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ),
    .I2(\BU2/U0/tx_axi_shim/tlast_reg_448 ),
    .I3(tx_axis_mac_tvalid),
    .I4(\BU2/U0/tx_axi_shim/force_burst1_441 ),
    .I5(\BU2/U0/tx_axi_shim/force_burst2_439 ),
    .O(\BU2/U0/tx_axi_shim/force_burst2_glue_set_438 )
  );
  LUT3 #(
    .INIT ( 8'h02 ))
  \BU2/U0/tx_axi_shim/no_burst_rstpot  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ),
    .I1(tx_axis_mac_tvalid),
    .I2(NlwRenamedSig_OI_tx_reset_out),
    .O(\BU2/U0/tx_axi_shim/no_burst_rstpot_453 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_rstpot  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(NlwRenamedSig_OI_tx_reset_out),
    .O(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_rstpot_452 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/INT_RX_STATISTICS_VALID_rstpot  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[6]),
    .I2(NlwRenamedSig_OI_rx_reset_out),
    .O(\BU2/U0/INT_RX_STATISTICS_VALID_rstpot_451 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/INT_TX_STATISTICS_VALID_rstpot  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[0]),
    .I2(NlwRenamedSig_OI_tx_reset_out),
    .O(\BU2/U0/INT_TX_STATISTICS_VALID_rstpot_450 )
  );
  LUT3 #(
    .INIT ( 8'hBA ))
  \BU2/U0/MATCH_FRAME_INT_glue_set  (
    .I0(\BU2/U0/RX_GOOD_FRAME ),
    .I1(\BU2/U0/RX_BAD_FRAME ),
    .I2(\BU2/U0/MATCH_FRAME_INT_437 ),
    .O(\BU2/U0/MATCH_FRAME_INT_glue_set_436 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF66466444 ))
  \BU2/U0/tx_axi_shim/force_assert_glue_set  (
    .I0(\BU2/U0/tx_axi_shim/force_burst1_441 ),
    .I1(\BU2/U0/tx_axi_shim/force_burst2_439 ),
    .I2(NlwRenamedSig_OI_speed_is_10_100),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .I4(\BU2/U0/TX_ACK ),
    .I5(\BU2/N48 ),
    .O(\BU2/U0/tx_axi_shim/force_assert_glue_set_442 )
  );
  LUT6 #(
    .INIT ( 64'h08000800FFFF0800 ))
  \BU2/U0/tx_axi_shim/force_assert_glue_set_SW0  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I1(tx_axis_mac_tvalid),
    .I2(tx_axis_mac_tlast),
    .I3(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I4(\BU2/U0/tx_axi_shim/force_assert_443 ),
    .I5(\BU2/U0/tx_axi_shim/tx_data_valid_185 ),
    .O(\BU2/N48 )
  );
  LUT5 #(
    .INIT ( 32'h40004444 ))
  \BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_rstpot  (
    .I0(NlwRenamedSig_OI_rx_reset_out),
    .I1(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I2(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I3(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .I4(\BU2/U0/RX_DATA_VALID ),
    .O(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_rstpot_455 )
  );
  LUT6 #(
    .INIT ( 64'hFFAAFFAEFFEAFFEE ))
  \BU2/U0/tx_axi_shim/tx_data_valid_glue_set_G  (
    .I0(\BU2/U0/tx_axi_shim/force_assert_443 ),
    .I1(\BU2/U0/tx_axi_shim/tx_data_valid_185 ),
    .I2(\BU2/N10 ),
    .I3(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o ),
    .I4(\BU2/N16 ),
    .I5(\BU2/N17 ),
    .O(\BU2/N47 )
  );
  MUXF7   \BU2/U0/tx_axi_shim/tx_data_valid_glue_set  (
    .I0(\BU2/N46 ),
    .I1(\BU2/N47 ),
    .S(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .O(\BU2/U0/tx_axi_shim/tx_data_valid_glue_set_446 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_0_rstpot  (
    .I0(tx_axis_mac_tdata_5[0]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [0]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N44 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_0_rstpot_468 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW7  (
    .I0(tx_axis_mac_tdata_5[0]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [0]),
    .O(\BU2/N44 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_1_rstpot  (
    .I0(tx_axis_mac_tdata_5[1]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [1]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N42 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_1_rstpot_467 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW6  (
    .I0(tx_axis_mac_tdata_5[1]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [1]),
    .O(\BU2/N42 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_2_rstpot  (
    .I0(tx_axis_mac_tdata_5[2]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [2]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N40 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_2_rstpot_466 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW5  (
    .I0(tx_axis_mac_tdata_5[2]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [2]),
    .O(\BU2/N40 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_3_rstpot  (
    .I0(tx_axis_mac_tdata_5[3]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [3]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N38 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_3_rstpot_465 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW4  (
    .I0(tx_axis_mac_tdata_5[3]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [3]),
    .O(\BU2/N38 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_4_rstpot  (
    .I0(tx_axis_mac_tdata_5[4]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [4]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N36 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_4_rstpot_464 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW3  (
    .I0(tx_axis_mac_tdata_5[4]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [4]),
    .O(\BU2/N36 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_5_rstpot  (
    .I0(tx_axis_mac_tdata_5[5]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [5]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N34 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_5_rstpot_463 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW2  (
    .I0(tx_axis_mac_tdata_5[5]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [5]),
    .O(\BU2/N34 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_6_rstpot  (
    .I0(tx_axis_mac_tdata_5[6]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [6]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N32 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_6_rstpot_462 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW1  (
    .I0(tx_axis_mac_tdata_5[6]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [6]),
    .O(\BU2/N32 )
  );
  LUT6 #(
    .INIT ( 64'hAFFFA000CCCCCCCC ))
  \BU2/U0/tx_axi_shim/tx_data_7_rstpot  (
    .I0(tx_axis_mac_tdata_5[7]),
    .I1(\BU2/U0/tx_axi_shim/tx_data [7]),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/N30 ),
    .I5(\BU2/U0/tx_axi_shim/_n0270_inv ),
    .O(\BU2/U0/tx_axi_shim/tx_data_7_rstpot_461 )
  );
  LUT5 #(
    .INIT ( 32'hAAABAAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_tx_state[3]_tx_enable_reg_AND_78_o1_SW0  (
    .I0(tx_axis_mac_tdata_5[7]),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_data_hold [7]),
    .O(\BU2/N30 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFE2 ))
  \BU2/U0/tx_axi_shim/_n0270_inv1  (
    .I0(\BU2/U0/TX_ACK ),
    .I1(NlwRenamedSig_OI_speed_is_10_100),
    .I2(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/U0/tx_axi_shim/_n0270_inv )
  );
  LUT6 #(
    .INIT ( 64'h10000000D0000000 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd5-In1  (
    .I0(\BU2/U0/TX_ACK ),
    .I1(NlwRenamedSig_OI_speed_is_10_100),
    .I2(tx_axis_mac_tlast),
    .I3(tx_axis_mac_tuser),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ),
    .I5(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_71_o )
  );
  LUT6 #(
    .INIT ( 64'hF101FD0DF000F000 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd2-In1  (
    .I0(\BU2/U0/TX_ACK ),
    .I1(NlwRenamedSig_OI_speed_is_10_100),
    .I2(tx_axis_mac_tvalid),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ),
    .I4(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_72_o )
  );
  LUT6 #(
    .INIT ( 64'hF8F8F8F8F8F8FFF8 ))
  \BU2/U0/tx_axi_shim/force_end_rstpot  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd5_310 ),
    .I1(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I2(NlwRenamedSig_OI_tx_retransmit),
    .I3(\BU2/U0/tx_axi_shim/force_end_425 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ),
    .O(\BU2/U0/tx_axi_shim/force_end_rstpot_457 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFDDDFCCC ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In_SW4_F  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I2(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/N23 )
  );
  MUXF7   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In_SW4  (
    .I0(\BU2/N23 ),
    .I1(\BU2/N1 ),
    .S(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ),
    .O(\BU2/N17 )
  );
  LUT6 #(
    .INIT ( 64'hFDDDFDDDFDDDFCCC ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In_SW3_F  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I2(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/N21 )
  );
  MUXF7   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In_SW3  (
    .I0(\BU2/N21 ),
    .I1(\BU2/N1 ),
    .S(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ),
    .O(\BU2/N16 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_TX_RESET_I/R3  (
    .C(tx_axi_clk),
    .D(\BU2/U0/SYNC_TX_RESET_I/R2_244 ),
    .Q(\BU2/U0/SYNC_TX_RESET_I/R3_415 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_TX_RESET_I/R4  (
    .C(tx_axi_clk),
    .D(\BU2/U0/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_108_o ),
    .Q(NlwRenamedSig_OI_tx_reset_out)
  );
  FD #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_RX_RESET_I/R3  (
    .C(rx_axi_clk),
    .D(\BU2/U0/SYNC_RX_RESET_I/R2_241 ),
    .Q(\BU2/U0/SYNC_RX_RESET_I/R3_413 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_RX_RESET_I/R4  (
    .C(rx_axi_clk),
    .D(\BU2/U0/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_108_o ),
    .Q(NlwRenamedSig_OI_rx_reset_out)
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_0  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_0_rstpot_468 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [0])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_1_rstpot_467 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [1])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_2_rstpot_466 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [2])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_3  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_3_rstpot_465 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [3])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_4  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_4_rstpot_464 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [4])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_5  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_5_rstpot_463 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [5])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_6  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_6_rstpot_462 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [6])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_7  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_7_rstpot_461 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data [7])
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFE2 ))
  \BU2/U0/tx_axi_shim/tx_ack_wire_tx_state[3]_OR_29_o1  (
    .I0(\BU2/U0/TX_ACK ),
    .I1(NlwRenamedSig_OI_speed_is_10_100),
    .I2(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/U0/tx_axi_shim/tx_ack_wire_tx_state[3]_OR_29_o )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFF1FFFFFFF0 ))
  \BU2/U0/tx_axi_shim/next_tx_state[3]_ignore_packet_OR_48_o  (
    .I0(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I1(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I2(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_71_o ),
    .I3(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_72_o ),
    .I4(\BU2/N19 ),
    .I5(\BU2/U0/tx_axi_shim/next_tx_state[3]_PWR_20_o_equal_74_o ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_ignore_packet_OR_48_o_331 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFAEAEAE ))
  \BU2/U0/tx_axi_shim/next_tx_state[3]_ignore_packet_OR_48_o_SW1  (
    .I0(\BU2/U0/tx_axi_shim/ignore_packet_420 ),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd9_322 ),
    .I2(tx_axis_mac_tlast),
    .I3(tx_axis_mac_tvalid),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I5(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o ),
    .O(\BU2/N19 )
  );
  FD   \BU2/U0/rx_axi_shim/rx_frame_complete  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/rx_frame_complete_rstpot_458 ),
    .Q(\BU2/U0/rx_axi_shim/rx_frame_complete_424 )
  );
  FD   \BU2/U0/tx_axi_shim/force_end  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/force_end_rstpot_457 ),
    .Q(\BU2/U0/tx_axi_shim/force_end_425 )
  );
  FD   \BU2/U0/rx_axi_shim/rx_mac_tuser  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/rx_mac_tuser_rstpot_456 ),
    .Q(rx_axis_mac_tuser)
  );
  FD   \BU2/U0/rx_axi_shim/rx_state_FSM_FFd1  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_rstpot_455 ),
    .Q(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 )
  );
  FD   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_rstpot_454 ),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 )
  );
  FD   \BU2/U0/tx_axi_shim/no_burst  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/no_burst_rstpot_453 ),
    .Q(\BU2/U0/tx_axi_shim/no_burst_419 )
  );
  FD   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_rstpot_452 ),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 )
  );
  FD   \BU2/U0/INT_RX_STATISTICS_VALID  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VALID_rstpot_451 ),
    .Q(rx_statistics_valid)
  );
  FD   \BU2/U0/INT_TX_STATISTICS_VALID  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VALID_rstpot_450 ),
    .Q(tx_statistics_valid)
  );
  FDR   \BU2/U0/tx_axi_shim/two_byte_tx  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/two_byte_tx_rstpot_449 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/two_byte_tx_428 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_underrun  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_underrun_glue_set ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_underrun_184 )
  );
  FDR   \BU2/U0/tx_axi_shim/tlast_reg  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tlast_reg_glue_set ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tlast_reg_448 )
  );
  FDR   \BU2/U0/tx_axi_shim/ignore_packet  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/ignore_packet_glue_set_447 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/ignore_packet_420 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_data_valid  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_data_valid_glue_set_446 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_valid_185 )
  );
  FDR   \BU2/U0/tx_axi_shim/early_underrun  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/early_underrun_glue_set_445 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/early_underrun_432 )
  );
  FDR   \BU2/U0/tx_axi_shim/early_deassert  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/early_deassert_glue_set_444 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/early_deassert_427 )
  );
  FDR   \BU2/U0/tx_axi_shim/force_assert  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/force_assert_glue_set_442 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/force_assert_443 )
  );
  FDR   \BU2/U0/tx_axi_shim/force_burst1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/force_burst1_glue_set_440 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/force_burst1_441 )
  );
  FDR   \BU2/U0/tx_axi_shim/force_burst2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/force_burst2_glue_set_438 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/force_burst2_439 )
  );
  FDR   \BU2/U0/MATCH_FRAME_INT  (
    .C(rx_axi_clk),
    .D(\BU2/U0/MATCH_FRAME_INT_glue_set_436 ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(\BU2/U0/MATCH_FRAME_INT_437 )
  );
  LUT6 #(
    .INIT ( 64'h88B8AAAA88A8AAAA ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_en12  (
    .I0(\BU2/U0/GMII_TX_EN_INT ),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_385 ),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r2_392 ),
    .I3(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress_r_412 ),
    .I4(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I5(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_en1 ),
    .O(gmii_tx_en)
  );
  LUT5 #(
    .INIT ( 32'h9009FFFF ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_en11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [1]),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [1]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [0]),
    .I3(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [0]),
    .I4(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1_391 ),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_en1 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFB3A2A2A2 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .I1(tx_axis_mac_tvalid),
    .I2(\BU2/N10 ),
    .I3(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 ),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_37_o )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10-In_SW0  (
    .I0(tx_axis_mac_tuser),
    .I1(\BU2/U0/tx_axi_shim/no_burst_419 ),
    .I2(\BU2/U0/tx_axi_shim/ignore_packet_420 ),
    .O(\BU2/N10 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF444044404440 ))
  \BU2/U0/tx_axi_shim/tx_mac_tready_int_tx_ack_wire_OR_32_o  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I1(\BU2/U0/tx_axi_shim/early_underrun_432 ),
    .I2(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I3(\BU2/U0/tx_axi_shim/force_end_425 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I5(\BU2/N8 ),
    .O(\BU2/U0/tx_axi_shim/tx_underrun_glue_set )
  );
  LUT3 #(
    .INIT ( 8'h8A ))
  \BU2/U0/tx_axi_shim/tx_mac_tready_int_tx_ack_wire_OR_32_o_SW0  (
    .I0(NlwRenamedSig_OI_tx_axis_mac_tready),
    .I1(tx_axis_mac_tuser),
    .I2(tx_axis_mac_tvalid),
    .O(\BU2/N8 )
  );
  LUT6 #(
    .INIT ( 64'hFFFF001000100010 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd4-In  (
    .I0(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I1(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I3(\BU2/U0/tx_axi_shim/tlast_reg_glue_set ),
    .I4(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I5(\BU2/N6 ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_PWR_20_o_equal_74_o )
  );
  LUT4 #(
    .INIT ( 16'hFFDC ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd4-In_SW0  (
    .I0(tx_axis_mac_tvalid),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .O(\BU2/N6 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFAAAAAABA ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd7-In  (
    .I0(\BU2/N4 ),
    .I1(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ),
    .I3(\BU2/U0/tx_axi_shim/force_end_425 ),
    .I4(tx_axis_mac_tvalid),
    .I5(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd5_310 ),
    .O(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7-In_313 )
  );
  LUT4 #(
    .INIT ( 16'h8880 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd7-In_SW0  (
    .I0(tx_axis_mac_tlast),
    .I1(tx_axis_mac_tuser),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd9_322 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 ),
    .O(\BU2/N4 )
  );
  LUT6 #(
    .INIT ( 64'hAAA8FFFFAAA8AAA8 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd3-In  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 ),
    .I1(\BU2/U0/tx_axi_shim/early_deassert_427 ),
    .I2(\BU2/U0/tx_axi_shim/tlast_reg_glue_set ),
    .I3(\BU2/U0/tx_axi_shim/two_byte_tx_428 ),
    .I4(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I5(\BU2/N2 ),
    .O(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3-In_311 )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd3-In_SW0  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 ),
    .I1(\BU2/U0/tx_axi_shim/force_end_425 ),
    .I2(tx_axis_mac_tvalid),
    .O(\BU2/N2 )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_tx_stats_byte_valid_AND_6_o1  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_409 ),
    .I1(\BU2/U0/TX_STATS_BYTEVLD ),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_tx_stats_byte_valid_AND_6_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_tx_er11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TX_ER_INT ),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r2_390 ),
    .O(gmii_tx_er)
  );
  LUT3 #(
    .INIT ( 8'hF8 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_collision_r_PWR_18_o_MUX_33_o11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r2_392 ),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_385 ),
    .I2(NlwRenamedSig_OI_tx_collision),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_PWR_18_o_MUX_33_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd81  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [7]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [3]),
    .O(gmii_txd_2[7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd71  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [6]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [2]),
    .O(gmii_txd_2[6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd61  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [5]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [1]),
    .O(gmii_txd_2[5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd51  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [4]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [0]),
    .O(gmii_txd_2[4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd41  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [3]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [3]),
    .O(gmii_txd_2[3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd31  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [2]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [2]),
    .O(gmii_txd_2[2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd21  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [1]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [1]),
    .O(gmii_txd_2[1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mmux_txd11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 ),
    .I1(\BU2/U0/GMII_TXD_INT [0]),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [0]),
    .O(gmii_txd_2[0])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mcount_tx_en_count_xor<1>11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [1]),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [0]),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<1>1 )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/Mcount_tx_byte_count_xor<1>11  (
    .I0(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [1]),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [0]),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result [1])
  );
  LUT6 #(
    .INIT ( 64'h0440444444440440 ))
  \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress1  (
    .I0(\BU2/U0/GMII_TX_EN_INT ),
    .I1(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1_391 ),
    .I2(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [0]),
    .I3(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [0]),
    .I4(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [1]),
    .I5(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [1]),
    .O(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \BU2/U0/rx_axi_shim/rx_state_rx_state[1]_rx_enable_AND_17_o1  (
    .I0(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I1(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .O(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o )
  );
  LUT4 #(
    .INIT ( 16'h8880 ))
  \BU2/U0/rx_axi_shim/next_rx_state[1]_rx_enable_AND_13_o1  (
    .I0(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I1(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I2(\BU2/U0/RX_DATA_VALID ),
    .I3(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .O(\BU2/U0/rx_axi_shim/next_rx_state[1]_rx_enable_AND_13_o )
  );
  LUT4 #(
    .INIT ( 16'hAA80 ))
  \BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_11_o1  (
    .I0(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I1(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .I2(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I3(\BU2/U0/RX_DATA_VALID ),
    .O(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_11_o )
  );
  LUT4 #(
    .INIT ( 16'h3B2A ))
  \BU2/U0/rx_axi_shim/rx_state_FSM_FFd2-In1  (
    .I0(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 ),
    .I1(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd1_423 ),
    .I2(\BU2/U0/rx_axi_shim/rx_frame_complete_424 ),
    .I3(\BU2/U0/RX_DATA_VALID ),
    .O(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2-In )
  );
  LUT4 #(
    .INIT ( 16'h88D8 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_REQ_out1  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_REQ_reg_361 ),
    .I2(pause_req),
    .I3(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd2_344 ),
    .O(\BU2/U0/PAUSE_REQ_INT )
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mcount_tx_stats_bytevld_ctr_xor<1>11  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out161  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[9]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [9]),
    .O(\BU2/U0/PAUSE_VAL_INT [9])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out151  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[8]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [8]),
    .O(\BU2/U0/PAUSE_VAL_INT [8])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out141  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[7]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [7]),
    .O(\BU2/U0/PAUSE_VAL_INT [7])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out131  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[6]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [6]),
    .O(\BU2/U0/PAUSE_VAL_INT [6])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out121  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[5]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [5]),
    .O(\BU2/U0/PAUSE_VAL_INT [5])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out111  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[4]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [4]),
    .O(\BU2/U0/PAUSE_VAL_INT [4])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out101  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[3]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [3]),
    .O(\BU2/U0/PAUSE_VAL_INT [3])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out91  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[2]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [2]),
    .O(\BU2/U0/PAUSE_VAL_INT [2])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out81  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[1]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [1]),
    .O(\BU2/U0/PAUSE_VAL_INT [1])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out71  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[15]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [15]),
    .O(\BU2/U0/PAUSE_VAL_INT [15])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out61  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[14]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [14]),
    .O(\BU2/U0/PAUSE_VAL_INT [14])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out51  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[13]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [13]),
    .O(\BU2/U0/PAUSE_VAL_INT [13])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out41  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[12]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [12]),
    .O(\BU2/U0/PAUSE_VAL_INT [12])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out31  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[11]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [11]),
    .O(\BU2/U0/PAUSE_VAL_INT [11])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out21  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[10]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [10]),
    .O(\BU2/U0/PAUSE_VAL_INT [10])
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Mmux_PAUSE_VAL_out17  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd1_422 ),
    .I1(pause_val_7[0]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [0]),
    .O(\BU2/U0/PAUSE_VAL_INT [0])
  );
  LUT3 #(
    .INIT ( 8'h57 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o1  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [3]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o )
  );
  LUT4 #(
    .INIT ( 16'h0008 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_equal_13_o11  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [3]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .I3(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_equal_13_o )
  );
  LUT4 #(
    .INIT ( 16'h6CCC ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result<3>1  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [3]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .I3(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [3])
  );
  LUT3 #(
    .INIT ( 8'h6A ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result<2>1  (
    .I0(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2]),
    .I1(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0]),
    .I2(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1]),
    .O(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [2])
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/tx_axi_shim/tx_mac_tlast_tx_mac_tready_int_AND_31_o1  (
    .I0(tx_axis_mac_tlast),
    .I1(NlwRenamedSig_OI_tx_axis_mac_tready),
    .O(\BU2/U0/tx_axi_shim/tlast_reg_glue_set )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \BU2/U0/tx_axi_shim/Mmux_tx_ack_wire11  (
    .I0(NlwRenamedSig_OI_speed_is_10_100),
    .I1(\BU2/U0/TX_ACK ),
    .I2(\BU2/U0/tx_axi_shim/tx_ack_reg_332 ),
    .O(\BU2/U0/tx_axi_shim/tx_ack_wire )
  );
  LUT5 #(
    .INIT ( 32'h00020000 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd9-In1  (
    .I0(tx_axis_mac_tvalid),
    .I1(tx_axis_mac_tuser),
    .I2(\BU2/U0/tx_axi_shim/no_burst_419 ),
    .I3(\BU2/U0/tx_axi_shim/ignore_packet_420 ),
    .I4(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 ),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o )
  );
  LUT3 #(
    .INIT ( 8'h2A ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd8-In1  (
    .I0(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd9_322 ),
    .I1(tx_axis_mac_tlast),
    .I2(tx_axis_mac_tuser),
    .O(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_70_o )
  );
  LUT6 #(
    .INIT ( 64'h4444F5F4F5F4F5F4 ))
  \BU2/U0/tx_axi_shim/tx_state_FSM_FFd6-In1  (
    .I0(\BU2/U0/tx_axi_shim/tx_ack_wire ),
    .I1(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd1_418 ),
    .I2(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 ),
    .I3(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 ),
    .I4(tx_axis_mac_tlast),
    .I5(tx_axis_mac_tuser),
    .O(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6-In )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \BU2/U0/INT_TX_RST_ASYNCH1  (
    .I0(glbl_rstn),
    .I1(tx_axi_rstn),
    .O(\BU2/U0/INT_TX_RST_ASYNCH )
  );
  LUT2 #(
    .INIT ( 4'h7 ))
  \BU2/U0/INT_RX_RST_ASYNCH1  (
    .I0(glbl_rstn),
    .I1(rx_axi_rstn),
    .O(\BU2/U0/INT_RX_RST_ASYNCH )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/SYNC_TX_RESET_I/Mmux_R3_PWR_21_o_MUX_108_o11  (
    .I0(\BU2/U0/SYNC_TX_RESET_I/R2_244 ),
    .I1(\BU2/U0/SYNC_TX_RESET_I/R3_415 ),
    .O(\BU2/U0/SYNC_TX_RESET_I/R3_PWR_21_o_MUX_108_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \BU2/U0/SYNC_RX_RESET_I/Mmux_R3_PWR_21_o_MUX_108_o11  (
    .I0(\BU2/U0/SYNC_RX_RESET_I/R2_241 ),
    .I1(\BU2/U0/SYNC_RX_RESET_I/R3_413 ),
    .O(\BU2/U0/SYNC_RX_RESET_I/R3_PWR_21_o_MUX_108_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT321  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[10]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT311  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[9]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<8> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT301  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[8]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT291  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[7]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT281  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[6]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT271  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[5]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<4> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT261  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[4]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT251  (
    .I0(\BU2/U0/TX_STATS_SHIFT ),
    .I1(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<31> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT241  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[31]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<30> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT231  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[3]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT221  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[30]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<29> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT211  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[29]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<28> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT201  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[28]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<27> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT191  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[27]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<26> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT181  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[26]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<25> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT171  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[25]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<24> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT161  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[24]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<23> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT151  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[23]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<22> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT141  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[22]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<21> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT131  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[21]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<20> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT121  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[2]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT111  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[20]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<19> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT101  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[19]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<18> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT91  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[18]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<17> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT81  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[17]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<16> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT71  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[16]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<15> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT61  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[15]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<14> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT51  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[14]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<13> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT41  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[13]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<12> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT33  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[12]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<11> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT210  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[11]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT110  (
    .I0(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_tx_statistics_vector[1]),
    .O(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<0> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT281  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[16]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<9> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT271  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[15]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<8> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT261  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[14]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<7> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT251  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[13]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<6> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT241  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[12]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<5> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT231  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[11]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<4> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT221  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[10]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<3> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT211  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[9]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT201  (
    .I0(\BU2/U0/RX_STATS_SHIFT [6]),
    .I1(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<27> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT191  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [5]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<26> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT181  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [4]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<25> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT171  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [3]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<24> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT161  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [2]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<23> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT151  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [1]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<22> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT141  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(\BU2/U0/RX_STATS_SHIFT [0]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<21> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT131  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[27]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<20> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT121  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[8]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT111  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[26]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<19> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT101  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[25]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<18> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT91  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[24]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<17> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT81  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[23]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<16> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT71  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[22]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<15> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT61  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[21]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<14> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT51  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[20]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<13> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT41  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[19]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<12> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT31  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[18]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<11> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT29  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[17]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<10> )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \BU2/U0/Mmux_INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT110  (
    .I0(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .I1(NlwRenamedSig_OI_rx_statistics_vector[7]),
    .O(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<0> )
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1_0  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [4]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [0])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1_1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [5]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [1])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1_2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [6]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [2])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1_3  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [7]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [3])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1_0  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [0]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [0])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1_1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [1]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [1])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1_2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [2]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [2])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1_3  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TXD_INT [3]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [3])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TX_ER_INT ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r1_389 )
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/GMII_TX_EN_INT ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1_391 )
  );
  FD   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress_r  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_suppress_r_412 )
  );
  FD   \BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r  (
    .C(tx_axi_clk),
    .D(NlwRenamedSig_OI_speed_is_10_100),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/speed_is_10_100_r_410 )
  );
  FD   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r  (
    .C(tx_axi_clk),
    .D(\BU2/U0/TX_STATS_BYTEVLD ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_409 )
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2_0  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [0]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [0])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2_1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [1]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [1])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2_2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [2]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [2])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2_3  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r1 [3]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_lonbl_r2 [3])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2_0  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [0]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [0])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2_1  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [1]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [1])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2_2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [2]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [2])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2_3  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r1 [3]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/txd_hinbl_r2 [3])
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r1_391 ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_r2_392 )
  );
  FDC   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r2  (
    .C(tx_axi_clk),
    .CLR(NlwRenamedSig_OI_tx_reset_out),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r1_389 ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_er_r2_390 )
  );
  FDE   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r_0  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_tx_stats_byte_valid_AND_6_o ),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [0]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [0])
  );
  FDE   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r_1  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_r_tx_stats_byte_valid_AND_6_o ),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [1]),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_r [1])
  );
  FD   \BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_PWR_18_o_MUX_33_o ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/collision_r_385 )
  );
  FDR   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_0  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result [0]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [0])
  );
  FDR   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count_1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result [1]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_byte_count [1])
  );
  FDR   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count_0  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<0>1 ),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_from_mac_inv ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [0])
  );
  FDR   \BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count_1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/FCSBLKGEN.fcs_blk_inst/Result<1>1 ),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_from_mac_inv ),
    .Q(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_en_count [1])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_0  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [0]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [0])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_1  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [1]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [1])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_2  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [2]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [2])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_3  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [3]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [3])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_4  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [4]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [4])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_5  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [5]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [5])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_6  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [6]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [6])
  );
  FD   \BU2/U0/rx_axi_shim/rx_data_reg_7  (
    .C(rx_axi_clk),
    .D(\BU2/U0/RX_DATA [7]),
    .Q(\BU2/U0/rx_axi_shim/rx_data_reg [7])
  );
  FDR   \BU2/U0/rx_axi_shim/rx_mac_tvalid  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_11_o ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tvalid)
  );
  FDR   \BU2/U0/rx_axi_shim/rx_mac_tlast  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/next_rx_state[1]_rx_enable_AND_13_o ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tlast)
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_0  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [0]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[0])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_1  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [1]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[1])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_2  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [2]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[2])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_3  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [3]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[3])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_4  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [4]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[4])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_5  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [5]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[5])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_6  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [6]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[6])
  );
  FDRE   \BU2/U0/rx_axi_shim/rx_mac_tdata_7  (
    .C(rx_axi_clk),
    .CE(\BU2/U0/rx_axi_shim/rx_state[1]_rx_enable_AND_17_o ),
    .D(\BU2/U0/rx_axi_shim/rx_data_reg [7]),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_axis_mac_tdata_3[7])
  );
  FDR   \BU2/U0/rx_axi_shim/rx_state_FSM_FFd2  (
    .C(rx_axi_clk),
    .D(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2-In ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(\BU2/U0/rx_axi_shim/rx_state_FSM_FFd2_363 )
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_REQ_reg  (
    .C(tx_axi_clk),
    .D(pause_req),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_REQ_reg_361 )
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_0  (
    .C(tx_axi_clk),
    .D(pause_val_7[0]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [0])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_1  (
    .C(tx_axi_clk),
    .D(pause_val_7[1]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [1])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_2  (
    .C(tx_axi_clk),
    .D(pause_val_7[2]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [2])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_3  (
    .C(tx_axi_clk),
    .D(pause_val_7[3]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [3])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_4  (
    .C(tx_axi_clk),
    .D(pause_val_7[4]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [4])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_5  (
    .C(tx_axi_clk),
    .D(pause_val_7[5]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [5])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_6  (
    .C(tx_axi_clk),
    .D(pause_val_7[6]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [6])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_7  (
    .C(tx_axi_clk),
    .D(pause_val_7[7]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [7])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_8  (
    .C(tx_axi_clk),
    .D(pause_val_7[8]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [8])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_9  (
    .C(tx_axi_clk),
    .D(pause_val_7[9]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [9])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_10  (
    .C(tx_axi_clk),
    .D(pause_val_7[10]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [10])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_11  (
    .C(tx_axi_clk),
    .D(pause_val_7[11]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [11])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_12  (
    .C(tx_axi_clk),
    .D(pause_val_7[12]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [12])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_13  (
    .C(tx_axi_clk),
    .D(pause_val_7[13]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [13])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_14  (
    .C(tx_axi_clk),
    .D(pause_val_7[14]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [14])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg_15  (
    .C(tx_axi_clk),
    .D(pause_val_7[15]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/PAUSE_VAL_reg [15])
  );
  FDR   \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_equal_13_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/pausereq_mux_slt_FSM_FFd2_344 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr_0  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o ),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [0]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr_1  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o ),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [1]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr_2  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o ),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [2]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr_3  (
    .C(tx_axi_clk),
    .CE(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr[3]_PWR_16_o_LessThan_6_o ),
    .D(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/Result [3]),
    .R(\BU2/U0/FCSBLKGEN.fcs_blk_inst/tx_stats_byte_valid_inv ),
    .Q(\BU2/U0/PAUSESHIM_8_GEN.pausereq_shim_inst/tx_stats_bytevld_ctr [3])
  );
  FD   \BU2/U0/tx_axi_shim/tx_ack_reg  (
    .C(tx_axi_clk),
    .D(\BU2/U0/TX_ACK ),
    .Q(\BU2/U0/tx_axi_shim/tx_ack_reg_332 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_mac_tready_reg  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_ignore_packet_OR_48_o_331 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_axis_mac_tready)
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_0  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[0]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [0])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_1  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[1]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [1])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_2  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[2]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [2])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_3  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[3]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [3])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_4  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[4]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [4])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_5  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[5]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [5])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_6  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[6]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [6])
  );
  FDRE   \BU2/U0/tx_axi_shim/tx_data_hold_7  (
    .C(tx_axi_clk),
    .CE(NlwRenamedSig_OI_tx_axis_mac_tready),
    .D(tx_axis_mac_tdata_5[7]),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_data_hold [7])
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd9  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_28_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd9_322 )
  );
  FDS   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd10  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_tx_enable_reg_AND_37_o ),
    .S(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd10_320 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd6  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6-In ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd6_318 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd8  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_70_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd8_316 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd7  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7-In_313 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd7_314 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd3  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3-In_311 ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd3_312 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd5  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_71_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd5_310 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd4  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_PWR_20_o_equal_74_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd4_308 )
  );
  FDR   \BU2/U0/tx_axi_shim/tx_state_FSM_FFd2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/tx_axi_shim/next_tx_state[3]_GND_20_o_equal_72_o ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(\BU2/U0/tx_axi_shim/tx_state_FSM_FFd2_306 )
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_0  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<0> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[0])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_1  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<1> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[1])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_2  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<2> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[2])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_3  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<3> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[3])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_4  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<4> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[4])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_5  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<5> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(rx_statistics_vector_4[5])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_6  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<6> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[6])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_7  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<7> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[7])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_8  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<8> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[8])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_9  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<9> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[9])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_10  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<10> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[10])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_11  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<11> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[11])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_12  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<12> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[12])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_13  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<13> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[13])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_14  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<14> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[14])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_15  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<15> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[15])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_16  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<16> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[16])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_17  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<17> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[17])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_18  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<18> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[18])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_19  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<19> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[19])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_20  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<20> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[20])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_21  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<21> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[21])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_22  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<22> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[22])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_23  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<23> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[23])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_24  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<24> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[24])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_25  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<25> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[25])
  );
  FDR   \BU2/U0/INT_RX_STATISTICS_VECTOR_26  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<26> ),
    .R(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[26])
  );
  FDS   \BU2/U0/INT_RX_STATISTICS_VECTOR_27  (
    .C(rx_axi_clk),
    .D(\BU2/U0/INT_RX_STATISTICS_VECTOR[27]_RX_STATS_SHIFT[6]_mux_5_OUT<27> ),
    .S(NlwRenamedSig_OI_rx_reset_out),
    .Q(NlwRenamedSig_OI_rx_statistics_vector[27])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_0  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<0> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[0])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_1  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<1> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[1])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<2> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[2])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_3  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<3> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[3])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_4  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<4> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[4])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_5  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<5> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[5])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_6  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<6> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[6])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_7  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<7> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[7])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_8  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<8> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[8])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_9  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<9> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[9])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_10  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<10> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[10])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_11  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<11> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[11])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_12  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<12> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[12])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_13  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<13> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[13])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_14  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<14> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[14])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_15  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<15> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[15])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_16  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<16> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[16])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_17  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<17> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[17])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_18  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<18> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[18])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_19  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<19> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[19])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_20  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<20> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[20])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_21  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<21> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[21])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_22  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<22> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[22])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_23  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<23> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[23])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_24  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<24> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[24])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_25  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<25> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[25])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_26  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<26> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[26])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_27  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<27> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[27])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_28  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<28> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[28])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_29  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<29> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[29])
  );
  FDR   \BU2/U0/INT_TX_STATISTICS_VECTOR_30  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<30> ),
    .R(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[30])
  );
  FDS   \BU2/U0/INT_TX_STATISTICS_VECTOR_31  (
    .C(tx_axi_clk),
    .D(\BU2/U0/INT_TX_STATISTICS_VECTOR[31]_TX_STATS_SHIFT_mux_9_OUT<31> ),
    .S(NlwRenamedSig_OI_tx_reset_out),
    .Q(NlwRenamedSig_OI_tx_statistics_vector[31])
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_TX_RESET_I/R2  (
    .C(tx_axi_clk),
    .D(\BU2/U0/SYNC_TX_RESET_I/R1_243 ),
    .PRE(\BU2/U0/INT_TX_RST_ASYNCH ),
    .Q(\BU2/U0/SYNC_TX_RESET_I/R2_244 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_TX_RESET_I/R1  (
    .C(tx_axi_clk),
    .D(\BU2/N0 ),
    .PRE(\BU2/U0/INT_TX_RST_ASYNCH ),
    .Q(\BU2/U0/SYNC_TX_RESET_I/R1_243 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_RX_RESET_I/R2  (
    .C(rx_axi_clk),
    .D(\BU2/U0/SYNC_RX_RESET_I/R1_240 ),
    .PRE(\BU2/U0/INT_RX_RST_ASYNCH ),
    .Q(\BU2/U0/SYNC_RX_RESET_I/R2_241 )
  );
  FDP #(
    .INIT ( 1'b1 ))
  \BU2/U0/SYNC_RX_RESET_I/R1  (
    .C(rx_axi_clk),
    .D(\BU2/N0 ),
    .PRE(\BU2/U0/INT_RX_RST_ASYNCH ),
    .Q(\BU2/U0/SYNC_RX_RESET_I/R1_240 )
  );
  TEMAC_SINGLE #(
    .EMAC_1000BASEX_ENABLE ( "FALSE" ),
    .EMAC_ADDRFILTER_ENABLE ( "FALSE" ),
    .EMAC_BYTEPHY ( "FALSE" ),
    .EMAC_CTRLLENCHECK_DISABLE ( "FALSE" ),
    .EMAC_DCRBASEADDR ( 8'h00 ),
    .EMAC_GTLOOPBACK ( "FALSE" ),
    .EMAC_HOST_ENABLE ( "FALSE" ),
    .EMAC_LINKTIMERVAL ( 9'h031 ),
    .EMAC_LTCHECK_DISABLE ( "FALSE" ),
    .EMAC_MDIO_ENABLE ( "FALSE" ),
    .EMAC_MDIO_IGNORE_PHYADZERO ( "FALSE" ),
    .EMAC_PAUSEADDR ( 48'h000000000000 ),
    .EMAC_PHYINITAUTONEG_ENABLE ( "FALSE" ),
    .EMAC_PHYISOLATE ( "FALSE" ),
    .EMAC_PHYLOOPBACKMSB ( "FALSE" ),
    .EMAC_PHYPOWERDOWN ( "FALSE" ),
    .EMAC_PHYRESET ( "FALSE" ),
    .EMAC_RGMII_ENABLE ( "FALSE" ),
    .EMAC_RX16BITCLIENT_ENABLE ( "FALSE" ),
    .EMAC_RXFLOWCTRL_ENABLE ( "FALSE" ),
    .EMAC_RXHALFDUPLEX ( "FALSE" ),
    .EMAC_RXINBANDFCS_ENABLE ( "FALSE" ),
    .EMAC_RXJUMBOFRAME_ENABLE ( "FALSE" ),
    .EMAC_RXRESET ( "FALSE" ),
    .EMAC_RXVLAN_ENABLE ( "FALSE" ),
    .EMAC_RX_ENABLE ( "TRUE" ),
    .EMAC_SGMII_ENABLE ( "FALSE" ),
    .EMAC_SPEED_LSB ( "FALSE" ),
    .EMAC_SPEED_MSB ( "TRUE" ),
    .EMAC_TX16BITCLIENT_ENABLE ( "FALSE" ),
    .EMAC_TXFLOWCTRL_ENABLE ( "FALSE" ),
    .EMAC_TXHALFDUPLEX ( "FALSE" ),
    .EMAC_TXIFGADJUST_ENABLE ( "FALSE" ),
    .EMAC_TXINBANDFCS_ENABLE ( "FALSE" ),
    .EMAC_TXJUMBOFRAME_ENABLE ( "FALSE" ),
    .EMAC_TXRESET ( "FALSE" ),
    .EMAC_TXVLAN_ENABLE ( "FALSE" ),
    .EMAC_TX_ENABLE ( "TRUE" ),
    .EMAC_UNICASTADDR ( 48'h000000000000 ),
    .EMAC_UNIDIRECTION_ENABLE ( "FALSE" ),
    .EMAC_USECLKEN ( "FALSE" ),
    .SIM_VERSION ( "1.0" ))
  \BU2/U0/v6_emac  (
    .EMACCLIENTTXCLIENTCLKOUT(\NLW_BU2/U0/v6_emac_EMACCLIENTTXCLIENTCLKOUT_UNCONNECTED ),
    .EMACPHYTXCHARDISPMODE(\BU2/txchardispmode ),
    .HOSTMIIMRDY(\NLW_BU2/U0/v6_emac_HOSTMIIMRDY_UNCONNECTED ),
    .EMACPHYSYNCACQSTATUS(\BU2/syncacqstatus ),
    .EMACCLIENTTXSTATSBYTEVLD(\BU2/U0/TX_STATS_BYTEVLD ),
    .DCRHOSTDONEIR(\NLW_BU2/U0/v6_emac_DCRHOSTDONEIR_UNCONNECTED ),
    .PHYEMACGTXCLK(\BU2/N0 ),
    .EMACPHYMGTRXRESET(\BU2/mgtrxreset ),
    .PHYEMACRXCLK(rx_axi_clk),
    .DCREMACENABLE(\BU2/N0 ),
    .EMACSPEEDIS10100(NlwRenamedSig_OI_speed_is_10_100),
    .PHYEMACTXGMIIMIICLKIN(tx_axi_clk),
    .EMACCLIENTTXACK(\BU2/U0/TX_ACK ),
    .EMACPHYTXCHARISK(\BU2/txcharisk ),
    .PHYEMACRXRUNDISP(N0),
    .PHYEMACMIITXCLK(\BU2/N0 ),
    .CLIENTEMACTXFIRSTBYTE(\BU2/N0 ),
    .EMACPHYTXGMIIMIICLKOUT(\BU2/tx_axi_clk_out ),
    .HOSTMIIMSEL(\BU2/N0 ),
    .EMACCLIENTANINTERRUPT(\BU2/aninterrupt ),
    .EMACPHYENCOMMAALIGN(\BU2/encommaalign ),
    .EMACPHYMDTRI(\BU2/mdio_tri ),
    .EMACCLIENTRXDVLD(\BU2/U0/RX_DATA_VALID ),
    .EMACPHYTXEN(\BU2/U0/GMII_TX_EN_INT ),
    .PHYEMACRXNOTINTABLE(N0),
    .EMACCLIENTRXGOODFRAME(\BU2/U0/RX_GOOD_FRAME ),
    .DCREMACCLK(\BU2/N0 ),
    .DCREMACWRITE(\BU2/N0 ),
    .CLIENTEMACDCMLOCKED(N1),
    .PHYEMACRXDV(gmii_rx_dv),
    .PHYEMACRXCHARISK(N0),
    .PHYEMACTXBUFERR(N0),
    .EMACPHYMCLKOUT(\BU2/mdc_out ),
    .CLIENTEMACPAUSEREQ(\BU2/U0/PAUSE_REQ_INT ),
    .CLIENTEMACTXUNDERRUN(\BU2/U0/tx_axi_shim/tx_underrun_184 ),
    .EMACCLIENTRXFRAMEDROP(\NLW_BU2/U0/v6_emac_EMACCLIENTRXFRAMEDROP_UNCONNECTED ),
    .EMACCLIENTRXDVLDMSW(\NLW_BU2/U0/v6_emac_EMACCLIENTRXDVLDMSW_UNCONNECTED ),
    .EMACCLIENTRXCLIENTCLKOUT(\NLW_BU2/U0/v6_emac_EMACCLIENTRXCLIENTCLKOUT_UNCONNECTED ),
    .CLIENTEMACTXCLIENTCLKIN(tx_axi_clk),
    .PHYEMACCRS(N0),
    .EMACCLIENTTXRETRANSMIT(NlwRenamedSig_OI_tx_retransmit),
    .PHYEMACMCLKIN(N0),
    .CLIENTEMACTXDVLDMSW(\BU2/N0 ),
    .EMACCLIENTRXSTATSBYTEVLD(\NLW_BU2/U0/v6_emac_EMACCLIENTRXSTATSBYTEVLD_UNCONNECTED ),
    .EMACPHYTXCHARDISPVAL(\BU2/txchardispval ),
    .PHYEMACRXDISPERR(N0),
    .PHYEMACRXCHARISCOMMA(N0),
    .EMACPHYMDOUT(\BU2/mdio_out ),
    .EMACPHYMGTTXRESET(\BU2/mgttxreset ),
    .PHYEMACCOL(N0),
    .CLIENTEMACTXDVLD(\BU2/U0/tx_axi_shim/tx_data_valid_185 ),
    .EMACCLIENTTXSTATSVLD(\BU2/U0/TX_STATS_SHIFT_VLD ),
    .PHYEMACMDIN(N0),
    .EMACCLIENTTXCOLLISION(NlwRenamedSig_OI_tx_collision),
    .PHYEMACSIGNALDET(N0),
    .EMACCLIENTRXSTATSVLD(\BU2/U0/RX_STATS_SHIFT_VLD ),
    .HOSTREQ(\BU2/N0 ),
    .EMACDCRACK(\NLW_BU2/U0/v6_emac_EMACDCRACK_UNCONNECTED ),
    .HOSTCLK(N0),
    .PHYEMACRXER(gmii_rx_er),
    .EMACPHYTXCLK(\NLW_BU2/U0/v6_emac_EMACPHYTXCLK_UNCONNECTED ),
    .EMACPHYTXER(\BU2/U0/GMII_TX_ER_INT ),
    .EMACPHYPOWERDOWN(\BU2/powerdown ),
    .EMACPHYLOOPBACKMSB(\BU2/loopbackmsb ),
    .CLIENTEMACRXCLIENTCLKIN(rx_axi_clk),
    .EMACCLIENTTXSTATS(\BU2/U0/TX_STATS_SHIFT ),
    .RESET(\BU2/U0/INT_GLBL_RST ),
    .DCREMACREAD(\BU2/N0 ),
    .EMACCLIENTRXBADFRAME(\BU2/U0/RX_BAD_FRAME ),
    .CLIENTEMACTXD({\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/U0/tx_axi_shim/tx_data [7], 
\BU2/U0/tx_axi_shim/tx_data [6], \BU2/U0/tx_axi_shim/tx_data [5], \BU2/U0/tx_axi_shim/tx_data [4], \BU2/U0/tx_axi_shim/tx_data [3], 
\BU2/U0/tx_axi_shim/tx_data [2], \BU2/U0/tx_axi_shim/tx_data [1], \BU2/U0/tx_axi_shim/tx_data [0]}),
    .HOSTWRDATA({\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , 
\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , 
\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 }),
    .EMACCLIENTRXD({\NLW_BU2/U0/v6_emac_EMACCLIENTRXD<15>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<14>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACCLIENTRXD<13>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<12>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACCLIENTRXD<11>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<10>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACCLIENTRXD<9>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACCLIENTRXD<8>_UNCONNECTED , \BU2/U0/RX_DATA [7], \BU2/U0/RX_DATA [6], 
\BU2/U0/RX_DATA [5], \BU2/U0/RX_DATA [4], \BU2/U0/RX_DATA [3], \BU2/U0/RX_DATA [2], \BU2/U0/RX_DATA [1], \BU2/U0/RX_DATA [0]}),
    .EMACPHYTXD({\BU2/U0/GMII_TXD_INT [7], \BU2/U0/GMII_TXD_INT [6], \BU2/U0/GMII_TXD_INT [5], \BU2/U0/GMII_TXD_INT [4], \BU2/U0/GMII_TXD_INT [3], 
\BU2/U0/GMII_TXD_INT [2], \BU2/U0/GMII_TXD_INT [1], \BU2/U0/GMII_TXD_INT [0]}),
    .PHYEMACRXD({gmii_rxd_8[7], gmii_rxd_8[6], gmii_rxd_8[5], gmii_rxd_8[4], gmii_rxd_8[3], gmii_rxd_8[2], gmii_rxd_8[1], gmii_rxd_8[0]}),
    .PHYEMACRXCLKCORCNT({N0, N0, N0}),
    .CLIENTEMACPAUSEVAL({\BU2/U0/PAUSE_VAL_INT [15], \BU2/U0/PAUSE_VAL_INT [14], \BU2/U0/PAUSE_VAL_INT [13], \BU2/U0/PAUSE_VAL_INT [12], 
\BU2/U0/PAUSE_VAL_INT [11], \BU2/U0/PAUSE_VAL_INT [10], \BU2/U0/PAUSE_VAL_INT [9], \BU2/U0/PAUSE_VAL_INT [8], \BU2/U0/PAUSE_VAL_INT [7], 
\BU2/U0/PAUSE_VAL_INT [6], \BU2/U0/PAUSE_VAL_INT [5], \BU2/U0/PAUSE_VAL_INT [4], \BU2/U0/PAUSE_VAL_INT [3], \BU2/U0/PAUSE_VAL_INT [2], 
\BU2/U0/PAUSE_VAL_INT [1], \BU2/U0/PAUSE_VAL_INT [0]}),
    .EMACDCRDBUS({\NLW_BU2/U0/v6_emac_EMACDCRDBUS<0>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<1>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<2>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<3>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<4>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<5>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<6>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<7>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<8>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<9>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<10>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<11>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<12>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<13>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<14>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<15>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<16>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<17>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<18>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<19>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<20>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<21>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<22>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<23>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<24>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<25>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<26>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<27>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<28>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_EMACDCRDBUS<29>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<30>_UNCONNECTED , \NLW_BU2/U0/v6_emac_EMACDCRDBUS<31>_UNCONNECTED })
,
    .HOSTADDR({\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 }),
    .DCREMACDBUS({\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , 
\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , 
\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 }),
    .EMACCLIENTRXSTATS({\BU2/U0/RX_STATS_SHIFT [6], \BU2/U0/RX_STATS_SHIFT [5], \BU2/U0/RX_STATS_SHIFT [4], \BU2/U0/RX_STATS_SHIFT [3], 
\BU2/U0/RX_STATS_SHIFT [2], \BU2/U0/RX_STATS_SHIFT [1], \BU2/U0/RX_STATS_SHIFT [0]}),
    .DCREMACABUS({\BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 , \BU2/N0 }),
    .HOSTOPCODE({\BU2/N0 , \BU2/N0 }),
    .CLIENTEMACTXIFGDELAY({tx_ifg_delay_6[7], tx_ifg_delay_6[6], tx_ifg_delay_6[5], tx_ifg_delay_6[4], tx_ifg_delay_6[3], tx_ifg_delay_6[2], 
tx_ifg_delay_6[1], tx_ifg_delay_6[0]}),
    .PHYEMACPHYAD({N0, N0, N0, N0, N0}),
    .PHYEMACRXBUFSTATUS({N0, \BU2/N0 }),
    .HOSTRDDATA({\NLW_BU2/U0/v6_emac_HOSTRDDATA<31>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<30>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<29>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<28>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<27>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<26>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<25>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<24>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<23>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<22>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<21>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<20>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<19>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<18>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<17>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<16>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<15>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<14>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<13>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<12>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<11>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<10>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<9>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<8>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<7>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<6>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<5>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<4>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<3>_UNCONNECTED , 
\NLW_BU2/U0/v6_emac_HOSTRDDATA<2>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<1>_UNCONNECTED , \NLW_BU2/U0/v6_emac_HOSTRDDATA<0>_UNCONNECTED })
  );
  VCC   \BU2/XST_VCC  (
    .P(\BU2/N1 )
  );
  GND   \BU2/XST_GND  (
    .G(\BU2/N0 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
