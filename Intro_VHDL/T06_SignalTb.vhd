-- signals are only updated when the program pauses // and signals only remember the last
-- assignment to them... if there are multiple assignments before a pause, signal will only get last assignment.
-- whereas variables are updated imediately

entity T06_SignalTb is 
end entity;

architecture sim of T06_SignalTb is

    signal MySignal: integer :=0;

begin 

	process is 
        variable MyVar : integer := 0;
	begin
        
        report "***** Processes Begin *****";

        MyVar := MyVar + 1;
        MySignal <= Mysignal + 1;

        report "MyVariable=" & integer'image(MyVar) &
             ", MySignal= " & integer'image(Mysignal);

        MyVar := MyVar + 1;
        MySignal <= Mysignal + 1;    
        
        report "MyVariable=" & integer'image(MyVar) &
        ", MySignal= " & integer'image(Mysignal);        

        wait for 10 ns;  

        report "MyVariable=" & integer'image(MyVar) &
        ", MySignal= " & integer'image(Mysignal);

        
        
	end process;


end architecture;

