ghdl --remove --workdir=work

ghdl -a --workdir=work --std=08 ./registers/generic_register.vhdl ./registers/*_reg.vhdl ./registers/registers_tb.vhdl 
ghdl --elab-run --workdir=work --std=08 registers_tb

# Clean up
ghdl --remove --workdir=work
rm *.exe *.o