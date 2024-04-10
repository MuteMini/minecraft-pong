library ieee;
use ieee.std_logic_1164.all;

entity registers_tb is
end registers_tb;

architecture behaviour of registers_tb is
    --component
    component pos_reg 
    port( 
        clk                             : IN STD_LOGIC;
        write                           : IN STD_LOGIC;
        reset                           : IN STD_LOGIC;
        dataIn                          : IN STD_LOGIC_VECTOR(4 downto 0);
        dataOut                         : OUT STD_LOGIC_VECTOR(4 downto 0));
    end component;

    component score_reg 
    port (
        clk                             : IN STD_LOGIC;
        write                           : IN STD_LOGIC;
        reset                           : IN STD_LOGIC;
        dataIn                          : IN STD_LOGIC_VECTOR(2 downto 0);
        dataOut                         : OUT STD_LOGIC_VECTOR(2 downto 0));
    end component;

    signal clk                          : std_logic := '0';
    constant clk_half_period            : time := 0.5 ns;
    signal write, reset                 : std_logic;
    signal dataInPos, dataOutPos        : std_logic_vector(4 downto 0);
    signal dataInScore, dataOutScore    : std_logic_vector(2 downto 0);

    signal wr_pulse                     : std_logic;

    signal finished                     : std_logic;

begin
    Pos_Reg0 : pos_reg
    port map (clk => clk, write => write, reset => reset, dataIn => dataInPos, dataOut => dataOutPos);

    Score_Reg0 : score_reg
    port map (clk=>clk, write=>write, reset=>reset, dataIn=>dataInScore, dataOut=>dataOutScore);
    
    process 
    begin

        finished <= '0';
        write <= '1';
        reset <= '0';
        dataInPos <= "00000";
        --clk <= not clk after clk_half_period when finished /= '1' else '0'; --rising edge
        wait for 1 ns;
        assert dataOutPos = "00000"
            report "wrong output" severity error;
        finished <= '1';
        -- find out how to incorporate a clk in ghdl.

        --DataIn    wr_pulse    reset   DataOut (Q)
        --0         1           0       0
        --1         1           0       1
        --0         0           0       X
        --1         0           0       X
        --0         1           1       0
        --1         1           1       0
        --0         0           1       0
        --1         0           1       0

    end process;
END behaviour;