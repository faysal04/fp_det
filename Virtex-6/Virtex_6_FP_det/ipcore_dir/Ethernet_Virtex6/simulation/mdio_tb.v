//------------------------------------------------------------------------------
// Title      : MDIO testbench
// Project    : Xilinx LogiCORE Virtex-6 Embedded Tri-Mode Ethernet MAC
// File       : mdio_tb.v
// Version    : 2.3
//-----------------------------------------------------------------------------
//
// (c) Copyright 2004-2008 Xilinx, Inc. All rights reserved.
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
// Description: This testbench will respond to MDIO reads with all 1's to indicate
// no PHY is present (this limits the number fo MDIO accesses performed by the example design)
//------------------------------------------------------------------------------
`timescale 1ps / 1ps

module mdio_tb (
   input             resetn,
   inout             mdio,
   input             mdc,
   output reg        mdio_done
);

  reg  [5:0]  mdio_count;
  reg         last_mdio;
  reg         mdio_read;
  reg         mdio_addr;
  reg         mdio_fail;

  //----------------------------------------------------------------------------
  // Simulate the MDIO -
  // respond with sensible data to mdio reads and accept writes
  //----------------------------------------------------------------------------
  // expect mdio to try and read from reg addr 1 - return all 1's if we don't
  // want any other mdio accesses
  // if any other response then mdio will write to reg_addr 9 then 4 then 0
  // (may check for expected write data?)
  // finally mdio read from reg addr 1 until bit 5 is seen high
  // NOTE - do not check any other bits so could drive all high again..


  // count through the mdio transfer
  always @(posedge mdc or negedge resetn)
  begin
     if (!resetn) begin
        mdio_done    <= 0;
        mdio_count   <= 0;
        last_mdio    <= 1'b1;
     end
     else begin
        last_mdio <= mdio;
        mdio_done <= 0;
        if (mdio_count >= 32) begin
           mdio_count <= 0;
           mdio_done  <= 1;
        end
        else if (mdio_count != 0) begin
           mdio_count <= mdio_count + 1;
        end
        else begin // only get here if mdio state is 0 - now look for a start
           if ((mdio === 1'b1) && (last_mdio === 1'b0))
              mdio_count <= 1;
        end
     end
  end

  assign mdio = (mdio_read & (mdio_count >= 14) & (mdio_count <= 31)) ? 1'b1 : 1'bz;

  // only respond to phy addr 7 and reg address == 1 (PHY_STATUS)
  always @(posedge mdc or negedge resetn)
  begin
     if (!resetn) begin
        mdio_read <= 1'b0;
        mdio_addr <= 1'b1; // this will go low if the address doesn't match required
        mdio_fail <= 1'b0;
     end
     else
     begin
        if (mdio_count == 2) begin
           mdio_addr <= 1'b1;    // new access so address needs to be revalidated
           if ({last_mdio,mdio} === 2'b10)
              mdio_read <= 1'b1;
           else // take a write as a default as won't drive at the wrong time
              mdio_read <= 1'b0;
        end
        else if ((mdio_count <= 12)) begin
           // check address is phy addr/reg addr are correct
           if (mdio_count <= 7 & mdio_count >= 5) begin
              if (mdio !== 1'b1)
                 mdio_addr <= 1'b0;
           end
           else begin
              if (mdio !== 1'b0)
                 mdio_addr <= 1'b0;
           end
        end
        else if ((mdio_count == 14)) begin
           if (!mdio_read & (mdio | !last_mdio)) begin
              $display("FAIL : Write TA phase is incorrect at %t ps", $time);
           end
        end
        else if ((mdio_count >= 15) & (mdio_count <= 30) & mdio_addr) begin
           if (!mdio_read) begin
              if (mdio_count == 20) begin
                 if (mdio) begin
                    mdio_fail <= 1;
                    $display("FAIL : Expected bit 10 of mdio write data to be 0 at %t ps", $time);
                 end
              end
              else begin
                 if (!mdio) begin
                    mdio_fail <= 1;
                    $display("FAIL : Expected all except bit 10 of mdio write data to be 1 at %t ps", $time);
                 end
              end
           end
        end
     end
  end

endmodule
