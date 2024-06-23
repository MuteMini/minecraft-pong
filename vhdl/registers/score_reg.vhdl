library ieee;
use ieee.std_logic_1164.all;

entity score_reg is
    port ( 
        clk       : in std_logic;
        reset     : in std_logic;
        data_in   : in std_logic_vector(2 downto 0);
        data_out  : out std_logic_vector(2 downto 0)
    );
end score_reg;

architecture score_reg_behav of score_reg is
begin
    register_3bit : entity work.generic_register
        generic map (data_width => 3)
        port map (clk => clk, reset => reset, data_in => data_in, data_out => data_out);
end score_reg_behav;