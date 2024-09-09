library ieee;
use ieee.std_logic_1164.all;

entity ball_updater is
    port (
        p1_pos, p2_pos : in std_logic_vector(4 downto 0);
        b_x, b_y : in std_logic_vector(4 downto 0);
        c_x_vel : in std_logic;
        c_y_vel : in std_logic_vector(2 downto 0);
        n_x_vel : out std_logic;
        n_y_vel : out std_logic_vector(2 downto 0)
    );
end entity;

architecture ball_updater_behav of ball_updater is 

    signal p1_x_vel, p2_x_vel : std_logic;
    signal p1_y_vel, p2_y_vel, w_y_vel : std_logic_vector(2 downto 0);

begin
    wall_collider: entity work.wall_collider
    port map (
        c_y_vel => c_y_vel, 
        n_y_vel => w_y_vel
    );

    p1_collider: entity work.paddle_collider
    port map (
        ball_y => b_y,  p_pos => p1_pos,
        c_x_vel => c_x_vel,    c_y_vel => c_y_vel, 
        n_x_vel => p1_x_vel,   n_y_vel => p1_y_vel
    );

    p2_collider: entity work.paddle_collider
    port map (
        ball_y => b_y,  p_pos => p2_pos,
        c_x_vel => c_x_vel,     c_y_vel => c_y_vel, 
        n_x_vel => p2_x_vel,    n_y_vel => p2_y_vel
    );

    process (all)
    begin
        -- Check if paddle hit first
        if b_x = "00011" then
            n_x_vel <= p1_x_vel;
            n_y_vel <= p1_y_vel;
        elsif b_x = "11100" then
            n_x_vel <= p2_x_vel;
            n_y_vel <= p2_y_vel;
        -- Then check if walls were hit
        elsif b_y = "11111" OR b_y = "00000" then
            n_x_vel <= c_x_vel;
            n_y_vel <= w_y_vel;
        else
            n_x_vel <= c_x_vel;
            n_y_vel <= c_y_vel;
        end if;
    end process;

end ball_updater_behav;