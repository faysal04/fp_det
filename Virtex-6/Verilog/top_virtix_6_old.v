// `timescale 1ns/1ps

// module top_wrapper (
//   // Differential 200 MHz input clock
//   input  wire clk_200_p,
//   input  wire clk_200_n,
//   input  wire resetn_in, // Active-low external reset

//   // PHY GMII interface
//   input  wire gmii_rx_dv,
//   input  wire gmii_rx_er,
//   input  wire [7:0] gmii_rxd,
//   output wire gmii_tx_en,
//   output wire gmii_tx_er,
//   output wire [7:0] gmii_txd,
//   input  wire gmii_crs,
//   input  wire gmii_col,

//   // Outputs from your existing top module
//   output wire [7:0] rxd_out,
//   output wire [16-1:0] fp_num0,
//   output wire [16-1:0] fp_num1,
//   output wire [16-1:0] fp_num2,
//   output wire [16-1:0] fp_num3,
//   output wire [16-1:0] fp_num4,
//   output wire [16-1:0] fp_num5,
//   output wire [16-1:0] fp_num6,
//   output wire [16-1:0] fp_num7,
//   output wire [16-1:0] fp_num8,
//   output wire [16-1:0] fp_num9,
//   output wire [16-1:0] fp_num10,
//   output wire [16-1:0] fp_num11,
//   output wire [16-1:0] fp_num12,
//   output wire [16-1:0] fp_num13,
//   output wire [16-1:0] fp_num14,
//   output wire [16-1:0] fp_num15,
//   output wire [16-1:0] fp_num16,
//   output wire [16-1:0] fp_num17,
//   output wire fp_det,
//   output wire [16-1:0] ip_id,
//   output wire [32-1:0] ip_dst,
//   output wire [16-1:0] tcp_sport,
//   output wire [16-1:0] tcp_dport,
//   output wire [32-1:0] tcp_ack,
//   output wire [32-1:0] tcp_seq,
//   output wire [16-1:0] tcp_window,
//   output wire valid
// );

//   // Internal clocks
//   wire clk_125;  // For MAC / GMII
//   wire clk_200;  // System clock
//   wire clk_locked;
//   wire reset_sync;

//   // Clocking Wizard instantiation
//   clk clk_wiz_inst (
//     .CLK_IN1_P (clk_200_p),
//     .CLK_IN1_N (clk_200_n),
//     .CLK_OUT1  (clk_125),
//     .CLK_OUT2  (clk_200),
//     .LOCKED    (clk_locked),
//     .RESET     (~resetn_in)
//   );

//   // Synchronized reset
//   reg rst_n_sync;
//   always @(posedge clk_200 or negedge resetn_in) begin
//     if(!resetn_in)
//       rst_n_sync <= 1'b0;
//     else if(clk_locked)
//       rst_n_sync <= 1'b1;
//   end
//   assign reset_sync = ~rst_n_sync;

//   // Ethernet MAC Wrapper v2.3 IP
//   Ethernet_Virtex6 mac_ip (
//     .gtx_clk    (clk_125),
//     .glbl_rstn  (rst_n_sync),
//     .gmii_rx_dv (gmii_rx_dv),
//     .gmii_rx_er (gmii_rx_er),
//     .gmii_rxd   (gmii_rxd),
//     .gmii_tx_en (gmii_tx_en),
//     .gmii_tx_er (gmii_tx_er),
//     .gmii_txd   (gmii_txd)
//     //.gmii_crs   (gmii_crs),
//     //.gmii_col   (gmii_col)
//     // Add other optional ports if needed (e.g., PHY config, interrupts)
//   );

//   // Your existing top module instantiation
//   top inst_top (
//     .rx_er(gmii_rx_er),
//     .rx_dv(gmii_rx_dv),
//     .rxd(gmii_rxd),
//     .rx_clk(clk_125),
//     .crs(gmii_crs),
//     .col(gmii_col),
//     .tx_clk(clk_125),
//     .tx_er(gmii_tx_er),
//     .tx_en(gmii_tx_en),
//     .txd(gmii_txd),
//     .clk(clk_200),
//     .rst_n(rst_n_sync),
//     .link_active(1'b1), // Tie high for now; can be connected to PHY link status
//     .preamble_detected(1'b0), // Can connect to preamble detector if available
//     .rxd_out(rxd_out),
//     .fp_num0(fp_num0),
//     .fp_num1(fp_num1),
//     .fp_num2(fp_num2),
//     .fp_num3(fp_num3),
//     .fp_num4(fp_num4),
//     .fp_num5(fp_num5),
//     .fp_num6(fp_num6),
//     .fp_num7(fp_num7),
//     .fp_num8(fp_num8),
//     .fp_num9(fp_num9),
//     .fp_num10(fp_num10),
//     .fp_num11(fp_num11),
//     .fp_num12(fp_num12),
//     .fp_num13(fp_num13),
//     .fp_num14(fp_num14),
//     .fp_num15(fp_num15),
//     .fp_num16(fp_num16),
//     .fp_num17(fp_num17),
//     .fp_det(fp_det),
//     .ip_id(ip_id),
//     .ip_dst(ip_dst),
//     .tcp_sport(tcp_sport),
//     .tcp_dport(tcp_dport),
//     .tcp_ack(tcp_ack),
//     .tcp_seq(tcp_seq),
//     .tcp_window(tcp_window),
//     .valid(valid)
//   );

// endmodule
