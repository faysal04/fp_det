`timescale 1ns / 1ps

module link_speed_tb();

    logic clk;
    logic rx_clk;
    logic rst_n;

    logic ready;
    logic speed;

    link_speed_detector dut (
        .clk_200(clk),
        .clk_det(rx_clk),
        .rst_n(rst_n),
        .ready(ready),
        .speed(speed)
    );

    //rx_clk = 125Mhz
    initial rx_clk = 0;
    always #3.2 rx_clk = ~rx_clk;

    // clk  = 200Mhz
    initial clk = 0;
    always #2.5 clk = ~clk;

    initial begin
        rst_n = 0;

        #16;

        rst_n = 1;
    end
endmodule
