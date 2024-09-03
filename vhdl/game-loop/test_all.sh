# Paddle Updater Test
ghdl --remove --workdir=work

ghdl -a --workdir=work --std=08 ./common/*.vhdl ./paddle-input/paddle_input.vhdl ./game-loop/paddle_updater*.vhdl
ghdl --elab-run --workdir=work --std=08 paddle_updater_tb

