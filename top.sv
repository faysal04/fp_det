module top (
  input  logic          rx_er      ,
  input  logic          rx_dv      ,
  input  logic [ 8-1:0] rxd        ,
  input  logic          rx_clk     ,
  // gmii/mii control signals
  input  logic          crs        ,
  input  logic          col        ,
  // gmii/mii tx channel
  input  logic          tx_clk     ,
  output logic          tx_er      ,
  output logic          tx_en      ,
  output logic [ 8-1:0] txd        ,
  // mac control signals
  input  logic          clk        ,
  input  logic          rst_n      ,
  input  logic          link_active,
  // fp detector outputs
  output logic [16-1:0] fp_num0    ,
  output logic [16-1:0] fp_num1    ,
  output logic [16-1:0] fp_num2    ,
  output logic [16-1:0] fp_num3    ,
  output logic [16-1:0] fp_num4    ,
  output logic [16-1:0] fp_num5    ,
  output logic [16-1:0] fp_num6    ,
  output logic [16-1:0] fp_num7    ,
  output logic [16-1:0] fp_num8    ,
  output logic [16-1:0] fp_num9    ,
  output logic [16-1:0] fp_num10   ,
  output logic [16-1:0] fp_num11   ,
  output logic [16-1:0] fp_num12   ,
  output logic [16-1:0] fp_num13   ,
  output logic [16-1:0] fp_num14   ,
  output logic [16-1:0] fp_num15   ,
  output logic [16-1:0] fp_num16   ,
  output logic [16-1:0] fp_num17   ,
  output logic          fp_det
);


  logic [16-1:0] ip_id     ;
  logic [32-1:0] ip_dst    ;
  logic [16-1:0] tcp_sport ;
  logic [16-1:0] tcp_dport ;
  logic [32-1:0] tcp_ack   ;
  logic [32-1:0] tcp_seq   ;
  logic [16-1:0] tcp_window;
  logic          valid     ;

  mac inst_mac (
    .rx_er       (rx_er      ),
    .rx_dv       (rx_dv      ),
    .rxd         (rxd        ),
    .rx_clk      (rx_clk     ),
    .crs         (crs        ),
    .col         (col        ),
    .tx_clk      (tx_clk     ),
    .tx_er       (tx_er      ),
    .tx_en       (tx_en      ),
    .txd         (txd        ),
    .clk         (clk        ),
    .rst_n       (rst_n      ),
    .link_active (link_active),
    .ip_id       (ip_id      ),
    .ip_dst      (ip_dst     ),
    .tcp_src     (tcp_sport  ),
    .tcp_dst     (tcp_dport  ),
    .tcp_ack     (tcp_ack    ),
    .tcp_seq     (tcp_seq    ),
    .tcp_window  (tcp_window ),
    .fields_valid(valid      )
  );


// Instantiation tempelate for top module
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
    .fp_num0   (fp_num0   ),
    .fp_num1   (fp_num1   ),
    .fp_num2   (fp_num2   ),
    .fp_num3   (fp_num3   ),
    .fp_num4   (fp_num4   ),
    .fp_num5   (fp_num5   ),
    .fp_num6   (fp_num6   ),
    .fp_num7   (fp_num7   ),
    .fp_num8   (fp_num8   ),
    .fp_num9   (fp_num9   ),
    .fp_num10  (fp_num10  ),
    .fp_num11  (fp_num11  ),
    .fp_num12  (fp_num12  ),
    .fp_num13  (fp_num13  ),
    .fp_num14  (fp_num14  ),
    .fp_num15  (fp_num15  ),
    .fp_num16  (fp_num16  ),
    .fp_num17  (fp_num17  ),
    .fp_det    (fp_det    )
  );

endmodule