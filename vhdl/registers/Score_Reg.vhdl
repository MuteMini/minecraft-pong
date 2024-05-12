library ieee;
use ieee.std_logic_1164.all;

-- 3 bit score register for a max score of 7.


ENTITY score_reg IS
    PORT ( 
        wr_pulse        : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic_vector(2 downto 0);
        dataOut         : out std_logic_vector(2 downto 0)
        );
END score_reg;

ARCHITECTURE behaviour OF score_reg IS
   signal Q            : std_logic_vector(2 downto 0);
   signal Q_bar        : std_logic_vector(2 downto 0);
BEGIN 
    
    modify_storage      : PROCESS (wr_pulse, dataIn, reset)
    BEGIN

        if (wr_pulse = '1') then
            for i in 0 to 2 loop
                Q(i) <= dataIn(i) and (not reset);
            end loop;
        end if;
        
        dataOut <= Q;

    END PROCESS modify_storage;
    
END behaviour;