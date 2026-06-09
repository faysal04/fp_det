
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name Virtex_6_FP_det -dir "Y:/Virtex 6 ISE design/Virtex_6_FP_det/planAhead_run_1" -part xc6vlx240tff1156-1
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "top_wrapper.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ipcore_dir/clk.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/synchronizer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/preamble_detector.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/allignment.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/uart_tx_new.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/read_buffer.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/link_speed_detector.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_9.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_8.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_7.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_6.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_5.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_4.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_3.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_2.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_17.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_16.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_15.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_14.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_13.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_12.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_11.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_10.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_1.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/gen_number_0.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/async_fifo.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/accumulator.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/packet_logging.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/mac.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/fp_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/buffer_packet_logger.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {../../Source files/Veilog/top_virtix_6.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top top_wrapper $srcset
add_files [list {top_wrapper.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Ethernet_Virtex6.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/chipscope_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/chipscope_ila.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/uart_test_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/uart_test_ila.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6vlx240tff1156-1
