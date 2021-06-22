-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

library ieee;
use ieee.std_logic_1164.all;


entity T10_StdLogicTb is 
end entity;

architecture sim of T10_StdLogicTb is

    signal Signal1 : std_logic := '0';
    signal Signal2 : integer   := 0;
    

begin 

	process is 
	begin

        wait for 10 ns;      
        Signal1 <= not Signal1;
	end process;


	-- Driver B
	process (Signal1) is
	begin
	
		if rising_edge(Signal1) then
		
		Signal2 <= Signal2 + 1;
		end if;
	
	end process;
 

end architecture;

