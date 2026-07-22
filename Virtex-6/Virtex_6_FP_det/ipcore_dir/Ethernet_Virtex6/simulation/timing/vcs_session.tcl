gui_open_window Wave
gui_list_select -id Hier.1 { testbench }
gui_list_select -id Data.1 { testbench.reset }
gui_sg_create TEMAC_Group
gui_list_add_group -id Wave.1 {TEMAC_Group}
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Test_semaphores }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Configuration_Interface }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Tx_GMII_MII_Interface }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Rx_GMII_MII_Interface }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Rx_MAC_Interface }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { Tx_MAC_Interface }
gui_list_add_divider -id Wave.1 -after TEMAC_Group { System_Signals }

gui_list_add -id Wave.1 -after System_Signals {{testbench.reset} {testbench.gtx_clk} }

gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tuser}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tlast}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tready}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tdata}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tkeep}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/tx_axis_mac_tvalid}}
gui_list_add -id Wave.1 -after Tx_MAC_Interface {{testbench.dut.tx_reset}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/rx_axis_mac_tuser}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/rx_axis_mac_tlast}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/rx_axis_mac_tdata}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/rx_axis_mac_tkeep}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.\v6emac_fifo_block/rx_axis_mac_tvalid}}
gui_list_add -id Wave.1 -after Rx_MAC_Interface {{testbench.dut.rx_reset}}
gui_list_add -id Wave.1 -after Tx_GMII_MII_Interface {{testbench.gmii_tx_en}}
gui_list_add -id Wave.1 -after Tx_GMII_MII_Interface {{testbench.gmii_tx_er}}
gui_list_add -id Wave.1 -after Tx_GMII_MII_Interface {{testbench.gmii_txd}}
gui_list_add -id Wave.1 -after Tx_GMII_MII_Interface {{testbench.gmii_tx_clk}}
gui_list_add -id Wave.1 -after Rx_GMII_MII_Interface {{testbench.gmii_rx_dv}}
gui_list_add -id Wave.1 -after Rx_GMII_MII_Interface {{testbench.gmii_rx_er}}
gui_list_add -id Wave.1 -after Rx_GMII_MII_Interface {{testbench.gmii_rxd}}
gui_list_add -id Wave.1 -after Rx_GMII_MII_Interface {{testbench.gmii_rx_clk}}

gui_zoom -window Wave.1 -full
