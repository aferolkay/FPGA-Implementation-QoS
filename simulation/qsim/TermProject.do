onerror {exit -code 1}
vlib work
vlog -work work TermProject.vo
vlog -work work sync_test.vwf.vt
vsim -novopt -c -t 1ps -L cyclonev_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.vga_sync_vlg_vec_tst -voptargs="+acc"
vcd file -direction TermProject.msim.vcd
vcd add -internal vga_sync_vlg_vec_tst/*
vcd add -internal vga_sync_vlg_vec_tst/i1/*
run -all
quit -f
