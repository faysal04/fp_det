/*******************************************************************************
*     (c) Copyright 1995 - 2010 Xilinx, Inc. All rights reserved.              *
*                                                                              *
*     This file contains confidential and proprietary information              *
*     of Xilinx, Inc. and is protected under U.S. and                          *
*     international copyright and other intellectual property                  *
*     laws.                                                                    *
*                                                                              *
*     DISCLAIMER                                                               *
*     This disclaimer is not a license and does not grant any                  *
*     rights to the materials distributed herewith. Except as                  *
*     otherwise provided in a valid license issued to you by                   *
*     Xilinx, and to the maximum extent permitted by applicable                *
*     law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND                  *
*     WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES              *
*     AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING                *
*     BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-                   *
*     INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and                 *
*     (2) Xilinx shall not be liable (whether in contract or tort,             *
*     including negligence, or under any other theory of                       *
*     liability) for any loss or damage of any kind or nature                  *
*     related to, arising under or in connection with these                    *
*     materials, including for any direct, or any indirect,                    *
*     special, incidental, or consequential loss or damage                     *
*     (including loss of data, profits, goodwill, or any type of               *
*     loss or damage suffered as a result of any action brought                *
*     by a third party) even if such damage or loss was                        *
*     reasonably foreseeable or Xilinx had been advised of the                 *
*     possibility of the same.                                                 *
*                                                                              *
*     CRITICAL APPLICATIONS                                                    *
*     Xilinx products are not designed or intended to be fail-                 *
*     safe, or for use in any application requiring fail-safe                  *
*     performance, such as life-support or safety devices or                   *
*     systems, Class III medical devices, nuclear facilities,                  *
*     applications related to the deployment of airbags, or any                *
*     other applications that could lead to death, personal                    *
*     injury, or severe property or environmental damage                       *
*     (individually and collectively, "Critical                                *
*     Applications"). Customer assumes the sole risk and                       *
*     liability of any use of Xilinx products in Critical                      *
*     Applications, subject only to applicable laws and                        *
*     regulations governing limitations on product liability.                  *
*                                                                              *
*     THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS                 *
*     PART OF THIS FILE AT ALL TIMES.                                          *
*******************************************************************************/

//  Generated from component ID: xilinx.com:ip:v6_emac:2.3


// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
Ethernet_Virtex6 YourInstanceName (
	.glbl_rstn(glbl_rstn), // input glbl_rstn
	.rx_axi_rstn(rx_axi_rstn), // input rx_axi_rstn
	.tx_axi_rstn(tx_axi_rstn), // input tx_axi_rstn
	.gtx_clk(gtx_clk), // input gtx_clk
	.rx_axi_clk(rx_axi_clk), // input rx_axi_clk
	.rx_reset_out(rx_reset_out), // output rx_reset_out
	.rx_axis_mac_tdata(rx_axis_mac_tdata), // output [7 : 0] rx_axis_mac_tdata
	.rx_axis_mac_tvalid(rx_axis_mac_tvalid), // output rx_axis_mac_tvalid
	.rx_axis_mac_tlast(rx_axis_mac_tlast), // output rx_axis_mac_tlast
	.rx_axis_mac_tuser(rx_axis_mac_tuser), // output rx_axis_mac_tuser
	.rx_statistics_vector(rx_statistics_vector), // output [27 : 0] rx_statistics_vector
	.rx_statistics_valid(rx_statistics_valid), // output rx_statistics_valid
	.tx_axi_clk(tx_axi_clk), // input tx_axi_clk
	.tx_reset_out(tx_reset_out), // output tx_reset_out
	.tx_axis_mac_tdata(tx_axis_mac_tdata), // input [7 : 0] tx_axis_mac_tdata
	.tx_axis_mac_tvalid(tx_axis_mac_tvalid), // input tx_axis_mac_tvalid
	.tx_axis_mac_tlast(tx_axis_mac_tlast), // input tx_axis_mac_tlast
	.tx_axis_mac_tuser(tx_axis_mac_tuser), // input tx_axis_mac_tuser
	.tx_axis_mac_tready(tx_axis_mac_tready), // output tx_axis_mac_tready
	.tx_retransmit(tx_retransmit), // output tx_retransmit
	.tx_collision(tx_collision), // output tx_collision
	.tx_ifg_delay(tx_ifg_delay), // input [7 : 0] tx_ifg_delay
	.tx_statistics_vector(tx_statistics_vector), // output [31 : 0] tx_statistics_vector
	.tx_statistics_valid(tx_statistics_valid), // output tx_statistics_valid
	.pause_req(pause_req), // input pause_req
	.pause_val(pause_val), // input [15 : 0] pause_val
	.speed_is_10_100(speed_is_10_100), // output speed_is_10_100
	.gmii_txd(gmii_txd), // output [7 : 0] gmii_txd
	.gmii_tx_en(gmii_tx_en), // output gmii_tx_en
	.gmii_tx_er(gmii_tx_er), // output gmii_tx_er
	.gmii_rxd(gmii_rxd), // input [7 : 0] gmii_rxd
	.gmii_rx_dv(gmii_rx_dv), // input gmii_rx_dv
	.gmii_rx_er(gmii_rx_er)); // input gmii_rx_er

// INST_TAG_END ------ End INSTANTIATION Template ---------
