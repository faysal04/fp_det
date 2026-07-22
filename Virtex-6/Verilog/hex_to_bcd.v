//Double Dabble Hex to BCD Conversion
module bin2bcd (
    input clk,
    input start,
    input rst_n,

    input [15:0] binary,

    output reg [3:0] ten_thousands,
    output reg [3:0] thousands,
    output reg [3:0] hundreds,
    output reg [3:0] tens,
    output reg [3:0] units,
    output reg done,

    output [35:0] shift_reg_test //For debugging
);

reg [35:0] shift_reg;
reg [35:0] next_shift;
reg [4:0] count;
reg busy;

assign shift_reg_test = shift_reg;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        shift_reg <= 0;
        next_shift = 0;
        count <= 0;
        busy <= 0;
        ten_thousands <= 0;
        thousands <= 0;
        hundreds <= 0;
        tens <= 0;
        units <= 0;
    end
    else begin
        if (start && !busy) begin
        shift_reg <= {20'd0, binary};
        count <= 0;
        busy <= 1;
        done <= 0;
        end
        else if (busy) begin
            // Add-3 step
            next_shift = shift_reg;
            if (next_shift[19:16] >= 5) next_shift[19:16] = next_shift[19:16] + 3;
            if (next_shift[23:20] >= 5) next_shift[23:20] = next_shift[23:20] + 3;
            if (next_shift[27:24] >= 5) next_shift[27:24] = next_shift[27:24] + 3;
            if (next_shift[31:28] >= 5) next_shift[31:28] = next_shift[31:28] + 3;
            if (next_shift[35:32] >= 5) next_shift[35:32] = next_shift[35:32] + 3;

            // Shift
            //next_shift = next_shift << 1;
            count <= count + 1;
            shift_reg <= next_shift << 1;

            if (count == 16) begin
                busy <= 0;
                done <= 1;

                ten_thousands <= shift_reg[35:32];
                thousands     <= shift_reg[31:28];
                hundreds      <= shift_reg[27:24];
                tens          <= shift_reg[23:20];
                units         <= shift_reg[19:16];
            end
        end
    end
end

endmodule