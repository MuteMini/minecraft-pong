library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wall_collider_tb is
end wall_collider_tb;

architecture behav of wall_collider_tb is
    
    signal c_y_vel, n_y_vel : std_logic_vector(2 downto 0);

begin
    wall_collider_0: entity work.wall_collider
    port map(
        c_y_vel => c_y_vel, n_y_vel => n_y_vel
    );

    process
    begin
        c_y_vel <= "000";

        -- Testing ball bounce from walls
        c_y_vel <= "001";
        wait for 1 ns;
        assert n_y_vel = "111"
            report "Did not bounce from ceiling, 1 to -1" severity error;

        c_y_vel <= "010";
        wait for 1 ns;
        assert n_y_vel = "110"
            report "Did not bounce from ceiling, 2 to -2" severity error;

        c_y_vel <= "101";
        wait for 1 ns;
        assert n_y_vel = "011"
            report "Did not bounce from ceiling, -3 to 3" severity error;

        wait;
    end process;
end behav;