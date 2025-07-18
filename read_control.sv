`include "preamble_detector.sv"

module read_control (
  input logic         clk       ,
  input logic         rst_n     ,
  input logic         start     ,
  input logic [8-1:0] rxd       ,
  input logic         rx_er     ,
  input logic         rx_dv     ,
  input logic         fifo_empty
);

  logic preamble_found;

  preamble_detector inst_preamble_detector (
    .clk    (clk           ),
    .rst_n  (rst_n         ),
    .rxd    (rxd           ),
    .rx_dv  (rx_dv         ),
    .rx_er  (rx_er         ),
    .empty  (fifo_empty    ),
    .collect(preamble_found)
  );

  logic          waddr_gen_enable;
  logic [11-1:0] waddr           ;
  logic          waddr_overflow  ;

  waddr_gen inst_waddr_gen (
    .clk     (clk             ),
    .rst_n   (rst_n           ),
    .enable  (waddr_gen_enable),
    .empty   (fifo_empty      ),
    .address (waddr           ),
    .overflow(waddr_overflow  )
  );

  logic          write_buffer;
  logic [32-1:0] buffer_out  ;

  buffer inst_buffer (
    .clk     (clk         ),
    .rst_n   (rst_n       ),
    .data_in (rxd         ),
    .rw      (write_buffer),
    .addr    (waddr       ),
    .data_out(buffer_out  )
  );



  logic [1-1:0] current_state    ;
  logic [1-1:0] next_state       ;
  logic         end_found        ;
  initial       end_found     = 0;

  localparam WAIT_PREAMBLE  = 0;
  localparam CAPTURE_PACKET = 1;


// state assignment
  always@(posedge clk, negedge rst_n) begin
    if(!rst_n) begin
      current_state <= WAIT_PREAMBLE;
    end
    else begin
      current_state <= next_state;
    end
  end


// next state logic

  always@(*) begin

    case(current_state)

      WAIT_PREAMBLE : begin
        if(preamble_found == 1) begin
          next_state = CAPTURE_PACKET;
        end
        else begin
          next_state = WAIT_PREAMBLE;
        end
      end

      CAPTURE_PACKET : begin
        if(end_found) begin
          next_state = WAIT_PREAMBLE;
        end
        else begin
          next_state = CAPTURE_PACKET;
        end
      end

    endcase // current_state

  end

endmodule