vlib work
vmap work work
vlog -work work ../../../Ethernet_Virtex6.v
vlog -work work ../../example_design/common/reset_sync.v \
../../example_design/common/sync_block.v \
../../example_design/fifo/tx_client_fifo_8.v \
../../example_design/fifo/rx_client_fifo_8.v \
../../example_design/fifo/ten_100_1g_eth_fifo.v \
../../example_design/pat_gen/address_swap.v \
../../example_design/pat_gen/axi_mux.v \
../../example_design/pat_gen/axi_pat_gen.v \
../../example_design/pat_gen/axi_pat_check.v \
../../example_design/pat_gen/axi_pipe.v \
../../example_design/pat_gen/basic_pat_gen.v \
../../example_design/physical/gmii_if.v \
../../example_design/clk_wiz.v \
../../example_design/Ethernet_Virtex6_block.v \
../../example_design/Ethernet_Virtex6_fifo_block.v \
../../example_design/Ethernet_Virtex6_example_design.v

vlog -work work ../phy_tb.v \
../demo_tb.v

vsim -voptargs="+acc" -L secureip -L unisims_ver -L unimacro_ver -t ps work.testbench work.glbl
do wave_mti.do
run -all
