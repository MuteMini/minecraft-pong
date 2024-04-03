library ieee;
use ieee.std_logic_1164.all;

----- Screen State Entity -----
--
-- The inputs of the screen state entity processes the score and
-- tells the display what "buffer" to show. Each buffer is either a
-- variable or static screen determined by paddle position, ball position,
-- or player score.
--
-- state:   00 - Game State:    Determined by paddle and ball position, updated from the register.
--          01 - P1 Won:        Shows a static screen that displays a win msg for P1.
--          10 - P2 Won:        Shows a static screen that displays a win msg for P2.
--          11 - Reset State:   Shows an empty static screen.
--
entity screen_state is
    port (
        reset:      in std_logic;
        p1_score:   in std_logic_vector(2 downto 0);
        p2_score:   in std_logic_vector(2 downto 0);
        state:      out std_logic_vector(1 downto 0)
    );
end entity;

-- The following architecture relies on a unary AND operator only available beyond VHDL-2008.
architecture screen_state_behav of screen_state is
    signal p1_won : std_logic;
    signal p2_won : std_logic;
begin
    p1_won <= AND p1_score;
    p2_won <= AND p2_score;

    state(0) <= reset OR p1_won;
    state(1) <= reset OR p2_won;
end architecture;