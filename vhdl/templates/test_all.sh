ghdl --remove --workdir=work

ghdl -a --workdir=work --std=08 [FILE_PATH_HERE]
ghdl --elab-run --workdir=work --std=08 [TESTBENCH_ENTITY_HERE]

# Clean up
ghdl --remove --workdir=work
rm *.exe *.o