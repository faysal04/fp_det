// Auto-Generated top module for the syn-det generator 

module fp_top (
  input bit clk,
  input bit rst,
  input   bit  valid, 
  input   bit [16-1:0]  tcp_dport,
  input   bit [32-1:0]  ip_dst,
  input   bit [32-1:0]  tcp_seq,
  input   bit [32-1:0]  tcp_ack,
  input   bit [16-1:0]  tcp_sport,
  input   bit [16-1:0]  tcp_window,
  input   bit [16-1:0]  ip_id,
  output  logic [16-1:0]  fp_num0,
  output  logic [16-1:0]  fp_num1,
  output  logic [16-1:0]  fp_num2,
  output  logic [16-1:0]  fp_num3,
  output  logic [16-1:0]  fp_num4,
  output  logic [16-1:0]  fp_num5,
  output  logic [16-1:0]  fp_num6,
  output  logic [16-1:0]  fp_num7,
  output  logic [16-1:0]  fp_num8,
  output  logic [16-1:0]  fp_num9,
  output  logic [16-1:0]  fp_num10,
  output  logic [16-1:0]  fp_num11,
  output  logic [16-1:0]  fp_num12,
  output  logic [16-1:0]  fp_num13,
  output  logic [16-1:0]  fp_num14,
  output  logic [16-1:0]  fp_num15,
  output  logic [16-1:0]  fp_num16,
  output  logic [16-1:0]  fp_num17,
  output  logic fp_det
);
// Instantiation tempelate for module gen_number_0
	logic fp_detected_0;
	gen_number_0 inst_gen_number_0 (
		.clk(clk),
		.valid(valid),
		.ip_dst(ip_dst),
		.tcp_seq(tcp_seq),
		.fp_detected(fp_detected_0)
	); 

// Instantiation tempelate for module gen_number_1
	logic fp_detected_1;
	gen_number_1 inst_gen_number_1 (
		.clk(clk),
		.valid(valid),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_1)
	); 

// Instantiation tempelate for module gen_number_2
	logic fp_detected_2;
	gen_number_2 inst_gen_number_2 (
		.clk(clk),
		.valid(valid),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_2)
	); 

// Instantiation tempelate for module gen_number_3
	logic fp_detected_3;
	gen_number_3 inst_gen_number_3 (
		.clk(clk),
		.valid(valid),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_3)
	); 

// Instantiation tempelate for module gen_number_4
	logic fp_detected_4;
	gen_number_4 inst_gen_number_4 (
		.clk(clk),
		.valid(valid),
		.ip_dst(ip_dst),
		.tcp_seq(tcp_seq),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_4)
	); 

// Instantiation tempelate for module gen_number_5
	logic fp_detected_5;
	gen_number_5 inst_gen_number_5 (
		.clk(clk),
		.valid(valid),
		.tcp_seq(tcp_seq),
		.fp_detected(fp_detected_5)
	); 

// Instantiation tempelate for module gen_number_6
	logic fp_detected_6;
	gen_number_6 inst_gen_number_6 (
		.clk(clk),
		.valid(valid),
		.tcp_seq(tcp_seq),
		.fp_detected(fp_detected_6)
	); 

// Instantiation tempelate for module gen_number_7
	logic fp_detected_7;
	gen_number_7 inst_gen_number_7 (
		.clk(clk),
		.valid(valid),
		.tcp_seq(tcp_seq),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_7)
	); 

// Instantiation tempelate for module gen_number_8
	logic fp_detected_8;
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

// Instantiation tempelate for module gen_number_9
	logic fp_detected_9;
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

// Instantiation tempelate for module gen_number_10
	logic fp_detected_10;
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

// Instantiation tempelate for module gen_number_11
	logic fp_detected_11;
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

// Instantiation tempelate for module gen_number_12
	logic fp_detected_12;
	gen_number_12 inst_gen_number_12 (
		.clk(clk),
		.valid(valid),
		.ip_dst(ip_dst),
		.tcp_dport(tcp_dport),
		.tcp_ack(tcp_ack),
		.ip_id(ip_id),
		.fp_detected(fp_detected_12)
	); 

