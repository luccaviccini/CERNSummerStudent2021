-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

entity T07_WaitOnUnintlTb is 
end entity;

architecture sim of T07_WaitOnUnintlTb is

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
            wait on CountUp, CountDown;
            report "CountUp=" & integer'image(CountUp) &
                    " CountDown=" & integer'image(CountDown);
        end process;     

    process is 
    begin 
        wait until CountUp = CountDown;
        report "Jackpot!";

    end process;


end architecture;

