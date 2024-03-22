library ieee;
use ieee.std_logic_1164.all;

entity paddle_input_tb is
end paddle_input_tb;

architecture behav of paddle_input_tb is
    component paddle_input
        port (up:     in std_logic;
              down:   in std_logic;
              vector: out std_logic_vector(1 downto 0));
      end component;

begin

end behav;