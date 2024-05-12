library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- Register Position
ENTITY register_ex IS
    -- inputs and outputs of a hardware piece plus their bit size
    port ( 
        wr_pulse        : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic;
        dataOut         : out std_logic
        );
END register_ex;

ARCHITECTURE behaviour OF register_ex IS
-- Declarative area
    signal Q            : std_logic;
    signal Q_bar        : std_logic;
BEGIN 

    modify_storage: PROCESS (dataIn, wr_pulse, reset)
    BEGIN
        
        if (wr_pulse = '1') then
            dataOut <= dataIn and (not reset);
        end if;

    END PROCESS modify_storage;
    
END behaviour;