view structure
view signals
view wave
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System Signals}
add wave -noupdate -format Logic /testbench/reset
add wave -noupdate -format Logic /testbench/gtx_clk
add wave -noupdate -divider {Tx MAC Interface}
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/tx_axis_mac_tvalid }
add wave -noupdate -format Literal {/testbench/dut/\v6emac_fifo_block/tx_axis_mac_tdata }
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/tx_axis_mac_tready }
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/tx_axis_mac_tlast }
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/tx_axis_mac_tuser }
add wave -noupdate -divider {Rx MAC Interface}
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/rx_axis_mac_tvalid }
add wave -noupdate -format Literal {/testbench/dut/\v6emac_fifo_block/rx_axis_mac_tdata }
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/rx_axis_mac_tlast }
add wave -noupdate -format Logic {/testbench/dut/\v6emac_fifo_block/rx_axis_mac_tuser }
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
