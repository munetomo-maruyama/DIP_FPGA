# Directory
set DIR_RTL  ../RTL
set DIR_FPGA ../FPGA

# Compile
vmap -del work
vlib work
vmap work work
vlog \
    -work work \
    -sv \
    +incdir+$DIR_RTL     \
    -timescale=1ns/100ps \
    +define+SIMULATION   \
    $DIR_FPGA/OSC/synthesis/OSC.v \
    $DIR_FPGA/OSC/synthesis/submodules/altera_int_osc.v \
    $DIR_RTL/top.sv \
    ./tb_TOP.sv

# Start Simulation
vsim -c -voptargs="+acc" \
     -L altera_mf_ver    \
     -L fiftyfivenm_ver  \
     work.tb_TOP

# Add Waveform
add wave -divider Testbench
add wave -position end  sim:/tb_TOP/tb_cyc
add wave -position end  sim:/tb_TOP/tb_res
add wave -position end  sim:/tb_TOP/tb_clk
#
add wave -divider Top
add wave -position end  sim:/tb_TOP/U_TOP/oscena
add wave -position end  sim:/tb_TOP/U_TOP/clk
add wave -position end  sim:/tb_TOP/U_TOP/por_count
add wave -position end  sim:/tb_TOP/U_TOP/por_n
add wave -position end  sim:/tb_TOP/U_TOP/res
add wave -position end  sim:/tb_TOP/U_TOP/led_count
add wave -position end  sim:/tb_TOP/U_TOP/led_count_max
add wave -position end  sim:/tb_TOP/U_TOP/LED

# Do Simulation with logging all signals in WLF file
log -r *
run -all

