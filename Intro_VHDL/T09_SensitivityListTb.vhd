-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

entity T09_SensitivityListTb is 
end entity;

architecture sim of T09_SensitivityListTb is

    signal CountUp: integer   := 0;
    signal CountDown: integer := 10;

begin 

	process is 
	begin
        CountUp <= CountUp + 1;
        CountDown <= CountDown - 1;
        wait for 10 ns;      
        
	end process;
    -- process is triggered using Wait On 
    process is 
        begin 
            if CountUp = CountDown then
                report "Process A: JackPot!";
            end if;
            
            wait on CountUp, CountDown;

        end process;     

    process(CountUp, CountDown) is
        begin
        if CountUp = CountDown then
            report "Process B: JackPot!";
        end if;
        
        
    end process;     


end architecture;

