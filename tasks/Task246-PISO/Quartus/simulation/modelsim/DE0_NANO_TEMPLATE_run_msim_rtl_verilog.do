transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus/db {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task246-PISO/mux21.sv}

