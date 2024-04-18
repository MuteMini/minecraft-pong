library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This file encapsulates a cancel carry adder implementation 
--   We do not need to synthesise this directly, as the CCA is
--   very unique to Minecraft and has no logic gate equivalant.
entity cancel_carry_adder is
    generic (
        adder_width : integer := 1
    );
    port (
        a : in std_logic_vector(adder_width - 1 downto 0);
        b : in std_logic_vector(adder_width - 1 downto 0);
        output : out std_logic_vector(adder_width - 1 downto 0)
    );
end cancel_carry_adder;

architecture cca_behav of cancel_carry_adder is
begin
    output <= std_logic_vector( unsigned(a) + unsigned(b) );
end cca_behav;