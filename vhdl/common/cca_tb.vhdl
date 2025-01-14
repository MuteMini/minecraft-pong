library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cca_tb is
end cca_tb;

architecture behav of cca_tb is
    component cancel_carry_adder is
        generic (
            adder_width : integer := 1
        );
        port (
            a : in std_logic_vector(adder_width - 1 downto 0);
            b : in std_logic_vector(adder_width - 1 downto 0);
            output : out std_logic_vector(adder_width - 1 downto 0)
        );
    end component;

    for cca_3bit : cancel_carry_adder use entity work.cancel_carry_adder;
    for cca_5bit : cancel_carry_adder use entity work.cancel_carry_adder;

    signal a_3bit, b_3bit, out_3bit : std_logic_vector(2 downto 0);
    signal a_5bit, b_5bit, out_5bit : std_logic_vector(4 downto 0);
begin
    cca_3bit : cancel_carry_adder
        generic map (adder_width => 3)
        port map (  a=>a_3bit, 
                    b=>b_3bit, 
                    output=>out_3bit );

    cca_5bit : cancel_carry_adder
        generic map (adder_width => 5)
        port map (  a=>a_5bit, 
                    b=>b_5bit, 
                    output=>out_5bit );

    process
        type array_3bit_io is record
            a, b, o : std_logic_vector(2 downto 0);
        end record;
        
        type array_5bit_io is record
            a, b, o : std_logic_vector(4 downto 0);
        end record;

        type add_3bit_io_array is array (natural range <>) of array_3bit_io;
        constant cca_3bit_io : add_3bit_io_array :=
            (("000", "000", "000"),
             ("001", "001", "010"),
             ("101", "001", "110"),
             ("011", "011", "110"),
             ("111", "001", "000"),
             ("111", "110", "101"));

        type add_5bit_io_array is array (natural range <>) of array_5bit_io;
        constant cca_5bit_io : add_5bit_io_array :=
            (("00000", "00000", "00000"),
             ("00001", "00001", "00010"),
             ("01101", "10001", "11110"),
             ("01010", "01100", "10110"),
             ("11101", "00011", "00000"),
             ("11010", "11011", "10101"));

    begin
        for i in cca_3bit_io'range loop
            a_3bit <= cca_3bit_io(i).a;
            b_3bit <= cca_3bit_io(i).b;

            wait for 1 ns;
            assert out_3bit = cca_3bit_io(i).o
                report "bad sum value" severity error;
        end loop;

        for i in cca_5bit_io'range loop
            a_5bit <= cca_5bit_io(i).a;
            b_5bit <= cca_5bit_io(i).b;

            wait for 1 ns;
            assert out_5bit = cca_5bit_io(i).o
                report "bad sum value" severity error;
        end loop;  
        wait;
    end process;
end behav;