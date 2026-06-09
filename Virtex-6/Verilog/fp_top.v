// Auto-Generated top module for the syn-det generator 

module fp_top (
  input clk,
  input rst,
  input valid, 
  input [15:0] tcp_dport,
  input [31:0] ip_dst,
  input [31:0] tcp_seq,
  input [31:0] tcp_ack,
  input [15:0] tcp_sport,
  input [15:0] tcp_window,
  input [15:0] ip_id,
  output reg [15:0] fp_num0,
  output reg [15:0] fp_num1,
  output reg [15:0] fp_num2,
  output reg [15:0] fp_num3,
  output reg [15:0] fp_num4,
  output reg [15:0] fp_num5,
  output reg [15:0] fp_num6,
  output reg [15:0] fp_num7,
  output reg [15:0] fp_num8,
  output reg [15:0] fp_num9,
  output reg [15:0] fp_num10,
  output reg [15:0] fp_num11,
  output reg [15:0] fp_num12,
  output reg [15:0] fp_num13,
  output reg [15:0] fp_num14,
  output reg [15:0] fp_num15,
  output reg [15:0] fp_num16,
  output reg [15:0] fp_num17,
  output reg fp_det
);

// Internal detection wires
wire fp_detected_0;
wire fp_detected_1;
wire fp_detected_2;
wire fp_detected_3;
wire fp_detected_4;
wire fp_detected_5;
wire fp_detected_6;
wire fp_detected_7;
wire fp_detected_8;
wire fp_detected_9;
wire fp_detected_10;
wire fp_detected_11;
wire fp_detected_12;
wire fp_detected_13;
wire fp_detected_14;
wire fp_detected_15;
wire fp_detected_16;
wire fp_detected_17;

// Module instantiations (unchanged)
gen_number_0 inst_gen_number_0 (
    .clk(clk),
    .valid(valid),
    .ip_dst(ip_dst),
    .tcp_seq(tcp_seq),
    .fp_detected(fp_detected_0)
); 

gen_number_1 inst_gen_number_1 (
    .clk(clk),
    .valid(valid),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_1)
); 

gen_number_2 inst_gen_number_2 (
    .clk(clk),
    .valid(valid),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_2)
); 

gen_number_3 inst_gen_number_3 (
    .clk(clk),
    .valid(valid),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_3)
); 

gen_number_4 inst_gen_number_4 (
    .clk(clk),
    .valid(valid),
    .ip_dst(ip_dst),
    .tcp_seq(tcp_seq),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_4)
); 

gen_number_5 inst_gen_number_5 (
    .clk(clk),
    .valid(valid),
    .tcp_seq(tcp_seq),
    .fp_detected(fp_detected_5)
); 

gen_number_6 inst_gen_number_6 (
    .clk(clk),
    .valid(valid),
    .tcp_seq(tcp_seq),
    .fp_detected(fp_detected_6)
); 

gen_number_7 inst_gen_number_7 (
    .clk(clk),
    .valid(valid),
    .tcp_seq(tcp_seq),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_7)
); 

gen_number_8 inst_gen_number_8 (
    .clk(clk),
    .valid(valid),
    .tcp_dport(tcp_dport),
    .tcp_sport(tcp_sport),
    .tcp_window(tcp_window),
    .tcp_seq(tcp_seq),
    .tcp_ack(tcp_ack),
    .ip_id(ip_id),
    .fp_detected(fp_detected_8)
); 

gen_number_9 inst_gen_number_9 (
    .clk(clk),
    .valid(valid),
    .ip_id(ip_id),
    .tcp_window(tcp_window),
    .tcp_seq(tcp_seq),
    .tcp_ack(tcp_ack),
    .tcp_sport(tcp_sport),
    .fp_detected(fp_detected_9)
); 

gen_number_10 inst_gen_number_10 (
    .clk(clk),
    .valid(valid),
    .ip_id(ip_id),
    .tcp_window(tcp_window),
    .tcp_seq(tcp_seq),
    .tcp_ack(tcp_ack),
    .tcp_sport(tcp_sport),
    .fp_detected(fp_detected_10)
); 

