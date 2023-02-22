transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task248-Counters/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task248-Counters/Quartus/de0_nano_template.v}

