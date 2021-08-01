library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- This module is a model for a jet engine
entity jet_engine is 
generic(DataWidth : integer := 16);
port (
		-- Inputs
		signal clk : in std_logic; -- frequency/ period specidied in testbench
		signal je_in : in std_logic_vector(DataWidth - 1 downto 0); -- sequential input 
		signal eta_ind  : in  std_logic_vector(2 downto 0); -- corresponding eta to the input
		
		-- Outputs of module
		signal biggest_gt : out std_logic_vector(DataWidth - 1 downto 0); -- biggest gtower in each cycle
		signal eta_ind_out : out std_logic_vector(2 downto 0)); -- eta corresponding to the biggest tower in respective cycle
		
end jet_engine;	

architecture rtl of jet_engine is

signal cycle : integer := 0;

begin 
	process(clk) is
	-- big6 is a temp variable to store the biggest gtower found on one cycle.
	variable big6 : std_logic_vector(DataWidth - 1 downto 0):= "0000000000000000";
	variable  big_eta : std_logic_vector(2 downto 0) := "XXX";
	begin 
		if rising_edge(clk) then
			case eta_ind is 
				when "000" => -- beginning of the cycle, put input on temporary variable
					big6 := je_in;
					big_eta := eta_ind;
					
				when "110" => -- end of cycle -> output answer
					biggest_gt <= big6;
					eta_ind_out <= big_eta; 
					cycle <= cycle + 1;
					
				when "111" => -- never going to happen
					biggest_gt <=  "XXXXXXXXXXXXXXXX";
	                eta_ind_out <= "XXX";
					
				when others => -- check for etas from 1 to 5 if they are bigger than temporary variable
					if(je_in > big6) then 
						big6 := je_in;
						big_eta := eta_ind;
					end if;
			end case;			
		end if;
	end process;
end architecture;	