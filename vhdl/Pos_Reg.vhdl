library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- 5 bit position register for a 32x32 screen.
-- Used for all objects
-- A D flip flop uses 2 D-latches to ensure data is written at the rising edge of the clk.

ENTITY pos_reg IS
    PORT ( 
        wr_pulse        : IN STD_LOGIC;
        reset           : in std_logic;
        dataIn          : IN STD_LOGIC_VECTOR(4 downto 0);
        dataOut         : OUT STD_LOGIC_VECTOR(4 downto 0)
        );
END pos_reg;

ARCHITECTURE behaviour OF pos_reg IS
   signal Q             : std_logic_vector(4 downto 0);
   signal Q_bar         : std_logic_vector(4 downto 0);
BEGIN 

    modify_storage: PROCESS (wr_pulse, dataIn)
    variable data   : STD_LOGIC_VECTOR(4 downto 0);
    BEGIN

        for i in 0 to 4 loop
            Q(i) <= (dataIn(i) nand wr_pulse) nand Q_bar(i);
            Q_bar(i) <= ( (not dataIn(i)) nand wr_pulse) nand Q(i);
        end loop;
        
        for i in 0 to 4 loop
            Q(i) <= Q(i) and (not reset);
        end loop;
        
        dataOut <= Q;

    END PROCESS modify_storage;
    
END behaviour;