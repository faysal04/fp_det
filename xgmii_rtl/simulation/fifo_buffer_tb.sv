`timescale 1ns/1ps

module fifo_buff_tb ();
    
    logic clk_156;
    logic rst_n;
    logic [63:0] data_in;
    logic [7:0]  control_in;
    logic [63:0] data_out;
    logic [7:0]  control_out;
    logic wen;
    logic bit_test;
    logic error;

    logic clk;
    logic full;
    logic [72:0] rdata;
    logic empty;
    logic [7:0] control;
    logic [63:0] data;
    logic async_error;

    logic [15:0] ip_id;
    logic [31:0] ip_dst;
    logic [31:0] ip_src;
    logic [15:0] tcp_src;
    logic [15:0] tcp_dst;
    logic [31:0] tcp_ack;
    logic [31:0] tcp_seq;
    logic [15:0] tcp_window;
    logic        fields_valid;
    logic [511:0] packet;

    logic [15:0] packet_type;
    logic [3:0]  version;
    logic [3:0]  ihl;
    logic [7:0]  tcp_flags; 
    logic [7:0]  protocol;
    logic [1:0] state_probe;

    logic [63:0] data_send;
    logic [511:0] packet_test;

    accumulator accum_inst (
    .clk_156    (clk_156),
    .rst_n      (rst_n),
    .error     (error),
    .data_in    (data_in),
    .control_in (control_in),
    .data_out   (data_out),
    .control_out(control_out),
    .wen        (wen),
    .bit_test (bit_test)
    );

    async_fifo #(.DSIZE(73), .ASIZE(4)) inst_async_fifo (
    .i_wclk  (clk_156),
    .i_wrst_n(rst_n),
    .i_wr    (wen),
    .i_wdata ({error, control_out, data_out}),
    .o_wfull (full),
    .i_rclk  (clk),
    .i_rrst_n(rst_n),
    .i_rd    (1'b1),
    .o_rdata (rdata),
    .o_rempty(empty)
    );

    read_buffer inst_read_buffer (
    .clk         (clk),
    .rst_n       (rst_n),
    .rxd         (rdata[63:0]),
    // .rx_dv       (rdata[72]), // not sure about valid yet
    .rxc         (rdata[71:64]),
    .rx_er       (rdata[72]),
    .empty       (empty),
    .ip_id       (ip_id),
    .ip_dst      (ip_dst),
    .ip_src      (ip_src),
    .tcp_src     (tcp_src),
    .tcp_dst     (tcp_dst),
    .tcp_seq     (tcp_seq),
    .tcp_ack     (tcp_ack),
    .tcp_window  (tcp_window),
    .packet_type(packet_type),
    .ihl(ihl),
    .version(version),
    .tcp_flags(tcp_flags),
    .protocol(protocol),
    .fields_valid(fields_valid),

    .packet_logic(packet)
    );

    initial clk_156 = 0;
    always #3.2 clk_156 = ~clk_156; //156.25 MHz 

    initial clk = 0;
    always #2.5 clk = ~clk;

    always @(posedge clk) begin
        if (!empty) begin
            data = rdata[63:0];
            control = rdata[71:64];
            async_error = rdata[72];
        end
    end

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

    task automatic send_data_64bit(input [64-1:0] data);
        data_in = data;
        @(posedge clk);
    endtask

    task send_ethernet_packet_proper();
  
        reg [7:0] eth_header [0:13];
        reg [7:0] ip_header [0:19];
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
        empty = '0;
        data_send = {8'hD5, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'hFB};
        control_in = 8'h01;

        send_data_64bit(data_send);

        control_in = 8'h00; //Control bit would remain 0 for data transfer

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

        data_send = {tcp_header[13], tcp_header[12], tcp_header[11], tcp_header[10],
                    tcp_header[19], tcp_header[8], tcp_header[7], tcp_header[6]};

        packet_test = {data_send, packet_test[511:64]};

        send_data_64bit(data_send);

        control_in = 8'h00;
        data_send = {8'h00, 8'h00, tcp_header[19], tcp_header[18], 
                    tcp_header[17], tcp_header[16], tcp_header[15], tcp_header[14]};
        
        packet_test = {data_send, packet_test[511:64]};

        send_data_64bit(data_send);

        control_in = 8'h80;
        data_send = {8'hFD, 8'h00, 8'h00, 8'h00, 
                    8'h00, 8'h00, 8'h00, 8'h00};
        
        packet_test = {data_send, packet_test[511:64]};

        send_data_64bit(data_send);

    endtask

    initial begin
        rst_n = 0;
        data_in = 8'h00;
        #40;
        rst_n = 1;
        repeat (2) @(posedge clk);

        // Send dummy Ethernet packet
        send_ethernet_packet_proper();

        // Wait and finish
        #1000;

        $display("Testbench completed.");
        // $finish;
        $stop;
    end
endmodule