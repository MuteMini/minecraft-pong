library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity paddle_collider_tb is
end paddle_collider_tb;

architecture behav of paddle_collider_tb is
    
    signal b_y, p_pos: std_logic_vector(4 downto 0);
    signal y_vel, n_y_vel: std_logic_vector(2 downto 0);
    signal x_vel, n_x_vel: std_logic;
    
begin
    p_collider: entity work.paddle_collider
        port map (
            ball_y => b_y,
            p_pos => p_pos,
            c_x_vel => x_vel, n_x_vel => n_x_vel,
            c_y_vel => y_vel, n_y_vel => n_y_vel
        );

    process
    begin
        b_y <= "01000";
        y_vel <= "010";
        x_vel <= '0';

        p_pos <= "00000";
        wait for 1 ns;
        assert n_y_vel = "010" AND n_x_vel = '0'
            report "updated when ball not touching paddle" severity error;

        p_pos <= "01000";
        wait for 1 ns;
        assert n_y_vel = "101" AND n_x_vel = '1'
            report "ball did not bounce to -3" severity error;

        p_pos <= "00111";
        wait for 1 ns;
        assert n_y_vel = "110" AND n_x_vel = '1'
            report "ball did not bounce to -2" severity error;

        p_pos <= "00110";
        wait for 1 ns;
        assert n_y_vel = "111" AND n_x_vel = '1'
            report "ball did not bounce to -1" severity error;

        p_pos <= "00101";
        wait for 1 ns;
        assert n_y_vel = "001" AND n_x_vel = '1'
            report "ball did not bounce to +1" severity error;

        p_pos <= "00100";
        wait for 1 ns;
        assert n_y_vel = "010" AND n_x_vel = '1'
            report "ball did not bounce to +2" severity error;

        p_pos <= "00011";
        wait for 1 ns;
        assert n_y_vel = "011" AND n_x_vel = '1'
            report "ball did not bounce to +3" severity error;

        p_pos <= "10110";
        wait for 1 ns;
        assert n_y_vel = "010" AND n_x_vel = '0'
            report "updated when ball not touching paddle" severity error;

        wait;
    end process;
    
end behav;