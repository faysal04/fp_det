module link_speed_detector (
  input  logic clk_200,
  input  logic clk_det,
  input  logic rst_n  ,
  output logic speed  ,
  output logic ready
);

  logic [32-1:0] ref_counter;
  logic [32-1:0] det_counter;
  logic [32-1:0] syn_counter;
  logic [32-1:0] syn_counter_q;
  logic          async_reset;
  logic          sync_reset ;

  logic condition1;
  logic condition2;
  logic condition3;
  logic condition4;
  always @(posedge clk_200) begin
    if(syn_counter_q > 39999)
		condition1 <= 1'b1;
    else
	   condition1 <= 1'b0;
  end

  always @(posedge clk_200)begin
    if(syn_counter_q <= 10000 && syn_counter_q >= 7000)
	   condition2 <= 1'b1;
	 else
	   condition2 <= 1'b0;
  end

  always @(posedge clk_200) begin
    if(syn_counter_q <= 1000 && syn_counter_q >= 700)
	   condition3 <= 1'b1;
	 else
	   condition3 <= 1'b0;
  end

  always @(posedge clk_200)begin
    if(ref_counter > 16'hFFFD)
	   condition4 <= 1'b1;
	 else
	   condition4 <= 1'b0;
  end

  always @(posedge clk_200, negedge rst_n) begin
    if(!rst_n) begin
      async_reset <= 1'b0;
      ref_counter <= 0;
      speed       <= 1'b0;
      ready       <= 1'b0;
    end
    else begin
      if(ready == 0) begin
        async_reset <= 1'b1;
        ref_counter <= ref_counter + 1'b1;
        if(condition4) begin
          if(condition1) begin
            speed <= 1'b1;
            ready <= 1'b1;
          end
          else if (condition2 || condition3 ) begin
            speed <= 1'b0;
            ready <= 1'b1;
          end
          else begin
            ref_counter <= 0;
            async_reset <= 1'b0;
          end
        end
      end
    end
  end

  always@(posedge clk_det, negedge sync_reset) begin
    if(!sync_reset) begin
      det_counter <= 0;
    end
    else begin
      det_counter <= det_counter + 1'b1;
    end
  end

  synchronizer #(.WIDTH(1)) inst_synchronizer_reset (
    .ref_clk (clk_det    ),
    .rst_n   (rst_n      ),
    .async_in(async_reset),
    .sync_out(sync_reset )
  );


  synchronizer #(.WIDTH(32)) inst_synchronizer_counter (
    .ref_clk (clk_200    ),
    .rst_n   (rst_n      ),
    .async_in(det_counter),
    .sync_out(syn_counter)
  );

  always@(posedge clk_200)begin
    syn_counter_q <= syn_counter;
  end

endmodule : link_speed_detector