`timescale 1ns/1ps

module mac (

    // gmii/mii rx channel
    input  rx_er,
    input  rx_dv,
    input  [7:0] rxd,
    input  rx_clk,
    // gmii/mii control signals
    input  crs,
    input  col,
    // gmii/mii tx channel
    input  tx_clk,
    output tx_er,
    output tx_en,
    output [7:0] txd,
    // mac control signals
    input  clk,
    input  rst_n,
    input  link_active,
    // input  extern_preamble,

    // outputs of header fields
    output [15:0] ip_id,
    output [31:0] ip_dst,
    output [31:0] ip_src,
    output [15:0] tcp_src,
    output [15:0] tcp_dst,
    output [31:0] tcp_ack,
    output [31:0] tcp_seq,
    output [15:0] tcp_window,
    output fields_valid,
    output [431:0] packet,

    output [15:0] packet_type,
    output [3:0]  version, 
    output [3:0] ihl,
    output [7:0]  tcp_flags, 
    output [7:0] protocol,

    output speed_probe,
    output ready_probe,
    output [7:0] rdata_probe,
    output accum_state_probe,
    output [4:0] accum_data_in_lsb_probe,
    output [4:0] rbin_probe,
    output [4:0] wbin_probe,
    output [4:0] rbin_next_probe,
    output [4:0] wbin_next_probe,
    output [4:0] wq1_probe,
    output [4:0] wq2_probe,
    output [4:0] rgray_next_probe,
    output [1:0] buffer_state_probe,
    output [10:0] counter_probe,
    output [7:0] buffer_probe

    // output reg [7:0] eth_header_probe [13:0],
    // output reg [7:0] ip_header_probe  [19:0],
    // output reg [7:0] tcp_header_probe [19:0]
);

    // Internal signals
    // reg [15:0] packet_type;
    // reg [3:0]  version;
    // reg [3:0]  ihl;
    // reg [7:0]  tcp_flags;
    // reg [7:0]  protocol;
    reg        process_1;
    reg        process_2;
    reg        pipe4;
    reg [1:0]  current_state;

    //assign tx_er = 1'b0;
    //assign tx_en = 1'b0;
    //assign txd   = 8'b0;

    wire [7:0]  data_out;
    wire        out_error;
    wire        out_valid;
    reg        async_accumlate;
    wire       sync_accumlate;
    reg        async_accum_reset;
    wire       sync_accum_reset;
    wire       wen;
    wire       full;
    wire       empty;
    wire [9:0] rdata;
    wire       speed;
    wire       ready;

    localparam WAIT_LINK   = 3'd0;
    localparam CHECK_SPEED = 3'd1;
    localparam ENABLE      = 3'd2;

    reg [2:0] state;


    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= WAIT_LINK;
        else begin
            if (state == WAIT_LINK && link_active)
                state <= CHECK_SPEED;
            else if (state == CHECK_SPEED && !link_active)
                state <= WAIT_LINK;
            else if (state == CHECK_SPEED && ready)
                state <= ENABLE;
            else if (state == ENABLE && !link_active)
                state <= WAIT_LINK;
        end
    end

    // Control signals based on state
    reg link_speed_reset;
    reg read_buffer_reset;

    always @(posedge clk) begin
        if (state == WAIT_LINK) begin
            link_speed_reset  <= 1'b0;
            async_accum_reset <= 1'b0;
            async_accumlate   <= 1'b0;
            read_buffer_reset <= 1'b0;
        end else if (state == CHECK_SPEED) begin
            link_speed_reset <= 1'b1;
            if (speed)
                async_accumlate <= 1'b1;
            else
                async_accumlate <= 1'b0;
        end else if (state == ENABLE) begin
            async_accum_reset <= 1'b1;
            read_buffer_reset <= 1'b1;
            link_speed_reset  <= 1'b0;
        end
    end

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

    // Link speed detector
    link_speed_detector inst_link_speed_detector (
        .clk_200(clk),
        .clk_det(rx_clk),
        .rst_n  (link_speed_reset),
        .speed  (speed),
        .ready  (ready)
    );

    // Accumulator
    wire preamble_accum;
    // wire [63:0] preamble;
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
        .extern_preamble(preamble_accum)
        // .state_probe(accum_state_probe),
        // .data_in_lsb_probe()
    );

    wire i_rd;
    // Async FIFO
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
        .speed(sync_accumlate)
        // .rbin_probe(accum_data_in_lsb_probe),
        // .wbin_probe(wbin_probe),
        // .rbin_next_probe(rbin_next_probe),
        // .wbin_next_probe(wbin_next_probe),
        // .wq1_probe(wq1_probe),
        // .wq2_probe(wq2_probe),
        // .rgray_next_probe(rgray_next_probe)
    );

    // Individual bits for read buffer
    wire f0 = rdata[7];
    wire f1 = rdata[6];
    wire f2 = rdata[5];
    wire f3 = rdata[4];
    wire f4 = rdata[3];
    wire f5 = rdata[2];
    wire f6 = rdata[1];
    wire f7 = rdata[0];

    // Read buffer
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

    //          .packet_type(packet_type),
    // .version(version), 
    // .ihl(ihl),
    // .tcp_flags(tcp_flags), 
    // .protocol(protocol),

        .extern_preamble(preamble_accum),
        // .state_probe(buffer_state_probe),
        .packet(packet)
        // .counter_probe(counter_probe),
        // .buffer_probe(buffer_probe)
        // .eth_header_probe(eth_header_probe),
        // .tcp_header_probe(tcp_header_probe),
        // ip_header_probe(ip_header_probe)
    );

    assign empty_t = empty;
    assign speed_probe = sync_accumlate;
    assign ready_probe = preamble_accum;
    // assign rdata_probe = rdata[7:0];

endmodule
