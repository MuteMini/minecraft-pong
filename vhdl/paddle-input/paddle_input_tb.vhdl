library ieee;
use ieee.std_logic_1164.all;

entity paddle_input_tb is
end paddle_input_tb;

architecture behav of paddle_input_tb is
    component paddle_input
        port (  up, down:  in std_logic;
                vel:       out std_logic_vector(4 downto 0));
    end component;

    -- Taking paddle_input component from work library (GHDL default)
    for paddle_input_0 : paddle_input use entity work.paddle_input;

    signal up, down : std_logic;
    signal vel : std_logic_vector(4 downto 0);
begin
    paddle_input_0 : paddle_input 
        port map(up=>up, down=>down, vel=>vel);

    process
    begin
        -- Check correct value when no inputs being pressed
        up <= '0';
        down <= '0';
        wait for 1 ns;
        assert vel = "00000"
            report "bad default value" severity error;

        -- Check correct value when up input is pressed
        up <= '1';
        down <= '0';
        wait for 1 ns;
        assert vel = "00001"
            report "bad up value" severity error;

        -- Check correct value when down input is pressed
        up <= '0';
        down <= '1';
        wait for 1 ns;
        assert vel = "11111"
            report "bad down value" severity error;
        wait;
    end process;
end behav;