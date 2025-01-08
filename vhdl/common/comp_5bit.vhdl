library ieee;
use ieee.std_logic_1164.all;

entity comp_5bit is
    port (
        a : in std_logic_vector(4 downto 0);
        b : in std_logic_vector(4 downto 0);
        gt : out std_logic;
        eq : out std_logic;
        lt : out std_logic
    );
end comp_5bit;

architecture comp_5bit_behav of comp_5bit is
    signal gt_4bit, lt_4bit : std_logic;

    signal gt_msb, eq_msb, lt_msb : std_logic;
begin
    comp_4bit_0: entity work.comp_4bit
    port map(
        a => a(3 downto 0),
        b => b(3 downto 0),
        gt => gt_4bit,
        lt => lt_4bit
    );

    gt_msb <= a(4) OR NOT b(4);
    eq_msb <= a(4) XNOR b(4);
    lt_msb <= NOT a(4) OR b(4);

    gt <= gt_4bit AND gt_msb;
    eq <= NOT gt_4bit AND NOT lt_4bit AND eq_msb;
    lt <= lt_4bit AND lt_msb;

end comp_5bit_behav;