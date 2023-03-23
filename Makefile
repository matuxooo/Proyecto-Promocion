std = --std=08
cf = work-obj08.cf

sync: $(cf)
	ghdl -m $(std) sync_TB
	ghdl -r $(std) sync_TB --assert-level=none --wave=sync.ghw
	gtkwave -f sync.ghw
$(cf): *.vhd
	ghdl -i $(std) *.vhd