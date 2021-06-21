-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

library ieee;
use ieee.std_logic_1164.all;


entity T11_StdLogicVectorTb is 
end entity;

architecture sim of T11_StdLogicVectorTb is
    signal Slv1 : std_logic_vector(7 downto 0);
    signal Slv2 : std_logic_vector(7 downto 0) := (others => '0');
    signal Slv3 : std_logic_vector(7 downto 0) := (others => '1');
    signal Slv4 : std_logic_vector(7 downto 0) := x"AA";
    signal Slv5 : std_logic_vector(0 to 7) := "10101010";
    signal Slv6 : std_logic_vector(7 downto 0) := "00000001";




begin 

	process is 
	begin
        -- Shift Register 
        -- Slv6'right .... right attribute takes the number of bit of right
        wait for 10 ns;     
        for i in Slv6'left downto (Slv6'right + 1) loop
            Slv6(i) <= Slv6(i-1);
        end loop;    
        
        Slv6(Slv6'right) <= Slv6(Slv6'left);
	end process;
end architecture;

