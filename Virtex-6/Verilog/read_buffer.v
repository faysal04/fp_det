`timescale 1ns/1ps

module read_buffer (

    input  clk,
    input  rst_n,
    input  [7:0] rxd,
    input  rx_dv,
    input  rx_er,
    input  empty,
    input  extern_preamble,
    output reg [15:0] ip_id,
    output reg [31:0] ip_dst,
    output reg [31:0] ip_src,
    output reg [15:0] tcp_src,
    output reg [15:0] tcp_dst,
    output reg [31:0] tcp_seq,
    output reg [31:0] tcp_ack,
    output reg [15:0] tcp_window,
    output            fields_valid,
    output            detected,
    output reg [15:0] packet_type,
    output reg [3:0]  version, 
    output reg [3:0] ihl,
    output reg [7:0]  tcp_flags, 
    output reg [7:0] protocol,
    output reg  [431:0] packet,

    output reg [7:0] pipe_rxd,
    output reg       pipe_rx_dv,
    output reg       pipe_rx_er,
    output reg       pipe_empty,
    output [1:0]     state_probe,
    output reg [7:0] buffer_probe,
    output [10:0] counter_probe
    // output reg [7:0] eth_header_probe [13:0],
    // output reg [7:0] ip_header_probe  [19:0],
    // output reg [7:0] tcp_header_probe [19:0]
);

    // Stage 1 pipeline registers
    always @(posedge clk) begin
        if (!rst_n) begin
            pipe_rxd   <= 0;
            pipe_rx_dv <= 0;
            pipe_rx_er <= 0;
            pipe_empty <= 0;
        end else begin
            pipe_rxd   <= rxd;
            pipe_rx_dv <= rx_dv;
            pipe_rx_er <= rx_er;
            pipe_empty <= empty;
        end
    end

    // Stage 2 pipeline
    reg [7:0] pipe2_rxd;
    reg       pipe2_rx_dv;
    reg       pipe2_rx_er;
    reg       pipe2_empty;
    always @(posedge clk) begin
        pipe2_rxd   <= pipe_rxd;
        pipe2_rx_dv <= pipe_rx_dv;
        pipe2_rx_er <= pipe_rx_er;
        pipe2_empty <= pipe_empty;
    end

    // Stage 3 pipeline
    reg [7:0] pipe3_rxd;
    reg       pipe3_rx_dv;
    reg       pipe3_rx_er;
    reg       pipe3_empty;
    always @(posedge clk) begin
        pipe3_rxd   <= pipe2_rxd;
        pipe3_rx_dv <= pipe2_rx_dv;
        pipe3_rx_er <= pipe2_rx_er;
        pipe3_empty <= pipe2_empty;
    end

    // Stage 4 pipeline
    reg [7:0] pipe4_rxd;
    reg       pipe4_rx_dv;
    reg       pipe4_rx_er;
    reg       pipe4_empty;
    always @(posedge clk) begin
        pipe4_rxd   <= pipe3_rxd;
        pipe4_rx_dv <= pipe3_rx_dv;
        pipe4_rx_er <= pipe3_rx_er;
        pipe4_empty <= pipe3_empty;
    end

    // Preamble detector
    preamble_detector inst_preamble_detector (
        .clk(clk),
        .rst_n(rst_n),
        .rxd(pipe_rxd),
        .rx_er(pipe_rx_er),
        .empty(pipe_empty),
        .detected(detected)
    );

    reg pipe_detected;
    reg accum_preamble;

        // State machine
    localparam WAIT_PRE_1 = 2'b00,
               WAIT_PKT_1 = 2'b01,
               WAIT_PRE_2 = 2'b10,
               WAIT_PKT_2 = 2'b11;

    reg [1:0] current_state, next_state;
    // assign state_probe = current_state;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= WAIT_PRE_1;
        else
            current_state <= next_state;
    end

    reg preamble_d1, preamble_d2;
    always @(posedge clk) begin
        if (!rst_n) begin
            {preamble_d2, preamble_d1} <= 0;
        end
        else begin
            {preamble_d2, preamble_d1} <= {preamble_d1, extern_preamble};
        end
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            accum_preamble <= 0;
        end
        else begin
            if ((current_state == WAIT_PRE_1 || current_state == WAIT_PRE_2) && preamble_d2) begin
                accum_preamble <= 1'b1;
            end
            else if (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2) begin
                accum_preamble <= 1'b0;
            end
        end
    end
    // // reg accum_preamble;

    // always @(posedge clk) begin
    //     if (!rst_n) begin
    //         preamble_d1 <= 0;
    //         preamble_d2 <= 0;
    //         preamble_d3 <= 0;
    //         accum_preamble <= 0;
    //     end
    //     else begin
    //         // synchronize through pipeline
    //         preamble_d1 <= preamble_detected;
    //         preamble_d2 <= preamble_d1;
    //         preamble_d3 <= preamble_d2;

    //         // detect rising edge after pipeline
    //         accum_preamble <= preamble_d2 & ~preamble_d3;
    //     end
    // end

    always @(posedge clk) begin
        // pipe_detected <= detected || accum_preamble;
        pipe_detected <= detected;
    end

    assign state_probe = current_state;
    always @(*) begin
        case(current_state)
            WAIT_PRE_1: next_state = (pipe_detected) ? WAIT_PKT_1 : WAIT_PRE_1;
            WAIT_PKT_1: next_state = (!pipe4_empty && pipe4_rx_dv == 0) ? WAIT_PRE_2 : WAIT_PKT_1;
            WAIT_PRE_2: next_state = (pipe_detected) ? WAIT_PKT_2 : WAIT_PRE_2;
            WAIT_PKT_2: next_state = (!pipe4_empty && pipe4_rx_dv == 0) ? WAIT_PRE_1 : WAIT_PKT_2;
        endcase
    end

    // Packet counter
    reg [10:0] counter;
    assign counter_probe = counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 0;
        else if (!pipe4_empty) begin
            if (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)
                counter <= counter + 1'b1;
            else
                counter <= 0;
        end
    end

    // Headers
    reg [7:0] eth_header [13:0];
    reg [7:0] ip_header  [19:0];
    reg [7:0] tcp_header [19:0];
    reg [431:0] packet_reg;
    // reg [8:0] packet_byte_count;
    // localparam packet_size = 9'd480;
    //assign eth_header_probe = eth_header;
    //assign ip_header_probe = ip_header;
    //assign tcp_header_probe = tcp_header;

    reg [7:0] eth_count, ip_count, tcp_count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            eth_count <= 0;
            ip_count  <= 0;
            tcp_count <= 0;
            packet_reg <= 431'd0;
            buffer_probe <= 0;
            // packet_byte_count <= 0;
        end else begin
            if (!pipe4_empty && counter <= 13 && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
                // if (counter == 0) begin
                //     packet_reg <= 431'd0;
                // end
                eth_count <= eth_count + 1'b1;
                ip_count  <= 0;
                tcp_count <= 0;
                eth_header[eth_count] <= pipe4_rx_er ? 8'd0 : pipe4_rxd;
                packet_reg <= {packet_reg[423:0], (pipe4_rx_er ? 8'd0 : pipe4_rxd)}; //shift packet_reg by a byte and append byte
            end else if (!pipe4_empty && counter > 13 && counter <= 33 && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
                ip_count  <= ip_count + 1'b1;
                eth_count <= 0;
                ip_header[ip_count] <= pipe4_rx_er ? 8'd0 : pipe4_rxd;
                packet_reg <= {packet_reg[423:0], (pipe4_rx_er ? 8'd0 : pipe4_rxd)};
            end else if (!pipe4_empty && counter > 33 && counter <= 53 && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
                tcp_count <= tcp_count + 1'b1;
                tcp_header[tcp_count] <= pipe4_rx_er ? 8'd0 : pipe4_rxd;
                packet_reg <= {packet_reg[423:0], (pipe4_rx_er ? 8'd0 : pipe4_rxd)};
            end else if (!pipe4_empty) begin
                eth_count <= 0;
                ip_count  <= 0;
                tcp_count <= 0;
            end

            if (!pipe_empty && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
                buffer_probe <= pipe_rxd;
            end

            // if (!pipe4_empty && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
            //     packet_reg[packet_size - packet_byte_count -: 8] <= (pipe4_rx_er ? 8'd0 : pipe4_rxd);
            //     packet_byte_count <= packet_byte_count + 8;
            // end
        end
    end

    // Packet processing
    reg process_1_delayed, process_2_delayed;
    wire process_1 = (current_state == WAIT_PRE_2) || (current_state == WAIT_PKT_2) || (current_state == WAIT_PRE_1);
    wire process_2 = (current_state == WAIT_PRE_1) || (current_state == WAIT_PKT_1) || (current_state == WAIT_PRE_2);
    wire process_1_pulse = ~process_1_delayed & process_1;
    wire process_2_pulse = ~process_2_delayed & process_2;

    always @(posedge clk) begin
        process_1_delayed <= process_1;
        process_2_delayed <= process_2;
    end

    assign fields_valid = ((process_1_pulse || process_2_pulse) &&
                           (packet_type == 16'h0800 && version == 4 && ihl == 5 && protocol == 6 && tcp_flags[1] == 1));

    wire header_done = (counter == 54);
    initial begin
        packet <= 480'd0;
    end
    always @(posedge clk) begin
        packet_type <= {eth_header[12], eth_header[13]};
        {version, ihl} <= ip_header[0];
        ip_id       <= {ip_header[4], ip_header[5]};
        protocol    <= ip_header[9];
        ip_dst      <= {ip_header[16], ip_header[17], ip_header[18], ip_header[19]};
        ip_src      <= {ip_header[12], ip_header[13], ip_header[14], ip_header[15]};
        tcp_src     <= {tcp_header[0], tcp_header[1]};
        tcp_dst     <= {tcp_header[2], tcp_header[3]};
        tcp_seq     <= {tcp_header[4], tcp_header[5], tcp_header[6], tcp_header[7]};
        tcp_ack     <= {tcp_header[8], tcp_header[9], tcp_header[10], tcp_header[11]};
        tcp_flags   <= tcp_header[13];
        tcp_window  <= {tcp_header[14], tcp_header[15]};
            // packet      <= {
            //     eth_header[0], eth_header[1], eth_header[2], eth_header[3],
            //     eth_header[4], eth_header[5], eth_header[6], eth_header[7],
            //     eth_header[8], eth_header[9], eth_header[10], eth_header[11],
            //     eth_header[12], eth_header[13],

            //     ip_header[0], ip_header[1], ip_header[2], ip_header[3],
            //     ip_header[4], ip_header[5], ip_header[6], ip_header[7], 
            //     ip_header[8], ip_header[9], ip_header[10], ip_header[11],
            //     ip_header[12], ip_header[13], ip_header[14], ip_header[15], 
            //     ip_header[16], ip_header[17], ip_header[18], ip_header[19],  

            //     tcp_header[0], tcp_header[1], tcp_header[2], tcp_header[3],
            //     tcp_header[4], tcp_header[5], tcp_header[6], tcp_header[7], 
            //     tcp_header[8], tcp_header[9], tcp_header[10], tcp_header[11], 
            //     tcp_header[12], tcp_header[13], tcp_header[14], tcp_header[15], 
            //     tcp_header[16], tcp_header[17], tcp_header[18], tcp_header[19]  
            // };
        if (header_done) begin
            packet <= packet_reg;
        end
    end


endmodule
