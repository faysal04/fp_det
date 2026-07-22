`timescale 1ns/1ps

module async_fifo_Xtb ();
    
    logic clk_156;
    logic rst_n;
    logic [63:0] data_in;
    logic [7:0]  control_in;
    logic [63:0] data_out;
    logic [7:0]  control_out;
    logic wen;
    logic bit_test;
    logic error;

    logic clk;
    logic full;
    logic [72:0] rdata;
    logic empty;
    logic [7:0] control;
    logic [63:0] data;
    logic async_error;

    accumulator accum_inst (
    .clk_156    (clk_156),
    .rst_n      (rst_n),
    .error     (error),
    .data_in    (data_in),
    .control_in (control_in),
    .data_out   (data_out),
    .control_out(control_out),
    .wen        (wen),
    .bit_test (bit_test)
    );

    async_fifo #(.DSIZE(73), .ASIZE(4)) inst_async_fifo (
    .i_wclk  (clk_156),
    .i_wrst_n(rst_n),
    .i_wr    (wen),
    .i_wdata ({error, control_out, data_out}),
    .o_wfull (full),
    .i_rclk  (clk),
    .i_rrst_n(rst_n),
    .i_rd    (1'b1),
    .o_rdata (rdata),
    .o_rempty(empty)
    );

    initial clk_156 = 0;
    always #3.2 clk_156 = ~clk_156; //156.25 MHz 

    initial clk = 0;
    always #2.5 clk = ~clk;

    always @(posedge clk) begin
        if (!empty) begin
            data = rdata[63:0];
            control = rdata[71:64];
            async_error = rdata[72];
        end
    end

    localparam [63:0] idle1 = 64'h0707070707070707;
    localparam [7:0] control_idle1 = 8'hff;

    localparam [63:0] sof1 = 64'hD5555555555555FB;
    localparam [7:0] control_sof1 = 8'h01;

    localparam [63:0] sof2 = 64'h555555fb07070707;
    localparam [7:0] control_sof2 = 8'h1f;

    localparam [63:0] sof3 = 64'hccccccccd5555555;
    localparam [7:0] control_sof3 = 8'h00;

    localparam [63:0] data_test1 = 64'hffffffffffffffff;
    localparam [7:0] control_test1 = 8'h00; 

    localparam [63:0] data_test2 = 64'h44444444ffffffff;
    localparam [7:0] control_test2 = 8'h00;

    localparam [63:0] err1 = 64'hfffffffffffeffff;
    localparam [7:0] control_err = 8'h04;

    localparam [63:0] eof = {8'h00, 8'h00, 8'h00, 8'hFD, 
                                8'h00, 8'h00, 8'h00, 8'h00};
    localparam [7:0] control_eof = 8'h10;
    initial begin
        rst_n = 0;
        data_in = idle1; //Checking idle word
        control_in = control_idle1;

        @(posedge clk_156);

        rst_n = 1;

        @(posedge clk_156);
        @(posedge clk_156);

        //Checking for sof word with sof at lane0

        data_in = sof1; 
        control_in = control_sof1;

        @(posedge clk_156);

        data_in = data_test1; 
        control_in = control_test1;

        @(posedge clk_156);

        data_in = data_test2; 
        control_in = control_test2;

        @(posedge clk_156);

        data_in = data_test1; 
        control_in = control_test1;

        @(posedge clk_156);

        data_in = data_test2; 
        control_in = control_test2;

        @(posedge clk_156);
        @(posedge clk_156);

        // rst_n = 0;
        data_in = idle1; 
        control_in = control_idle1;

        @(posedge clk_156);

        rst_n = 1;

        @(posedge clk_156);
        @(posedge clk_156);

         //Checking for sof word with sof at lane4

        data_in = sof2; 
        control_in = control_sof2;

        @(posedge clk_156);

        data_in = sof3; 
        control_in = control_sof3;

        @(posedge clk_156);

        data_in = data_test2; 
        control_in = control_test2;

        @(posedge clk_156);

        data_in = eof; 
        control_in = control_eof;

        // @(posedge clk_156);

        @(posedge clk_156);

        data_in = idle1; 
        control_in = control_idle1;

        @(posedge clk_156);


        @(posedge clk_156);
        @(posedge clk_156);
        @(posedge clk_156);
        @(posedge clk_156);
        @(posedge clk_156);
        @(posedge clk_156);
        @(posedge clk_156);

        $stop;
    end
endmodule