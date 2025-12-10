module sv_wrapper_read_buffer(
    input  wire          clk     ,
    input  wire          rst_n       ,
    input  wire [ 8-1:0] rxd         ,
    input  wire          rx_dv       ,
    input  wire          rx_er       ,
    input  wire          empty       ,
    output wire [16-1:0] ip_id       ,
    output wire [32-1:0] ip_dst      ,
    output wire [16-1:0] tcp_src     ,
    output wire [16-1:0] tcp_dst     ,
    output wire [32-1:0] tcp_seq     ,
    output wire [32-1:0] tcp_ack     ,
    output wire [16-1:0] tcp_window  ,
    output wire          fields_valid,
    output wire          detected,
  output   wire [8-1:0] pipe_rxd ,
  output wire         pipe_rx_dv,
  output wire         pipe_rx_er,
  output wire         pipe_empty);



read_buffer inst_read_buffer (
    .clk     (clk                                 ),
    .rst_n       (rst_n                           ),
    .rxd         (rxd                             ),
    .rx_dv       (rx_dv                           ),
    .rx_er       (rx_er                           ),
    .empty       (empty                           ),
    .ip_id       (ip_id                           ),
    .ip_dst      (ip_dst                          ),
    .tcp_src     (tcp_src                         ),
    .tcp_dst     (tcp_dst                         ),
    .tcp_seq     (tcp_seq                         ),
    .tcp_ack     (tcp_ack                         ),
    .tcp_window  (tcp_window                      ),
    .fields_valid(fields_valid                    ),
    .detected    (detected                        ),
    .pipe_rxd    (pipe_rxd                        ),
    .pipe_rx_dv  (pipe_rx_dv                      ),
    .pipe_rx_er  (pipe_rx_er                      ),
    .pipe_empty  (pipe_empty                      )
  );
    
endmodule