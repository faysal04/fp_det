// module uart_tx #(
//     parameter CLK_FREQ = 200_000_000,
//     parameter BAUD_RATE = 115200
// )(
//     input wire [7:0] data_in,
//     input wire clk,
//     input wire rst_n,
//     input wire send,
    
//     output reg done,
//     output reg busy,
//     output [1:0] state_out,
//     output reg transition,
//     output reg tx_out

// );

// localparam integer CLKS_PER_BIT = CLK_FREQ / BAUD_RATE;

// localparam IDLE = 2'b00;
// localparam START = 2'b01;
// localparam DATA = 2'b10;
// localparam STOP = 2'b11;

// reg [1:0] state;
// assign state_out = state;


// reg [2:0] bit_index;
// reg [15:0] clk_counter;
// reg [7:0] tx_data;
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         state <= IDLE;
//         tx_out <= 1'b1;  // Idle state of UART tx_out is high
//         busy <= 1'b0;
//         clk_counter <= 0;
//         bit_index <= 0;
//         done <= 0;
//     end 
//     else begin 
//         //Sequence of events for tx_out: IDLE -> START -> SEND -> STOP. 
//         //IDLE -> Keep data bit high to show no transmission until send command is received. Move to START.
//         //START -> Send the start bit. Move to SEND.
//         //SEND -> Send each bit of the byte. Move to STOP once all 8 bits are sent.
//         //STOP -> Send the stop bit by setting the data bit high. Raise done flag
//         case (state)
//             IDLE: begin 
//                 tx_out <= 1'b1;
//                 busy <= 1'b0;
//                 clk_counter <= 0;
//                 bit_index <= 0;
//                 done <= 0;
//                 transition <= 1;
//                 if (send) begin
//                     tx_data <= data_in;
//                     state <= START;
//                 end
//             end

//             START: begin 
//                 tx_out <= 1'b0;  // Start bit
//                 if (clk_counter < CLKS_PER_BIT-1) begin
//                     clk_counter <= clk_counter + 1;
//                     transition <= 1;
//                     // done <= 0;
//                 end else begin
//                     clk_counter <= 0;
//                     state <= DATA;
//                     transition <= 0;
//                 end
//             end

//             DATA: begin 
//                 if (clk_counter < CLKS_PER_BIT-1) begin
//                     clk_counter <= clk_counter + 1;
//                     transition <= 1;
//                 end else begin
//                     clk_counter <= 0;
//                     if (bit_index < 7) begin
//                         tx_out <= tx_data[bit_index];
//                         bit_index <= bit_index + 1;
//                         transition <= 0;
//                     end else begin
//                         bit_index <= 0;
//                         state <= STOP;
//                     end
//                 end
//             end

//             STOP: begin
//                 tx_out <= 1'b1;  // Stop bit
//                 if (clk_counter < CLKS_PER_BIT-1) begin
//                     clk_counter <= clk_counter + 1;
//                     transition <= 1;
//                 end else begin
//                     clk_counter <= 0;
//                     state <= IDLE;
//                     done <= 1;
//                     transition <= 0;
//                 end
//             end

//             default: state <= IDLE;
//         endcase
//     end
// end


    
// endmodule