// Instantiation tempelate for module gen_number_13
	logic fp_detected_13;
	gen_number_13 inst_gen_number_13 (
		.clk(clk),
		.valid(valid),
		.tcp_window(tcp_window),
		.tcp_ack(tcp_ack),
		.fp_detected(fp_detected_13)
	); 

// Instantiation tempelate for module gen_number_14
	logic fp_detected_14;
	gen_number_14 inst_gen_number_14 (
		.clk(clk),
		.valid(valid),
		.ip_dst(ip_dst),
		.tcp_dport(tcp_dport),
		.ip_id(ip_id),
		.tcp_seq(tcp_seq),
		.fp_detected(fp_detected_14)
	); 

// Instantiation tempelate for module gen_number_15
	logic fp_detected_15;
	gen_number_15 inst_gen_number_15 (
		.clk(clk),
		.valid(valid),
		.ip_id(ip_id),
		.fp_detected(fp_detected_15)
	); 

// Instantiation tempelate for module gen_number_16
	logic fp_detected_16;
	gen_number_16 inst_gen_number_16 (
		.clk(clk),
		.valid(valid),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_16)
	); 

// Instantiation tempelate for module gen_number_17
	logic fp_detected_17;
	gen_number_17 inst_gen_number_17 (
		.clk(clk),
		.valid(valid),
		.tcp_seq(tcp_seq),
		.ip_id(ip_id),
		.tcp_window(tcp_window),
		.fp_detected(fp_detected_17)
	); 

	always@(posedge clk) begin
		if(rst == 0)
			fp_num0 <= 0;
		else if(fp_detected_0 == 1'b1) begin
			fp_num0 <= fp_num0 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num1 <= 0;
		else if(fp_detected_1 == 1'b1) begin
			fp_num1 <= fp_num1 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num2 <= 0;
		else if(fp_detected_2 == 1'b1) begin
			fp_num2 <= fp_num2 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num3 <= 0;
		else if(fp_detected_3 == 1'b1) begin
			fp_num3 <= fp_num3 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num4 <= 0;
		else if(fp_detected_4 == 1'b1) begin
			fp_num4 <= fp_num4 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num5 <= 0;
		else if(fp_detected_5 == 1'b1) begin
			fp_num5 <= fp_num5 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num6 <= 0;
		else if(fp_detected_6 == 1'b1) begin
			fp_num6 <= fp_num6 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num7 <= 0;
		else if(fp_detected_7 == 1'b1) begin
			fp_num7 <= fp_num7 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num8 <= 0;
		else if(fp_detected_8 == 1'b1) begin
			fp_num8 <= fp_num8 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num9 <= 0;
		else if(fp_detected_9 == 1'b1) begin
			fp_num9 <= fp_num9 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num10 <= 0;
		else if(fp_detected_10 == 1'b1) begin
			fp_num10 <= fp_num10 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num11 <= 0;
		else if(fp_detected_11 == 1'b1) begin
			fp_num11 <= fp_num11 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num12 <= 0;
		else if(fp_detected_12 == 1'b1) begin
			fp_num12 <= fp_num12 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num13 <= 0;
		else if(fp_detected_13 == 1'b1) begin
			fp_num13 <= fp_num13 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num14 <= 0;
		else if(fp_detected_14 == 1'b1) begin
			fp_num14 <= fp_num14 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num15 <= 0;
		else if(fp_detected_15 == 1'b1) begin
			fp_num15 <= fp_num15 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num16 <= 0;
		else if(fp_detected_16 == 1'b1) begin
			fp_num16 <= fp_num16 + 1; 
		end
	end
	always@(posedge clk) begin
		if(rst == 0)
			fp_num17 <= 0;
		else if(fp_detected_17 == 1'b1) begin
			fp_num17 <= fp_num17 + 1; 
		end
	end
	always@(posedge clk) begin
		fp_det <= fp_detected_0
				 || fp_detected_1
				 || fp_detected_2
				 || fp_detected_3
				 || fp_detected_4
				 || fp_detected_5
				 || fp_detected_6
				 || fp_detected_7
				 || fp_detected_8
				 || fp_detected_9
				 || fp_detected_10
				 || fp_detected_11
				 || fp_detected_12
				 || fp_detected_13
				 || fp_detected_14
				 || fp_detected_15
				 || fp_detected_16
				 || fp_detected_17
				;
	end
endmodule