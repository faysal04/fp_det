`timescale 1ns/1ps

module MII_FIFO();
    localparam M_G = 0;
    logic clk;
    logic rx_clk;
    logic rst_n;
    logic sync_accumlate;
    logic async_accumlate;
    assign async_accumlate = M_G;
    logic sync_accum_reset;
    logic async_accum_reset;

    assign async_accum_reset = 1'b1;
    logic read_buffer_reset;
    logic link_speed_reset  = 1'b0;

    assign read_buffer_reset = rst_n;

    logic [7:0] rxd;
    logic rx_er;
    logic rx_dv;
    logic [7:0] data_out;
    logic out_error;
    logic out_valid;
    logic wen;
    // logic preamble;
    logic preamble_accum;
    logic accum_state_probe;
    logic full;
    logic [9:0] rdata;
    logic empty;
    // logic [4:0] accum_data_in_lsb_probe;
    logic [4:0] rbin_probe;
    logic [4:0] wbin_probe;
    logic [4:0] rbin_next_probe;
    logic [4:0] wbin_next_probe;
    logic [4:0] wq1_probe;
    logic [4:0] wq2_probe;
    logic [4:0] rgray_next_probe;
    logic [1:0] buffer_state_probe;
    logic crs;
    logic link_active;
    logic col;
    logic tx_clk;
    // Synchronizers
    synchronizer #(.WIDTH(1)) inst_synchronizer_speed (
        .ref_clk (rx_clk),
        .rst_n   (rst_n),
        .async_in(async_accumlate),
        .sync_out(sync_accumlate)
    );

    synchronizer #(.WIDTH(1)) inst_synchronizer_accum (
        .ref_clk (rx_clk),
        .rst_n   (rst_n),
        .async_in(async_accum_reset),
        .sync_out(sync_accum_reset)
    );

    accumulator inst_accumulator (
        .clk_125  (rx_clk),
        .rst_n    (sync_accum_reset),
        .accumlate(sync_accumlate),
        .data_in  (rxd),
        .error    (rx_er),
        .valid    (rx_dv),
        .data_out (data_out),
        .out_error(out_error),
        .out_valid(out_valid),
        .wen      (wen),
        // .preamble(preamble),
        .extern_preamble(preamble_accum),
        .state_probe(accum_state_probe),
        .data_in_lsb_probe(accum_data_in_lsb_probe)
    );

    wire i_rd;
    // Async FIFO
    logic [10:0] write_probe; 
    async_fifo #(.DSIZE(10), .ASIZE(4)) inst_async_fifo (
        .i_wclk  (rx_clk),
        .i_wrst_n(sync_accum_reset),
        .i_wr    (wen),
        .i_wdata ({out_error, out_valid, data_out}),
        .o_wfull (full),
        .i_rclk  (clk),
        .i_rrst_n(read_buffer_reset),
        .i_rd    (1'b1),
        .o_rdata (rdata),
        .o_rempty(empty),
        .speed(sync_accumlate),
        .rbin_probe(rbin_probe),
        .wbin_probe(wbin_probe),
        .rbin_next_probe(rbin_next_probe),
        .wbin_next_probe(wbin_next_probe),
        .wq1_probe(wq1_probe),
        .wq2_probe(wq2_probe),
        .rgray_next_probe(rgray_next_probe),
        .write_probe(write_probe)
    );

    logic [15:0] ip_id;
    logic [31:0] ip_dst;
    logic [31:0] ip_src;
    logic [15:0] tcp_src;
    logic [15:0] tcp_dst;
    logic [31:0] tcp_ack;
    logic [31:0] tcp_seq;
    logic [15:0] tcp_window;
    logic fields_valid;
    logic [431:0] packet;
    logic [7:0] pipe_rxd;
    logic [10:0] counter_probe;

    read_buffer inst_read_buffer (
    .clk         (clk),
    .rst_n       (read_buffer_reset),
    .rxd         (rdata[7:0]),
    .rx_dv       (rdata[8]),
    .rx_er       (rdata[9]),
    .empty       (empty),
    .ip_id       (ip_id),
    .ip_dst      (ip_dst),
    .ip_src      (ip_src),
    .tcp_src     (tcp_src),
    .tcp_dst     (tcp_dst),
    .tcp_seq     (tcp_seq),
    .tcp_ack     (tcp_ack),
    .tcp_window  (tcp_window),
    .fields_valid(fields_valid),
    .extern_preamble(preamble_accum),
    .state_probe(buffer_state_probe),
    .packet(packet),
    .buffer_probe(pipe_rxd),
    .counter_probe(counter_probe)
    // .eth_header_probe(eth_header_probe),
    // .tcp_header_probe(tcp_header_probe),
    // ip_header_probe(ip_header_probe)
    );

     initial rx_clk = 0;
  always begin
    if (M_G) #4 rx_clk = ~rx_clk;
    else #20 rx_clk = ~rx_clk;
  end
    // clk  = 200Mhz
    initial clk = 0;
  always #2.5 clk = ~clk;

  task automatic send_data(input [8-1:0] data);
    rxd=data; 
    @(posedge rx_clk);
endtask 

  task automatic send_data_nibble(input [8-1:0] data);
    rxd={4'h00, data[3:0]};
    @(posedge rx_clk);
    rxd={4'h00, data[7:4]};  
    @(posedge rx_clk);
endtask 
// task to send packet for fp_gen0
// in gen_fp_0 we should have same values for IP-dst and TCP_seq
task send_fp_0_pkt();
    
    $display("--- Test: Sending Valid TCP-ACK Packet with IP_DST == TCP_SEQ to detect FP ---");
    crs = '1; // crs asserted as line is busy
    //data is valid hence assert the dv
    rx_dv = '1;

    //  Preamble (8 bytes) + SFD (1 byte) ---
    for (int i = 0; i < 7; i++) begin
      send_data(8'h55);
    end
    send_data(8'hD5);
    $display("Time %t: Preamble and SFD sent.", $time);

    // ----------------------------------------------------------------------
    //  Ethernet Header (14 bytes) - 
    // ----------------------------------------------------------------------
    // DA (6 bytes, Broadcast)
    for (int i = 0; i < 6; i++) send_data(8'hFF); 
    // SA (6 bytes)
    send_data(8'h00); send_data(8'h0A); send_data(8'hB5); 
    send_data(8'hCC); send_data(8'hDD); send_data(8'hEE);
    // ethertype (2 bytes) - Byte Index 21, 22
    send_data(8'h08); // eth_header[12] -> MSB
    send_data(8'h00); // eth_header[13] -> LSB (packet_type == 0x0800)

    // ----------------------------------------------------------------------
    //  IP Header (20 bytes) - Byte Indices 23 to 42
    // ----------------------------------------------------------------------
    // byte 23: Version (4) & IHL (5) -> 0x45 (version=4, ihl=5)
    send_data(8'h45); 
    // DSCP (1 byte)
    send_data(8'h00); 
    // Total Length (2 bytes)
    send_data(8'h00); send_data(8'h54); 
    // ID (2 bytes)
    send_data(8'h12); send_data(8'h34); 
    // Flags/Offset (3 bytes)
    send_data(8'h40); send_data(8'h00); send_data(8'h00);
    // Byte 32: Protocol (6 -> TCP)
    send_data(8'h06); // protocol == 6
    // Checksum (2 bytes)
    send_data(8'hAB); send_data(8'hCD); 
    // Source IP (4 bytes)
    send_data(8'h10); send_data(8'h01); send_data(8'h01); send_data(8'h01);
    // Destination IP (4 bytes) - Indices 39 to 42
    send_data(8'hC0); // ip_header[16]
    send_data(8'hA8); // ip_header[17]
    send_data(8'h01); // ip_header[18]
    send_data(8'h01); // ip_header[19] (ip_dst <= 0xC0A80101)

    // ----------------------------------------------------------------------
    // TCP Header (20 bytes) - Byte Indices 43 to 62
    // ----------------------------------------------------------------------
    // Source Port (2 bytes)
    send_data(8'hC3); send_data(8'h50); 
    // Destination Port (2 bytes)
    send_data(8'h13); send_data(8'h88);
    // Sequence Number (4 bytes) - Indices 47 to 50
    send_data(8'hC0); // tcp_header[4]
    send_data(8'hA8); // tcp_header[5]
    send_data(8'h01); // tcp_header[6]
    send_data(8'h01); // tcp_header[7] (tcp_seq <= 0xC0A80101)
    // Acknowledgment Number (4 bytes)
    send_data(8'h00); send_data(8'h00); send_data(8'h00); send_data(8'h01);
    // Data Offset/Reserved (1 byte)
    send_data(8'h50);
    // Byte 56: Flags (1 byte) - syn bit (tcp_flags[1]) must be 1. 0x02 = ACK flag set.
    send_data(8'h02); 
    // Window (2 bytes)
    send_data(8'hFA); send_data(8'hF0);
    // Checksum (2 bytes)
    send_data(8'hAB); send_data(8'hCD);
    // Urgent Pointer (2 bytes)
    send_data(8'h00); send_data(8'h00);

    // ----------------------------------------------------------------------
    //  Check Output and Finalize
    // ----------------------------------------------------------------------
    $display("Time %t: Packet data transmission complete (62 bytes).", $time);
    
    // Check the fields_valid signal after a sufficient delay for the pipeline
    send_data(8'h00); // 1 extra cycle
    send_data(8'h00); // 2 extra cycles
    send_data(8'h00);
    send_data(8'h00);
    send_data(8'h00);
    
    @(posedge rx_clk);
    // end of packet hence crs should be deasserted and valid too
    crs = '0;
    rx_dv = '0;
    send_data(8'h00);
    // Clear valid signal after check
    @(posedge rx_clk);
    $display("Time %t: Finished valid packet test.", $time);

endtask

task send_fp_0_pkt_nibble();
    
    $display("--- Test: Sending Valid TCP-ACK Packet with IP_DST == TCP_SEQ to detect FP ---");
    crs = '1; // crs asserted as line is busy
    //data is valid hence assert the dv
    rx_dv = '1;

    //  Preamble (8 bytes) + SFD (1 byte) ---
    for (int i = 0; i < 7; i++) begin
      send_data_nibble(8'h55);
    end
    send_data_nibble(8'hD5);
    $display("Time %t: Preamble and SFD sent.", $time);

    // ----------------------------------------------------------------------
    //  Ethernet Header (14 bytes) - 
    // ----------------------------------------------------------------------
    // DA (6 bytes, Broadcast)
    for (int i = 0; i < 6; i++) send_data_nibble(8'hFF); 
    // SA (6 bytes)
    send_data_nibble(8'h00); send_data_nibble(8'h0A); send_data_nibble(8'hB5); 
    send_data_nibble(8'hCC); send_data_nibble(8'hDD); send_data_nibble(8'hEE);
    // ethertype (2 bytes) - Byte Index 21, 22
    send_data_nibble(8'h08); // eth_header[12] -> MSB
    send_data_nibble(8'h00); // eth_header[13] -> LSB (packet_type == 0x0800)

    // ----------------------------------------------------------------------
    //  IP Header (20 bytes) - Byte Indices 23 to 42
    // ----------------------------------------------------------------------
    // byte 23: Version (4) & IHL (5) -> 0x45 (version=4, ihl=5)
    send_data_nibble(8'h45); 
    // DSCP (1 byte)
    send_data_nibble(8'h00); 
    // Total Length (2 bytes)
    send_data_nibble(8'h00); send_data_nibble(8'h54); 
    // ID (2 bytes)
    send_data_nibble(8'h12); send_data_nibble(8'h34); 
    // Flags/Offset (3 bytes)
    send_data_nibble(8'h40); send_data_nibble(8'h00); send_data_nibble(8'h00);
    // Byte 32: Protocol (6 -> TCP)
    send_data_nibble(8'h06); // protocol == 6
    // Checksum (2 bytes)
    send_data_nibble(8'hAB); send_data_nibble(8'hCD); //Start
    // Source IP (4 bytes)
    send_data_nibble(8'h10); send_data_nibble(8'h01); send_data_nibble(8'h01); send_data_nibble(8'h01);
    // Destination IP (4 bytes) - Indices 39 to 42
    send_data_nibble(8'hC0); // ip_header[16]
    send_data_nibble(8'hA8); // ip_header[17]
    send_data_nibble(8'h01); // ip_header[18]
    send_data_nibble(8'h01); // ip_header[19] (ip_dst <= 0xC0A80101)

    // ----------------------------------------------------------------------
    // TCP Header (20 bytes) - Byte Indices 43 to 62
    // ----------------------------------------------------------------------
    // Source Port (2 bytes)
    send_data_nibble(8'hC3); send_data_nibble(8'h50); 
    // Destination Port (2 bytes)
    send_data_nibble(8'h13); send_data_nibble(8'h88);
    // Sequence Number (4 bytes) - Indices 47 to 50
    send_data_nibble(8'hC0); // tcp_header[4]
    send_data_nibble(8'hA8); // tcp_header[5]
    send_data_nibble(8'h01); // tcp_header[6]
    send_data_nibble(8'h01); // tcp_header[7] (tcp_seq <= 0xC0A80101)
    // Acknowledgment Number (4 bytes)
    send_data_nibble(8'h00); send_data_nibble(8'h00); send_data_nibble(8'h00); send_data_nibble(8'h01);
    // Data Offset/Reserved (1 byte)
    send_data_nibble(8'h50);
    // Byte 56: Flags (1 byte) - syn bit (tcp_flags[1]) must be 1. 0x02 = ACK flag set.
    send_data_nibble(8'h02); 
    // Window (2 bytes)
    send_data_nibble(8'hFA); send_data_nibble(8'hF0);
    // Checksum (2 bytes)
    send_data_nibble(8'hAB); send_data_nibble(8'hCD);
    // Urgent Pointer (2 bytes)
    send_data_nibble(8'h00); send_data_nibble(8'h00);

    // ----------------------------------------------------------------------
    //  Check Output and Finalize
    // ----------------------------------------------------------------------
    $display("Time %t: Packet data transmission complete (62 bytes).", $time);
    
    // Check the fields_valid signal after a sufficient delay for the pipeline
    send_data_nibble(8'h00); // 1 extra cycle
    send_data_nibble(8'h00); // 2 extra cycles
    send_data_nibble(8'h00);
    send_data_nibble(8'h00);
    send_data_nibble(8'h00);
    
    @(posedge rx_clk);
    // end of packet hence crs should be deasserted and valid too
    crs = '0;
    rx_dv = '0;
    send_data(8'h00);
    // Clear valid signal after check
    @(posedge rx_clk);
    $display("Time %t: Finished valid packet test.", $time);

endtask

initial begin
    rst_n = 0;
    crs = 0; // as the line is not busy
    col = 0;
    rx_er = '0;
    rx_dv = '0;
    rxd = '0;
    tx_clk = 0;
    link_active ='0;


    @(posedge rx_clk);
    rst_n = 1;
    col = '0; // collision
    link_active = '1;
    
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    if (M_G)    send_fp_0_pkt();
    else send_fp_0_pkt_nibble(); 
    
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);
    @(posedge rx_clk);

    // @(posedge rx_clk);
    // send_fp_0_pkt_nibble();
    // // send_fp_0_pkt(); 
    // @(posedge rx_clk);
    // @(posedge rx_clk);
    // @(posedge rx_clk);
    // @(posedge rx_clk);
    // @(posedge rx_clk);
    // @(posedge rx_clk);
    // @(posedge rx_clk);

   #100;
   $stop;
end

endmodule