`timescale 1ns/1ps

module read_buffer_tb;

  // Clock and reset
  logic clk;
  logic rst_n;

  // DUT inputs
  logic [7:0] rxd;
  logic rx_dv;
  logic rx_er;
  logic empty;

  // DUT outputs
  logic [15:0] ip_id;
  logic [31:0] ip_dst;
  logic [15:0] tcp_src;
  logic [15:0] tcp_dst;
  logic [31:0] tcp_seq;
  logic [31:0] tcp_ack;
  logic [15:0] tcp_window;
  logic fields_valid;
  logic detected;
  logic [7:0] pipe_rxd;
  logic pipe_rx_dv;
  logic pipe_rx_er;
  logic pipe_empty;

  // Instantiate DUT
  read_buffer dut (
    .clk(clk),
    .rst_n(rst_n),
    .rxd(rxd),
    .rx_dv(rx_dv),
    .rx_er(rx_er),
    .empty(empty),
    .ip_id(ip_id),
    .ip_dst(ip_dst),
    .tcp_src(tcp_src),
    .tcp_dst(tcp_dst),
    .tcp_seq(tcp_seq),
    .tcp_ack(tcp_ack),
    .tcp_window(tcp_window),
    .fields_valid(fields_valid),
    .detected(detected),
    .pipe_rxd(pipe_rxd),
    .pipe_rx_dv(pipe_rx_dv),
    .pipe_rx_er(pipe_rx_er),
    .pipe_empty(pipe_empty)
  );

    initial begin
    #4000;
    $finish;
    end
  // 125 MHz clock generation (period = 8ns)
  initial clk = 0;
  always #4 clk = ~clk;

  // Dummy Ethernet packet (preamble + SFD + 14 bytes dest/src/type + 20 bytes IP + 20 bytes TCP)
  task send_ethernet_packet();
    integer i;
    reg [7:0] eth_header [0:13];
    reg [7:0] ip_header [0:19];
    reg [7:0] tcp_header [0:19];
    begin
      // Preamble (7x 0x55) + SFD (0xD5)
      rx_dv = 1;
      empty = 0;
      rx_er = 0;
      for (i = 0; i < 7; i = i + 1) begin
        rxd = 8'h55;
        @(posedge clk);
      end
      rxd = 8'hD5;
      @(posedge clk);
      // Ethernet header (dummy values)
      for (i = 0; i < 14; i = i + 1) begin
        eth_header[i] = 8'h11 + i;
        rxd = eth_header[i];
        @(posedge clk);
      end
      // IP header (dummy values)
      for (i = 0; i < 20; i = i + 1) begin
        ip_header[i] = 8'h21 + i;
        rxd = ip_header[i];
        @(posedge clk);
      end
      // TCP header (dummy values)
      for (i = 0; i < 20; i = i + 1) begin
        tcp_header[i] = 8'h31 + i;
        rxd = tcp_header[i];
        @(posedge clk);
      end
      // End of frame
      rx_dv = 0;
      empty = 1;
      rxd = 8'h00;
      repeat (2) @(posedge clk);
    end
  endtask

  // Test stimulus
  initial begin
    rst_n = 0;
    rxd = 8'h00;
    rx_dv = 0;
    rx_er = 0;
    empty = 1;
    #40;
    rst_n = 1;
    repeat (2) @(posedge clk);

    // Send dummy Ethernet packet
    send_ethernet_packet();

    // Wait and finish
    #200;
    $display("Testbench completed.");
    $finish;
  end

endmodule
