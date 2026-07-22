module sv_wrapper_fp_top(
    input   wire clk,
    input   wire rst,
    input   wire  valid, 
    input   wire [16-1:0]  tcp_dport,
    input   wire [32-1:0]  ip_dst,
    input   wire [32-1:0]  tcp_seq,
    input   wire [32-1:0]  tcp_ack,
    input   wire [16-1:0]  tcp_sport,
    input   wire [16-1:0]  tcp_window,
    input   wire [16-1:0]  ip_id,

    output  wire fp_det
);
    

  fp_top inst_fp_top (
    .clk       (clk       ),
    .rst       (rst_n     ),
    .valid     (valid     ),
    .tcp_window(tcp_window),
    .tcp_seq   (tcp_seq   ),
    .ip_id     (ip_id     ),
    .tcp_sport (tcp_sport ),
    .tcp_ack   (tcp_ack   ),
    .tcp_dport (tcp_dport ),
    .ip_dst    (ip_dst    ),
    .fp_det    (fp_det    )
  );


endmodule