library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ball_updater_tb is
end ball_updater_tb;

architecture behav of ball_updater_tb is
    
    signal p1_pos, p2_pos, b_x, b_y : std_logic_vector(4 downto 0);
    signal c_x_vel, n_x_vel : std_logic;
    signal c_y_vel, n_y_vel : std_logic_vector(2 downto 0);

begin
    ball_updater_0: entity work.ball_updater
    port map(
        p1_pos => p1_pos, p2_pos => p2_pos,
        b_x => b_x, b_y => b_y,
        c_x_vel => c_x_vel, c_y_vel => c_y_vel,
        n_x_vel => n_x_vel, n_y_vel => n_y_vel
    );

    process
    begin
        p1_pos <= "00000";
        p2_pos <= "00000";
        b_x <= "01001";
        b_y <= "01001";
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
        b_y <= "11111";
        c_y_vel <= "001";
        wait for 1 ns;
        assert n_y_vel = "111" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, 1 to -1" severity error;

        c_y_vel <= "010";
        wait for 1 ns;
        assert n_y_vel = "110" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, 2 to -2" severity error;

        b_y <= "00000";
        c_y_vel <= "101";
        wait for 1 ns;
        assert n_y_vel = "011" AND n_x_vel = c_x_vel
            report "Did not bounce from ceiling, -3 to 3" severity error;

        -- Testing ball bounce from paddle
        b_x <= "00011";
        b_y <= "01001";
        p1_pos <= "00000";
        wait for 1 ns;
        assert n_y_vel = c_y_vel AND n_x_vel = c_x_vel
            report "Bounced when paddle 1 was not hit" severity error;

        p1_pos <= "01000";
        wait for 1 ns;
        assert n_y_vel = "110" AND n_x_vel = '1'
            report "Did not bounce correctly when paddle 1 was hit" severity error;

        b_x <= "11100";
        b_y <= "01001";
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