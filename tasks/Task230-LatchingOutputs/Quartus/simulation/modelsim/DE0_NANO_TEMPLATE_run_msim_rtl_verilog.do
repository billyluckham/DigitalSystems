transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task230-LatchingOutputs {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task230-LatchingOutputs/srgate.sv}

