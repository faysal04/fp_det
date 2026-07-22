`timescale 1ns/1ps

module async_fifo #(
    parameter DSIZE = 10,
    parameter ASIZE = 6
)(
    input  logic                 i_wclk,
    input  logic                 i_wrst_n,
    input  logic                 i_wr,
    input  logic [DSIZE-1:0]     i_wdata,
    output logic                 o_wfull,
    input  logic                 i_rclk,
    input  logic                 i_rrst_n,
    input  logic                 i_rd,
    output logic [DSIZE-1:0]     o_rdata,
    output logic                 o_rempty,

    output logic [ASIZE:0]       rbin_probe,
    output logic [ASIZE:0]       wbin_probe,
    output logic [ASIZE:0]       rbin_next_probe,
    output logic [ASIZE:0]       wbin_next_probe,
    output logic [ASIZE:0]       wq1_probe,
    output logic [ASIZE:0]       wq2_probe,
    output logic [ASIZE:0]       rgray_next_probe,
    output logic [DSIZE-1:0]     write_probe
);

    // Write domain signals
    logic [ASIZE-1:0] waddr;
    logic [ASIZE-1:0] raddr;
    logic             wfull_next;
    logic             rempty_next;
    logic [ASIZE:0]   wgray;
    logic [ASIZE:0]   wbin;
    logic [ASIZE:0]   wq2_rgray;
    logic [ASIZE:0]   wq1_rgray;
    logic [ASIZE:0]   wgraynext;
    logic [ASIZE:0]   wbinnext;

    // Read domain signals
    logic [DSIZE-1:0] o_rdata_reg;
    logic [ASIZE:0]   rgray;
    logic [ASIZE:0]   rbin;
    logic [ASIZE:0]   rq2_wgray;
    logic [ASIZE:0]   rq1_wgray;
    logic [ASIZE:0]   rgraynext;
    logic [ASIZE:0]   rbinnext;
    logic             r_iwr1;
    logic             r_iwr2;

    // Memory
    logic [DSIZE-1:0] mem [0:(1<<ASIZE)-1];

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
        write_probe <= mem[waddr];
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

    initial begin
        r_iwr1 = 0;
        r_iwr2 = 0;
    end

    always @(posedge i_rclk or negedge i_rrst_n) begin
        if (!i_rrst_n) 
            {r_iwr2, r_iwr1} <= 0;
        else
            {r_iwr2, r_iwr1} <= {r_iwr1, i_wr};
    end

    // Output read data
    assign o_rdata = mem[raddr];

endmodule