`timescale 1ns/1ps

module accumulator (
    input  logic        clk_156,
    input  logic        rst_n,
    input  logic [63:0] data_in,
    input  logic [7:0]  control_in,
    output logic [63:0] data_out,
    output logic [7:0]  control_out,
    output logic        wen,
    output logic        error,
    output logic        bit_test

);

    // Internal signals
    logic counter;
    logic inter_error;
    logic inter_valid;
    logic allign;
    logic combine;

    // assign extern_preamble = allign;

    // State machine
    localparam FOUND   = 1'b1;
    localparam LOOKING = 1'b0;

    logic state;
    logic combine_reg;

    logic lane_idle;
    assign  lane_idle = 
        (control_in[7] && data_in[56 +: 8] == 8'hFD) ||
        (control_in[6] && data_in[48 +: 8] == 8'hFD) ||
        (control_in[5] && data_in[40 +: 8] == 8'hFD) ||
        (control_in[4] && data_in[32 +: 8] == 8'hFD) ||
        (control_in[3] && data_in[24 +: 8] == 8'hFD) ||
        (control_in[2] && data_in[16 +: 8] == 8'hFD) ||
        (control_in[1] && data_in[8 +: 8] == 8'hFD)  ||
        (control_in[0] && data_in[0 +: 8] == 8'hFD);

    logic idle_now, idle_next;
    always @(posedge clk_156) begin
        {idle_next, idle_now} <= {idle_now, lane_idle};
    end

    // State update
    always @(posedge clk_156 or negedge rst_n) begin
        if (!rst_n) begin
            state <= LOOKING;
            combine_reg <= 0;
        end else begin
            if (allign) begin
                state <= FOUND;
            end

            if (combine) begin
                combine_reg <= combine;
            end

            else if (idle_next) begin
                state <= LOOKING;
                combine_reg <= combine;
            end
        
        end
    end

    logic lane_err;
    assign  lane_err = 
        (control_in[7] && data_in[56 +: 8] == 8'hFE) ||
        (control_in[6] && data_in[48 +: 8] == 8'hFE) ||
        (control_in[5] && data_in[40 +: 8] == 8'hFE) ||
        (control_in[4] && data_in[32 +: 8] == 8'hFE) ||
        (control_in[3] && data_in[24 +: 8] == 8'hFE) ||
        (control_in[2] && data_in[16 +: 8] == 8'hFE) ||
        (control_in[1] && data_in[8 +: 8] == 8'hFE)  ||
        (control_in[0] && data_in[0 +: 8] == 8'hFE);
        logic err_reg;

    always @(posedge clk_156 or negedge rst_n) begin
        if (!rst_n) begin
            err_reg <= 0;
        end
        else begin
            err_reg <= error;
        end
    end

    assign error = (lane_err || err_reg) && state;

    logic [63:0] data_d;
    logic [7:0] control_d;

    // Main accumulator logic
    logic [31:0] lower_word;
    logic [31:0] higher_word;
    logic [3:0] lower_control;
    logic [3:0] higher_control;
    logic       wen_next;

    always @(posedge clk_156 or negedge rst_n) begin
        if (!rst_n) begin
            lower_word <= 32'h07070707;
            lower_control <= 4'hf;
            wen    <= 1'b0;
            counter     <= 1'b0;
            data_out    <= 64'h0707070707070707;
            control_out <= 8'hff;
        end else begin
            if (state || allign) begin
                if (combine_reg || combine) begin //If sof is on lane/byte 4, combine the top word of previous cycle with lower word of next cycle
                    if (counter == 0) begin
                        counter <= 1'b1;
                        lower_word <= data_d[63:32];
                        lower_control <= control_d[7:4];
                        wen <= 1'b0;
                    end
                    else begin
                        lower_word <= data_d[63:32];
                        lower_control <= control_d[7:4];
                        wen <= 1'b1;
                        data_out <= {data_d[31:0], lower_word};
                        control_out <= {control_d[3:0], lower_control};
                    end
                end
                else begin //If sof is on lane/byte 0, pass through accumulator
                    data_out <= data_d;
                    control_out <= control_d;
                    wen <= 1'b1;
                end
            end
            else begin
                wen <= 1'b0;
                data_out <= 64'h0707070707070707;
                control_out <= 8'hff;
                lower_word <= 32'h07070707;
                lower_control <= 4'hf;
                counter <= 1'b0;
            end
        end
    end

    // assign wen = wen_next;
    // assign data_out = {higher_word, lower_word};
    // assign control_out = {higher_control, lower_control};

    // Alignment module instantiation
    allignment inst_allignment (
        .clk     (clk_156),
        .rst_n   (rst_n),
        .rxd     (data_in),
        .rxc     (control_in),

        .rxd_out (data_d),
        .rxc_out (control_d),
        .rx_er  (error),
        .detected(allign),
        .combine(combine)
    );

    assign bit_test = counter;
    assign lowerword = lower_word;

endmodule