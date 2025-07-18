module mac (
  // gmii/mii rx channel
  input  logic         rx_er      ,
  input  logic         rx_dv      ,
  input  logic [8-1:0] rxd        ,
  input  logic         rx_clk     ,
  // gmii/mii control signals
  input  logic         crs        ,
  input  logic         col        ,
  // gmii/mii tx channel
  input  logic         tx_clk     ,
  output logic         tx_er      ,
  output logic         tx_en      ,
  output logic [8-1:0] txd        ,
  // mac control signals
  input  logic         clk        ,
  input  logic         rst_n      ,
  input  logic         link_active,

  // outputs of header fields
  output logic [16-1:0] ip_id       ,
  output logic [32-1:0] ip_dst      ,
  output logic [16-1:0] tcp_src     ,
  output logic [16-1:0] tcp_dst     ,
  output logic [32-1:0] tcp_ack     ,
  output logic [32-1:0] tcp_seq     ,
  output logic [16-1:0] tcp_window  ,
  output logic          fields_valid
);

  assign tx_er = 1'b0;
  assign tx_en = 1'b0;
  assign txd   = 8'b0;

  logic [ 8-1:0] data_out       ;
  logic          out_error      ;
  logic          out_valid      ;
  logic          async_accumlate;
  logic          sync_accumlate ;
  logic          wen            ;
  logic          full           ;
  logic          empty          ;
  logic [10-1:0] rdata          ;
  logic          speed          ;
  logic          ready          ;

  localparam WAIT_LINK   = 0;
  localparam CHECK_SPEED = 1;
  localparam ENABLE      = 2;

  logic [3-1:0] state;
  always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      state <= WAIT_LINK;
    end
    else begin
      if(state == WAIT_LINK && link_active == 1'b1)begin
        state <= CHECK_SPEED;
      end
      else if(state == CHECK_SPEED && link_active == 1'b0)begin
        state <= WAIT_LINK;
      end
      else if(state == CHECK_SPEED && ready == 1'b1) begin
        state <= ENABLE;
      end
      else if(state == ENABLE && link_active == 1'b0)begin
        state <= WAIT_LINK;
      end
    end
  end

  logic link_speed_reset ;
  logic async_accum_reset;
  logic sync_accum_reset ;
  logic read_buffer_reset;

  always@(posedge clk) begin
    if(state == WAIT_LINK) begin
      link_speed_reset  <= 1'b0;
      async_accum_reset <= 1'b0;
      async_accumlate   <= 1'b0;
      read_buffer_reset <= 1'b0;
    end
    else if(state == CHECK_SPEED) begin
      link_speed_reset <= 1'b1;
      if(speed == 1)
        async_accumlate <= 1'b1;
      else
        async_accumlate <= 1'b0;
    end
    else if(state == ENABLE) begin
      async_accum_reset <= 1'b1;
      read_buffer_reset <= 1'b1;
      link_speed_reset  <= 1'b0;
    end
  end

  synchronizer #(.WIDTH(1)) inst_synchronizer_speed (
    .ref_clk (rx_clk         ),
    .rst_n   (rst_n          ),
    .async_in(async_accumlate),
    .sync_out(sync_accumlate )
  );

  synchronizer #(.WIDTH(1)) inst_synchronizer_accum (
    .ref_clk (rx_clk           ),
    .rst_n   (rst_n            ),
    .async_in(async_accum_reset),
    .sync_out(sync_accum_reset )
  );

  link_speed_detector inst_link_speed_detector (
    .clk_200(clk             ),
    .clk_det(rx_clk          ),
    .rst_n  (link_speed_reset),
    .speed  (speed           ),
    .ready  (ready           )
  );

  accumulator inst_accumulator (
    .clk_125  (rx_clk          ),
    .rst_n    (sync_accum_reset),
    .accumlate(sync_accumlate  ),
    .data_in  (rxd             ),
    .error    (rx_er           ),
    .valid    (rx_dv           ),
    .data_out (data_out        ),
    .out_error(out_error       ),
    .out_valid(out_valid       ),
    .wen      (wen             )
  );

  async_fifo #(
    .DSIZE(10),
    .ASIZE(4 )
  ) inst_async_fifo (
    .i_wclk  (rx_clk                        ),
    .i_wrst_n(sync_accum_reset              ),
    .i_wr    (wen                           ),
    .i_wdata ({out_error,out_valid,data_out}),
    .o_wfull (full                          ),
    .i_rclk  (clk                           ),
    .i_rrst_n(read_buffer_reset             ),
    .i_rd    (1'b1                          ),
    .o_rdata (rdata                         ),
    .o_rempty(empty                         )
  );



  logic f0, f1, f2, f3, f4, f5, f6, f7;
  assign f0 = rdata[7];
  assign f1 = rdata[6];
  assign f2 = rdata[5];
  assign f3 = rdata[4];
  assign f4 = rdata[3];
  assign f5 = rdata[2];
  assign f6 = rdata[1];
  assign f7 = rdata[0];

  read_buffer inst_read_buffer (
    .clk_200     (clk                             ),
    .rst_n       (read_buffer_reset               ),
    .rxd         ({f7, f6, f5, f4, f3, f2, f1, f0}),
    .rx_dv       (rdata[8]                        ),
    .rx_er       (rdata[9]                        ),
    .empty       (empty                           ),
    .ip_id       (ip_id                           ),
    .ip_dst      (ip_dst                          ),
    .tcp_src     (tcp_src                         ),
    .tcp_dst     (tcp_dst                         ),
    .tcp_seq     (tcp_seq                         ),
    .tcp_ack     (tcp_ack                         ),
    .tcp_window  (tcp_window                      ),
    .fields_valid(fields_valid                    )
  );

endmodule : mac