library ieee;
use ieee.std_logic_1164.all;

entity screen_state_tb is
end screen_state_tb;

architecture behav of screen_state_tb is
    component screen_state
        port (  reset:                  in std_logic;
                p1_score, p2_score:     in std_logic_vector(2 downto 0);
                state:                  out std_logic_vector(1 downto 0));
    end component;

    signal reset : std_logic;
    signal p1_score, p2_score : std_logic_vector(2 downto 0);
    signal state : std_logic_vector(1 downto 0);
begin
    screen_state_0 : screen_state 
        port map(reset=>reset, p1_score=>p1_score, p2_score=>p2_score, state=>state);

    process
    begin
        reset <= '1';
        p1_score <= "000";
        p2_score <= "000";
        wait for 1 ns;
        assert state = "11"
            report "bad reset state" severity error;

        reset <= '1';
        wait for 1 ns;
        assert state = "11"
            report "bad reset state" severity error;

        reset <= '0';
        p1_score <= "000";
        p2_score <= "000";
        wait for 1 ns;
        assert state = "00"
            report "bad default state" severity error;

        p1_score <= "010";
        p2_score <= "101";
        wait for 1 ns;
        assert state = "00"
            report "bad default state" severity error;

        p1_score <= "111";
        p2_score <= "101";
        wait for 1 ns;
        assert state = "01"
            report "bad player_1 won state" severity error;

        p1_score <= "110";
        p2_score <= "111";
        wait for 1 ns;
        assert state = "10"
            report "bad player_2 won state" severity error;

        wait;
    end process;
end behav;