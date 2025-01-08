ghdl --remove --workdir=work

# CCA Test
ghdl -a --workdir=work --std=08 ./common/*.vhdl
ghdl --elab-run --workdir=work --std=08 cca_tb

# 4 bit comparator test
ghdl --elab-run --workdir=work --std=08 comp_4bit_tb

# 5 bit comparator test
ghdl --elab-run --workdir=work --std=08 comp_5bit_tb

# cleanup
ghdl --remove --workdir=work
rm *.exe *.o