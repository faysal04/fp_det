`timescale 1ns/1ps

module synchronizer #(parameter WIDTH = 1) (
  input  logic             ref_clk , // Clock
  input  logic             rst_n   , // Asynchronous reset active low
  input  logic [WIDTH-1:0] async_in,
  output logic [WIDTH-1:0] sync_out
);

  logic [WIDTH-1:0] middle_reg;

  always@(posedge ref_clk) begin
    if(!rst_n)
      middle_reg <= 0;
    else
      middle_reg <= async_in;
  end

  always@(posedge ref_clk) begin
    if(!rst_n)
      sync_out <= 0;
    else
      sync_out <= middle_reg;
  end

endmodule