`include "link_speed_detector.sv"

module top_controller (
  //
  // main clock and reset for controller
  input  logic clk_200          ,
  input  logic clk_phy          ,
  input  logic rst_n            ,
  //
  // indicates that the link is up
  input  logic link_up          ,
  //
  // reset the fifo read and write
  output logic fifo_read_reset  ,
  output logic fifo_write_reset ,
  //
  // fifo write enable
  output logic ready,
  output logic use_byte
  //
);

localparam WAIT_LINK    = 3'b000;
localparam RESET_SPEED  = 3'b001;
localparam CHECK_SPEED  = 3'b010;
localparam RESET_FIFO   = 3'b011;
localparam ENABLE_WRITE = 3'b100;

logic [3-1:0] current_state;
logic [3-1:0] next_state   ;

logic [8-1:0] link_speed_reset_counter;
logic         link_counter_enable     ;


logic [8-1:0] fifo_reset_counter ;
logic         fifo_counter_enable;

logic link_speed_ready;
logic link_speed      ;
logic link_speed_reset;

always@(posedge clk_200) begin
  if(!rst_n) begin
    link_speed_reset_counter <= 0;
  end
  else begin
    if(link_counter_enable) begin
      link_speed_reset_counter <= link_speed_reset_counter + 1;
    end
    else begin
      link_speed_reset_counter <= 0;
    end
  end
end

always@(posedge clk_200) begin
  if(!rst_n) begin
    fifo_reset_counter <= 0;
  end
  else begin
    if(fifo_counter_enable) begin
      fifo_reset_counter <= fifo_reset_counter + 1;
    end
    else begin
      fifo_reset_counter <= 0;
    end
  end
end

// state assignment
always@(posedge clk_200) begin
  if(!rst_n) begin
    current_state <= WAIT_LINK;
  end
  else begin
    current_state <= next_state;
  end
end


// next state logic
always@(*) begin
  case(current_state)
    WAIT_LINK : begin
      if(link_up) begin
        next_state = RESET_SPEED;
      end
      else begin
        next_state = WAIT_LINK;
      end
    end // WAIT_LINK

    RESET_SPEED : begin
      if(link_speed_reset_counter >= 200) begin
        next_state = CHECK_SPEED;
      end
      else begin
        next_state = RESET_SPEED;
      end
    end // RESET SPEED

    CHECK_SPEED : begin
      if(link_speed_ready) begin
        next_state = RESET_FIFO;
      end
      else begin
        next_state = CHECK_SPEED;
      end
    end // CHECK SPEED

    RESET_FIFO : begin
      if(fifo_reset_counter >= 200) begin
        next_state = ENABLE_WRITE;
      end
      else begin
        next_state = RESET_FIFO;
      end
    end // RESET_FIFO

    ENABLE_WRITE : begin
      if(!rst_n) begin
        next_state = WAIT_LINK;
      end
      else begin
        next_state <= ENABLE_WRITE;
      end
    end // ENABLE_WRITE
  endcase // current_state
end

// state outputs
always@(posedge clk_200) begin
  if(current_state == WAIT_LINK) begin
    fifo_read_reset     <= 1;
    fifo_write_reset    <= 1;
    ready               <= 0;
    use_byte            <= 0;
    link_speed_reset    <= 1;
    link_counter_enable <= 0;
    fifo_counter_enable <= 0;
  end
  else if (current_state == RESET_SPEED) begin
    link_counter_enable <= 1;
    link_speed_reset    <= 0;
  end
  else if(current_state == CHECK_SPEED) begin
    link_counter_enable <= 0;
    link_speed_reset    <= 1;
    use_byte            <= link_speed;
  end
  else if (current_state == RESET_FIFO) begin
    fifo_read_reset     <= 0;
    fifo_write_reset    <= 0;
    fifo_counter_enable <= 1;
  end
  else if(current_state == ENABLE_WRITE) begin
    fifo_read_reset     <= 1;
    fifo_write_reset    <= 1;
    fifo_counter_enable <= 0;
    ready               <= 1'b1;
  end
end

link_speed_detector inst_link_speed_detector (
  .clk_200(clk_200         ),
  .clk_det(clk_phy         ),
  .rst_n  (link_speed_reset),
  .speed  (link_speed      ),
  .ready  (link_speed_ready)
);

endmodule