gen_number_11 inst_gen_number_11 (
    .clk(clk),
    .valid(valid),
    .ip_dst(ip_dst),
    .tcp_dport(tcp_dport),
    .tcp_ack(tcp_ack),
    .ip_id(ip_id),
    .tcp_window(tcp_window),
    .tcp_sport(tcp_sport),
    .fp_detected(fp_detected_11)
); 

gen_number_12 inst_gen_number_12 (
    .clk(clk),
    .valid(valid),
    .ip_dst(ip_dst),
    .tcp_dport(tcp_dport),
    .tcp_ack(tcp_ack),
    .ip_id(ip_id),
    .fp_detected(fp_detected_12)
); 

gen_number_13 inst_gen_number_13 (
    .clk(clk),
    .valid(valid),
    .tcp_window(tcp_window),
    .tcp_ack(tcp_ack),
    .fp_detected(fp_detected_13)
); 

gen_number_14 inst_gen_number_14 (
    .clk(clk),
    .valid(valid),
    .ip_dst(ip_dst),
    .tcp_dport(tcp_dport),
    .ip_id(ip_id),
    .tcp_seq(tcp_seq),
    .fp_detected(fp_detected_14)
); 

gen_number_15 inst_gen_number_15 (
    .clk(clk),
    .valid(valid),
    .ip_id(ip_id),
    .fp_detected(fp_detected_15)
); 

gen_number_16 inst_gen_number_16 (
    .clk(clk),
    .valid(valid),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_16)
); 

gen_number_17 inst_gen_number_17 (
    .clk(clk),
    .valid(valid),
    .tcp_seq(tcp_seq),
    .ip_id(ip_id),
    .tcp_window(tcp_window),
    .fp_detected(fp_detected_17)
); 

// Counters
always @(posedge clk) begin
    if (rst == 0) begin
        fp_num0  <= 0;  fp_num1  <= 0;  fp_num2  <= 0;  fp_num3  <= 0;
        fp_num4  <= 0;  fp_num5  <= 0;  fp_num6  <= 0;  fp_num7  <= 0;
        fp_num8  <= 0;  fp_num9  <= 0;  fp_num10 <= 0;  fp_num11 <= 0;
        fp_num12 <= 0;  fp_num13 <= 0;  fp_num14 <= 0;  fp_num15 <= 0;
        fp_num16 <= 0;  fp_num17 <= 0;
    end else begin
        if (fp_detected_0)  fp_num0  <= fp_num0  + 1;
        if (fp_detected_1)  fp_num1  <= fp_num1  + 1;
        if (fp_detected_2)  fp_num2  <= fp_num2  + 1;
        if (fp_detected_3)  fp_num3  <= fp_num3  + 1;
        if (fp_detected_4)  fp_num4  <= fp_num4  + 1;
        if (fp_detected_5)  fp_num5  <= fp_num5  + 1;
        if (fp_detected_6)  fp_num6  <= fp_num6  + 1;
        if (fp_detected_7)  fp_num7  <= fp_num7  + 1;
        if (fp_detected_8)  fp_num8  <= fp_num8  + 1;
        if (fp_detected_9)  fp_num9  <= fp_num9  + 1;
        if (fp_detected_10) fp_num10 <= fp_num10 + 1;
        if (fp_detected_11) fp_num11 <= fp_num11 + 1;
        if (fp_detected_12) fp_num12 <= fp_num12 + 1;
        if (fp_detected_13) fp_num13 <= fp_num13 + 1;
        if (fp_detected_14) fp_num14 <= fp_num14 + 1;
        if (fp_detected_15) fp_num15 <= fp_num15 + 1;
        if (fp_detected_16) fp_num16 <= fp_num16 + 1;
        if (fp_detected_17) fp_num17 <= fp_num17 + 1;
    end
end

// Detection OR logic
always @(posedge clk) begin
    fp_det <= fp_detected_0  || fp_detected_1  || fp_detected_2  ||
              fp_detected_3  || fp_detected_4  || fp_detected_5  ||
              fp_detected_6  || fp_detected_7  || fp_detected_8  ||
              fp_detected_9  || fp_detected_10 || fp_detected_11 ||
              fp_detected_12 || fp_detected_13 || fp_detected_14 ||
              fp_detected_15 || fp_detected_16 || fp_detected_17;
end

endmodule
