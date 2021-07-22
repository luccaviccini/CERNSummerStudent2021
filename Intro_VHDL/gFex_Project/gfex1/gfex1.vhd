library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity gfex1  is
generic(DataWidth : integer := 16);
port( 
	signal clk 	    : in std_logic;
	signal gt_inp0  : in  std_logic_vector(DataWidth-1 downto 0);
	signal gt_inp1  : in  std_logic_vector(DataWidth-1 downto 0); 
	-- selector
	signal eta_ind  : in  std_ulogic_vector(2 downto 0);
	-- output
	signal d_out0    : out std_logic_vector(DataWidth-1 downto 0);
	signal d_out1    : out std_logic_vector(DataWidth-1 downto 0);
	
	signal biggest_sum : out std_logic_vector(DataWidth + 2 downto 0));
	

	
end entity;

architecture rtl of gfex1 is

type reg_comp is array (natural range <>) of std_logic_vector(DataWidth-1 downto 0);
type reg_soma is array (natural range <>) of std_logic_vector(DataWidth + 2 downto 0);

signal cycle : integer := 0;

signal big6 : reg_comp(0 to 1);
signal sum6 : reg_soma(0 to 1);




begin
	process(clk) is
	variable temp : std_logic_vector(DataWidth + 2 downto 0) := "0000000000000000000";
	
    begin
		if rising_edge(clk) then
			case eta_ind is 			
				when "000" =>
					big6(0) <= gt_inp0;
					sum6(0) <= ('0' & '0' & '0' & gt_inp0);
					big6(1)	<= gt_inp1;
					sum6(1) <= ('0' & '0' & '0' & gt_inp1);	
					
				when "110" =>
					d_out0 <= big6(0);
					d_out1 <= big6(1);
					
					for i in 0 to 1 loop 
						if(sum6(i) > temp) then
							temp := sum6(i);
						end if;
					end loop;
					
					biggest_sum <= temp;
					cycle <= cycle + 1;
					
				when "111" =>
					d_out0 <= x"FFFF";
					d_out1 <= x"FFFF";
				
				when others =>
				
					if(gt_inp0 > big6(0)) then big6(0) <= gt_inp0; end if;      sum6(0) <= sum6(0) + ('0' & '0' & '0' & gt_inp0);				
					if(gt_inp1 > big6(1)) then big6(1) <= gt_inp1; end if; 		sum6(1) <= sum6(1) + ('0' & '0' & '0' & gt_inp1);
					
					
			end case;
		end if;	
   end process;
end architecture;