module waddr_gen (
  input  logic          clk     ,
  input  logic          rst_n   ,
  input  logic          enable  ,
  input  logic          empty   ,
  output logic [11-1:0] address ,
  output logic          overflow
);


  always@(posedge clk, negedge rst_n) begin
    if(!rst_n || !enable) begin
      address  <= 0;
      overflow <= 0;
    end
    else begin
      address <= address + 1;
      if(address == 2047) begin
        overflow <= 1;
      end
    end
  end

endmodule