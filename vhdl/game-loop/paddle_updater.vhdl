library ieee;
use ieee.std_logic_1164.all;

-- Paddle width is 6 pixels wide.
--   Taking the bottom of the paddle as 0, the paddle position
--   (min, max) for a screen size of 32 is (0, 26)

entity paddle_updater is
    port(
        vel : in std_logic_vector(4 downto 0);
        old_pos : in std_logic_vector(4 downto 0);
        new_pos : out std_logic_vector(4 downto 0)
    );
end paddle_updater;

architecture paddle_updater_behav of paddle_updater is
begin
    
    new_pos <= 
end paddle_updater_behav;