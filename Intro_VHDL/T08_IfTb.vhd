-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

entity T08_IfTb is 
end entity;

architecture sim of T08_IfTb is

    signal CountUp: integer   := 0;
    signal CountDown: integer := 10;

begin 

	process is 
	begin
        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;      
        
	end process;

    process is 
        begin 
            if CountUp > CountDown then
                report " CountUp is Larger";
            elsif CountUp < CountDown then
                report "CountDown is larger";
            else  
                report "They are the same" ;       
            end if;
            wait on CountUp, CountDown;

        end process;     



end architecture;

