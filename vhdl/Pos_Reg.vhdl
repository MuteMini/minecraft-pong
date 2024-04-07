library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- 5 bit position register for a 32x32 screen.
-- Used for all objects

ENTITY Pos_Reg IS
    PORT ( 
        clk         : IN STD_LOGIC;
        write       : IN STD_LOGIC;
        reset       : IN STD_LOGIC;
        dataIn      : IN STD_LOGIC_VECTOR(4 downto 0);
        dataOut     : OUT STD_LOGIC_VECTOR(4 downto 0)
        );
END Pos_Reg;

ARCHITECTURE behaviour OF Pos_Reg IS
   signal Q : std_logic_vector(4 downto 0);
   signal Q_bar: std_logic_vector(4 downto 0);
   signal nand_gate1: std_logic_vector(4 downto 0);
   signal nand_gate2: std_logic_vector(4 downto 0);
BEGIN 
-- If clk == 1 && write == 1, then dataout <= datain
-- If clk == 1 && reset == 1, then dataout <= 0 
    
    modify_storage: PROCESS (clk, write, reset)
    variable data   : STD_LOGIC_VECTOR(4 downto 0);
    BEGIN

        --nand_gate1 <= dataIn nand (clk and write);

        for i in 0 to 4 loop
            nand_gate1(i) <= dataIn(i) nand (clk and write);
            nand_gate2(i) <= (not dataIn(i)) nand (clk and write);
        end loop;

            for i in 0 to 4 loop
                Q(i) <= nand_gate1(i) nand Q_bar(i);
                Q_bar(i) <= nand_gate2(i) nand Q(i);
            end loop;
        
        dataOut <= Q;

    END PROCESS modify_storage;
    
END behaviour;