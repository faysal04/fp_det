module bcd_tb();


logic clk;
logic start;
logic [15:0] binary;
logic [3:0] tenk;
logic [3:0] thousands;
logic [3:0] hundreds;
logic [3:0] tens;
logic [3:0] units;
logic done;
logic rst_n;
logic [35:0] shift_reg;

bin2bcd inst_bcd(
    .clk(clk),
    .start(start),
    .rst_n(rst_n),
    .binary(binary),
    .ten_thousands(tenk),
    .thousands(thousands),
    .hundreds(hundreds),
    .tens(tens),
    .units(units),
    .done(done),
    .shift_reg_test(shift_reg)
);

initial begin
    clk = 0;
    forever #2.5 clk = ~clk; // 200mhz
end

initial begin
    rst_n = 1'b0;
    binary = $urandom_range(16'hFFFF, 0);
    start = 1'b1;
    @(posedge clk);
    rst_n = 1'b1;

    wait(done)

    #100;
    $stop;
end

endmodule