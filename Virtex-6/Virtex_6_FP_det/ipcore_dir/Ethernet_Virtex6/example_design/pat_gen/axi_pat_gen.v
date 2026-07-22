//------------------------------------------------------------------------------
// File       : axi_pat_gen.v
// Author     : Xilinx Inc.
// Project    : Xilinx LogiCORE Virtex-6 Embedded Tri-Mode Ethernet MAC
// File       : axi_pat_gen.v
// Version    : 2.3
//-----------------------------------------------------------------------------
//
// (c) Copyright 2010 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//
// Description:  This is a very simple pattern generator which will generate packets
// with the supplied dest_addr and src_addr and incrementing data.  The packet size
// increments between the min and max size (which can be set to the same value if a
// specific size is required
//
//------------------------------------------------------------------------------

`timescale 1 ps/1 ps

module axi_pat_gen #(
   parameter               DEST_ADDR = 48'hda0102030405,
   parameter               SRC_ADDR  = 48'h5a0102030405,
   parameter               MAX_SIZE  = 16'd500,
   parameter               MIN_SIZE  = 16'd64

)(
   input                   axi_tclk,
   input                   axi_tresetn,

   input                   enable_pat_gen,

   output reg  [7:0]       tdata,
   output                  tvalid,
   output reg              tlast,
   input                   tready
);

parameter      IDLE   = 2'b00,
               HEADER = 2'b01,
               SIZE   = 2'b10,
               DATA   = 2'b11;

reg         [11:0]         byte_count;
reg         [3:0]          header_count;
reg         [11:0]         pkt_size;
reg         [1:0]          next_gen_state;
reg         [1:0]          gen_state;
wire        [7:0]          lut_data;
reg                        tvalid_int;

wire                       axi_treset;

assign axi_treset = !axi_tresetn;

// need a packet counter - max size limited to 11 bits
always @(posedge axi_tclk)
begin
   if (axi_treset) begin
      byte_count <= 12'd0;
   end
   else if ((gen_state == DATA) && |byte_count & tready) begin
      byte_count <= byte_count - 12'd1;
   end
   else if (gen_state == IDLE) begin
      byte_count <= pkt_size;
   end
end

// need a smaller count to manage the header insertion
always @(posedge axi_tclk)
begin
   if (axi_treset) begin
      header_count <= 4'd0;
   end
   else if ((gen_state != IDLE) && !(&header_count) & (tready | !tvalid_int)) begin
      header_count <= header_count + 4'd1;
   end
   else if (gen_state == IDLE) begin
      header_count <= 4'd0;
   end
end

// need a smaller count to manage the header insertion
// adjust parameter values by 18 to allow for header and crc
// so the pkt_size can be sued directly in the size field
always @(posedge axi_tclk)
begin
   if (axi_treset) begin
      pkt_size <= MIN_SIZE - 18;
   end
   else if ((gen_state == DATA) && (next_gen_state == IDLE)) begin
      if (pkt_size == MAX_SIZE - 18)
         pkt_size <= MIN_SIZE - 18;
      else
         pkt_size <= pkt_size + 12'd1;
   end
end

// store the parameterized values in a lut (64 deep)
// this should mean the values could be adjusted in fpga_editor etc..
genvar i;
generate
  for (i=0; i<=7; i=i+1) begin : gen_addr
    LUT6 #(
       .INIT      ({52'd0,
                    SRC_ADDR[i],
                    SRC_ADDR[i+8],
                    SRC_ADDR[i+16],
                    SRC_ADDR[i+24],
                    SRC_ADDR[i+32],
                    SRC_ADDR[i+40],
                    DEST_ADDR[i],
                    DEST_ADDR[i+8],
                    DEST_ADDR[i+16],
                    DEST_ADDR[i+24],
                    DEST_ADDR[i+32],
                    DEST_ADDR[i+40]
                   })   // Specify LUT Contents
    ) LUT6_inst (
       .O         (lut_data[i]),
       .I0        (header_count[0]),
       .I1        (header_count[1]),
       .I2        (header_count[2]),
       .I3        (header_count[3]),
       .I4        (1'b0),
       .I5        (1'b0)
    );
   end
endgenerate


// simple state machine to control the data
// on the transition from IDLE we reset the counters and increment the packet size
always @(gen_state or enable_pat_gen or header_count or tready or byte_count or tvalid_int)
begin
   next_gen_state = gen_state;
   case (gen_state)
      IDLE : begin
         if (enable_pat_gen & !tvalid_int)
            next_gen_state = HEADER;
      end
      HEADER : begin
         if ((header_count == 4'd11) && tready)
            next_gen_state = SIZE;
      end
      SIZE : begin
         if ((header_count == 4'd13) && tready)
            next_gen_state = DATA;
      end
      DATA : begin
         if ((byte_count == 12'd1) && tready) begin
            next_gen_state = IDLE;
         end
      end
      default : begin
         next_gen_state = IDLE;
      end
   endcase
end

always @(posedge axi_tclk)
begin
   if (axi_treset) begin
      gen_state <= IDLE;
   end
   else begin
   gen_state <= next_gen_state;
   end
end


// now generate the TVALID output
always @(posedge axi_tclk)
begin
   if (axi_treset)
      tvalid_int <= 0;
   else if (gen_state != IDLE)
      tvalid_int <= 1;
   else if (tready)
      tvalid_int <= 0;
end

// now generate the TDATA output
always @(posedge axi_tclk)
begin
   if ((gen_state == HEADER) && (tready | !tvalid_int))
      tdata <= lut_data;
   else if ((gen_state == SIZE) && tready) begin
      if (header_count[0])
         tdata <= pkt_size[7:0];
      else
         tdata <= {5'h0, pkt_size[10:8]};
   end
   else if (tready)
      tdata <= byte_count[7:0];
end


// now generate the TLAST output
always @(posedge axi_tclk)
begin
   if (axi_treset)
      tlast <= 0;
   else if ((byte_count == 12'd1) && tready)
      tlast <= 1;
   else if (tready)
      tlast <= 0;
end

assign tvalid = tvalid_int;




endmodule
