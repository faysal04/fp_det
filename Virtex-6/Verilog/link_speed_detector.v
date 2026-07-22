`timescale 1ns/1ps

module link_speed_detector (
    input  clk_200,
    input  clk_det,
    input  rst_n,
    output reg speed,
    output reg ready
);

    reg [31:0] ref_counter;
    reg [31:0] det_counter;
    wire [31:0] syn_counter;
    reg [31:0] syn_counter_q;
    reg        async_reset;
    wire        sync_reset;

    reg condition1;
    reg condition2;
    reg condition3;
    reg condition4;

    // Condition generation
    always @(posedge clk_200) begin
        if (syn_counter_q > 32'd39999)
            condition1 <= 1'b1;
        else
            condition1 <= 1'b0;
    end

    always @(posedge clk_200) begin
        if (syn_counter_q <= 32'd10000 && syn_counter_q >= 32'd7000)
            condition2 <= 1'b1;
        else
            condition2 <= 1'b0;
    end

    always @(posedge clk_200) begin
        if (syn_counter_q <= 32'd1000 && syn_counter_q >= 32'd700)
            condition3 <= 1'b1;
        else
            condition3 <= 1'b0;
    end

    always @(posedge clk_200) begin
        if (ref_counter > 32'hFFFD)
            condition4 <= 1'b1;
        else
            condition4 <= 1'b0;
    end

    // Async reset generation and speed detection
    always @(posedge clk_200 or negedge rst_n) begin
        if (!rst_n) begin
            async_reset <= 1'b0;
            ref_counter <= 32'd0;
            speed       <= 1'b0;
            ready       <= 1'b0;
        end else begin
            if (ready == 1'b0) begin
                async_reset <= 1'b1;
                ref_counter <= ref_counter + 1'b1;
                if (condition4) begin
                    if (condition1) begin
                        speed <= 1'b1;
                        ready <= 1'b1;
                    end else if (condition2 || condition3) begin
                        speed <= 1'b0;
                        ready <= 1'b1;
                    end else begin
                        ref_counter <= 32'd0;
                        async_reset <= 1'b0;
                    end
                end
            end
        end
    end

    // Detection counter in clk_det domain
    always @(posedge clk_det or negedge sync_reset) begin
        if (!sync_reset)
            det_counter <= 32'd0;
        else
            det_counter <= det_counter + 1'b1;
    end

    // Synchronizer instances
    synchronizer #(.WIDTH(1)) inst_synchronizer_reset (
        .ref_clk (clk_det),
        .rst_n   (rst_n),
        .async_in(async_reset),
        .sync_out(sync_reset)
    );

    synchronizer #(.WIDTH(32)) inst_synchronizer_counter (
        .ref_clk (clk_200),
        .rst_n   (rst_n),
        .async_in(det_counter),
        .sync_out(syn_counter)
    );

    always @(posedge clk_200) begin
        syn_counter_q <= syn_counter;
    end

endmodule
