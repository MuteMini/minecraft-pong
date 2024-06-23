library ieee;
use ieee.std_logic_1164.all;

entity generic_register is
    generic (
        data_width : integer := 4
    );
    port ( 
        clk          : in std_logic;
        reset        : in std_logic;
        data_in      : in std_logic_vector(data_width - 1 downto 0);
        data_out     : out std_logic_vector(data_width - 1 downto 0)
    );
end generic_register;

architecture generic_register_behav of generic_register is
begin 
    process (clk, reset)
    begin
        if reset = '1' then
            data_out <= (others => '0');
        elsif rising_edge(clk) then
            data_out <= data_in;
        end if;
    end process;
end generic_register_behav;
