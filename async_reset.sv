module async_reset (
  input  logic clk  ,
  input  logic rst_n,
  input  logic d    ,
  output logic q
);


  always@(posedge clk, negedge rst_n) begin
    if(!rst_n)begin
      q <= 1'b0;
    end
    else begin
      q <= d;
    end

  end

endmodule : async_reset