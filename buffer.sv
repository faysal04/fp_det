module buffer (
  input  logic          clk     ,
  input  logic          rst_n   ,
  input  logic [ 8-1:0] data_in ,
  input  logic          rw      ,
  input  logic [11-1:0] addr    ,
  output logic [32-1:0] data_out
);

  logic [8-1:0] memory[2047:0];

  always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      data_out <= 0;
    end
    else begin
      if(rw) begin
        memory[addr] <= data_in;
      end
      else begin
        data_out <= {memory[addr],memory[addr+1],memory[addr+2], memory[addr+3]};
      end
    end
  end
  

endmodule : buffer

 