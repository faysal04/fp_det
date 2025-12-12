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
    #65;
    rst_n = 1;
 end

 // task to display value of the functions
 task automatic display_fp(input logic [16-1:0] fp_num_value, input string fp_num);
   // every fp_num takes 1 clock cycles
   // @(posedge clk);
   @(posedge clk);
   $display("The %s is now %d", fp_num, fp_num_value);
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
    #70;
    @(posedge clk);
    valid = 1;
    ip_dst = '1;
    tcp_seq = '0;
    display_fp(fp_num0,"FP number 0");
    @(posedge clk);
    ip_dst = '1;
    tcp_seq = '1;
    display_fp(fp_num0,"FP number 0");
   tcp_window_value(14600);
    display_fp(fp_num1,"FP number 1");
    @(posedge clk);
    ip_dst = '0;
    tcp_seq = '1;
    display_fp(fp_num0,"FP number 0");
    @(posedge clk);
    tcp_window_value(29040);
    display_fp(fp_num2,"FP number 2");
    ip_dst = '1;
    tcp_seq = '0;
    display_fp(fp_num0,"FP number 0");
    @(posedge clk);
    @(posedge clk);
    tcp_window_value (14520);
    display_fp(fp_num3,"FP number 3");
    @(posedge clk);
    @(posedge clk);
    ip_dst = '0;
    tcp_seq = 3232235778;
    tcp_window_value(1300);
    display_fp(fp_num4,"FP number 4");
    @(posedge clk);
    tcp_seq = '0;
    ip_dst = '1;
    #150;
    $finish;

 end

 endmodule

    