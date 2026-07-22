// NOTE: SFD is part of preamble in this case
`timescale 1ns/1ps

module allignment (
  input  logic         clk     ,
  input  logic         rst_n   ,
  input  logic         rx_er   ,
  input  logic [64-1:0] rxd     ,
  input  logic [8-1:0]  rxc    ,

  output  logic [64-1:0] rxd_out     ,
  output  logic [8-1:0]  rxc_out    ,
  output logic         detected,
  output logic         combine
);

  logic sof0; //Check if sof (0xFB) happens on lane 0
  logic sof4; //Check if sof (0xFB) happens on lane 4


  always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      rxd_out <= 64'h0707070707070707;
      rxc_out <= 8'hff;
    end
    else begin
        rxd_out <= rxd;
        rxc_out <= rxc;
    end
  end

  assign sof0 = (rxc[0] == 1 && rxd[7:0] == 8'hFB);
  assign sof4 = (rxc[4] == 1 && rxd[39:32] == 8'hFB);

  assign detected = sof0 || sof4; //Flag to determine if packet has arrived
  assign combine = sof4; //Flag to see if word allignment is required


endmodule