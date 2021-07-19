
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity T20_Generic  is
generic(DataWidth : integer);
port( 
  signal din_0 : in  std_logic_vector(DataWidth-1 downto 0);
  signal din_1 : in  std_logic_vector(DataWidth-1 downto 0);
  signal din_2 : in  std_logic_vector(DataWidth-1 downto 0);
  signal din_3 : in  std_logic_vector(DataWidth-1 downto 0);
  signal sel   : in  std_logic_vector(1 downto 0);
  signal dout  : out std_logic_vector(DataWidth-1 downto 0));
end entity;

architecture rtl of T20_Generic is
begin
  process(sel,din_0,din_1,din_2,din_3) is
  begin
      case sel is 
        when "00" =>
          dout  <= din_0;
        when "01" =>
          dout  <= din_1;
        when "10" =>
          dout  <= din_2;
        when "11" =>
          dout  <= din_3;
        when others =>
          dout  <= (others => 'X');
      end case;
   end process;
end architecture;


