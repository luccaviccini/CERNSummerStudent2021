library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- This module represents 2 jet engines of an FPGA on gFEX. Each jet engine receives information from gtowers in sequential temporal fashion.
-- during each cycle of inputs, each jet_engine will recieve 6 Tower Inputs;

entity gfex2  is
generic(DataWidth : integer := 16); -- size in bits of hex word read from stimulus file (actually comes from test bench)
port( 

	-- Inputs for module 
	signal clk 	    : in std_logic; --  frequency/period specified in testbench.
	
	-- jet engine inputs ( since this module is for 2 jet engines, there are 2 inputs).
	signal je_inp0  : in  std_logic_vector(DataWidth-1 downto 0);
	signal je_inp1  : in  std_logic_vector(DataWidth-1 downto 0); 
	
	-- eta indicator is common for all jet engines since all jet engines recieve the information in parallel.
	signal eta_ind  : in  std_ulogic_vector(2 downto 0);
	-- output for each jet engine
	signal je_out0    : out std_logic_vector(DataWidth-1 downto 0);
	signal je_out1    : out std_logic_vector(DataWidth-1 downto 0);
	
	-- (each jet engine receives 6 gTowers, and this signal outputs the biggest sum among all jet engines).
	-- this signal has to be 19 bits once it stores the sum of six 16 bit signals.
	signal biggest_sum : out std_logic_vector(DataWidth + 2 downto 0));
end entity;

architecture rtl of gfex2 is
-- type reg_comp (register for comparison) is an array to store the biggest value received during each cycle.
type reg_comp is array (natural range <>) of std_logic_vector(DataWidth-1 downto 0);

-- type reg_sum (register for sum) is an array that stores the sum all values sequentially recieved during a cycle for each jet engine.
-- the size of the data of the array has to be 19 once it stores the sum of six, 16 bit signals.
type reg_sum is array (natural range <>) of std_logic_vector(DataWidth + 2 downto 0);

-- a cycle consists of 7 sequential values received, the 7th value should not be used.
signal cycle : integer := 0;

-- actually creating a signals of types mentioned above.
-- both of them have size 2 (2 jet engines) and all positions of array are set to 0 initially.
-- each position in the array corresponds to one jet engine.
signal big6 : reg_comp(0 to 1) := (others=>(others=>'0'));
signal sum6 : reg_sum(0 to 1) := (others=>(others=>'0'));




begin
	process(clk) is
	-- temporary variable created inside process to check for biggest sum of jet_engines.
	variable temp : std_logic_vector(DataWidth + 2 downto 0) := "0000000000000000000";
	
    begin
		if rising_edge(clk) then
			case eta_ind is 			
				when "000" => -- beginning of the cycle
					big6(0) <= je_inp0;				sum6(0) <= ('0' & '0' & '0' & je_inp0); --  the '0's are necessary because sum6 is 19 bits and je_inpX is 16 bits
					big6(1)	<= je_inp1;				sum6(1) <= ('0' & '0' & '0' & je_inp1);	
					
				when "110" => -- 7th value => eta = 6 -> do nothing and only output values
					je_out0 <= big6(0);
					je_out1 <= big6(1);
					
					--- at the end of the cycle (eta=6) this for loop goes through the sum vector to find the biggest sum among all jet engines.
					for i in 0 to 1 loop 
						if(sum6(i) > temp) then
							temp := sum6(i);
						end if;
					end loop;
					
					biggest_sum <= temp; -- output for biggest sum found on previous for loop.
					cycle <= cycle + 1;
					
				when "111" => --  never going to have this eta value.
					je_out0 <= "X";
					je_out1 <= "X";
				
				when others => -- this is the case for etas from 1 to 5 including.
					-- if value in input is bigger than the value stored in 	-- adding inputs for each jet_engine
					-- the array -> substitute the value in the array 
					--(array of type reg_comp)
					
					if(je_inp0 > big6(0)) then big6(0) <= je_inp0; end if;      sum6(0) <= sum6(0) + ('0' & '0' & '0' & je_inp0);				
					if(je_inp1 > big6(1)) then big6(1) <= je_inp1; end if; 		sum6(1) <= sum6(1) + ('0' & '0' & '0' & je_inp1);					
					
			end case;
		end if;	
   end process;
end architecture;