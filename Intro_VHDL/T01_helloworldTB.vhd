entity T01_helloworldTB is 
end entity;

architecture sim of T01_helloworldTB is
begin 
	
	process is 
		
		begin 
			report "11111";
			wait for 10 ns;
			report "22222";
		end process;
		

	process is 
		begin 
			report "33333";
			wait for 10 ns;
			report "44444";
		end process;

end architecture;

