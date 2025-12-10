module axi_serializer (
    input         clk,
    input         rst_n,

    // AXI4-Stream slave interface
    input  [31:0] s_axis_tdata,
    input         s_axis_tvalid,
    output        s_axis_tready,
    input         s_axis_tlast,

    // Byte-wide output interface
    output [7:0]  rxd,
    output        rx_dv,
    output        rx_er,
    output        empty
);

    // FSM states
    localparam ST_IDLE     = 3'd0,
               ST_PREAMBLE = 3'd1,
               ST_SFD      = 3'd2,
               ST_DATA     = 3'd3;

    reg [2:0]   state;
    reg [2:0]   pre_cnt;
    reg [31:0]  data_reg;
    reg [2:0]   byte_cnt;
    reg [7:0]   rxd_reg;
    reg         rx_dv_reg;
    reg         hold_last;      // remember tlast during serialization
    reg         word_consumed;  // handshake control

    assign rx_er  = 1'b0;
    assign rxd    = rxd_reg;
    assign rx_dv  = rx_dv_reg;
    assign empty  = (state == ST_IDLE);

    // AXIS handshake: ready when we�re in data state and consumed the word
    assign s_axis_tready = (state == ST_DATA && word_consumed);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state        <= ST_IDLE;
            pre_cnt      <= 3'd0;
            data_reg     <= 32'd0;
            byte_cnt     <= 3'd0;
            rxd_reg      <= 8'd0;
            rx_dv_reg    <= 1'b0;
            hold_last    <= 1'b0;
            word_consumed<= 1'b0;
        end else begin
            rx_dv_reg <= 1'b0;
            word_consumed <= 1'b0;

            case (state)
                ST_IDLE: begin
                    if (s_axis_tvalid) begin
                        // Start of frame ? latch first word
                        data_reg   <= s_axis_tdata;
                        hold_last  <= s_axis_tlast;
                        byte_cnt   <= 0;
                        pre_cnt    <= 0;
                        state      <= ST_PREAMBLE;
                        word_consumed <= 1'b1; // handshake consumed first beat
                    end
                end

                ST_PREAMBLE: begin
                    rxd_reg   <= 8'h55;
                    rx_dv_reg <= 1'b1;
                    pre_cnt   <= pre_cnt + 1;
                    if (pre_cnt == 3'd6)
                        state <= ST_SFD;
                end

                ST_SFD: begin
                    rxd_reg   <= 8'hD5;
                    rx_dv_reg <= 1'b1;
                    state     <= ST_DATA;
                end

                ST_DATA: begin
                    // shift out one byte from data_reg (32 bits)
                    rxd_reg   <= data_reg[7:0];
                    rx_dv_reg <= 1'b1;
                    data_reg  <= {8'd0, data_reg[31:8]};
                    byte_cnt  <= byte_cnt + 1;

                    if (byte_cnt == 3'd3) begin // 4 bytes per 32-bit word
                        // finished current word
                        if (hold_last) begin
                            // that was the last beat of the frame
                            state <= ST_IDLE;
                        end else if (s_axis_tvalid) begin
                            // fetch next beat immediately
                            data_reg   <= s_axis_tdata;
                            hold_last  <= s_axis_tlast;
                            byte_cnt   <= 0;
                            word_consumed <= 1'b1; // handshake
                        end else begin
                            // wait for next beat
                            state <= ST_DATA;
                        end
                    end
                end
            endcase
        end
    end

endmodule
