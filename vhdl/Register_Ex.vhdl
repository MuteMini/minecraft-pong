entity Register_Ex is
    -- inputs and outputs of a hardware piece plus their bit size
    port in ( 
        reset   in bit
        clk     in bit
        i0      in bit 3 downto 0
        i1      out bit 7 downto 0
        )
end Register_ex;

architecture behaviour of Register_ex 
is
begin 
    regi: process is
        if i0 > 1
            i1 <= i1 + 1;
    end process
    r: process is
        i1 <= 0;
    end process
    
end behaviour