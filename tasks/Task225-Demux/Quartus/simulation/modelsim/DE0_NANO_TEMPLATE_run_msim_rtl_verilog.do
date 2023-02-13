transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus/db {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/Quartus/clk_div_N.sv}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task225-Demux/demux.sv}

