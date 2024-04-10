library ieee;
use ieee.std_logic_1164.all;

-- 3 bit score register for a max score of 7.


ENTITY score_reg IS
    PORT ( 
        wr_pulse        : IN STD_LOGIC;
        reset           : in std_logic;
        dataIn          : IN STD_LOGIC_VECTOR(2 downto 0);
        dataOut         : OUT STD_LOGIC_VECTOR(2 downto 0)
        );
END score_reg;

ARCHITECTURE behaviour OF score_reg IS
   signal Q            : std_logic_vector(2 downto 0);
   signal Q_bar        : std_logic_vector(2 downto 0);
BEGIN 
    
    modify_storage      : PROCESS (wr_pulse)
        variable data   : STD_LOGIC_VECTOR(2 downto 0);
    BEGIN

        --wr_pulse clears D-latches 
        --D-latch logic:
        for i in 0 to 2 loop
            Q(i) <= (dataIn(i) nand wr_pulse) nand Q_bar(i);
            Q_bar(i) <= ( (not dataIn(i)) nand wr_pulse ) nand Q(i);
        end loop;

        for i in 0 to 2 loop
            Q(i) <= Q(i) and (not reset);
        end loop;
        
        dataOut <= Q;

    END PROCESS modify_storage;
    
END behaviour;