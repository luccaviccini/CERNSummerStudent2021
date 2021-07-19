-- Entity example #1

-- Libraries
library ieee;
use ieee.std_logic_1164.all;

-- Entity
entity ARCH_EXAMPLE_1 is
	port (
		A : in std_logic;
		B : in std_logic;
		C : in std_logic;
		D : out std_logic);
end ARCH_EXAMPLE_1;

-- Architecture
architecture dataflow of ARCH_EXAMPLE_1
begin

D <= (A AND B) XNOR ((A AND B) OR (NOT C));

end dataflow;
