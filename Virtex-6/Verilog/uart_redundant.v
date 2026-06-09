//XXXXX,X = times fp detected 

module uart_fp (
    input reg [15:0] fp_num0,
    input reg [15:0] fp_num1,
    input reg [15:0] fp_num2,
    input reg [15:0] fp_num3,
    input reg [15:0] fp_num4,
    input reg [15:0] fp_num5,
    input reg [15:0] fp_num6,
    input reg [15:0] fp_num7,
    input reg [15:0] fp_num8,
    input reg [15:0] fp_num9,
    input reg [15:0] fp_num10,
    input reg [15:0] fp_num11,
    input reg [15:0] fp_num12,
    input reg [15:0] fp_num13,
    input reg [15:0] fp_num14,
    input reg [15:0] fp_num15,
    input reg [15:0] fp_num16,
    input reg [15:0] fp_num17,

    input rst_n,
    input clk,
    input update,

    output tx_out
);

reg [15:0] fp_storage [16:0]; //store all the fingerprint values
reg [4:0] char_idx; //Which char to send
reg [5:0] fp_sent; //which fingerprint to sent
reg send; //Send the signal to send data
reg done; //Signal to show data has been transmitted
reg [7:0] tx_data; //Tx reg for uart
reg [3:0] digits [4:0]; //Bin to dec conversion

reg [2:0] num_idx;

uart_tx tx_inst(
    .tx_data(tx_data),
    .clk(clk),
    .rst_n(rst_n),
    .send(send),
    .done(done),
    .tx_out(tx_out)
);

always @(posedge clk) begin
    if (!rst_n) begin
        fp_storage <= 0;
        char_idx <= 0;
        send <= 0;
        tx_data <= 0;
    end
    else begin
        if (update) begin
            //Update the values of all FP
            fp_storage[0] <= fp_num0;
            fp_storage[1] <= fp_num1;
            fp_storage[2] <= fp_num2;
            fp_storage[3] <= fp_num3;
            fp_storage[4] <= fp_num4;
            fp_storage[5] <= fp_num5;
            fp_storage[6] <= fp_num6;
            fp_storage[7] <= fp_num7;
            fp_storage[8] <= fp_num8;
            fp_storage[9] <= fp_num9;
            fp_storage[10] <= fp_num10;
            fp_storage[11] <= fp_num11;
            fp_storage[12] <= fp_num12;
            fp_storage[13] <= fp_num13;
            fp_storage[14] <= fp_num14;
            fp_storage[15] <= fp_num15;
            fp_storage[16] <= fp_num16;
            fp_storage[17] <= fp_num17;
        end
        if (char_idx == 11) begin
            char_idx <= 0;
            fp_sent <= fp_sent + 1;
        end

        if (fp_sent == 17) begin
            fp_sent <= 0;
        end
        
        if (char_idx == 2) begin
            //Send the fingerprint number
        end
        else if (char_idx > 5 && char_idx < 11) begin
            //Send the fp value
        end
        else begin
            if (done) begin
                tx_data <= char_to_send[char_idx];
                send <= 1;
                char_idx <= char_idx + 1;
            end
        end

    end
end
    
endmodule

//                for (i=0; i<5; i=i+1) begin
                //     digits[i] <= num % 10;
                //     num <= num / 10;
                // end