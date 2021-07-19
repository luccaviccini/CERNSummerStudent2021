-- Entity Example # 2 - 2:1 Multiplexer

-- Library
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity MULTIPLEXER is
	port (
		A : in std_logic_vector(3 downto 0);
		B : in std_logic_vector(3 downto 0);
		sel : in std_logic;
		C : out std_logic_vector(3 downto 0));
end MULTIPLEXER;

-- architecture
architecture behave of MULTIPLEXER is
begin
	mux: process(A, B, sel)
	begin
		if (sel = '1') then
			C <= A;
		else
			C <= B;
		end if;
	end process;
end behave;