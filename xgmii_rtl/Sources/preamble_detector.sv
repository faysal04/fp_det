`timescale 1ns/1ps

module preamble_detector (
    input         clk,
    input         rst_n,
    input  [63:0] rxd,
    input  [ 7:0] rxc,
    input         rx_er,
    input         empty,
  
    output logic detected
);

    // Shift register for preamble bytes

    logic [ 7:0] rxc1;
    logic [63:0] preamble1;

    // Shift the preamble bytes
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            preamble1 <= 64'd0;
            rxc1 <= '0;
        end else begin
            if (!empty) begin
                if (!rx_er) begin
                    preamble1 <= rxd;
                    rxc1 <= rxc;
                 end
                else begin
                    preamble1 <= 64'd0;
                     rxc1 <= '0;
                end
            end
        end
    end

    // Detect the preamble pattern: 0xD5 followed by six 0x55 and one 0xFB bytes for xgmii and control bit is 1
    always @(posedge clk) begin
        detected <= (preamble1 == 64'hD5555555555555FB) && (rxc1 == 8'b1);
    end 

endmodule
