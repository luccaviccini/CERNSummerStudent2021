library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.jet_engine; -- library that contains jet_engine module

entity gfex_2 is 
generic(DataWidth : integer := 16);
port(
		-- inputs
		signal clk    	: in std_logic;
		-- input for each jet engine 
		signal je_in0 	: in std_logic_vector(DataWidth-1 downto 0);
		signal je_in1 	: in std_logic_vector(DataWidth-1 downto 0);
		-- eta_ind is common for all jet engines
		signal eta_ind  : in  std_logic_vector(2 downto 0); 
		-- outputs
		signal biggest_gt_out : out std_logic_vector(DataWidth - 1 downto 0); 		
		signal eta_ind_out : out std_logic_vector(2 downto 0);		
		signal jet_engine_number : out integer);
end gfex_2;	

architecture rtl of gfex_2 is 
-- biggest_gt is an array to store each jet engine biggest value
signal cycle : integer := 0;

-- array to store biggest of each jet engine. 
type biggest_gt_arr is array (natural range <>) of std_logic_vector(DataWidth-1 downto 0);
-- array to store the index of biggest jet engine
type eta_arr is array (natural range <>) of std_logic_vector(2 downto 0);

signal biggest_gt : biggest_gt_arr(0 to 1) := (others=>(others=>'0'));
signal eta 		  : eta_arr		  (0 to 1) := (others=>(others=>'0'));

	
begin 
	-- adding each jet engine 
	jet_engine0 : entity work.jet_engine(rtl)
	generic map (DataWidth => DataWidth)
	port map(
				clk => clk,
				je_in => je_in0,
				eta_ind => eta_ind,
				biggest_gt => biggest_gt(0),
				eta_ind_out => eta(0));
				
	jet_engine1 : entity work.jet_engine(rtl)
	generic map (DataWidth => DataWidth)
	port map(
				clk => clk,
				je_in => je_in1,
				eta_ind => eta_ind,
				biggest_gt => biggest_gt(1),
				eta_ind_out => eta(1));
	
process (clk, cycle) is
	variable temp : std_logic_vector(DataWidth -1 downto 0) := "0000000000000000";
	variable temp2 : std_logic_vector(2 downto 0) := "000"; -- store eta index
	variable temp3 : integer;
	begin 
		if rising_edge(clk) then
			case eta_ind is 
			when "000" => -- beginning of cycle. 
				-- the loop has to happen at eta = 0 once the biggest value for each jet engine in only available at eta = 6 (from jet engine module)
				for i in 0 to 1 loop -- loop to see which jet engine has biggest value 
					if( biggest_gt(i) > temp) then
						temp := biggest_gt(i);
						temp2 := eta(i);
						temp3 := i;
					 end if;	
				end loop;
				
			biggest_gt_out <= temp;
			eta_ind_out <= temp2;
			jet_engine_number <= temp3;
			temp := "0000000000000000";
			
			when "110" =>
				cycle <= cycle + 1;
			
			when others => null;			
				
			end case;			
		end if;
	end process;	
end architecture;
				