transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task209-TestBench {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task209-TestBench/uop_nxor.sv}

do "C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task209-TestBench/simulation/modelsim/build_all_tests.do"
