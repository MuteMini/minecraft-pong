library ieee;
use ieee.std_logic_1164.all;

-- I found this: https://peterfab.com/ref/vhdl/vdlande/index.html
-- 5 bit position register for a 32x32 screen.
-- Used for all objects
-- A D flip flop uses 2 D-latches to ensure data is written at the rising edge of the clk.

ENTITY pos_reg IS
    PORT ( 
        clk         : IN STD_LOGIC;
        write       : IN STD_LOGIC;
        reset       : IN STD_LOGIC;
        dataIn      : IN STD_LOGIC_VECTOR(4 downto 0);
        dataOut     : OUT STD_LOGIC_VECTOR(4 downto 0)
        );
END pos_reg;

ARCHITECTURE behaviour OF pos_reg IS
   signal Q1 : std_logic_vector(4 downto 0);
   signal Q1_bar: std_logic_vector(4 downto 0);
   signal Q2: std_logic_vector(4 downto 0);
   signal Q2_bar: std_logic_vector(4 downto 0);
   signal clk_write: std_logic;
   signal nclk_write: std_logic;
BEGIN 

    modify_storage: PROCESS (clk, write, reset)
    variable data   : STD_LOGIC_VECTOR(4 downto 0);
    BEGIN

        nclk_write <= (not clk) and write;
        clk_write <= clk and write;


        for i in 0 to 4 loop
            Q1(i) <= (dataIn(i) nand nclk_write) nand Q1_bar(i);
            Q1_bar(i) <= ( (not dataIn(i)) nand nclk_write) nand Q1(i);
        end loop;
        
        for i in 0 to 4 loop
            Q2(i) <= (Q1(i) nand clk_write) nand Q2_bar(i);
            Q2_bar(i) <= (Q1_bar(i) nand clk_write) nand Q2(i);
        end loop;
        
        for i in 0 to 4 loop
            Q2(i) <= Q2(i) and (not reset);
        end loop;

        dataOut <= Q2;

    END PROCESS modify_storage;
    
END behaviour;