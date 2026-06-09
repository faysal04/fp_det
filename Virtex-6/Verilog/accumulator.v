`timescale 1ns/1ps

module accumulator (
    input        clk_125,
    input        rst_n,
    input        accumlate,
    input  [7:0] data_in,
    input        error,
    input        valid,
    output       extern_preamble,
    output reg [7:0] data_out,
    output reg       out_error,
    output reg       out_valid,
    output           wen,
    // output [63:0] preamble,

    output state_probe,
    output [3:0] data_in_lsb_probe
);

    // Internal registers
    reg counter;
    reg inter_error;
    reg inter_valid;
    wire allign;
    assign extern_preamble = allign;

    // State machine
    localparam FOUND   = 1'b1;
    localparam LOOKING = 1'b0;
    reg state;

    // State update
    always @(posedge clk_125 or negedge rst_n) begin
        if (!rst_n) begin
            state <= LOOKING;
        end else begin
            if (allign) begin
                state <= FOUND;
            end
        end
    end

    // Main accumulator logic
    reg [3:0] lower_nibble;
    reg wen_next;
    always @(posedge clk_125 or negedge rst_n) begin
        if (!rst_n) begin
            data_out    <= 8'b0;
            wen_next    <= 1'b0;
            counter     <= 1'b0;
            inter_error <= 1'b0;
            inter_valid <= 1'b0;
            out_error   <= 1'b0;
            out_valid   <= 1'b0;
        end else begin
            if (!accumlate && state == FOUND) begin
                // wen <= wen_next;      // delayed write enable
                // wen_next <= 1'b0;
                if (counter == 0) begin
                    counter       <= 1'b1;
                    lower_nibble <= data_in[3:0];
                    inter_error   <= error;
                    inter_valid   <= valid;
                    wen_next      <= 1'b0;
                    out_error     <= 1'b0;
                    out_valid     <= 1'b0;
                end else if (counter == 1) begin
                    data_out <= {data_in[3:0], lower_nibble};
                    counter       <= 1'b0;
                    wen_next      <= 1'b1;
                    out_valid     <= inter_valid && valid;
                    out_error     <= inter_error || error;
                end
            end else if (!accumlate && state == LOOKING) begin
                counter <= 1'b0;
            end else begin
                data_out  <= data_in;
                out_valid <= valid;
                out_error <= error;
                wen_next       <= 1'b1;
            end
        end
    end
    // assign wen = (accumlate) ? wen_next : (counter == 1'b1);
    assign wen = wen_next;

    // Alignment module instantiation
    allignment inst_allignment (
        .clk     (clk_125),
        .rst_n   (rst_n),
        .rxd     (data_in[3:0]),
        .rx_er   (error),
        .detected(allign)
        // .preamble(preamble)
    );
    assign data_in_lsb_probe = counter;
    assign state_probe = wen;
endmodule
