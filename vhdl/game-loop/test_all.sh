# Paddle Updater Test
ghdl --remove --workdir=work
ghdl -a --workdir=work --std=08 ./common/*.vhdl ./paddle-input/paddle_input.vhdl ./game-loop/paddle_updater*.vhdl
ghdl --elab-run --workdir=work --std=08 paddle_updater_tb

# Paddle_Collider Test
ghdl --remove --workdir=work
ghdl -a --workdir=work --std=08 ./common/*.vhdl ./game-loop/paddle_collider*.vhdl
ghdl --elab-run --workdir=work --std=08 paddle_collider_tb

# Ball Updater Test
ghdl --remove --workdir=work
ghdl -a --workdir=work --std=08 ./common/*.vhdl ./game-loop/paddle_collider.vhdl ./game-loop/ball_updater*.vhdl
ghdl --elab-run --workdir=work --std=08 ball_updater_tb

# Clean up
ghdl --remove --workdir=work
rm *.exe *.o