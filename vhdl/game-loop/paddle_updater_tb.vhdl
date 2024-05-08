library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity paddle_updater_tb is
end paddle_updater_tb;

architecture behav of paddle_updater_tb is
    component paddle_updater is
        port(
            up, down : in std_logic;
            old_pos : in std_logic_vector(4 downto 0);
            new_pos : out std_logic_vector(4 downto 0)
        );
    end component;
    
    for paddle_updater_0 : paddle_updater use entity work.paddle_updater;

    signal up, down : std_logic;
    signal old_pos, new_pos : std_logic_vector(4 downto 0);
begin
    paddle_updater_0 : paddle_updater
        port map (  up=>up, 
                    down=>down,
                    old_pos=>old_pos,
                    new_pos=>new_pos );

    process
    begin
        up <= '0';
        down <= '0';
        old_pos <= "00010";

        wait for 1 ns;
        assert new_pos = "00010"
            report to_string(new_pos) severity error;

        up <= '1';
        old_pos <= new_pos;
        wait for 1 ns;
        assert new_pos = "00011"
            report "bad addition" severity error;

        old_pos <= new_pos;
        wait for 1 ns;
        assert new_pos = "00100"
            report "bad addition" severity error;

        up <= '0';
        down <= '1';
        old_pos <= new_pos;
        wait for 1 ns;
        assert new_pos = "00011"
            report "bad subtraction" severity error;

        old_pos <= new_pos;
        wait for 1 ns;
        assert new_pos = "00010"
            report "bad subtraction" severity error;

        wait;
    end process;
end behav;