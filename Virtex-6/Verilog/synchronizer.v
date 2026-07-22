`timescale 1ns/1ps

module synchronizer #(parameter WIDTH = 1) (
    input  ref_clk,                   // Clock
    input  rst_n,                     // Asynchronous reset active low
    input  [WIDTH-1:0] async_in,
    output reg [WIDTH-1:0] sync_out
);

    reg [WIDTH-1:0] middle_reg;

    // First stage flip-flop
    always @(posedge ref_clk) begin
        if (!rst_n)
            middle_reg <= {WIDTH{1'b0}};
        else
            middle_reg <= async_in;
    end

    // Second stage flip-flop
    always @(posedge ref_clk) begin
        if (!rst_n)
            sync_out <= {WIDTH{1'b0}};
        else
            sync_out <= middle_reg;
    end

endmodule
