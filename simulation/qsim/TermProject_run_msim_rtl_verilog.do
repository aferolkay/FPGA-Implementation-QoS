transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/print.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/vga_sync.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/F_25MHz.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/deneme.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/deneme2.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/deneme3.v}
vlog -vlog01compat -work work +incdir+C:/Users/AferOlkay/Desktop/EE314-Project {C:/Users/AferOlkay/Desktop/EE314-Project/deneme4.v}

