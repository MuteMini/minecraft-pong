library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ball_updater is
    port (
        ball_x, ball_y: in std_logic_vector(4 downto 0);
        p1_pos, p2_pos: in std_logic_vector(4 downto 0);
        cur_y_vel : in std_logic_vector(2 downto 0);
        new_y_vel : out std_logic_vector(2 downto 0);
        cur_x_vel : in std_logic;
        new_x_vel : out std_logic
    );
end ball_updater;

architecture ball_updater_behav of ball_updater is

    signal p1_y_vel, p2_y_vel : std_logic_vector(2 downto 0);
    signal p1_x_vel, p2_x_vel : std_logic;

begin        
    p1_collider: entity work.paddle_collider
        port map (
            ball_y => ball_y, p_pos => p1_pos,
            cur_y_vel => cur_y_vel, new_y_vel => p1_y_vel,
            cur_x_vel => cur_x_vel, new_x_vel => p1_x_vel
        );

    p2_collider: entity work.paddle_collider
        port map (
            ball_y => ball_y, p_pos => p2_pos,
            cur_y_vel => cur_y_vel, new_y_vel => p2_y_vel,
            cur_x_vel => cur_x_vel, new_x_vel => p2_x_vel
        );

    -- Implement if statements with or/and gates, cases with mux.
    process (all)
    begin
        -- Collision with paddles
        if ball_x = "00011" then
            new_y_vel <= p1_y_vel;
            new_x_vel <= p1_x_vel;
        elsif ball_x = "11100" then
            new_y_vel <= p2_y_vel;
            new_x_vel <= p2_x_vel;
        -- Collision with wall
        elsif ball_y = "11111" OR ball_y = "00000" then
            case cur_y_vel is
                when "011" => new_y_vel <= "101"; 
                when "010" => new_y_vel <= "110"; 
                when "001" => new_y_vel <= "111"; 
                when "111" => new_y_vel <= "001"; 
                when "110" => new_y_vel <= "010"; 
                when "101" => new_y_vel <= "011"; 
                when others => new_y_vel <= "001";
            end case;
        else
            new_y_vel <= cur_y_vel;
            new_x_vel <= cur_x_vel;
        end if;
    end process;

end ball_updater_behav;