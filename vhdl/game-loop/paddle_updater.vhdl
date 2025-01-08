library ieee;
use ieee.std_logic_1164.all;

-- Paddle width is 6 pixels wide.
--   Taking the bottom of the paddle as 0, the paddle position
--   (min, max) for a screen size of 32 is (0, 26) => ("00000", "11010")

entity paddle_updater is
    port(
        up, down : in std_logic;
        old_pos : in std_logic_vector(4 downto 0);
        new_pos : out std_logic_vector(4 downto 0)
    );
end paddle_updater;

architecture paddle_updater_behav of paddle_updater is

    signal vel, added : std_logic_vector(4 downto 0);

begin
    paddle_input_0 : entity work.paddle_input
        port map ( 	up=>up,
                    down=>down,
                    vel=>vel    );

    cca_5bit : entity work.cancel_carry_adder
        generic map (adder_width=>5)
        port map (  a=>vel,
                    b=>old_pos,
                    output=>added );

    process (added)
        variable invalid : std_logic;
    begin
        -- kmap solution to added > "11010" 
        invalid := added(4) AND added(3) AND 
                    ( added(2) OR (added(1) AND added(0)) );

        -- mux on each bit depending on sel=invalid.
        if invalid = '1' then
            new_pos <= old_pos;
        else
            new_pos <= added;
        end if;
    end process;
    
end paddle_updater_behav; 