`timescale 1ns/1ps

module preamble_det_tb();

//clock and rst
logic clk;
logic rst_n;

// DUT input     
 logic [64-1:0] rxd   ;  
 logic [7:0]    rxc; 
 
 logic [64-1:0] rxd_probe   ;  
 logic [7:0]    rxc_probe; 

 logic         rx_er ;       
 logic         empty ;      

 // DUT output
 logic detected; 


 string testname;

 // Instantiate DUT

 preamble_detector preamble_tb (
    .clk        (clk      ),
    .rst_n      (rst_n    ),
    .rxd        (rxd      ),
    .rxc        (rxc      ),
    .rx_er      (rx_er    ),
    .empty      (empty    ),
    .detected   (detected ),
    .preamble_probe(rxd_probe),
    .rxc_probe(rxc_probe)
 ); 

 localparam  PREAMBLE_LEN = 7  ;

 initial begin
    clk = 0;
    forever #2.5 clk = ~clk; // 200mhz
 end

 // send data and wait for one cycle
task automatic send_data(input [64-1:0] data);
    rxc = 8'b1;
    rxd = data; 
    @(posedge clk);
endtask 

task simple_det();
    $display ("running Baseline Preamble SFD Detection ...");
    // sending preamble
    send_data({8'hD5, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'hFB});
    // detected signal should be asserted
    if (detected)
        $display("Baseline Preamble SFD Detection test PASSED");
    else
        $display("Baseline Preamble SFD Detection test FAILED");
    
    // send_data(8'h00);

    @(posedge clk);
    @(posedge clk);

endtask

// TEST SELECTION AND EXECUTION

initial begin
        rst_n = 0;
        rx_er = 1;
        empty = 1;
        #65;
        rst_n = 1;
        rxd = '0;
        rx_er = 0;
        empty = 0;
        @(posedge clk);
    // if no testname is specified then run baseline test
    if(!$value$plusargs("TESTNAME=%s =" ,testname)) begin
        $display("no testname was specified hence running BASELINE PREAMBLE SFD TEST ...");
        testname = "SIMPLE_DETECTION";
    end
    else 
        $display("Testname provided. now running Test = %s", testname);
     
     // case statement for execution 
    case(testname)

        "SIMPLE_DETECTION" : simple_det();
        
        default : $fatal(1, "ERROR: INVALID TESTNAME: %s",testname );

    endcase

    #100ns;
    $stop;
end

endmodule