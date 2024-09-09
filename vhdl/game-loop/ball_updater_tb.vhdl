library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ball_updater_tb is
end ball_updater_tb;

architecture behav of ball_updater_tb is
    
    signal bp_x, bp_y : std_logic_vector(4 downto 0);
    signal p1_pos, p2_pos : std_logic_vector(4 downto 0);
    signal c_y_vel, n_y_vel : std_logic_vector(2 downto 0);
    signal c_x_vel, n_x_vel : std_logic;

begin
    ball_updater_0: entity work.ball_updater
     port map(
        ball_x => bp_x, ball_y => bp_y,
        p1_pos => p1_pos, p2_pos => p2_pos,
        cur_y_vel => c_y_vel, new_y_vel => n_y_vel,
        cur_x_vel => c_x_vel, new_x_vel => n_x_vel
    );

    process
    begin
        bp_x <= "01001";
        bp_y <= "01001";
        p1_pos <= "00000";
        p2_pos <= "00000";
        c_y_vel <= "000";
        c_x_vel <= '0';

        wait for 1 ns;
        assert n_y_vel = c_y_vel
            report "new velocity did not stay the same" severity error;

        c_y_vel <= "010";
        wait for 1 ns;
        assert n_y_vel = c_y_vel
            report "new velocity did not stay the same" severity error;

        -- Testing ball bounce from walls
        bp_y <= "11111";
        c_y_vel <= "001";
        wait for 1 ns;
        assert n_y_vel = "111" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, 1 to -1" severity error;

        c_y_vel <= "010";
        wait for 1 ns;
        assert n_y_vel = "110" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, 2 to -2" severity error;

        bp_y <= "00000";
        c_y_vel <= "101";
        wait for 1 ns;
        assert n_y_vel = "011" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, -3 to 3" severity error;

        -- Testing ball bounce from paddle
        bp_x <= "00011";
        bp_y <= "01001";
        p1_pos <= "00000";
        wait for 1 ns;
        assert n_y_vel = c_y_vel AND n_x_vel = c_x_vel
            report "Bounced when paddle 1 was not hit" severity error;

        p1_pos <= "01000";
        wait for 1 ns;
        assert n_y_vel = "110" AND n_x_vel = '1'
            report "Did not bounce correctly when paddle 1 was hit" severity error;

        bp_x <= "11100";
        bp_y <= "01001";
        p2_pos <= "00000";
        wait for 1 ns;
        assert n_y_vel = c_y_vel AND n_x_vel = c_x_vel
            report "Bounced when paddle 2 was not hit" severity error;

        p2_pos <= "00111";
        wait for 1 ns;
        assert n_y_vel = "111" AND n_x_vel = '1'
            report "Did not bounce correctly when paddle 2 was hit" severity error;

        wait;
    end process;
end behav;