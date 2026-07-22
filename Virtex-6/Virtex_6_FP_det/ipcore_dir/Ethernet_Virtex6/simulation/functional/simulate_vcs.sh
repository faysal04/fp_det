#!/bin/sh

rm -rf simv* csrc DVEfiles AN.DB

echo "Compiling Core Simulation Models"
vlogan +v2k -v2005 \
../../../Ethernet_Virtex6.v \
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
../../example_design/Ethernet_Virtex6_example_design.v \
../phy_tb.v \
../demo_tb.v

vcs   +vcs+lic+wait \
      -y unisims_ver \
      -y unimacro_ver \
      -y secureip \
      -debug -PP    \
      testbench glbl

./simv -ucli -i ucli_commands.key
dve -vpd vcdplus.vpd -session vcs_session.tcl
