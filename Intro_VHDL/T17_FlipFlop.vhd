library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity T17_FlipFlop is
port(    
    Clk     : in std_logic;
    nRst    : in std_logic; -- Negative reet
    Input   : in std_logic;
    Output1 : out std_logic);
end entity;
 
architecture rtl of T17_FlipFlop is
begin

    -- FlipFlop with synchronized reset.
    process(Clk) is 
    begin 
        if rising_edge(Clk) then
            if nRst = '0' then  
                Output1 <= '0';
            else
                Output1 <= Input;
            end if;  
        end if;



    end process;

end architecture;


