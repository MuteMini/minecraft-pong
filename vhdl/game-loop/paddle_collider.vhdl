library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Assuming that the paddle has been collided with on the x-axis, what would our new velocity values be?
entity paddle_collider is
    port (
        ball_y : in std_logic_vector(4 downto 0);
        p_pos : in std_logic_vector(4 downto 0);
        c_x_vel : in std_logic;
        n_x_vel : out std_logic;
        c_y_vel : in std_logic_vector(2 downto 0);
        n_y_vel : out std_logic_vector(2 downto 0)
    );
end paddle_collider;

architecture paddle_collider_behav of paddle_collider is
    -- Represents the ranges of the paddle that will be checked for equality
    type std_logic_aoa is array (natural range <>) of std_logic_vector;

    signal p_range: std_logic_aoa(0 to 5)(4 downto 0);
begin       
    -- Making 5 diffent 5 bit CCAs make this faster, but a cascading increment approach might be cheaper.
    p_range(0) <= p_pos;
    gen_cca:
    for I in 1 to 5 generate
        paddle_I : entity work.cancel_carry_adder generic map(adder_width => 5)
            port map(a => p_pos, b => std_logic_vector(to_unsigned(I, 5)), output => p_range(I));
    end generate gen_cca;

    process (all)
        variable touched : boolean := false;
    begin
        if    ball_y = p_range(0) then n_y_vel <= "101"; touched := true; -- -3 in twos complement
        elsif ball_y = p_range(1) then n_y_vel <= "110"; touched := true; -- -2 in twos complement
        elsif ball_y = p_range(2) then n_y_vel <= "111"; touched := true; -- -1 in twos complement
        elsif ball_y = p_range(3) then n_y_vel <= "001"; touched := true; -- +1 in twos complement
        elsif ball_y = p_range(4) then n_y_vel <= "010"; touched := true; -- +2 in twos complement
        elsif ball_y = p_range(5) then n_y_vel <= "011"; touched := true; -- +3 in twos complement
        else                       n_y_vel <= c_y_vel; touched := false;
        end if;

        n_x_vel <= NOT c_x_vel when touched else c_x_vel;
    end process;

end paddle_collider_behav;

