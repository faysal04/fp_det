`timescale 1ns/1ps

module top_wrapper (
    // Differential input clock for internal 200 MHz logic
    input  wire clk_200_p,
    input  wire clk_200_n,
    input  wire reset_in,
    output wire phy_rst_n,

    // PHY GMII RX interface
    input  wire [7:0]  rxd,
    input  wire        rx_dv,
    input  wire        rx_er,
    input  wire        crs,
    input  wire        col,
    input  wire        phy_rx_clk,       // PHY 125 MHz RX clock

    // PHY GMII TX interface (unused)
    input  wire        tx_clk,
    output wire [7:0]  txd,
    output wire        tx_en,
    output wire        tx_er,

    // Top module outputs
    output wire [7:0]  rxd_out,
    output wire [15:0] fp_num0,
    output wire [15:0] fp_num1,
    output wire [15:0] fp_num2,
    output wire [15:0] fp_num3,
    output wire [15:0] fp_num4,
    output wire [15:0] fp_num5,
    output wire [15:0] fp_num6,
    output wire [15:0] fp_num7,
    output wire [15:0] fp_num8,
    output wire [15:0] fp_num9,
    output wire [15:0] fp_num10,
    output wire [15:0] fp_num11,
    output wire [15:0] fp_num12,
    output wire [15:0] fp_num13,
    output wire [15:0] fp_num14,
    output wire [15:0] fp_num15,
    output wire [15:0] fp_num16,
    output wire [15:0] fp_num17,
    output reg         fp_det_LED,

        output [15:0] packet_type,
    output [3:0]  version, 
    output [3:0] ihl,
    output [7:0]  tcp_flags, 
    output [7:0] protocol,

    input wire phy_link,

    //UART Interface
    input CTS,
    output RTS,
    output uart_tx_out,

    output speed,
    output ready
);

    // Internal 200 MHz clock from clock wizard
    wire clk_200;
    wire clk_locked;
	wire resetn_in = ~reset_in;
	wire rx_clk_ibufg;
    wire rx_clk;

    assign RTS = 1'b0;

    // 1. Input Buffer
    // IBUFG ibufg_inst (.I(phy_rx_clk), .O(rx_clk_ibufg));
    assign rx_clk = phy_rx_clk;

    // 2. Global Buffer (or use an MMCM here for phase alignment)
    // BUFG bufg_inst (.I(rx_clk_ibufg), .O(rx_clk));
    // Instantiate clock wizard for 200 MHz only
    clk clk_wiz_inst (
        .CLK_IN1_P (clk_200_p),
        .CLK_IN1_N (clk_200_n),
        .CLK_OUT1  (),        // 125 MHz removed
        .CLK_OUT2  (clk_200), // Internal logic
        .LOCKED    (clk_locked),
        .RESET     (reset_in)
    );

    // Reset synchronized to clock wizard lock
    wire rst_n;
    assign rst_n = clk_locked & resetn_in;
    assign phy_rst_n = rst_n;

    // Link status register synchronized to internal clock
    reg link_active;

    always @(posedge clk_200 or negedge rst_n) begin
        if (!rst_n)
            link_active <= 1'b0;
        else
            link_active <= 1'b1; // PHY link status
    end
	 
	 wire fp_det;
	 wire valid;

     wire [7:0] rxd_reg;
     assign rxd_reg = rxd;
    //  always @(posedge rx_clk) begin
    //     rxd_reg <= rxd;
    //  end

     wire [15:0] ip_id;
     wire [31:0] ip_dst;
     wire [31:0] ip_src;
     wire [15:0] tcp_sport;
     wire [15:0] tcp_dport;
     wire [31:0] tcp_ack;
     wire [31:0] tcp_seq;
     wire [15:0] tcp_window; 

     (* keep = "true" *) wire [455:0] data_send_buffer;
     //data_send_buffer[103:72] -> ip_src
     //data_send_buffer[71:40] -> ip_dst
     //data_send_buffer[39:24] -> tcp_dport
     //data_send_buffer[23:16] -> fp_index (which finger print was detected)
     //data_send_buffer[15:0] -> fp_numX
	 
    //  reg [7:0] eth_header_probe [13:0];
    //  reg [7:0] ip_header_probe  [19:0];
    //  reg [7:0] tcp_header_probe [19:0];
    
	 // Instantiate top module
    top inst_top (
        .rx_er          (rx_er),
        .rx_dv          (rx_dv),
        .rxd            (rxd),
        .rx_clk         (rx_clk),   // Use PHY RX clock directly
        .crs            (crs),
        .col            (col),
        .tx_clk         (tx_clk),   // Passed through
        .tx_er          (tx_er),
        .tx_en          (tx_en),
        .txd            (txd),
        .clk            (clk_200),  // Internal logic clock
        .rst_n          (rst_n),
        .link_active    (link_active),
        // .preamble_detected(1'b0),   // Tie low or generate as needed
        .fp_det(fp_det),

        // FP outputs
        .fp_num0(fp_num0),   .fp_num1(fp_num1),
        .fp_num2(fp_num2),   .fp_num3(fp_num3),
        .fp_num4(fp_num4),   .fp_num5(fp_num5),
        .fp_num6(fp_num6),   .fp_num7(fp_num7),
        .fp_num8(fp_num8),   .fp_num9(fp_num9),
        .fp_num10(fp_num10), .fp_num11(fp_num11),
        .fp_num12(fp_num12), .fp_num13(fp_num13),
        .fp_num14(fp_num14), .fp_num15(fp_num15),
        .fp_num16(fp_num16), .fp_num17(fp_num17),

        // TCP/IP interface
        .ip_id(ip_id), 
        .ip_dst(ip_dst), 
        .ip_src(ip_src), 
        .tcp_sport(tcp_sport), 
        .tcp_dport(tcp_dport),
        .tcp_ack(tcp_ack), 
        .tcp_seq(tcp_seq), 
        .tcp_window(tcp_window), 
        .valid(valid),
    //  .packet_type(packet_type),
    // .version(version), 
    // .ihl(ihl),
    // .tcp_flags(tcp_flags), 
    // .protocol(protocol),
       .packet(data_send_buffer[455:24]),

        //Debug
        // .speed_probe(speed),
        // .buffer_probe(rxd_reg),
        .ready_probe(ready)

        // .eth_header_probe(eth_header_probe),
        // .tcp_header_probe(tcp_header_probe),
        // ip_header_probe(ip_header_probe)
    );


    reg [103:0] fp_send_buffer;
    reg [15:0] fp_num0_buffer;
    reg [15:0] fp_num1_buffer;
    reg [15:0] fp_num2_buffer;
    reg [15:0] fp_num3_buffer;
    reg [15:0] fp_num4_buffer;
    reg [15:0] fp_num5_buffer;
    reg [15:0] fp_num6_buffer;
    reg [15:0] fp_num7_buffer;
    reg [15:0] fp_num8_buffer;
    reg [15:0] fp_num9_buffer;
    reg [15:0] fp_num10_buffer;
    reg [15:0] fp_num11_buffer;
    reg [15:0] fp_num12_buffer;
    reg [15:0] fp_num13_buffer;
    reg [15:0] fp_num14_buffer;
    reg [15:0] fp_num15_buffer;
    reg [15:0] fp_num16_buffer;
    reg [15:0] fp_num17_buffer;
	 
    reg transmission_start;
	 
    always @(posedge clk_200) begin
        if (!rst_n) begin
            fp_num0_buffer <= 0;
            fp_num1_buffer <= 0;
            fp_num2_buffer <= 0;
            fp_num3_buffer <= 0;
            fp_num4_buffer <= 0;
            fp_num5_buffer <= 0;
            fp_num6_buffer <= 0;
            fp_num7_buffer <= 0;
            fp_num8_buffer <= 0;
            fp_num9_buffer <= 0;
            fp_num10_buffer <= 0;
            fp_num11_buffer <= 0;
            fp_num12_buffer <= 0;
            fp_num13_buffer <= 0;
            fp_num14_buffer <= 0;
            fp_num15_buffer <= 0;
            fp_num16_buffer <= 0;
            fp_num17_buffer <= 0;


            fp_send_buffer <= 0;
        end
        else begin
            if (fp_det) begin
                fp_send_buffer[103:72] <= ip_src;
                fp_send_buffer[71:40] <= ip_dst;
                fp_send_buffer[39:24] <= tcp_dport;
                if (fp_num0_buffer  != fp_num0 ) begin
                    fp_send_buffer[23:16] <= 8'd0;
                    fp_send_buffer[15:0]  <= fp_num0;
                end

                if (fp_num1_buffer  != fp_num1 ) begin
                    fp_send_buffer[23:16] <= 8'd1;
                    fp_send_buffer[15:0]  <= fp_num1;
                end

                if (fp_num2_buffer  != fp_num2 ) begin
                    fp_send_buffer[23:16] <= 8'd2;
                    fp_send_buffer[15:0]  <= fp_num2;
                end

                if (fp_num3_buffer  != fp_num3 ) begin
                    fp_send_buffer[23:16] <= 8'd3;
                    fp_send_buffer[15:0]  <= fp_num3;
                end

                if (fp_num4_buffer  != fp_num4 ) begin
                    fp_send_buffer[23:16] <= 8'd4;
                    fp_send_buffer[15:0]  <= fp_num4;
                end

                if (fp_num5_buffer  != fp_num5 ) begin
                    fp_send_buffer[23:16] <= 8'd5;
                    fp_send_buffer[15:0]  <= fp_num5;
                end

                if (fp_num6_buffer  != fp_num6 ) begin
                    fp_send_buffer[23:16] <= 8'd6;
                    fp_send_buffer[15:0]  <= fp_num6;
                end

                if (fp_num7_buffer  != fp_num7 ) begin
                    fp_send_buffer[23:16] <= 8'd7;
                    fp_send_buffer[15:0]  <= fp_num7;
                end

                if (fp_num8_buffer  != fp_num8 ) begin
                    fp_send_buffer[23:16] <= 8'd8;
                    fp_send_buffer[15:0]  <= fp_num8;
                end

                if (fp_num9_buffer  != fp_num9 ) begin
                    fp_send_buffer[23:16] <= 8'd9;
                    fp_send_buffer[15:0]  <= fp_num9;
                end

                if (fp_num10_buffer != fp_num10) begin
                    fp_send_buffer[23:16] <= 8'd10;
                    fp_send_buffer[15:0]  <= fp_num10;
                end

                if (fp_num11_buffer != fp_num11) begin
                    fp_send_buffer[23:16] <= 8'd11;
                    fp_send_buffer[15:0]  <= fp_num11;
                end

                if (fp_num12_buffer != fp_num12) begin
                    fp_send_buffer[23:16] <= 8'd12;
                    fp_send_buffer[15:0]  <= fp_num12;
                end

                if (fp_num13_buffer != fp_num13) begin
                    fp_send_buffer[23:16] <= 8'd13;
                    fp_send_buffer[15:0]  <= fp_num13;
                end

                if (fp_num14_buffer != fp_num14) begin
                    fp_send_buffer[23:16] <= 8'd14;
                    fp_send_buffer[15:0]  <= fp_num14;
                end

                if (fp_num15_buffer != fp_num15) begin
                    fp_send_buffer[23:16] <= 8'd15;
                    fp_send_buffer[15:0]  <= fp_num15;
                end

                if (fp_num16_buffer != fp_num16) begin
                    fp_send_buffer[23:16] <= 8'd16;
                    fp_send_buffer[15:0]  <= fp_num16;
                end

                if (fp_num17_buffer != fp_num17) begin
                    fp_send_buffer[23:16] <= 8'd17;
                    fp_send_buffer[15:0]  <= fp_num17;
                end

                fp_num0_buffer <= fp_num0;
                fp_num1_buffer <= fp_num1;
                fp_num2_buffer <= fp_num2;
                fp_num3_buffer <= fp_num3;
                fp_num4_buffer <= fp_num4;
                fp_num5_buffer <= fp_num5;
                fp_num6_buffer <= fp_num6;
                fp_num7_buffer <= fp_num7;
                fp_num8_buffer <= fp_num8;
                fp_num9_buffer <= fp_num9;
                fp_num10_buffer <= fp_num10;
                fp_num11_buffer <= fp_num11;
                fp_num12_buffer <= fp_num12;
                fp_num13_buffer <= fp_num13;
                fp_num14_buffer <= fp_num14;
                fp_num15_buffer <= fp_num15;
                fp_num16_buffer <= fp_num16;
                fp_num17_buffer <= fp_num17;
                transmission_start <= 1'b1;
            end
            else begin
                transmission_start <= 1'b0;
            end
        end
        
    end

	 assign data_send_buffer[23:0] = fp_send_buffer[23:0];


    // packet_logging #(.DATA_SIZE(455), .BYTE_SIZE(57)) inst_pkt_logger(
    //     .rst_n(rst_n),
    //     .clk(clk_200),
    //     .start(transmission_start),

    //     .packet_data(data_send_buffer),
    //     .tx_out(uart_tx_out)
    // );

    buffer_packet_logger #(
    .DATA_SIZE(455),     //Delay = Time delay in seconds * CLK_FREQ
    .BYTE_SIZE(57),
    .ADDRESS_SIZE(7)
    ) buffer_logger_inst(
        .packet(data_send_buffer),
        .rst_n(rst_n),
        .clk(clk_200),
        .fp_det(transmission_start), 
        .uart_tx_out(uart_tx_out),
        .empty(speed) 
    );


    // //ChipScope signals
	//  wire [35:0] control0;

	// //  ICON instance
	//  chipscope_icon icon_inst (
	// 	 .CONTROL0(control0)
	//  );

	// //  ILA instance
	//  chipscope_ila ila_inst (
	// 	 .CONTROL(control0),
	// 	 .CLK(clk_200),
	// 	 .TRIG0(rx_dv),
	// 	 .TRIG1(rxd_reg),
	// 	 .TRIG2(fields_valid),
	// 	 .TRIG3(tcp_flags),
	// 	 .TRIG4(protocol),
    //      .TRIG5 (ip_id),
    //      .TRIG6 (ip_dst),
    //      .TRIG7 (tcp_sport),
    //      .TRIG8 (tcp_dport),
    //      .TRIG9 (tcp_ack),
    //      .TRIG10 (tcp_seq),
    //      .TRIG11 (tcp_window),
    //      .TRIG12(packet_type),
    //      .TRIG13(version),
    //      .TRIG14(ihl)
	//  );

    always @(posedge clk_200) begin
        if (!rst_n) fp_det_LED <= 0;
        else begin
        if (fp_det) fp_det_LED <= 1;
        end
    end
endmodule
