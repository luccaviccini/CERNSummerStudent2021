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
	signal dout6_0  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_1  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_2  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_3  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_4  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_5  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_6  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_7  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_8  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_9  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_10  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_11  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_12  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_13  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_14  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_15  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_16  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_17  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_18  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_19  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_20  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_21  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_22  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_23  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_24  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_25  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_26  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_27  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_28  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_29  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_30  : out std_logic_vector(DataWidth-1 downto 0);
	signal dout6_31  : out std_logic_vector(DataWidth-1 downto 0);
	
	signal dout32  : out std_logic_vector(DataWidth-1 downto 0));
	
end entity;

architecture rtl of gfex_generic is


type reg_comp is array (DataWidth*2 - 1 downto 0) of std_logic_vector(DataWidth - 1 downto 0);
type reg_soma is array (DataWidth*2 - 1 downto 0) of std_logic_vector(DataWidth + 2 downto 0);

signal reg_comp_each_channel : reg_comp;
signal reg_soma_each_channel  : reg_soma;

begin
	process(clk) is
	variable temp : std_logic_vector(DataWidth+2 downto 0) := x"00000";
    begin
		if rising_edge(clk) then
			case sel is 
				when "000" =>
                    reg_comp_each_channel(0) <= din_0;      reg_soma_each_channel(0) <= din_0;
                    reg_comp_each_channel(1) <= din_1;      reg_soma_each_channel(1) <= din_1;
                    reg_comp_each_channel(2) <= din_2;      reg_soma_each_channel(2) <= din_2;
                    reg_comp_each_channel(3) <= din_3;      reg_soma_each_channel(3) <= din_3;
                    reg_comp_each_channel(4) <= din_4;      reg_soma_each_channel(4) <= din_4;
                    reg_comp_each_channel(5) <= din_5;      reg_soma_each_channel(5) <= din_5;
                    reg_comp_each_channel(6) <= din_6;      reg_soma_each_channel(6) <= din_6;
                    reg_comp_each_channel(7) <= din_7;      reg_soma_each_channel(7) <= din_7;
                    reg_comp_each_channel(8) <= din_8;      reg_soma_each_channel(8) <= din_8;
                    reg_comp_each_channel(9) <= din_9;      reg_soma_each_channel(9) <= din_9;
                    reg_comp_each_channel(10) <= din_10;      reg_soma_each_channel(10) <= din_10;
                    reg_comp_each_channel(11) <= din_11;      reg_soma_each_channel(11) <= din_11;
                    reg_comp_each_channel(12) <= din_12;      reg_soma_each_channel(12) <= din_12;
                    reg_comp_each_channel(13) <= din_13;      reg_soma_each_channel(13) <= din_13;
                    reg_comp_each_channel(14) <= din_14;      reg_soma_each_channel(14) <= din_14;
                    reg_comp_each_channel(15) <= din_15;      reg_soma_each_channel(15) <= din_15;
                    reg_comp_each_channel(16) <= din_16;      reg_soma_each_channel(16) <= din_16;
                    reg_comp_each_channel(17) <= din_17;      reg_soma_each_channel(17) <= din_17;
                    reg_comp_each_channel(18) <= din_18;      reg_soma_each_channel(18) <= din_18;
                    reg_comp_each_channel(19) <= din_19;      reg_soma_each_channel(19) <= din_19;
                    reg_comp_each_channel(20) <= din_20;      reg_soma_each_channel(20) <= din_20;
                    reg_comp_each_channel(21) <= din_21;      reg_soma_each_channel(21) <= din_21;
                    reg_comp_each_channel(22) <= din_22;      reg_soma_each_channel(22) <= din_22;
                    reg_comp_each_channel(23) <= din_23;      reg_soma_each_channel(23) <= din_23;
                    reg_comp_each_channel(24) <= din_24;      reg_soma_each_channel(24) <= din_24;
                    reg_comp_each_channel(25) <= din_25;      reg_soma_each_channel(25) <= din_25;
                    reg_comp_each_channel(26) <= din_26;      reg_soma_each_channel(26) <= din_26;
                    reg_comp_each_channel(27) <= din_27;      reg_soma_each_channel(27) <= din_27;
                    reg_comp_each_channel(28) <= din_28;      reg_soma_each_channel(28) <= din_28;
                    reg_comp_each_channel(29) <= din_29;      reg_soma_each_channel(29) <= din_29;
                    reg_comp_each_channel(30) <= din_30;      reg_soma_each_channel(30) <= din_30;
                    reg_comp_each_channel(31) <= din_31;      reg_soma_each_channel(31) <= din_31;

					
				when "101" =>
					dout6_0  <= reg_comp_each_channel(0);
					dout6_1  <= reg_comp_each_channel(1);
					dout6_2  <= reg_comp_each_channel(2);
					dout6_3  <= reg_comp_each_channel(3);
					dout6_4  <= reg_comp_each_channel(4);
					dout6_5  <= reg_comp_each_channel(5);
					dout6_6  <= reg_comp_each_channel(6);
					dout6_7  <= reg_comp_each_channel(7);
					dout6_8  <= reg_comp_each_channel(8);
					dout6_9  <= reg_comp_each_channel(9);
					dout6_10  <= reg_comp_each_channel(10);
					dout6_11  <= reg_comp_each_channel(11);
					dout6_12  <= reg_comp_each_channel(12);
					dout6_13  <= reg_comp_each_channel(13);
					dout6_14  <= reg_comp_each_channel(14);
					dout6_15  <= reg_comp_each_channel(15);
					dout6_16  <= reg_comp_each_channel(16);
					dout6_17  <= reg_comp_each_channel(17);
					dout6_18  <= reg_comp_each_channel(18);
					dout6_19  <= reg_comp_each_channel(19);
					dout6_20  <= reg_comp_each_channel(20);
					dout6_21  <= reg_comp_each_channel(21);
					dout6_22  <= reg_comp_each_channel(22);
					dout6_23  <= reg_comp_each_channel(23);
					dout6_24  <= reg_comp_each_channel(24);
					dout6_25  <= reg_comp_each_channel(25);
					dout6_26  <= reg_comp_each_channel(26);
					dout6_27  <= reg_comp_each_channel(27);
					dout6_28  <= reg_comp_each_channel(28);
					dout6_29  <= reg_comp_each_channel(29);
					dout6_30  <= reg_comp_each_channel(30);
					dout6_31  <= reg_comp_each_channel(31);
					
					for i in 0 to 31 loop
						if (reg_soma_each_channel(i) > temp) then
							temp := reg_soma(i);	
						end if;				
					end loop;
					
					dout32 <= temp;
				when "111" =>
					dout  <= x"FFFF";  			
				when others =>
					if (din_0 > reg_comp_each_channel(0)) then reg_comp_each_channel(0) <= din_0; end if;     reg_soma_each_channel(0) <= reg_soma(0) + din_0;
					if (din_1 > reg_comp_each_channel(1)) then reg_comp_each_channel(1) <= din_1; end if;     reg_soma_each_channel(1) <= reg_soma(1) + din_0;
					if (din_2 > reg_comp_each_channel(2)) then reg_comp_each_channel(2) <= din_2; end if;     reg_soma_each_channel(2) <= reg_soma(2) + din_0;
					if (din_3 > reg_comp_each_channel(3)) then reg_comp_each_channel(3) <= din_3; end if;     reg_soma_each_channel(3) <= reg_soma(3) + din_0;
					if (din_4 > reg_comp_each_channel(4)) then reg_comp_each_channel(4) <= din_4; end if;     reg_soma_each_channel(4) <= reg_soma(4) + din_0;
					if (din_5 > reg_comp_each_channel(5)) then reg_comp_each_channel(5) <= din_5; end if;     reg_soma_each_channel(5) <= reg_soma(5) + din_0;
					if (din_6 > reg_comp_each_channel(6)) then reg_comp_each_channel(6) <= din_6; end if;     reg_soma_each_channel(6) <= reg_soma(6) + din_0;
					if (din_7 > reg_comp_each_channel(7)) then reg_comp_each_channel(7) <= din_7; end if;     reg_soma_each_channel(7) <= reg_soma(7) + din_0;
					if (din_8 > reg_comp_each_channel(8)) then reg_comp_each_channel(8) <= din_8; end if;     reg_soma_each_channel(8) <= reg_soma(8) + din_0;
					if (din_9 > reg_comp_each_channel(9)) then reg_comp_each_channel(9) <= din_9; end if;     reg_soma_each_channel(9) <= reg_soma(9) + din_0;
					if (din_10 > reg_comp_each_channel(10)) then reg_comp_each_channel(10) <= din_10; end if;     reg_soma_each_channel(10) <= reg_soma(10) + din_0;
					if (din_11 > reg_comp_each_channel(11)) then reg_comp_each_channel(11) <= din_11; end if;     reg_soma_each_channel(11) <= reg_soma(11) + din_0;
					if (din_12 > reg_comp_each_channel(12)) then reg_comp_each_channel(12) <= din_12; end if;     reg_soma_each_channel(12) <= reg_soma(12) + din_0;
					if (din_13 > reg_comp_each_channel(13)) then reg_comp_each_channel(13) <= din_13; end if;     reg_soma_each_channel(13) <= reg_soma(13) + din_0;
					if (din_14 > reg_comp_each_channel(14)) then reg_comp_each_channel(14) <= din_14; end if;     reg_soma_each_channel(14) <= reg_soma(14) + din_0;
					if (din_15 > reg_comp_each_channel(15)) then reg_comp_each_channel(15) <= din_15; end if;     reg_soma_each_channel(15) <= reg_soma(15) + din_0;
					if (din_16 > reg_comp_each_channel(16)) then reg_comp_each_channel(16) <= din_16; end if;     reg_soma_each_channel(16) <= reg_soma(16) + din_0;
					if (din_17 > reg_comp_each_channel(17)) then reg_comp_each_channel(17) <= din_17; end if;     reg_soma_each_channel(17) <= reg_soma(17) + din_0;
					if (din_18 > reg_comp_each_channel(18)) then reg_comp_each_channel(18) <= din_18; end if;     reg_soma_each_channel(18) <= reg_soma(18) + din_0;
					if (din_19 > reg_comp_each_channel(19)) then reg_comp_each_channel(19) <= din_19; end if;     reg_soma_each_channel(19) <= reg_soma(19) + din_0;
					if (din_20 > reg_comp_each_channel(20)) then reg_comp_each_channel(20) <= din_20; end if;     reg_soma_each_channel(20) <= reg_soma(20) + din_0;
					if (din_21 > reg_comp_each_channel(21)) then reg_comp_each_channel(21) <= din_21; end if;     reg_soma_each_channel(21) <= reg_soma(21) + din_0;
					if (din_22 > reg_comp_each_channel(22)) then reg_comp_each_channel(22) <= din_22; end if;     reg_soma_each_channel(22) <= reg_soma(22) + din_0;
					if (din_23 > reg_comp_each_channel(23)) then reg_comp_each_channel(23) <= din_23; end if;     reg_soma_each_channel(23) <= reg_soma(23) + din_0;
					if (din_24 > reg_comp_each_channel(24)) then reg_comp_each_channel(24) <= din_24; end if;     reg_soma_each_channel(24) <= reg_soma(24) + din_0;
					if (din_25 > reg_comp_each_channel(25)) then reg_comp_each_channel(25) <= din_25; end if;     reg_soma_each_channel(25) <= reg_soma(25) + din_0;
					if (din_26 > reg_comp_each_channel(26)) then reg_comp_each_channel(26) <= din_26; end if;     reg_soma_each_channel(26) <= reg_soma(26) + din_0;
					if (din_27 > reg_comp_each_channel(27)) then reg_comp_each_channel(27) <= din_27; end if;     reg_soma_each_channel(27) <= reg_soma(27) + din_0;
					if (din_28 > reg_comp_each_channel(28)) then reg_comp_each_channel(28) <= din_28; end if;     reg_soma_each_channel(28) <= reg_soma(28) + din_0;
					if (din_29 > reg_comp_each_channel(29)) then reg_comp_each_channel(29) <= din_29; end if;     reg_soma_each_channel(29) <= reg_soma(29) + din_0;
					if (din_30 > reg_comp_each_channel(30)) then reg_comp_each_channel(30) <= din_30; end if;     reg_soma_each_channel(30) <= reg_soma(30) + din_0;
					if (din_31 > reg_comp_each_channel(31)) then reg_comp_each_channel(31) <= din_31; end if;     reg_soma_each_channel(31) <= reg_soma(31) + din_0;
			end case;
		end if;	
   end process;
end architecture;