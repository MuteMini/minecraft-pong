library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end testbench;

architecture behav of testbench is
    -- !! DEFINE COMPONENT !!
    -- component NAME is
    --     port (
    --         A : ...;
    --         B : ...
    --     );
    -- end component;

    -- !! MAP COMPONENT TO LABEL !!
    -- for NAME : NAME use entity work.cancel_carry_adder;

    -- !! INPUT/OUTPUT SIGNALS !!
    -- signal NAME : ...
begin
    -- !! MAP I/O SIGNALS !!
    -- NAME : NAME
    --     port map (  A=>NAME, 
    --                 B=>NAME );

    process
    begin
        -- !! SET INPUT AND TEST OUTPUT !!
        -- e.g.
        -- up <= '0';
        -- down <= '0';
        -- wait for 1 ns;
        -- assert vel = "00000"
        --     report "bad default value" severity error;
        wait;
    end process;
end behav;