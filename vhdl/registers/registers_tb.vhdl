library ieee;
use ieee.std_logic_1164.all;

entity registers_tb is
end registers_tb;

architecture behaviour of registers_tb is

    signal clk, reset                       : std_logic ;
    signal pos_data_in, pos_data_out        : std_logic_vector(4 downto 0);
    signal score_data_in, score_data_out    : std_logic_vector(2 downto 0);

begin
    Pos_Reg_0 : entity work.pos_reg
        port map (clk => clk, reset => reset, data_in => pos_data_in, data_out => pos_data_out);

    Score_Reg_0 : entity work.score_reg
        port map (clk => clk, reset => reset, data_in => score_data_in, data_out => score_data_out);

    process
    begin
        clk <= '0';
        reset <= '1';
        wait for 1 ns;
        assert pos_data_out = "00000" or score_data_out = "000";
            report "bad reset value" severity error;

        pos_data_in <= (others => '1');
        score_data_in <= (others => '1');
        wait for 1 ns;

        assert pos_data_out = "00000" or score_data_out = "000";
            report "stored value on low clk" severity error;

        clk <= '1';
        wait for 1 ns;
        assert pos_data_out = "11111" or score_data_out = "111";
            report "did not store value on rising edge" severity error;

        pos_data_in <= (1 => '1', others => '0');
        score_data_in <= (1 => '1', others => '0');

        wait for 1 ns;
        assert pos_data_out = "11111" or score_data_out = "111";
            report "stored value on high clk" severity error;

        clk <= '0';
        wait for 1 ns;
        assert pos_data_out = "11111" or score_data_out = "111";
            report "did not store value on falling edge clk" severity error;

        clk <= '1';
        wait for 1 ns;
            assert pos_data_out = "00010" or score_data_out = "010";
            report "did not store value on rising edge" severity error;

        reset <= '1';
        wait for 1 ns;
        assert pos_data_out = "00000" or score_data_out = "000";
            report "bad reset value" severity error;

        wait;
    end process;

end behaviour;