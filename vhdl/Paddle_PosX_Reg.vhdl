library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- Register Position
ENTITY Paddle_PosX_Reg IS
    -- inputs and outputs of a hardware piece plus their bit size
    PORT ( 
        clk         : IN STD_LOGIC;
        write       : IN STD_LOGIC;
        reset       : IN STD_LOGIC;
        dataIn      : IN STD_LOGIC_VECTOR( 7 downto 0 );
        dataOut     : OUT STD_LOGIC_VECTOR(7 downto 0)
        );
END Paddle_PosX_Reg;

ARCHITECTURE paddlex_reg OF Paddle_PosX_Reg IS
-- Declarative area
BEGIN 
-- If clk == 1 && write == 1, then dataout <= datain
-- If clk == 1 && reset == 1, then dataout <= 0 
    modify_storage: PROCESS (clk)
    BEGIN
        if rising_edge(clk) then
            if (write = '1') then
                dataOut <= dataIn;
            elsif (reset = '1') then
                dataOut <= "00000000";
            end if;
        end if;
    END PROCESS modify_storage;
    
END paddlex_reg;