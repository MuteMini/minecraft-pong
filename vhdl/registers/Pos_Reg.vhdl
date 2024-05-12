library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- 5 bit position register for a 32x32 screen.
-- Used for all objects
-- A D flip flop uses 2 D-latches to ensure data is written at the rising edge of the clk.

entity pos_reg is
    port ( 
        wr_pulse        : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic_vector(4 downto 0);
        dataOut         : out std_logic_vector(4 downto 0)
        );
end pos_reg;

ARCHITECTURE behaviour OF pos_reg IS
   signal Q             : std_logic_vector(4 downto 0);
BEGIN 

    modify_storage: PROCESS (wr_pulse, dataIn, reset)
    BEGIN

        if (wr_pulse = '1') then
            for i in 0 to 4 loop
                Q(i) <= dataIn(i) and (not reset);
            end loop;
        end if;
        
        dataOut <= Q;

    END PROCESS modify_storage;
        
END behaviour;