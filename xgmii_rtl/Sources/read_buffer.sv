`timescale 1ns/1ps

module read_buffer (

    input  clk,
    input  rst_n,
    // xgmii interface
    input  [63:0] rxd, //tdata
    input         rx_dv, //  data valid
    input  [ 7:0] rxc, // control signal per byte
    input  rx_er, //tuser
    input  empty,
    output logic [15:0] ip_id,
    output logic [31:0] ip_dst,
    output logic [31:0] ip_src,
    output logic [15:0] tcp_src,
    output logic [15:0] tcp_dst,
    output logic [31:0] tcp_seq,
    output logic [31:0] tcp_ack,

    output logic [15:0]  packet_type  ,             
    output logic [3:0]   version      ,           
    output logic [3:0]   ihl          ,      
    output logic [7:0]   tcp_flags    ,           
    output logic [7:0]   protocol     , 
   
    output logic [15:0] tcp_window,
    output            fields_valid,
    output            detected,

    output logic [511:0] packet_logic,

    output logic [63:0] pipe4_probe,
    output logic [7:0] pipe4_rxc_probe,
    output logic [1:0] state_probe 
);
       // State machine for IFG
    localparam WAIT_PRE_1 = 2'b00,
               WAIT_PKT_1 = 2'b01,
               WAIT_PRE_2 = 2'b10,
               WAIT_PKT_2 = 2'b11;


    // packet fields        
    logic [431:0] packet       ;        
         
    // logic [1:0]   state_probe  ;             
    logic [7:0]   buffer_probe ;               
    logic [10:0]  counter_probe;

    logic [63:0]  pipe_rxd   ;
    logic [ 7:0]  pipe_rxc   ;
    logic         pipe_rx_dv ;
    logic         pipe_rx_er ;
    logic         pipe_empty ;
    logic         pipe_detected;
    // xgmii states
    logic [1:0] xgmii_currentstate;
    logic [1:0] xgmii_nextstate;
    logic terminate_detected;
    logic error_detected;

    //Pipeline variables
    logic [63:0] pipe2_rxd;
    logic [ 7:0] pipe2_rxc;
    logic       pipe2_rx_dv;
    logic       pipe2_rx_er;
    logic       pipe2_empty;
    
    logic [63:0] pipe3_rxd;
    logic [ 7:0] pipe3_rxc;
    logic       pipe3_rx_dv;
    logic       pipe3_rx_er;
    logic       pipe3_empty;

    logic [63:0] pipe4_rxd;
    logic [ 7:0] pipe4_rxc;
    logic       pipe4_rx_dv;
    logic       pipe4_rx_er;
    logic       pipe4_empty;

//------------------------------------------- XGMII STATES -------------------------------------//

// terminate logic

 assign terminate_detected = (
    (pipe4_rxc[0] && pipe4_rxd[7:0]   == 8'hFD) ||
    (pipe4_rxc[1] && pipe4_rxd[15:8]  == 8'hFD) ||
    (pipe4_rxc[2] && pipe4_rxd[23:16] == 8'hFD) ||
    (pipe4_rxc[3] && pipe4_rxd[31:24] == 8'hFD) ||
    (pipe4_rxc[4] && pipe4_rxd[39:32] == 8'hFD) ||
    (pipe4_rxc[5] && pipe4_rxd[47:40] == 8'hFD) ||
    (pipe4_rxc[6] && pipe4_rxd[55:48] == 8'hFD) ||
    (pipe4_rxc[7] && pipe4_rxd[63:56] == 8'hFD)
    );


    
   // error logic
   

    assign error_detected = (
    (pipe4_rxc[0] && pipe4_rxd[7:0]   == 8'hFE) ||
    (pipe4_rxc[1] && pipe4_rxd[15:8]  == 8'hFE) ||
    (pipe4_rxc[2] && pipe4_rxd[23:16] == 8'hFE) ||
    (pipe4_rxc[3] && pipe4_rxd[31:24] == 8'hFE) ||
    (pipe4_rxc[4] && pipe4_rxd[39:32] == 8'hFE) ||
    (pipe4_rxc[5] && pipe4_rxd[47:40] == 8'hFE) ||
    (pipe4_rxc[6] && pipe4_rxd[55:48] == 8'hFE) ||
    (pipe4_rxc[7] && pipe4_rxd[63:56] == 8'hFE)
    );
    
    // always_ff @(posedge clk or negedge rst_n) begin
    //     if (!rst_n)
    //         xgmii_currentstate <= IDLE;
    //     else
    //         xgmii_currentstate <= xgmii_nextstate;
    // end
    // always@(posedge clk) begin 
    //     xgmii_nextstate = xgmii_currentstate;
    //     case(xgmii_currentstate) 
    //         IDLE: begin
    //         if (!empty && pipe_detected)
    //             xgmii_nextstate = START;   
    //         else
    //             xgmii_nextstate = xgmii_currentstate;
    //         end
    //         START: begin
    //         if(terminate_detected)
    //             xgmii_nextstate = EOF;
    //         else if (error_detected)
    //             xgmii_nextstate = ERROR;
    //         else
    //             xgmii_nextstate = xgmii_currentstate;
    //         end
    //         EOF: begin
    //             xgmii_nextstate = IDLE;
    //         end
    //         ERROR: begin 
    //             xgmii_nextstate = IDLE;
    //         end
    //         default: xgmii_nextstate = IDLE;
    //     endcase
    // end

   
     



//------------------------------------------   PIPELINING -----------------------------------
    // Stage 1 pipeline logicisters
    always @(posedge clk) begin
        if (!rst_n) begin
            pipe_rxd   <= 0;
            pipe_rx_dv <= 0;
            pipe_rxc   <= 0;
            pipe_rx_er <= 0;
            pipe_empty <= 0;
        end else begin
            pipe_rxd   <= rxd;
            pipe_rx_dv <= rx_dv;
            pipe_rxc   <= rxc;
            pipe_rx_er <= rx_er;
            pipe_empty <= empty;
        end
    end

    // Stage 2 pipeline
    always @(posedge clk) begin
        pipe2_rxd   <= pipe_rxd;
        pipe2_rx_dv <= pipe_rx_dv;
        pipe2_rxc   <= pipe_rxc  ;
        pipe2_rx_er <= pipe_rx_er;
        pipe2_empty <= pipe_empty;
    end

    // Stage 3 pipeline
    always @(posedge clk) begin
        pipe3_rxd   <= pipe2_rxd;
        pipe3_rx_dv <= pipe2_rx_dv;
        pipe3_rxc   <= pipe2_rxc  ;
        pipe3_rx_er <= pipe2_rx_er;
        pipe3_empty <= pipe2_empty;
    end

    // Stage 4 pipeline
    always @(posedge clk) begin
        pipe4_rxd   <= pipe3_rxd;
        pipe4_rx_dv <= pipe3_rx_dv;
        pipe4_rxc   <= pipe3_rxc  ;
        pipe4_rx_er <= pipe3_rx_er;
        pipe4_empty <= pipe3_empty;
    end
//----------------------------------------- PREAMBLE DETECTOR ----------------------------------
    // Preamble detector
    preamble_detector inst_preamble_detector (
        .clk(clk),
        .rst_n(rst_n),
        .rxd(pipe_rxd),
        .rxc(pipe_rxc),
        .rx_er(pipe_rx_er),
        .empty(pipe_empty),
   
        .detected(detected)
    );

  

    always @(posedge clk) begin
    pipe_detected <= detected;
    // pipe_detected <= detected;
    end

//--------------------------------------------PACKET states----------------------------------------------------
 

    logic [1:0] current_state, next_state;
    // assign state_probe = current_state;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= WAIT_PRE_1;
        else
            current_state <= next_state;
    end




    // assign state_probe = current_state;
    always @(*) begin
        case(current_state)
            WAIT_PRE_1: next_state = (pipe_detected) ? WAIT_PKT_1 : WAIT_PRE_1;
            WAIT_PKT_1: next_state = (!pipe4_empty && (terminate_detected || error_detected)) ? WAIT_PRE_2 : WAIT_PKT_1;
            WAIT_PRE_2: next_state = (pipe_detected) ? WAIT_PKT_2 : WAIT_PRE_2;
            WAIT_PKT_2: next_state = (!pipe4_empty && (terminate_detected || error_detected)) ? WAIT_PRE_1 : WAIT_PKT_2;
        endcase
    end

    // Packet counter
    logic [10:0] counter;
    assign counter_probe = counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            counter <= 0;
        else if (!pipe4_empty) begin
            if (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)
                counter <= counter + 1'b1;
            else
                counter <= 0;
        end
    end

    logic [63:0] pipe4_reversed;

    
    genvar i;
    generate
        for (i = 0; i < 8; i++) begin : gen_rev
            assign pipe4_reversed[i*8 +: 8] = pipe4_rxd[(7 - i)*8 +: 8];
        end
    endgenerate

    // Headers
    logic [111:0] eth_header ;
    logic [159:0] ip_header  ;
    logic [159:0] tcp_header ;

    logic [7:0] eth_count, ip_count, tcp_count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            eth_count <= 0;
            ip_count  <= 0;
            tcp_count <= 0;
            packet_logic <= 431'd0;
            buffer_probe <= 0;
            // packet_byte_count <= 0;
        end else begin
            if(!pipe4_empty && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
            if (counter == 0) begin
                eth_header[63:0] <= pipe4_rx_er ? 8'd0 : pipe4_reversed;
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)}; //shift packet_logic by eight bytes and append byte
                // packet_logic <= { (pipe4_rx_er ? 8'd0 : pipe4_reversed), packet_logic[511:64]};
            end 
            else if ( counter == 1 ) begin
                eth_header[111:64] <= pipe4_rx_er ? 8'd0 : pipe4_reversed[47:0];
                ip_header[15:0] <= pipe4_rx_er ? 8'd0 : pipe4_reversed[63:48];
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end
             else if ( counter == 2) begin
                ip_header[79:16] <= pipe4_rx_er ? 8'd0 : pipe4_reversed;
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end 
            else if ( counter == 3) begin
                ip_header[143:80] <= pipe4_rx_er ? 8'd0 : pipe4_reversed;
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end 
           else if ( counter == 4) begin
                ip_header[159:144] <= pipe4_rx_er ? 8'd0 : pipe4_reversed[15:0];
                tcp_header[47:0] <= pipe4_rx_er ? 8'd0 : pipe4_reversed[63:16];
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end 
           else if ( counter == 5) begin
                tcp_header[111:48] <= pipe4_rx_er ? 8'd0 : pipe4_reversed;
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end 
           else if ( counter == 6) begin
                tcp_header[159:112] <= pipe4_rx_er ? 8'd0 : pipe4_reversed[47:0];
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
            end
           else if (counter == 7) begin
                packet_logic <= { packet_logic[447:0], (pipe4_rx_er ? 8'd0 : pipe4_reversed)};
           end 
            else if (!pipe4_empty) begin
                eth_count <= 0;
                ip_count  <= 0;
                tcp_count <= 0;
            end
            end
            if (!pipe_empty && (current_state == WAIT_PKT_1 || current_state == WAIT_PKT_2)) begin
                buffer_probe <= pipe_rxd;
            end

            
        end
    end


    // Packet processing
    logic process_1, process_2, process_1_delayed, process_2_delayed, process_1_pulse, process_2_pulse;
    assign process_1 = (current_state == WAIT_PRE_2) || (current_state == WAIT_PKT_2) || (current_state == WAIT_PRE_1);
    assign process_2 = (current_state == WAIT_PRE_1) || (current_state == WAIT_PKT_1) || (current_state == WAIT_PRE_2);

    always @(posedge clk) begin
        process_1_delayed <= process_1;
        process_2_delayed <= process_2;
    end

    always @(posedge clk) begin
        process_1_pulse = ~process_1_delayed && process_1;
        process_2_pulse = ~process_2_delayed && process_2; 
    end

    assign fields_valid = ((process_1_pulse || process_2_pulse) &&
                           (packet_type == 16'h0800 && version == 4 && ihl == 5 && protocol == 6 && tcp_flags[1] == 1));

    logic header_done = (counter == 6);
    initial begin
        packet <= 480'd0;
    end
    always @(posedge clk) begin
        packet_type <= packet_logic[415:400];
        {version, ihl} <= packet_logic[399:392];
        ip_id       <= packet_logic[367:352];
        protocol    <= packet_logic[327:320];
        ip_dst      <= packet_logic[271:240];
        ip_src      <= packet_logic[303:272] ;
        tcp_src     <= packet_logic[239:224];
        tcp_dst     <= packet_logic[223:208];
        tcp_seq     <= packet_logic[207:176];
        tcp_ack     <= packet_logic[175:144];
        tcp_flags   <= packet_logic[135:128];
        tcp_window  <= packet_logic[127:112];
   
        if (header_done) begin
            packet <= packet_logic;
        end
    end

assign pipe4_probe = pipe4_rxd;
assign pipe4_rxc_probe = pipe4_rxc;
assign state_probe = current_state;
endmodule



       