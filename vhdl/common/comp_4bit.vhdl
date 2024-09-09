library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This file encapsulates a 4 bit analog comparator using minecraft comparators in subtract mode
-- along with a DAC to extract the A-B signal and B-A signal. 
entity comp_4bit is
    port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        gt : out std_logic;
        lt : out std_logic
    );
end comp_4bit;

architecture comp_4bit_behav of comp_4bit is
begin
    gt <= '1' when unsigned(a) > unsigned(b) else '0';
    lt <= '1' when unsigned(a) < unsigned(b) else '0';
end comp_4bit_behav;