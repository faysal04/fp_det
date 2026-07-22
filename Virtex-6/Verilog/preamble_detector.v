`timescale 1ns/1ps

module preamble_detector (
    input        clk,
    input        rst_n,
    input  [7:0] rxd,
    input        rx_er,
    input        empty,
    output reg   detected
);

    // Shift register for preamble bytes
    reg [7:0] preamble1;
    reg [7:0] preamble2;
    reg [7:0] preamble3;
    reg [7:0] preamble4;
    reg [7:0] preamble5;
    reg [7:0] preamble6;
    reg [7:0] preamble7;
    reg [7:0] preamble8;

    // Shift the preamble bytes
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            preamble1 <= 8'd0;
            preamble2 <= 8'd0;
            preamble3 <= 8'd0;
            preamble4 <= 8'd0;
            preamble5 <= 8'd0;
            preamble6 <= 8'd0;
            preamble7 <= 8'd0;
            preamble8 <= 8'd0;
        end else begin
            if (!empty) begin
                preamble8 <= preamble7;
                preamble7 <= preamble6;
                preamble6 <= preamble5;
                preamble5 <= preamble4;
                preamble4 <= preamble3;
                preamble3 <= preamble2;
                preamble2 <= preamble1;
                if (!rx_er)
                    preamble1 <= rxd;
                else
                    preamble1 <= 8'd0;
            end
        end
    end

    // Detect the preamble pattern: 0xD5 followed by seven 0x55 bytes
    always @(posedge clk) begin
        detected <= (preamble1 == 8'hD5) &&
                    (preamble2 == 8'h55) &&
                    (preamble3 == 8'h55) &&
                    (preamble4 == 8'h55) &&
                    (preamble5 == 8'h55) &&
                    (preamble6 == 8'h55) &&
                    (preamble7 == 8'h55) &&
                    (preamble8 == 8'h55);
    end

endmodule
