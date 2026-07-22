`timescale 1ns/1ps

module top_tb();

  logic          rx_er      ;
  logic          rx_dv      ;
  logic [64-1:0] rxd        ;
  logic [8-1:0]  rxc        ;
  logic          rx_clk     ;
  // gmii/mii control signals
  logic          crs        ;
  logic          col        ;
  // gmii/mii tx channel
  logic          tx_clk     ;
  logic          tx_er      ;
  logic          tx_en      ;
  logic [ 64-1:0] txd        ;
  // mac control signals
  logic          clk        ;
  logic          rst_n      ;
  logic          link_active;
  // fp detector signals
  logic [16-1:0] fp_num0    ;
  logic [16-1:0] fp_num1    ;
  logic [16-1:0] fp_num2    ;
  logic [16-1:0] fp_num3    ;
  logic [16-1:0] fp_num4    ;
  logic [16-1:0] fp_num5    ;
  logic [16-1:0] fp_num6    ;
  logic [16-1:0] fp_num7    ;
  logic [16-1:0] fp_num8    ;
  logic [16-1:0] fp_num9    ;
  logic [16-1:0] fp_num10   ;
  logic [16-1:0] fp_num11   ;
  logic [16-1:0] fp_num12   ;
  logic [16-1:0] fp_num13   ;
  logic [16-1:0] fp_num14   ;
  logic [16-1:0] fp_num15   ;
  logic [16-1:0] fp_num16   ;
  logic [16-1:0] fp_num17   ;
  logic          fp_det     ;

  // for debugging
  logic [16-1:0] ip_id     ;
  logic [32-1:0] ip_dst    ;
  logic [32-1:0] ip_src    ;
  logic [16-1:0] tcp_sport ;
  logic [16-1:0] tcp_dport ;
  logic [32-1:0] tcp_ack   ;
  logic [32-1:0] tcp_seq   ;
  logic [16-1:0] tcp_window;
  logic          valid     ;
  logic [15:0] packet_type ;
  logic [3:0]  version     ; 
  logic [3:0]  ihl         ;
  logic [7:0]  tcp_flags   ; 
  logic [7:0]  protocol    ;
  logic ready;
  logic speed;
  logic terminate_send;
  // logic [7:0] rdata_probe;
  // logic accum_state_probe;
  // logic [3:0] accum_data_in_lsb_probe;
  logic [511:0] packet;
  // logic [4:0] rbin_probe;
  // logic [4:0] wbin_probe;
  // logic [4:0] rbin_next_probe;
  // logic [4:0] wbin_next_probe;
  // logic [4:0] wq1_probe;
  // logic [4:0] wq2_probe;
  // logic [4:0] rgray_next_probe;
  // logic [1:0] buffer_state_probe;
  // logic [10:0] counter_probe;
  // logic [7:0] buffer_probe;

  logic [63:0] data_send;
  logic [511:0] packet_test;

  logic sof4;
  localparam [63:0] idle1 = 64'h0707070707070707;
  localparam [7:0] control_idle1 = 8'hff;

  localparam [63:0] sof1 = 64'hD5555555555555FB;
  localparam [7:0] control_sof1 = 8'h01;

  localparam [63:0] sof2 = 64'h555555fb07070707;
  localparam [7:0] control_sof2 = 8'h1f;

  localparam [63:0] sof3 = 64'hccccccccd5555555;
  localparam [7:0] control_sof3 = 8'h00;

  localparam [63:0] data_test1 = 64'hffffffffffffffff;
  localparam [7:0] control_test1 = 8'h00; 

  localparam [63:0] data_test2 = 64'h44444444ffffffff;
  localparam [7:0] control_test2 = 8'h00;

  localparam [63:0] err1 = 64'hfffffffffffeffff;
  localparam [7:0] control_err = 8'h04;
  logic error_send;

// DUT INSTANTIATION

top top_dut (
  .rx_dv(rx_dv)            ,
  .rxd(rxd)                ,
  .rxc(rxc)                ,
  .rx_clk(rx_clk)          ,
  .crs(crs)                ,
  .col(col)                ,
  .tx_clk(tx_clk)          ,
  .tx_er(tx_er)            ,
  .tx_en(tx_en)            ,
  .txd(txd)                ,
  .clk(clk)                ,
  .rst_n(rst_n)            ,
  .link_active(link_active),

  .fp_num0(fp_num0)        ,
  .fp_num1(fp_num1)        ,
  .fp_num2(fp_num2)        ,
  .fp_num3(fp_num3)        ,
  .fp_num4(fp_num4)        ,
  .fp_num5(fp_num5)        ,
  .fp_num6(fp_num6)        ,
  .fp_num7(fp_num7)        ,
  .fp_num8(fp_num8)        ,
  .fp_num9(fp_num9)        ,
  .fp_num10(fp_num10)      ,
  .fp_num11(fp_num11)      ,
  .fp_num12(fp_num12)      ,
  .fp_num13(fp_num13)      ,
  .fp_num14(fp_num14)      ,
  .fp_num15(fp_num15)      ,
  .fp_num16(fp_num16)      ,
  .fp_num17(fp_num17)      ,

  .ip_id(ip_id)            ,
  .ip_dst(ip_dst)          ,
  .ip_src(ip_src)          ,
  .tcp_sport(tcp_sport)    ,
  .tcp_dport(tcp_dport)    ,
  .tcp_ack(tcp_ack)        ,
  .tcp_seq(tcp_seq)        ,
  .tcp_window(tcp_window)  ,
  .valid(valid)            ,
  .tcp_flags(tcp_flags)    ,
  .ihl(ihl)                ,
  .version(version)        ,
  .protocol(protocol)      ,
  .packet_type(packet_type),
  .fp_det(fp_det)          ,
  .packet(packet)
  );

  // rx clk = 156.25Mhz
  initial rx_clk = 0;
  always #3.2 rx_clk = ~rx_clk;

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

  task automatic send_data_64bit(input [64-1:0] data);
    rxd = data;
    @(posedge rx_clk);
  endtask

  task send_ethernet_packet_proper();
  
    reg [7:0] eth_header [0:13];
    reg [7:0] ip_header  [0:19];
    reg [7:0] tcp_header [0:19];

    //----------------------------------------------------------------
    //                      Ethernet Header
    //                    (Byte Index 0 -> 13)
    //----------------------------------------------------------------

    //DA (Byte Index 0 -> 5)
    for (int i = 0; i < 6; i++) eth_header[i] = 8'hFF; 

    // SA (Byte Index 6 -> 11)
    eth_header[6] = 8'h00;
    eth_header[7] = 8'h0A;
    eth_header[8] = 8'hB5;
    eth_header[9] = 8'hCC;
    eth_header[10] = 8'hDD;
    eth_header[11] = 8'hEE;

    //Ethertype (Byte Index 12, 13) (packet_type) Should be 0x0800
    eth_header[12] = 8'h08;
    eth_header[13] = 8'h00;

    //---------------------------------------------------------------
    //                          IP header
    //                     (Byte Index 14 -> 33)
    //----------------------------------------------------------------
    //IPv4 (4) and IHL (5) (Byte Index 14)
    ip_header[0] = 8'h45;

    //DSCP (Byte Index 15)
    ip_header[1] = 8'h00;

    //Packet Length (Byte Index 16, 17)
    ip_header[2] = 8'h00;
    ip_header[3] = 8'h45;

    //IP ID (Byte Index 18, 19)
    ip_header[4] = 8'h12;
    ip_header[5] = 8'h34;

    //Flags/Offset (Byte Index 20, 21, 22)
    ip_header[6] = 8'h40;
    ip_header[7] = 8'h00;
    ip_header[8] = 8'h00;

    //TCP Protocol (6) (Byte Index 23)
    ip_header[9] = 8'h06;

    //Checksum (Byte Index 24, 25)
    ip_header[10] = 8'hAB;
    ip_header[11] = 8'hCD;

    // Source IP (Byte Index 26, 27, 28, 29) -> ip_src = 0x10010101
    ip_header[12] = 8'h10;
    ip_header[13] = 8'h01;
    ip_header[14] = 8'h01;
    ip_header[15] = 8'h01;

    // Destination IP (Byte Index 30, 31, 32, 33) -> ip_dst = 0xC0A80101
    ip_header[16] = 8'hC0;
    ip_header[17] = 8'hA8;
    ip_header[18] = 8'h01;
    ip_header[19] = 8'h01;

    //---------------------------------------------------------------------
    //                         TCP Header
    //                     (Byte Index 34 -> 53)
    //---------------------------------------------------------------------

    //Source Port (Byte Index 34, 35) sport = C350
    tcp_header[0] = 8'hC3 ;
    tcp_header[1] = 8'h50;

    // Destination Port (Byte Index 36, 37) dport = 1388
    tcp_header[2] = 8'h13;
    tcp_header[3] = 8'h88;

    // Sequence Number (Byte Index 38, 39, 40, 41) seq_num = C0A80101
    tcp_header[4] = 8'hC0;
    tcp_header[5] = 8'hA8;
    tcp_header[6] = 8'h01;
    tcp_header[7] = 8'h01;

    // Acknowledgment Number (Byte Index 42, 43, 44, 45)
    tcp_header[8] = 8'h00;
    tcp_header[9] = 8'h00;
    tcp_header[10] = 8'h00;
    tcp_header[11] = 8'h01;

    // Data Offset/Reserved (Byte Index 46)
    tcp_header[12] = 8'h50;

    // Flags (Byte Index 47) - syn bit (tcp_flags[1]) must be 1. 0x02 = ACK flag set.
    tcp_header[13] = 8'h02;

    // Window (Byte Index 48, 49)
    tcp_header[14] = 8'hFA;
    tcp_header[15] = 8'hF0;

    // Checksum (Byte Index 50, 51)
    tcp_header[16] = 8'hAB;
    tcp_header[17] = 8'hCD;

    // Urgent Pointer (Byte Index 52, 53)
    tcp_header[18] = 8'h00;
    tcp_header[19] = 8'h00;

    //*************************************************************************************************
    //-------------------------------------------------------------------------------------------------
    //                                Summary
    //--------------------------------------------------------------------------------------------------
    //**************************************************************************************************
    //|Field           |Bytes       |Index        |Value                |Variable
    //--------------------------------------------------------------------------------------------------
    //|DA              |6           |0-5          |0xFFFFFFFFFFFF       |eth_header[0] -> eth_header[5]
    //|SA              |6           |6-11         |0x000AB5CCDDEE       |eth_header[6] -> eth_header[11]
    //|EtherType       |2           |12,13        |0x0800               |eth_header[12], eth_header[13]
    //|IPv4 + IHL      |1           |14           |0x45                 |ip_header[0]
    //|DSCP            |1           |15           |0x00                 |ip_header[1]
    //|Packet Length   |2           |16,17        |0x0045               |ip_header[2], ip_header[3]
    //|IP ID           |2           |18,19        |0x1234               |ip_header[4], ip_header[5]
    //|Flags/Offset    |3           |20-22        |0x400000             |ip_header[6] -> ip_header[8]
    //|TCP Protocol    |1           |23           |0x06                 |ip_header[9]
    //|Checksum        |2           |24,25        |0xABCD               |ip_header[10], ip_header[11]
    //|Source IP       |4           |26-29        |0x10010101           |ip_header[12] -> ip_header[15]
    //|Dest IP         |4           |30-33        |0xC0A80101           |ip_header[16] -> ip_header[19]
    //|Source Port     |2           |34,35        |0xC350               |tcp_header[0], tcp_header[1]
    //|Dest Port       |2           |36,37        |0x1388               |tcp_header[2], tcp_header[3]
    //|Seq Num         |4           |38-41        |0xC0A80101           |tcp_header[4] -> tcp_header[7]
    //|Ack Num         |4           |42-45        |0x00000001           |tcp_header[8] -> tcp_header[11]
    //|Data Offset     |1           |46           |0x50                 |tcp_header[12]
    //|Flags (SYN)     |1           |47           |0x02                 |tcp_header[13]
    //|Window          |2           |48,49        |0xFAF0               |tcp_header[14], tcp_header[15]
    //|Checksum        |2           |50,51        |0xABCD               |tcp_header[16], tcp_header[17]
    //|Urgent Pointer  |2           |52,53        |0x0000               |tcp_header[18], tcp_header[19]
    //**************************************************************************************************
    // empty = '0;
    if (sof4 == 0) begin //If sof4 is high, start of frame would appear at lane 4 (upper word)
      data_send = sof1;
      rxc = control_sof1;

      send_data_64bit(data_send);

      rxc = 8'h00; //Control bit would remain 0 for data transfer
      if (terminate_send) begin
            data_send = {eth_header[7], eth_header[6], eth_header[5], eth_header[4],
                    eth_header[3], eth_header[2], 8'hFD, eth_header[0]};
            rxc = 8'h02;
      end


      data_send = {eth_header[7], eth_header[6], eth_header[5], eth_header[4],
                    eth_header[3], eth_header[2], eth_header[1], eth_header[0]};

      packet_test = {data_send, packet_test[511:64]};
      
      send_data_64bit(data_send);

      data_send = {ip_header[1], ip_header[0], eth_header[13], eth_header[12], 
                eth_header[11], eth_header[10], eth_header[9], eth_header[8]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);


      data_send = {ip_header[9], ip_header[8], ip_header[7], ip_header[6], 
                    ip_header[5], ip_header[4], ip_header[3], ip_header[2]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      data_send = {ip_header[17], ip_header[16], ip_header[15], ip_header[14],
                    ip_header[13], ip_header[12], ip_header[11], ip_header[10]};

      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      data_send = {tcp_header[5], tcp_header[4], tcp_header[3], tcp_header[2],
                    tcp_header[1], tcp_header[0], ip_header[19], ip_header[18]};

      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      if (error_send) begin
        data_send = {tcp_header[13], tcp_header[12], 'hFE, tcp_header[10],
                      tcp_header[19], tcp_header[8], tcp_header[7], tcp_header[6]};

        packet_test = {data_send, packet_test[511:64]};
        rxc = 'h20;
      end
      else begin
        data_send = {tcp_header[13], tcp_header[12], tcp_header[11], tcp_header[10],
                tcp_header[19], tcp_header[8], tcp_header[7], tcp_header[6]};

        packet_test = {data_send, packet_test[511:64]};
        send_data_64bit(data_send);
      end

      rxc = 8'h00;
      data_send = {8'h00, 8'h00, tcp_header[19], tcp_header[18], 
                    tcp_header[17], tcp_header[16], tcp_header[15], tcp_header[14]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      rxc = 8'h80;
      data_send = {8'hFD, 8'h00, 8'h00, 8'h00, 
                    8'h00, 8'h00, 8'h00, 8'h00};
        
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);
    end
    else begin
      data_send = sof2;
      rxc = control_sof2;

      send_data_64bit(data_send);

      rxc = control_sof3; //Control bit would remain 0 for data transfer

      data_send = {eth_header[3], eth_header[2], eth_header[1], eth_header[0],
                    8'hD5, 8'h55, 8'h55, 8'h55};

      packet_test = {data_send, packet_test[511:64]};
      
      send_data_64bit(data_send);

      data_send = {eth_header[11], eth_header[10], eth_header[9], eth_header[8],
                    eth_header[7], eth_header[6], eth_header[5], eth_header[4]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);


      data_send = {ip_header[5], ip_header[4], ip_header[3], ip_header[2], 
                    ip_header[1], ip_header[0], eth_header[13], eth_header[12]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      data_send = {ip_header[13], ip_header[12], ip_header[11], ip_header[10],
                    ip_header[9], ip_header[8], ip_header[7], ip_header[6]};

      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      data_send = {tcp_header[1], tcp_header[0], ip_header[19], ip_header[18],
                    ip_header[17], ip_header[16], ip_header[15], ip_header[14]};

      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      data_send = {tcp_header[9], tcp_header[8], tcp_header[7], tcp_header[6],
                    tcp_header[5], tcp_header[4], tcp_header[3], tcp_header[2]};

      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      rxc = 8'h00;
      data_send = {tcp_header[17], tcp_header[16], tcp_header[15], tcp_header[14], 
                    tcp_header[13], tcp_header[12], tcp_header[11], tcp_header[10]};
      
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      rxc = 8'h00;
      data_send = {8'h00, 8'h00, 8'h00, 8'h00, 
                    8'h00, 8'h00, tcp_header[19], tcp_header[18]};
        
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);

      rxc = 8'h10;
      data_send = {8'h00, 8'h00, 8'h00, 8'hFD, 
                    8'h00, 8'h00, 8'h00, 8'h00};
        
      packet_test = {data_send, packet_test[511:64]};

      send_data_64bit(data_send);
    end

  endtask


// task for largest packet

task automatic large_packet_sender();
  @(posedge rx_clk);
  rxd = idle1;
  rxc = control_idle1;
  error_send = 0;
  send_ethernet_packet_proper();
  for (int count =0 ; count < 726 ; count ++) begin
    data_send = '1;
    send_data_64bit(data_send);
  end
   for (int count =0 ; count < 726 ; count ++) begin
    data_send = '0;
    send_data_64bit(data_send);
  end
  data_send = 64'h12ABCDEF;
  send_data_64bit(data_send);
endtask //automatic

task automatic noise_packet();
  @(posedge rx_clk);
  rxd = idle1;
  rxc = control_idle1;
  error_send = 0;
  terminate_send = 1;
  send_ethernet_packet_proper();
endtask //automatic
initial begin
  rst_n = 0;
  rxd = idle1;
  rxc = control_idle1;
  link_active = 1;
  rx_dv = 0;
  sof4 = 0;
  data_send = 'b0;
  // rx_er = 0;
  // empty = 1;
  #40;
  rst_n = 1;
  repeat (2) @(posedge clk);
   

  // TEST description: SENDING 2 PACKETS BACK TO BACK WITH MINIMUM IFG DELAY (Checking alignment as well)
        #328000;
        @(posedge rx_clk);
        // for (int i = 0; i < 328; i++) @(posedge clk);
        error_send = 0;
        sof4 = 1;
        send_ethernet_packet_proper(); 

        rxd = idle1;
        rxc = control_idle1;
        @(posedge rx_clk);
        @(posedge rx_clk);
        error_send = 0;
        sof4 = 0;
        send_ethernet_packet_proper();

 // TEST description: SENDING LARGEST PACKET POSSIBLE

        large_packet_sender();

// TEST description:  if terminated in between

      
        noise_packet();
        


  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);
  @(posedge rx_clk);

//    #1000;
   $stop;

end

endmodule 