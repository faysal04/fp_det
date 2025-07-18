module read_buffer (
  input  logic          clk_200     ,
  input  logic          rst_n       ,
  input  logic [ 8-1:0] rxd         ,
  input  logic          rx_dv       ,
  input  logic          rx_er       ,
  input  logic          empty       ,
  output logic [16-1:0] ip_id       ,
  output logic [32-1:0] ip_dst      ,
  output logic [16-1:0] tcp_src     ,
  output logic [16-1:0] tcp_dst     ,
  output logic [32-1:0] tcp_seq     ,
  output logic [32-1:0] tcp_ack     ,
  output logic [16-1:0] tcp_window  ,
  output logic          fields_valid
);

  logic [8-1:0] pipe_rxd  ;
  logic         pipe_rx_dv;
  logic         pipe_rx_er;
  logic         pipe_empty;
  always@(posedge clk_200)begin
    pipe_rxd   <= rxd;
    pipe_rx_dv <= rx_dv;
    pipe_rx_er <= rx_er;
    pipe_empty <= empty;
  end

  logic [8-1:0] pipe2_rxd  ;
  logic         pipe2_rx_dv;
  logic         pipe2_rx_er;
  logic         pipe2_empty;
  always@(posedge clk_200)begin
    pipe2_rxd   <= pipe_rxd;
    pipe2_rx_dv <= pipe_rx_dv;
    pipe2_rx_er <= pipe_rx_er;
    pipe2_empty <= pipe_empty;
  end

  logic [8-1:0] pipe3_rxd  ;
  logic         pipe3_rx_dv;
  logic         pipe3_rx_er;
  logic         pipe3_empty;
  always@(posedge clk_200)begin
    pipe3_rxd   <= pipe2_rxd;
    pipe3_rx_dv <= pipe2_rx_dv;
    pipe3_rx_er <= pipe2_rx_er;
    pipe3_empty <= pipe2_empty;
  end

  logic [8-1:0] pipe4_rxd  ;
  logic         pipe4_rx_dv;
  logic         pipe4_rx_er;
  logic         pipe4_empty;
  always@(posedge clk_200)begin
    pipe4_rxd   <= pipe3_rxd;
    pipe4_rx_dv <= pipe3_rx_dv;
    pipe4_rx_er <= pipe3_rx_er;
    pipe4_empty <= pipe3_empty;
  end

  logic detected;
  preamble_detector inst_preamble_detector (
    .clk     (clk_200   ),
    .rst_n   (rst_n     ),
    .rxd     (pipe_rxd  ),
    .rx_er   (pipe_rx_er),
    .empty   (pipe_empty),
    .detected(detected  )
  );

  logic pipe_detected;
  always@(posedge clk_200)begin
    pipe_detected <= detected;
  end

  localparam WAIT_PRE_1 = 2'b00;
  localparam WAIT_PKT_1 = 2'b01;
  localparam WAIT_PRE_2 = 2'b10;
  localparam WAIT_PKT_2 = 2'b11;

  logic [2-1:0] current_state;
  logic [2-1:0] next_state   ;

  always@(posedge clk_200, negedge rst_n)begin
    if(!rst_n)begin
      current_state <= WAIT_PRE_1;
    end
    else begin
      current_state <= next_state;
    end
  end

  // logic [11-1:0] buffer1_size;
  // logic [11-1:0] buffer2_size;
  logic [11-1:0] counter;

  // nsl
  always@(*) begin
    case(current_state)
      WAIT_PRE_1 : begin
        if((!pipe4_empty) && (pipe_detected)) begin
          next_state <= WAIT_PKT_1;
        end
        else begin
          next_state <= WAIT_PRE_1;
        end
      end

      WAIT_PKT_1 : begin
        if((!pipe4_empty) && (pipe4_rx_dv == 0))begin
          next_state <= WAIT_PRE_2;
        end
        else begin
          next_state <= WAIT_PKT_1;
        end
      end

      WAIT_PRE_2 : begin
        if((!pipe4_empty) && (pipe_detected)) begin
          next_state <= WAIT_PKT_2;
        end
        else begin
          next_state <= WAIT_PRE_2;
        end
      end

      WAIT_PKT_2 : begin
        if((!pipe4_empty) && (pipe4_rx_dv == 0))begin
          next_state <= WAIT_PRE_1;
        end
        else begin
          next_state <= WAIT_PKT_2;
        end
      end
    endcase
  end

  always@(posedge clk_200, negedge rst_n) begin
    if(!rst_n) begin
      counter <= 0;
    end
    else begin
      if(!pipe4_empty) begin
        if(current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)begin
          counter <= counter + 1'b1;
        end
        else if (current_state == WAIT_PRE_1 || current_state == WAIT_PRE_2) begin
          counter <= 0;
        end
      end
    end
  end

  // logic [8-1:0] buffer_1[2047:0];
  // logic [8-1:0] buffer_2[2047:0];

  logic [16-1:0] packet_type;
  logic [ 4-1:0] version    ;
  logic [ 4-1:0] ihl        ;
  logic [ 8-1:0] tcp_flags  ;
  logic [ 8-1:0] protocol   ;


  // always@(posedge clk_200) begin
  //   if(!pipe4_empty) begin
  //     if(current_state == WAIT_PKT_1)begin
  //       if(!pipe4_rx_er)
  //         buffer_1[counter] <= pipe4_rxd;
  //       else
  //         buffer_1[counter] <= 0;
  //     end
  //     else if(current_state == WAIT_PKT_2) begin
  //       if(!pipe4_rx_er)
  //         buffer_2[counter] <= pipe4_rxd;
  //       else
  //         buffer_2[counter] <= 0;
  //     end
  //   end
  // end

  logic [8-1:0] eth_header[14-1:0];
  logic [8-1:0] ip_header [20-1:0];
  logic [8-1:0] tcp_header[20-1:0];
  logic [8-1:0] eth_count         ;
  logic [8-1:0] ip_count          ;
  logic [8-1:0] tcp_count         ;

  always@(posedge clk_200, negedge rst_n) begin
    if(!rst_n)begin
      eth_count <= 0;
      ip_count  <= 0;
      tcp_count <= 0;
    end
    else begin
      if((!pipe4_empty) && (counter <= 13) && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
        tcp_count <= 0;
        ip_count  <= 0;
        eth_count <= eth_count + 1'b1;
        if(!pipe4_rx_er)
          eth_header[eth_count] <= pipe4_rxd;
        else
          eth_header[eth_count] <= 0;
      end
      else if( (!pipe4_empty) && (counter > 13) && (counter <= 33) && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
        ip_count  <= ip_count + 1'b1;
        eth_count <= 0;
        if(!pipe4_rx_er)
          ip_header[ip_count] <= pipe4_rxd;
        else
          ip_header[ip_count] <= 0;
      end
      else if((!pipe4_empty) && (counter > 33) && (counter <= 53) && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2))begin
        tcp_count <= tcp_count + 1'b1;
        if(!pipe4_rx_er)
          tcp_header[tcp_count] <= pipe4_rxd;
        else
          tcp_header[tcp_count] <= 0;
      end
      else if(!pipe4_empty) begin
        tcp_count <= 0;
        ip_count  <= 0;
        eth_count <= 0;
      end
    end
  end

  logic process_1        ;
  logic process_1_delayed;
  logic process_1_pulse  ;

  assign process_1 = (current_state == WAIT_PRE_2) || (current_state == WAIT_PKT_2) || (current_state == WAIT_PRE_1);

  always@(posedge clk_200)begin
    process_1_delayed <= process_1;
  end

  assign process_1_pulse = (process_1_delayed == 0) && (process_1 == 1);


  logic process_2        ;
  logic process_2_delayed;
  logic process_2_pulse  ;

  assign process_2 = (current_state == WAIT_PRE_1) || (current_state == WAIT_PKT_1) || (current_state == WAIT_PRE_2);

  always@(posedge clk_200)begin
    process_2_delayed <= process_2;
  end

  assign process_2_pulse = (process_2_delayed == 0) && (process_2 == 1);

  assign fields_valid = ((process_1_pulse || process_2_pulse) && (packet_type == 16'h0800 && version == 4 && ihl == 5 && protocol == 6 && tcp_flags[1] == 1));

  always@(posedge clk_200) begin
    packet_type    <= {eth_header[12],eth_header[13]};
    {version,ihl}  <= ip_header[0];
    ip_id          <= {ip_header[4],ip_header[5]};
    protocol       <= ip_header[9];
    ip_dst         <= {ip_header[16],ip_header[17],ip_header[18],ip_header[19]};
    tcp_src        <= {tcp_header[0],tcp_header[1]};
    tcp_dst        <= {tcp_header[2],tcp_header[3]};
    tcp_seq        <= {tcp_header[4],tcp_header[5],tcp_header[6],tcp_header[7]};
    tcp_ack        <= {tcp_header[8],tcp_header[9],tcp_header[10],tcp_header[11]};
    tcp_flags      <= {tcp_header[13]};
    tcp_window     <= {tcp_header[14],tcp_header[15]};
  end

endmodule : read_buffer