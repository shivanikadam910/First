
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Assignment1 -dir "D:/clg/CO_lab/Assignment1/planAhead_run_1" -part xc7a100tcsg324-1
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/clg/CO_lab/Assignment1/top.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/clg/CO_lab/Assignment1} {ipcore_dir} }
add_files [list {ipcore_dir/d_memory.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/instruction.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pgm_memory.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/pm_memory.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/p_memory.ncf}] -fileset [get_property constrset [current_run]]
set_param project.pinAheadLayout  yes
set_property target_constrs_file "C:/Users/Shivani Kadam/Downloads/mips_16bit.ucf" [current_fileset -constrset]
add_files [list {C:/Users/Shivani Kadam/Downloads/mips_16bit.ucf}] -fileset [get_property constrset [current_run]]
link_design
