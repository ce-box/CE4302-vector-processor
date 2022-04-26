transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/top.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/microprocessor.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/hazard.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/datapath.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/controller.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/microarch/conditional.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/mux3.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/mux2.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/floprc.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/flopr.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/flopenrc.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/extend.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/eqcmp.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/alu.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/adder.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/memories {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/memories/imem.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/memories {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/memories/dmem.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/hdl/geo_isa/generic_blocks/register_file.sv}

vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/syntesis/../hdl/geo_isa/microarch {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/syntesis/../hdl/geo_isa/microarch/top.sv}
vlog -sv -work work +incdir+C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/syntesis/../tests/geo {C:/Users/Usuario/Documents/tec/ce4104-arquitectura-computadores/HDL-ARMv4-micro-arquitecture/Processor/syntesis/../tests/geo/top_geo_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  top_geo_tb

add wave *
view structure
view signals
run -all
