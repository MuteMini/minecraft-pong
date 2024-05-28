library ieee;
use ieee.std_logic_1164.all;

entity pos_reg is
    port ( 
        clk       : in std_logic;
        reset     : in std_logic;
        data_in   : in std_logic_vector(4 downto 0);
        data_out  : out std_logic_vector(4 downto 0)
    );
end pos_reg;

architecture pos_reg_behav of pos_reg is
begin 
    register_5bit : entity work.generic_register
        generic map (data_width => 5)
        port map (clk => clk, reset => reset, data_in => data_in, data_out => data_out);
end pos_reg_behav;