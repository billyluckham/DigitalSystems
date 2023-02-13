transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus/pll_main.v}
vlog -vlog01compat -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus/db {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus/db/pll_main_altpll.v}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/decoder_N.sv}
vlog -sv -work work +incdir+C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus {C:/Users/luckh/OneDrive/Documents/DigitalSystems/tasks/Task224-Decoders/Quartus/clk_div_N.sv}

