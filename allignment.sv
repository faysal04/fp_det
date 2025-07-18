// NOTE: SFD is part of preamble in this case
module allignment (
  input  logic         clk     ,
  input  logic         rst_n   ,
  input  logic [4-1:0] rxd     ,
  input  logic         rx_er   ,
  output logic         detected
);

  logic [4-1:0] preamble1;
  logic [4-1:0] preamble2;
  logic [4-1:0] preamble3;
  logic [4-1:0] preamble4;
  logic [4-1:0] preamble5;
  logic [4-1:0] preamble6;
  logic [4-1:0] preamble7;
  logic [4-1:0] preamble8;
  logic [4-1:0] preamble9;
  logic [4-1:0] preamble10;
  logic [4-1:0] preamble11;
  logic [4-1:0] preamble12;
  logic [4-1:0] preamble13;
  logic [4-1:0] preamble14;
  logic [4-1:0] preamble15;


  logic collect_byte  ;

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
      preamble9 <= 0;
      preamble10 <= 0;
      preamble11 <= 0;
      preamble12 <= 0;
      preamble13 <= 0;
      preamble14 <= 0;
      preamble15 <= 0;
    end
    else begin
      preamble15 <= preamble14;
      preamble14 <= preamble13;
      preamble13 <= preamble12;
      preamble12 <= preamble11;
      preamble11 <= preamble10;
      preamble10 <= preamble9;
      preamble9 <= preamble8;
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

  assign collect_byte = (preamble1 == 4'hB) &&
    (preamble2 == 4'hA) &&
    (preamble3 == 4'hA) &&
    (preamble4 == 4'hA) &&
    (preamble5 == 4'hA) &&
    (preamble6 == 4'hA) &&
    (preamble7 == 4'hA) &&
    (preamble8 == 4'hA) &&
    (preamble9 == 4'hA) &&
    (preamble10 == 4'hA) &&
    (preamble11 == 4'hA) &&
    (preamble12 == 4'hA) &&
    (preamble13 == 4'hA) &&
    (preamble14 == 4'hA) &&
    (preamble15 == 4'hA) &&
    (rxd == 8'hA && !rx_er);

  assign detected = collect_byte;


endmodule