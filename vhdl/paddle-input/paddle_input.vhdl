library ieee;
use ieee.std_logic_1164.all;

entity paddle_input is
    port (  up:     in std_logic;
            down:   in std_logic;
            vector: out std_logic_vector(1 downto 0));
end paddle_input;

