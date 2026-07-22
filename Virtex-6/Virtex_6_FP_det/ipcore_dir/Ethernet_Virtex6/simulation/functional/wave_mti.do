view structure
view signals
view wave
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System Signals}
add wave -noupdate -format Logic /testbench/reset
add wave -noupdate -format Logic /testbench/gtx_clk
add wave -noupdate -divider {Tx MAC Interface}
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_mac_resetn
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_mac_tvalid
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/v6emac_fifo_block/tx_axis_mac_tdata
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_mac_tready
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_mac_tlast
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_mac_tuser
add wave -noupdate -divider {Tx Statistics Vector}
add wave -noupdate -format Logic /testbench/dut/tx_statistics_valid
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/tx_statistics_vector
add wave -noupdate -divider {Rx MAC Interface}
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_mac_aclk
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_mac_resetn
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_mac_tvalid
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/v6emac_fifo_block/rx_axis_mac_tdata
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_mac_tlast
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_mac_tuser
add wave -noupdate -divider {Rx Statistics Vector}
add wave -noupdate -format Logic /testbench/dut/rx_statistics_valid
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/rx_statistics_vector
add wave -noupdate -divider {Flow Control}
add wave -noupdate -format Literal -hex /testbench/dut/pause_val
add wave -noupdate -format Logic /testbench/dut/pause_req
add wave -noupdate -divider {Rx FIFO AXI-S Interface}
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_fifo_clock
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_fifo_resetn
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/v6emac_fifo_block/rx_axis_fifo_tdata
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_fifo_tlast
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_fifo_tready
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/rx_axis_fifo_tvalid
add wave -noupdate -divider {Tx FIFO AXI-S Interface}
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_fifo_clock
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_fifo_resetn
add wave -noupdate -format Literal -radix hexadecimal /testbench/dut/v6emac_fifo_block/tx_axis_fifo_tdata
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_fifo_tlast
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_fifo_tready
add wave -noupdate -format Logic /testbench/dut/v6emac_fifo_block/tx_axis_fifo_tvalid
add wave -noupdate -divider {Tx GMII/MII Interface}
add wave -noupdate -format Logic /testbench/gmii_tx_clk
add wave -noupdate -format Logic /testbench/gmii_tx_en
add wave -noupdate -format Logic /testbench/gmii_tx_er
add wave -noupdate -format Literal -hex /testbench/gmii_txd
add wave -noupdate -divider {Rx GMII/MII Interface}
add wave -noupdate -format Logic /testbench/gmii_rx_clk
add wave -noupdate -format Logic /testbench/gmii_rx_dv
add wave -noupdate -format Logic /testbench/gmii_rx_er
add wave -noupdate -format Literal -hex /testbench/gmii_rxd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
WaveRestoreZoom {0 ps} {4310754 ps}
