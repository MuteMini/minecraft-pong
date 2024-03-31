library ieee;
use ieee.std_logic_1164.all;

-- 3 bit score register for a max score of 7.

ENTITY Score_Reg IS
    PORT ( 
        clk             : IN STD_LOGIC;
        write           : IN STD_LOGIC;
        reset           : IN STD_LOGIC;
        dataIn          : IN STD_LOGIC_VECTOR(2 downto 0);
        dataOut         : OUT STD_LOGIC_VECTOR(2 downto 0)
        );
END Score_Reg;

ARCHITECTURE behaviour OF Score_Reg IS
   
BEGIN 
-- If clk == 1 && write == 1, then dataout <= datain
-- If clk == 1 && reset == 1, then dataout <= 0 
    
    modify_storage      : PROCESS (clk, write, reset)
        variable data   : STD_LOGIC_VECTOR(2 downto 0);
    BEGIN

        for i in 0 to 2 loop
            data(i) := dataIn(i) AND clk AND write;
        end loop;
            
        for i in 0 to 2 loop
            data(i) := dataOut(i) AND (NOT reset);
        end loop;
        
        dataOut <= data;

    END PROCESS modify_storage;
    
END behaviour;