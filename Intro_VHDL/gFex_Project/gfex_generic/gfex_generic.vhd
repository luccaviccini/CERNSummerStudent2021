library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gfex_generic  is
generic(DataWidth : integer := 16);
port( 
	signal clk 	 : in std_logic;
	signal din_0 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_1 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_2 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_3 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_4 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_5 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_6 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_7 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_8 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_9 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_10 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_11 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_12 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_13 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_14 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_15 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_16 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_17 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_18 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_19 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_20 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_21 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_22 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_23 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_24 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_25 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_26 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_27 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_28 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_29 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_30 : in  std_logic_vector(DataWidth-1 downto 0);
	signal din_31 : in  std_logic_vector(DataWidth-1 downto 0);	
	-- selector
	signal sel   : in  std_ulogic_vector(2 downto 0);
	-- output
	signal dout  : out std_logic_vector(DataWidth-1 downto 0));
	
end entity;

architecture rtl of gfex_generic is
begin
-- this is a dummy process that depending on sel it outputs signals 0 to 5. It completely ignores all other outputs.
	process(clk) is
    begin
		if rising_edge(clk) then
			case sel is 
				when "000" =>
					dout  <= din_0;
				when "001" =>
					dout  <= din_1;
				when "010" =>
					dout  <= din_2;
				when "011" =>
					dout  <= din_3;
				when "100" =>
					dout  <= din_4;
				when "101" =>
					dout  <= din_5;
				when "111" =>
					dout  <= x"FFFF";  			
				when others =>
					dout  <= (others => 'X');
			end case;
		end if;	
   end process;
end architecture;