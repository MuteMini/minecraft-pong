library ieee;
use ieee.std_logic_1164.all;

entity vel_reg is
    port ( 
        clk, reset : in std_logic;
        x_vel_in   : in std_logic;
        x_vel_out  : out std_logic;
        y_vel_in   : in std_logic_vector(2 downto 0);
        y_vel_out  : out std_logic_vector(2 downto 0)
    );
end vel_reg;

architecture vel_reg_behav of vel_reg is
begin 

    process (clk, reset)
    begin
        if reset = '1' then
            x_vel_out <= '0';
        elsif rising_edge(clk) then
            x_vel_out <= x_vel_in;
        end if;
    end process;

    y_reg : entity work.generic_register
        generic map (data_width => 3)
        port map (clk => clk, reset => reset, data_in => y_vel_in, data_out => y_vel_out);
end vel_reg_behav;