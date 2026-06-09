
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Virtex_6_FP_det -dir "Y:/Virtex 6 ISE design/Virtex_6_FP_det/planAhead_run_2" -part xc6vlx240tff1156-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "Y:/Virtex 6 ISE design/Virtex_6_FP_det/top_wrapper.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {Y:/Virtex 6 ISE design/Virtex_6_FP_det} {ipcore_dir} {C:/Coregen} }
add_files [list {ipcore_dir/Ethernet_Virtex6.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/chipscope_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/chipscope_ila.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/uart_test_icon.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {C:/Coregen/uart_test_ila.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "top_wrapper.ucf" [current_fileset -constrset]
add_files [list {top_wrapper.ucf}] -fileset [get_property constrset [current_run]]
link_design
