library ieee;
use ieee.std_logic_1164.all;

entity registers_tb is
end registers_tb;

architecture behaviour of registers_tb is
    --component
    component pos_reg 
    port ( 
        wr_pulse        : in STD_LOGIC;
        reset           : in std_logic;
        dataIn          : in STD_LOGIC_VECTOR(4 downto 0);
        dataOut         : out STD_LOGIC_VECTOR(4 downto 0));
    end component;

    component score_reg 
    port (
        wr_pulse        : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic_vector(2 downto 0);
        dataOut         : out std_logic_vector(2 downto 0));
    end component;

    component register_ex IS
    port ( 
        wr_pulse        : in std_logic;
        reset           : in std_logic;
        dataIn          : in std_logic;
        dataOut         : out std_logic
        );
    END component;

    signal wr_pulse, reset, dI, dO      : std_logic;
    signal dataInPos, dataOutPos        : std_logic_vector(4 downto 0);
    signal dataInScore, dataOutScore    : std_logic_vector(2 downto 0);

    

begin
    reg_ex0 : register_ex
    port map ( wr_pulse => wr_pulse, reset => reset, dataIn => dI, dataOut => dO);

    Pos_Reg0 : pos_reg
    port map (wr_pulse => wr_pulse, reset => reset, dataIn => dataInPos, dataOut => dataOutPos);

    Score_Reg0 : score_reg
    port map (wr_pulse => wr_pulse, reset=>reset, dataIn=>dataInScore, dataOut=>dataOutScore);
    
    process 
    begin

        dataInPos <= "00000";
        wr_pulse <= '1';
        reset <= '0';
        wait for 1 ns;
        assert dataOutPos = "00000"
            report "wrong output" severity error;

        dataInPos <= "00001";
        --reset <= '0';
        wait for 1 ns;
        assert dataOutPos = "00000"
            report "wrong output" severity error;

        dataInPos <= "00001";
        --reset <= '0';
        wr_pulse <= '1';
        wait for 1 ns;
        assert dataOutPos = "00001"
            report "wrong output" severity error;

        dI <= '0';
        wr_pulse <= '1';
        reset <= '0';
        wait for 1 ns;
        assert dO = '0'
            report "wrong output" severity error;
        --DataIn    wr_pulse    reset   DataOut (Q)
        --0         1           0       0
        --1         1           0       1
        --0         0           0       X
        --1         0           0       X
        --0         1           1       0
        --1         1           1       0
        --0         0           1       0
        --1         0           1       0


        
        wait;
    end process;
END behaviour;