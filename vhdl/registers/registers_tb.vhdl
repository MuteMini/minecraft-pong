library ieee;
use ieee.std_logic_1164.all;

entity registers_tb is
end registers_tb;

architecture behaviour of registers_tb is

    signal pos_clk, pos_reset, score_clk, score_reset   : std_logic ;
    signal pos_data_in, pos_data_out                    : std_logic_vector(2 downto 0);
    signal score_data_in, score_data_out                : std_logic_vector(4 downto 0);

begin
    Pos_Reg_0 : entity work.pos_reg
        port map (clk => pos_clk, reset => pos_reset, data_in => pos_data_in, data_out => pos_data_out);

    Score_Reg_0 : entity work.score_reg
        port map (clk => score_clk, reset => score_reset, data_in => score_data_in, data_out => score_data_out);
    
end behaviour;