#!/bin/sh
mkdir work

ncvlog -work work ../../../Ethernet_Virtex6.v

ncvlog -work work \
../../example_design/common/reset_sync.v \
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

ncvlog -work work ../phy_tb.v
ncvlog -work work ../demo_tb.v

ncelab -access +rw work.testbench glbl
ncsim -gui -input @"simvision -input wave_ncsim.sv" work.testbench
