`timescale 1ns/1ps

module mac (

    // gmii/mii rx channel
    input  logic        rx_dv,
    input  logic [63:0] rxd,
    input  logic [7:0]  rxc,
    input  logic [7:0]  rxd_cnt,
    input  logic        rx_clk,

    // gmii/mii control signals
    input  logic        crs,
    input  logic        col,

    // gmii/mii tx channel
    input  logic        tx_clk,
    output logic        tx_er,
    output logic        tx_en,
    output logic [63:0]  txd,

    // mac control signals
    input  logic        clk,
    input  logic        rst_n,
    input  logic        link_active,
   
    // outputs of header fields
    output logic [15:0] ip_id,
    output logic [31:0] ip_dst,
    output logic [31:0] ip_src,
    output logic [15:0] tcp_src,
    output logic [15:0] tcp_dst,
    output logic [31:0] tcp_ack,
    output logic [31:0] tcp_seq,
    output logic [15:0] tcp_window,
    output logic        fields_valid,
    output logic [511:0] packet,

    output logic [15:0] packet_type,
    output logic [3:0]  version, 
    output logic [3:0]  ihl,
    output logic [7:0]  tcp_flags, 
    output logic [7:0]  protocol,

    output logic        speed_probe,
    output logic        ready_probe,
    output logic [72:0]  rdata_probe,
    output logic [63:0]  data_out_probe,
    output logic        accum_state_probe,
    output logic [4:0]  accum_data_in_lsb_probe,
    output logic [4:0]  rbin_probe,
    output logic [4:0]  wbin_probe,
    output logic [4:0]  rbin_next_probe,
    output logic [4:0]  wbin_next_probe,
    output logic [4:0]  wq1_probe,
    output logic [4:0]  wq2_probe,
    output logic [4:0]  rgray_next_probe,
    output logic [1:0]  buffer_state_probe,
    output logic [10:0] counter_probe,
    output logic [7:0]  buffer_probe
);

    // Internal signals
    logic        process_1;
    logic        process_2;
    logic        pipe4;
    logic [1:0]  current_state;

    logic [63:0]  data_out;
    logic [7:0]  control_out;
    logic        rx_er;
    logic        async_accumlate;
    logic        sync_accumlate;
    logic        async_accum_reset;
    logic        sync_accum_reset;
    logic        wen;
    logic        full;
    logic        empty;
    logic [73:0] rdata; // data =64 + cntrl = 8 + dv + er
    logic        speed;
    logic        ready;

    localparam WAIT_LINK   = 3'd0;
    localparam CHECK_SPEED = 3'd1;
    localparam ENABLE      = 3'd2;

    logic [2:0] state;

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
    logic link_speed_reset;
    logic read_buffer_reset;

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
    logic preamble_accum;

    accumulator inst_accumulator (
        .clk_156  (rx_clk),
        .rst_n    (sync_accum_reset),
        .error    (rx_er),
        .data_in  (rxd),
        .control_in (rxc),
        .data_out (data_out),
        .control_out (control_out),
        .wen      (wen)
    );


    logic i_rd;

    // Async FIFO
    async_fifo #(.DSIZE(73), .ASIZE(4)) inst_async_fifo (
        .i_wclk  (rx_clk),
        .i_wrst_n(sync_accum_reset),
        .i_wr    (wen),
        .i_wdata ({rx_er, control_out, data_out}),
        .o_wfull (full),
        .i_rclk  (clk),
        .i_rrst_n(read_buffer_reset),
        .i_rd    (1'b1),
        .o_rdata (rdata),
        .o_rempty(empty)
    );

   

    // Read buffer
    read_buffer inst_read_buffer (
        .clk         (clk),
        .rst_n       (read_buffer_reset),
        .rxd         (rdata[63:0]),

        .rx_dv       (rdata[72]), 

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
        .state_probe(buffer_state_probe),
        // .pipe4_probe(rdata_probe[63:0]),
        // .pipe4_rxc_probe(rdata_probe[71:64]),
    
        .packet_logic(packet)
    );

    assign empty_t     = empty;
    assign speed_probe = ready;
    assign ready_probe = wen;
    assign data_out_probe = data_out;
    // assign rdata_probe[72] = 0;
    assign rdata_probe = rdata;

endmodule