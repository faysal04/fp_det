module accumulator (
  input                clk_125  ,
  input                rst_n    ,
  input  logic         accumlate,
  input  logic [8-1:0] data_in  ,
  input  logic         error    ,
  input  logic         valid    ,
  output logic [8-1:0] data_out ,
  output logic         out_error,
  output logic         out_valid,
  output logic         wen
);

  logic counter    ;
  logic inter_error;
  logic inter_valid;
  logic allign     ;

  localparam FOUND   = 1'b1;
  localparam LOOKING = 1'b0;
  logic      state      ;

  always@(posedge clk_125, negedge rst_n)begin
    if(!rst_n)begin
      state <= LOOKING;
    end
    else begin
      if(allign)begin
        state <= FOUND;
      end
    end
  end

  always@(posedge clk_125, negedge rst_n)begin
    if(!rst_n)begin
      data_out    <= 0;
      wen         <= 0;
      counter     <= 0;
      inter_error <= 0;
      inter_valid <= 0;
    end
    else begin
      if(!accumlate && state == FOUND)begin
        if(counter == 0) begin
          counter       <= 1'b1;
          data_out[3:0] <= data_in[3:0];
          inter_error   <= error;
          inter_valid   <= valid;
          wen           <= 0;
          out_error     <= 0;
          out_valid     <= 0;
        end
        if(counter == 1) begin
          data_out[7:4] <= data_in[3:0];
          counter       <= 1'b0;
          wen           <= 1;
          out_valid     <= (inter_valid && valid);
          out_error     <= (inter_error || error);
        end
      end
      else if(!accumlate && state == LOOKING)begin
        counter <= 0;
      end
      else begin
        data_out  <= data_in;
        out_valid <= valid;
        out_error <= error;
        wen       <= 1'b1;
      end
    end
  end

  allignment inst_allignment (
    .clk     (clk_125),
    .rst_n   (rst_n  ),
    .rxd     (data_in[3:0]),
    .rx_er   (error  ),
    .detected(allign )
  );


endmodule : accumulator