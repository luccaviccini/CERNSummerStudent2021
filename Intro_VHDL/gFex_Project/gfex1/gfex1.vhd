library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfex1  is
generic(DataWidth : integer := 16);
port( 
	signal clk 	 : in std_logic;
	signal gt_inp1 : in  std_logic_vector(DataWidth-1 downto 0);
	-- selector
	signal eta_ind   : in  std_ulogic_vector(2 downto 0);
	-- output
	signal d_out  : out std_logic_vector(DataWidth-1 downto 0));

	
end entity;

architecture rtl of gfex1 is


signal cycle : integer := 0;


begin
	process(clk) is
    begin
		if rising_edge(clk) then
			case eta_ind is 			
				when "000" =>
					d_out <= gt_inp1;						
					
				when "001" =>
					d_out <= gt_inp1;
					
				when "010" =>
					d_out <= gt_inp1;					
					
				when "011" =>
					d_out <= gt_inp1;
					
				when "100" =>
					d_out <= gt_inp1;					
					
				when "101" =>
					d_out <= gt_inp1;
					
				when "110" =>
					d_out <= x"1111";
					cycle <= cycle + 1;
					
				when others =>
					d_out  <= (others => 'X');
			end case;
		end if;	
   end process;
end architecture;