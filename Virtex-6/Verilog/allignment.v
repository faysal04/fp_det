// NOTE: SFD is part of preamble in this case
`timescale 1ns/1ps

module allignment (
    input        clk,
    input        rst_n,
    input  [3:0] rxd,
    input        rx_er,
    output       detected
    // output [63:0] preamble
);

    // Preamble shift registers
    reg [3:0] preamble1;
    reg [3:0] preamble2;
    reg [3:0] preamble3;
    reg [3:0] preamble4;
    reg [3:0] preamble5;
    reg [3:0] preamble6;
    reg [3:0] preamble7;
    reg [3:0] preamble8;
    reg [3:0] preamble9;
    reg [3:0] preamble10;
    reg [3:0] preamble11;
    reg [3:0] preamble12;
    reg [3:0] preamble13;
    reg [3:0] preamble14;
    reg [3:0] preamble15;

    wire collect_byte;

    // Shift in preamble
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            preamble1  <= 4'b0;
            preamble2  <= 4'b0;
            preamble3  <= 4'b0;
            preamble4  <= 4'b0;
            preamble5  <= 4'b0;
            preamble6  <= 4'b0;
            preamble7  <= 4'b0;
            preamble8  <= 4'b0;
            preamble9  <= 4'b0;
            preamble10 <= 4'b0;
            preamble11 <= 4'b0;
            preamble12 <= 4'b0;
            preamble13 <= 4'b0;
            preamble14 <= 4'b0;
            preamble15 <= 4'b0;
        end else begin
            preamble15 <= preamble14;
            preamble14 <= preamble13;
            preamble13 <= preamble12;
            preamble12 <= preamble11;
            preamble11 <= preamble10;
            preamble10 <= preamble9;
            preamble9  <= preamble8;
            preamble8  <= preamble7;
            preamble7  <= preamble6;
            preamble6  <= preamble5;
            preamble5  <= preamble4;
            preamble4  <= preamble3;
            preamble3  <= preamble2;
            preamble2  <= preamble1;
            if (!rx_er)
                preamble1 <= rxd;
            else
                preamble1 <= 4'b0;
        end
    end

    // Check for preamble pattern
    // assign collect_byte = (preamble1  == 4'hB) &&
    //                       (preamble2  == 4'hA) &&
    //                       (preamble3  == 4'hA) &&
    //                       (preamble4  == 4'hA) &&
    //                       (preamble5  == 4'hA) &&
    //                       (preamble6  == 4'hA) &&
    //                       (preamble7  == 4'hA) &&
    //                       (preamble8  == 4'hA) &&
    //                       (preamble9  == 4'hA) &&
    //                       (preamble10 == 4'hA) &&
    //                       (preamble11 == 4'hA) &&
    //                       (preamble12 == 4'hA) &&
    //                       (preamble13 == 4'hA) &&
    //                       (preamble14 == 4'hA) &&
    //                       (preamble15 == 4'hA) &&
    //                       (rxd == 4'hA) &&
    //                       (!rx_er);

        assign collect_byte = (preamble1  == 4'h5) &&
                          (preamble2  == 4'h5) &&
                          (preamble2  == 4'h5) &&
                          (preamble2  == 4'h5) &&
                          (preamble3  == 4'h5) &&
                          (preamble4  == 4'h5) &&
                          (preamble5  == 4'h5) &&
                          (preamble6  == 4'h5) &&
                          (preamble7  == 4'h5) &&
                          (preamble8  == 4'h5) &&
                          (preamble9  == 4'h5) &&
                          (preamble10 == 4'h5) &&
                          (preamble11 == 4'h5) &&
                          (preamble12 == 4'h5) &&
                          (preamble13 == 4'h5) &&
                          (preamble14 == 4'h5) &&
                          (preamble15 == 4'h5) &&
                          (rxd == 4'hD) &&
                          (!rx_er);

    assign detected = collect_byte;
    // assign preamble = {rxd, 
    //                     preamble15, 
    //                     preamble14, 
    //                     preamble13,
    //                     preamble12,
    //                     preamble11,
    //                     preamble10,
    //                     preamble9,
    //                     preamble8,
    //                     preamble7,
    //                     preamble6,
    //                     preamble5,
    //                     preamble4,
    //                     preamble3,
    //                     preamble2,
    //                     preamble1 };



endmodule
