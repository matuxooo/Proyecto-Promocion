std = --std=08
cf = work-obj08.cf

sync: $(cf)
	ghdl -m $(std) sync_TB
	ghdl -r $(std) sync_TB
	gtkwave -f Sync.ghw
$(cf): *.vhd
	ghdl -i $(std) *.vhd
	