library ieee;
use ieee.std_logic_1164.all;

entity Registers_tb is
end Registers_tb;

architecture behaviour of Registers_tb is
    --component
    component Pos_Reg 
    port( 
        clk                             : IN STD_LOGIC;
        write                           : IN STD_LOGIC;
        reset                           : IN STD_LOGIC;
        dataIn                          : IN STD_LOGIC_VECTOR(4 downto 0);
        dataOut                         : OUT STD_LOGIC_VECTOR(4 downto 0));
    end component;

    component Score_Reg 
    port (
        clk                             : IN STD_LOGIC;
        write                           : IN STD_LOGIC;
        reset                           : IN STD_LOGIC;
        dataIn                          : IN STD_LOGIC_VECTOR(2 downto 0);
        dataOut                         : OUT STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal clk, write, reset            : std_logic;
    signal dataInPos, dataOutPos        : std_logic_vector(4 downto 0);
    signal dataInScore, dataOutScore    : std_logic_vector(2 downto 0);

begin
    Pos_Reg0 : Pos_Reg
    port map (clk => clk, write => write, reset => reset, dataIn => dataInPos, dataOut => dataOutPos);

    Score_Reg0 : Score_Reg
    port map (clk=>clk, write=>write, reset=>reset, dataIn=>dataInScore, dataOut=>dataOutScore);
    
    process 
    begin

        clk <= '0';
        write <= '0';
        reset <= '0';
        dataInPos <= "00000";
        wait for 1 ns;
        assert dataOutPos = "00000"
            report "wrong output" severity error;


    end process;
END behaviour;