`timescale 1ns/1ps

module accum_tb();

  logic clk_156;
  logic rst_n;
  logic [63:0] data_in;
  logic [7:0]  control_in;
  logic [63:0] data_out;
  logic [7:0]  control_out;
  logic wen;
  logic bit_test;
  logic error;

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
//    .allign_probe(allign_probe)
  );


    initial clk_156 = 0;
    always #3.2 clk_156 = ~clk_156; //156.25 MHz 

    logic [63:0] idle1 = 64'h0707070707070707;
    logic [7:0] control_idle1 = 8'hff;

    logic [63:0] sof1 = 64'hD5555555555555FB;
    logic [7:0] control_sof1 = 8'h01;

    logic [63:0] sof2 = 64'h555555fb07070707;
    logic [7:0] control_sof2 = 8'h1f;

    logic [63:0] sof3 = 64'hccccccccd5555555;
    logic [7:0] control_sof3 = 8'h00;

    logic [63:0] data_test1 = 64'hffffffffffffffff;
    logic [7:0] control_test1 = 8'h00; 

    logic [63:0] data_test2 = 64'h44444444ffffffff;
    logic [7:0] control_test2 = 8'h00;

    logic [63:0] err1 = 64'hfffffffffffeffff;
    logic [7:0] control_err = 8'h04;

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

        data_in = err1; 
        control_in = control_err;

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