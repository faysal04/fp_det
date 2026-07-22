`timescale 1ns/1ps

module async_fifo #(
    parameter DSIZE = 10,
    parameter ASIZE = 6
)(
    input                  i_wclk,
    input                  i_wrst_n,
    input                  i_wr,
    input  [DSIZE-1:0]     i_wdata,
    output reg             o_wfull,
    input                  i_rclk,
    input                  i_rrst_n,
    input                  i_rd,
    output [DSIZE-1:0]     o_rdata,
    output reg             o_rempty
);

    // Write domain signals
    wire  [ASIZE-1:0] waddr;
    wire  [ASIZE-1:0] raddr;
    wire             wfull_next;
    wire             rempty_next;
    reg  [ASIZE:0]   wgray;
    reg  [ASIZE:0]   wbin;
    reg  [ASIZE:0]   wq2_rgray;
    reg  [ASIZE:0]   wq1_rgray;
    wire [ASIZE:0]   wgraynext;
    wire [ASIZE:0]   wbinnext;

    // Read domain signals
    reg  [ASIZE:0] rgray;
    reg  [ASIZE:0] rbin;
    reg  [ASIZE:0] rq2_wgray;
    reg  [ASIZE:0] rq1_wgray;
    wire [ASIZE:0] rgraynext;
    wire [ASIZE:0] rbinnext;

    // Memory
    reg [DSIZE-1:0] mem [0:(1<<ASIZE)-1];

    //
    // Cross the read Gray pointer into the write clock domain
    //
    initial begin
        wq2_rgray = 0;
        wq1_rgray = 0;
    end
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if (!i_wrst_n)
            {wq2_rgray, wq1_rgray} <= 0;
        else
            {wq2_rgray, wq1_rgray} <= {wq1_rgray, rgray};
    end

    // Calculate the next write address and Gray code pointer
    assign wbinnext  = wbin + { {(ASIZE){1'b0}}, ((i_wr) && (!o_wfull)) };
    assign wgraynext = (wbinnext >> 1) ^ wbinnext;
    assign waddr     = wbin[ASIZE-1:0];

    // Register write address and Gray code
    initial begin
        wbin  = 0;
        wgray = 0;
    end
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if (!i_wrst_n)
            {wbin, wgray} <= 0;
        else
            {wbin, wgray} <= {wbinnext, wgraynext};
    end

    assign wfull_next = (wgraynext == {~wq2_rgray[ASIZE:ASIZE-1], wq2_rgray[ASIZE-2:0]});

    initial o_wfull = 0;
    always @(posedge i_wclk or negedge i_wrst_n) begin
        if (!i_wrst_n)
            o_wfull <= 1'b0;
        else
            o_wfull <= wfull_next;
    end

    // Write to FIFO memory
    always @(posedge i_wclk) begin
        if ((i_wr) && (!o_wfull))
            mem[waddr] <= i_wdata;
    end

    //
    // Cross the write Gray pointer into the read clock domain
    //
    initial begin
        rq2_wgray = 0;
        rq1_wgray = 0;
    end
    always @(posedge i_rclk or negedge i_rrst_n) begin
        if (!i_rrst_n)
            {rq2_wgray, rq1_wgray} <= 0;
        else
            {rq2_wgray, rq1_wgray} <= {rq1_wgray, wgray};
    end

    // Calculate next read address and Gray code
    assign rbinnext  = rbin + { {(ASIZE){1'b0}}, ((i_rd) && (!o_rempty)) };
    assign rgraynext = (rbinnext >> 1) ^ rbinnext;
    assign raddr     = rbin[ASIZE-1:0];

    // Register read address and Gray code
    initial begin
        rbin  = 0;
        rgray = 0;
    end
    always @(posedge i_rclk or negedge i_rrst_n) begin
        if (!i_rrst_n)
            {rbin, rgray} <= 0;
        else
            {rbin, rgray} <= {rbinnext, rgraynext};
    end

    // Determine empty
    assign rempty_next = (rgraynext == rq2_wgray);
    initial o_rempty = 1'b1;
    always @(posedge i_rclk or negedge i_rrst_n) begin
        if (!i_rrst_n)
            o_rempty <= 1'b1;
        else
            o_rempty <= rempty_next;
    end

    // Output read data
    assign o_rdata = mem[raddr];

endmodule
