entity T03_LoopTb is 
end entity;

architecture sim of T03_LoopTb is
begin 


	process is 
	begin 
		-- This is the start of the process "Thread"
		report "Hello";
		loop 
			report "Peekabooo!!"; -- consumes no time
		
			wait for 10 ns;
			exit; 
		end loop;

		report "Goodbye";
		wait;
		-- The process will loop back to the start from here.
	end process;


end architecture;

