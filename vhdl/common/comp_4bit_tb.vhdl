library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comp_4bit_tb is
end comp_4bit_tb;

architecture behav of comp_4bit_tb is
    signal a, b: std_logic_vector(3 downto 0) := (others => '0');
    signal gt, lt: std_logic;
begin
    comp_4bit_0: entity work.comp_4bit
     port map(
        a => a,
        b => b,
        gt => gt,
        lt => lt
    );

    process
        type array_4bit_io is record
            a, b: std_logic_vector(3 downto 0);
            gt, lt: std_logic;
        end record;

        type comp_4bit_io_array is array (natural range <>) of array_4bit_io;
        constant comp_4bit_io : comp_4bit_io_array :=
            (("0000", "0000", '0', '0'),
             ("0000", "0001", '0', '1'),
             ("0110", "1110", '0', '1'),
             ("1101", "1111", '0', '1'),
             ("0010", "0001", '1', '0'),
             ("0101", "0010", '1', '0'),
             ("1011", "0100", '1', '0'),
             ("1010", "1010", '0', '0'));

    begin
        for i in comp_4bit_io'range loop
            a <= comp_4bit_io(i).a;
            b <= comp_4bit_io(i).b;

            wait for 1 ns;
            assert gt = comp_4bit_io(i).gt
                report "bad gt value" severity error;
            assert lt = comp_4bit_io(i).lt
                report "bad lt value" severity error;
        end loop;  
        wait;
    end process;
end behav;