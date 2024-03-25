library ieee;
use ieee.std_logic_1164.all;
use std.textio.all; 

entity paddle_input is
    port (  up:     in std_logic;                   -- User inputs their paddle to go up
            down:   in std_logic;                   -- User inputs their paddle to go down
            vel: out std_logic_vector(4 downto 0)); -- Velocity value to add to paddle position during game loop
end paddle_input;

architecture paddle_behav of paddle_input is
  constant up_vel    : std_logic_vector(4 downto 0) := "11111";
  constant down_vel  : std_logic_vector(4 downto 0) := "00001";
begin
  process (up, down)
    variable mux_out_a : std_logic_vector(4 downto 0);
    variable mux_out_b : std_logic_vector(4 downto 0);
  begin
    for i in 0 to 4 loop
      mux_out_a(i) := up AND up_vel(i);
      mux_out_b(i) := down AND down_vel(i);
      vel(i) <= mux_out_a(i) OR mux_out_b(i);
    end loop;
  end process;
end paddle_behav;
