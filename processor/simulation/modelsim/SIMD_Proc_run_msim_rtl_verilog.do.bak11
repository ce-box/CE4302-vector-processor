transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks {C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks/mux_4to1.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks {C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks/mux_2to1.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks {C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks/ALU_Vec.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks {C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/hdl/generic_blocks/ALU_NBITS.sv}

vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/tests {C:/Users/Usuario/Documents/tec/CE4302-vector-processor/SystemVerilog/tests/alu_vec_test.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_vec_test

add wave *
view structure
view signals
run -all
