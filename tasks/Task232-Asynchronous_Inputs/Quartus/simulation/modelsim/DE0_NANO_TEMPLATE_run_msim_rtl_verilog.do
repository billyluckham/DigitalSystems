transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus/reset_cct.v}
vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus/db {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus/db/reset_cct_altpll.v}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/srgate.sv}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task232-Asynchronous_Inputs/Quartus/reset_block.sv}

