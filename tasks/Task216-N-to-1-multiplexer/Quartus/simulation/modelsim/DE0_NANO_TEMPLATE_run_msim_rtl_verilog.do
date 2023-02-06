transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus {C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus/db {C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus {C:/Users/bluckham/Documents/DigitalSystems/tasks/Task216-N-to-1-multiplexer/Quartus/clk_div_N.sv}

