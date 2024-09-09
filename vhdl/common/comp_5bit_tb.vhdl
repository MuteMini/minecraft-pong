library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_5bit_tb is
end comp_5bit_tb;

architecture behav of comp_5bit_tb is
    signal a, b: std_logic_vector(4 downto 0) := (others => '0');
    signal gt, eq, lt: std_logic;
begin
    comp_5bit_0: entity work.comp_5bit
    port map(
        a => a,
        b => b,
        gt => gt,
        eq => eq,
        lt => lt
    );

    process
        type array_5bit_io is record
            a, b: std_logic_vector(4 downto 0);
            gt, eq, lt: std_logic;
        end record;

        type comp_5bit_io_array is array (natural range <>) of array_5bit_io;
        constant comp_5bit_io : comp_5bit_io_array :=
            (("00000", "00000", '0', '1', '0'),
             ("00000", "00001", '0', '0', '1'),
             ("00110", "11110", '0', '0', '1'),
             ("11101", "11111", '0', '0', '1'),
             ("00010", "00001", '1', '0', '0'),
             ("10101", "00010", '1', '0', '0'),
             ("11011", "10100", '1', '0', '0'),
             ("11010", "11010", '0', '1', '0'));

    begin
        for i in comp_5bit_io'range loop
            a <= comp_5bit_io(i).a;
            b <= comp_5bit_io(i).b;

            wait for 1 ns;
            assert gt = comp_5bit_io(i).gt
                report "bad gt value" severity error;
            assert lt = comp_5bit_io(i).lt
                report "bad lt value" severity error;
        end loop;  
        wait;
    end process;
end behav;