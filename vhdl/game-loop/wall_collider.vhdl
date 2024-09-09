library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity wall_collider is
    port (
        c_y_vel : in std_logic_vector(2 downto 0);
        n_y_vel : out std_logic_vector(2 downto 0)
    );
end wall_collider;

architecture wall_collider_behav of wall_collider is

begin        
    -- Implement if statements with or/and gates, cases with mux.
    process (all)
    begin
        case c_y_vel is
            when "011" => n_y_vel <= "101"; 
            when "010" => n_y_vel <= "110"; 
            when "001" => n_y_vel <= "111"; 
            when "111" => n_y_vel <= "001"; 
            when "110" => n_y_vel <= "010"; 
            when "101" => n_y_vel <= "011"; 
            when others => n_y_vel <= "001";
        end case;
    end process;

end wall_collider_behav;