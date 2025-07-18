// NOTE: SFD is part of preamble in this case
module preamble_detector (
  input  logic         clk     ,
  input  logic         rst_n   ,
  input  logic [8-1:0] rxd     ,
  input  logic         rx_er   ,
  input  logic         empty   ,
  output logic         detected
);

  logic [8-1:0] preamble1;
  logic [8-1:0] preamble2;
  logic [8-1:0] preamble3;
  logic [8-1:0] preamble4;
  logic [8-1:0] preamble5;
  logic [8-1:0] preamble6;
  logic [8-1:0] preamble7;
  logic [8-1:0] preamble8;

  always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      preamble1 <= 0;
      preamble2 <= 0;
      preamble3 <= 0;
      preamble4 <= 0;
      preamble5 <= 0;
      preamble6 <= 0;
      preamble7 <= 0;
      preamble8 <= 0;
    end
    else begin
      if(!empty) begin
        preamble8 <= preamble7;
        preamble7 <= preamble6;
        preamble6 <= preamble5;
        preamble5 <= preamble4;
        preamble4 <= preamble3;
        preamble3 <= preamble2;
        preamble2 <= preamble1;
        if(!rx_er) begin
          preamble1 <= rxd;
        end
        else begin
          preamble1 <= 0;
        end
      end
    end
  end

  always@(posedge clk) begin
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