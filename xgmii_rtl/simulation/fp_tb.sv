`timescale 1ns/1ps

module fp_tb();

//clk rst
logic clk;
logic rst_n;

//DUT input

logic [16-1:0]  tcp_dport   ;            
logic [32-1:0]  ip_dst      ;        
logic [32-1:0]  tcp_seq     ;        
logic [32-1:0]  tcp_ack     ;        
logic [16-1:0]  tcp_sport   ;            
logic [16-1:0]  tcp_window  ;            
logic [16-1:0]  ip_id       ;  
logic           valid       ;      

//DUT output 

logic [16-1:0]  fp_num0  ;   
logic [16-1:0]  fp_num1  ;   
logic [16-1:0]  fp_num2  ;   
logic [16-1:0]  fp_num3  ;   
logic [16-1:0]  fp_num4  ;   
logic [16-1:0]  fp_num5  ;   
logic [16-1:0]  fp_num6  ;   
logic [16-1:0]  fp_num7  ;   
logic [16-1:0]  fp_num8  ;   
logic [16-1:0]  fp_num9  ;   
logic [16-1:0]  fp_num10 ;       
logic [16-1:0]  fp_num11 ;       
logic [16-1:0]  fp_num12 ;       
logic [16-1:0]  fp_num13 ;       
logic [16-1:0]  fp_num14 ;       
logic [16-1:0]  fp_num15 ;       
logic [16-1:0]  fp_num16 ;       
logic [16-1:0]  fp_num17 ;       
logic           fp_det   ;

// FP top Instantiation 

fp_top fp_dut (
    .clk        (clk),
    .rst        (rst_n),
    .valid      (valid         ),              
    .tcp_dport  (tcp_dport     ),         
    .ip_dst     (ip_dst        ),           
    .tcp_seq    (tcp_seq       ),             
    .tcp_ack    (tcp_ack       ),             
    .tcp_sport  (tcp_sport     ),         
    .tcp_window (tcp_window    ),       
    .ip_id      (ip_id         ),             
    .fp_num0    (fp_num0       ),             
    .fp_num1    (fp_num1       ),             
    .fp_num2    (fp_num2       ),             
    .fp_num3    (fp_num3       ),             
    .fp_num4    (fp_num4       ),             
    .fp_num5    (fp_num5       ),             
    .fp_num6    (fp_num6       ),             
    .fp_num7    (fp_num7       ),             
    .fp_num8    (fp_num8       ),             
    .fp_num9    (fp_num9       ),             
    .fp_num10   (fp_num10      ),           
    .fp_num11   (fp_num11      ),           
    .fp_num12   (fp_num12      ),           
    .fp_num13   (fp_num13      ),           
    .fp_num14   (fp_num14      ),           
    .fp_num15   (fp_num15      ),           
    .fp_num16   (fp_num16      ),           
    .fp_num17   (fp_num17      ),           
    .fp_det     (fp_det        )        
);
// clock for 200mhz

 initial begin
    clk = 0;
    forever #2.5 clk = ~clk; // 200mhz
 end

 //reset 
 initial begin 
    rst_n = 0;
    #10;
    rst_n = 1;
 end

 // task to display value of the functions
 task automatic display_fp(input logic [16-1:0] fp_num_value, input string fp_num);
   // every fp_num takes 1 clock cycles
   // @(posedge clk);
   @(posedge clk);
   $display("The %s is now %d", fp_num, fp_num_value);
endtask

task automatic display_case(input logic [16-1:0] fp_num_value, input string fp_num, input logic [8-1:0] case_num);
   @(posedge clk);
   $display("Testing Case: %0d. The %s is now %d", case_num, fp_num, fp_num_value);
endtask

task automatic tcp_window_value(input logic [15:0] tcp_window_data);
   tcp_window = tcp_window_data;
   @(posedge clk);
   tcp_window = '0;
endtask

 initial begin 
    tcp_dport   = '0;
    ip_dst      = '0;              
    tcp_seq     = '0;             
    tcp_ack     = '0;             
    tcp_sport   = '0;               
    tcp_window  = '0;              
    ip_id       = '0;    
    valid       = '0;
    #10;
    @(posedge clk);
    
    //Case 0
    
    display_case(fp_num0, "FP number 0", 0);
    valid = 1;
    ip_dst = '1;
    tcp_seq = '0;
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num0,"FP number 0");

   //  @(posedge clk);
   //  ip_dst = '1;
   //  tcp_seq = '1;
   //  display_fp(fp_num0,"FP number 0");

   //Case 1
    display_case(fp_num1, "FP number 1", 1);
    @(posedge clk);
    tcp_window_value(14600);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num1,"FP number 1");
   
   //Case 2
   
    display_case(fp_num2, "FP number 2", 2);
    @(posedge clk);
    tcp_window_value(29040);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num2,"FP number 2");

   //Case 3

    display_case(fp_num3, "FP number 3", 3);
    @(posedge clk);
    tcp_window_value (14520);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num3,"FP number 3");

   //Case 4

    display_case(fp_num4, "FP number 4", 4);
    @(posedge clk);
    ip_dst = '0;
    tcp_seq = 3232235778;
    tcp_window_value(1300);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num4,"FP number 4");

   //Case 5
    display_case(fp_num5, "FP number 5", 5);
    @(posedge clk);
    tcp_seq = 2018915346;
    ip_dst = '1;
    tcp_window_value(2900);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num5,"FP number 5");

   //Case 6

    display_case(fp_num6, "FP number 6", 6);
    @(posedge clk);
    tcp_seq = 333994513;
    ip_dst = '1;
    tcp_window_value(1300);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num6,"FP number 6");

   //Case 7

    display_case(fp_num7, "FP number 7", 7);
    @(posedge clk);
    tcp_seq = 3000;
    ip_dst = '1;
    tcp_window_value(65535);
    @(posedge clk);
    @(posedge clk);
    display_fp(fp_num7,"FP number 7");

   //Case 8

   display_case(fp_num8, "FP number 8", 8);
   @(posedge clk);
   tcp_dport = 5431;
   tcp_sport = 6;
   tcp_seq = 0;
   tcp_ack = 0;
   ip_id = 54321;
   tcp_window_value(65535);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num8,"FP number 8");

   //Case 9

   display_case(fp_num9, "FP number 9", 9);
   @(posedge clk);
   ip_id = 256;
   tcp_seq = 0;
   tcp_ack = 0;
   tcp_sport = 6000;
   tcp_window_value(16384);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num9,"FP number 9");

   //Case 10

   display_case(fp_num10, "FP number 10", 10);
   @(posedge clk);
   ip_id = 256;
   tcp_seq = 0;
   tcp_ack = 0;
   tcp_sport = 6000;
   tcp_window_value(16384);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num10,"FP number 10");

   //Case 11

   display_case(fp_num11, "FP number 11", 11);
   @(posedge clk);
   tcp_dport = 0;
   ip_dst = 0;
   tcp_ack = 1;
   ip_id = 0;
   tcp_sport = 80;
   tcp_window_value(17520);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num11,"FP number 11");

   //Case 12

   display_case(fp_num12, "FP number 12", 12);
   @(posedge clk);
   tcp_dport = 0;
   ip_dst = 0;
   tcp_ack = 1;
   ip_id = 38993;
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num12,"FP number 12");

   //Case 13

   display_case(fp_num13, "FP number 13", 13);
   @(posedge clk);
   tcp_ack = 0;
   tcp_window_value(1300);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num13,"FP number 13");

   //Case 14

   display_case(fp_num14, "FP number 14", 14);
   @(posedge clk);
   tcp_dport = 0;
   ip_id = 0;
   tcp_seq = 0;
   ip_dst = 0;
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num14,"FP number 14");

   //Case 15

   display_case(fp_num15, "FP number 15", 15);
   @(posedge clk);
   ip_id = 54321;
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num15,"FP number 15");

   //Case 16

   display_case(fp_num16, "FP number 16", 16);
   @(posedge clk);
   tcp_window_value(0);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num16,"FP number 16");

   //Case 17

   display_case(fp_num17, "FP number 17", 17);
   @(posedge clk);
   tcp_seq = 100;
   ip_id = 123;
   tcp_window_value(1024);
   @(posedge clk);
   @(posedge clk);
   display_fp(fp_num17,"FP number 17");
    #10;
   //  $finish;
   $stop;

 end

 endmodule

    