library ieee;
use ieee.std_logic_1164.all;

entity collision is
    port (
        ball_pos_x : in std_logic_vector(4 downto 0);
        ball_pos_y : in std_logic_vector(4 downto 0);
        paddle_1_pos: in std_logic_vector(4 downto 0);
        paddle_2_pos: in std_logic_vector(4 downto 0);
        cur_vel : in std_logic_vector(2 downto 0);
        new_vel : out std_logic_vector(2 downto 0);
        player_won : out std_logic_vector(1 downto 0) -- index 0 = player 1 won, index 1 = player 2 won, 
    );
end collision;

architecture collision_behav of collision is
begin
    -- Collision with goal
    player_won(0) <= AND (NOT ball_pos_x);
    player_won(1) <= AND ball_pos_x;

    
end collision_behav;