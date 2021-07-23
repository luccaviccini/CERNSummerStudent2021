library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity gfex32  is
generic(DataWidth : integer := 16);
port( 
	-- Clock 
	signal clk 	    : in std_logic;
	
	-- Inputs (16 bits) - they reffer to each jet_engine input 
	-- each input receives 6 values in a sequential form 
    signal gt_inp0  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp1  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp2  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp3  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp4  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp5  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp6  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp7  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp8  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp9  : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp10 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp11 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp12 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp13 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp14 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp15 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp16 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp17 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp18 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp19 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp20 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp21 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp22 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp23 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp24 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp25 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp26 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp27 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp28 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp29 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp30 : in std_logic_vector(DataWidth-1 downto 0);
    signal gt_inp31 : in std_logic_vector(DataWidth-1 downto 0);

	-- selector (3 bits because it has to count to 6)
	signal eta_ind  : in  std_ulogic_vector(2 downto 0);
	
	-- outputs (same size as inputs)
    signal d_out0  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out1  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out2  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out3  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out4  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out5  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out6  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out7  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out8  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out9  : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out10 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out11 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out12 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out13 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out14 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out15 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out16 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out17 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out18 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out19 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out20 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out21 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out22 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out23 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out24 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out25 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out26 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out27 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out28 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out29 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out30 : out std_logic_vector(DataWidth-1 downto 0);
    signal d_out31 : out std_logic_vector(DataWidth-1 downto 0); 

	-- signal to output biggest sum among the 32 jet engines
	-- (has to be 19 bits because of addition of 2 16 bit signals)
	signal biggest_sum : out std_logic_vector(DataWidth + 2 downto 0));
	
end entity;

architecture rtl of gfex32 is
-- array has to be the size of number of jet engines used in code... for algorithm it is 32
type reg_comp is array (natural range <>) of std_logic_vector(DataWidth-1 downto 0);
type reg_soma is array (natural range <>) of std_logic_vector(DataWidth + 2 downto 0);

signal cycle : integer := 0;

signal big6 : reg_comp(0 to 31) := (others=>(others=>'0'));
signal sum6 : reg_soma(0 to 31) := (others=>(others=>'0'));




begin
	process(clk) is
	variable temp : std_logic_vector(DataWidth + 2 downto 0) := "0000000000000000000";
	
    begin
		if rising_edge(clk) then
			case eta_ind is 			
				when "000" =>
					big6(0) <= gt_inp0;					sum6(0) <= ('0' & '0' & '0' & gt_inp0);
					big6(1) <= gt_inp1;					sum6(1) <= ('0' & '0' & '0' & gt_inp1);
					big6(2) <= gt_inp2;					sum6(2) <= ('0' & '0' & '0' & gt_inp2);
					big6(3) <= gt_inp3;					sum6(3) <= ('0' & '0' & '0' & gt_inp3);
					big6(4) <= gt_inp4;					sum6(4) <= ('0' & '0' & '0' & gt_inp4);
					big6(5) <= gt_inp5;					sum6(5) <= ('0' & '0' & '0' & gt_inp5);
					big6(6) <= gt_inp6;					sum6(6) <= ('0' & '0' & '0' & gt_inp6);
					big6(7) <= gt_inp7;					sum6(7) <= ('0' & '0' & '0' & gt_inp7);
					big6(8) <= gt_inp8;					sum6(8) <= ('0' & '0' & '0' & gt_inp8);
					big6(9) <= gt_inp9;					sum6(9) <= ('0' & '0' & '0' & gt_inp9);
					big6(10) <= gt_inp10;				sum6(10) <= ('0' & '0' & '0' & gt_inp10);
					big6(11) <= gt_inp11;				sum6(11) <= ('0' & '0' & '0' & gt_inp11);
					big6(12) <= gt_inp12;				sum6(12) <= ('0' & '0' & '0' & gt_inp12);
					big6(13) <= gt_inp13;				sum6(13) <= ('0' & '0' & '0' & gt_inp13);
					big6(14) <= gt_inp14;				sum6(14) <= ('0' & '0' & '0' & gt_inp14);
					big6(15) <= gt_inp15;				sum6(15) <= ('0' & '0' & '0' & gt_inp15);
					big6(16) <= gt_inp16;				sum6(16) <= ('0' & '0' & '0' & gt_inp16);
					big6(17) <= gt_inp17;				sum6(17) <= ('0' & '0' & '0' & gt_inp17);
					big6(18) <= gt_inp18;				sum6(18) <= ('0' & '0' & '0' & gt_inp18);
					big6(19) <= gt_inp19;				sum6(19) <= ('0' & '0' & '0' & gt_inp19);
					big6(20) <= gt_inp20;				sum6(20) <= ('0' & '0' & '0' & gt_inp20);
					big6(21) <= gt_inp21;				sum6(21) <= ('0' & '0' & '0' & gt_inp21);
					big6(22) <= gt_inp22;				sum6(22) <= ('0' & '0' & '0' & gt_inp22);
					big6(23) <= gt_inp23;				sum6(23) <= ('0' & '0' & '0' & gt_inp23);
					big6(24) <= gt_inp24;				sum6(24) <= ('0' & '0' & '0' & gt_inp24);
					big6(25) <= gt_inp25;				sum6(25) <= ('0' & '0' & '0' & gt_inp25);
					big6(26) <= gt_inp26;				sum6(26) <= ('0' & '0' & '0' & gt_inp26);
					big6(27) <= gt_inp27;				sum6(27) <= ('0' & '0' & '0' & gt_inp27);
					big6(28) <= gt_inp28;				sum6(28) <= ('0' & '0' & '0' & gt_inp28);
					big6(29) <= gt_inp29;				sum6(29) <= ('0' & '0' & '0' & gt_inp29);
					big6(30) <= gt_inp30;				sum6(30) <= ('0' & '0' & '0' & gt_inp30);
					big6(31) <= gt_inp31;				sum6(31) <= ('0' & '0' & '0' & gt_inp31);	
					
				when "110" =>
					d_out0 <= big6(0);
					d_out1 <= big6(1);
					d_out2 <= big6(2);
					d_out3 <= big6(3);
					d_out4 <= big6(4);
					d_out5 <= big6(5);
					d_out6 <= big6(6);
					d_out7 <= big6(7);
					d_out8 <= big6(8);
					d_out9 <= big6(9);
					d_out10 <= big6(10);
					d_out11 <= big6(11);
					d_out12 <= big6(12);
					d_out13 <= big6(13);
					d_out14 <= big6(14);
					d_out15 <= big6(15);
					d_out16 <= big6(16);
					d_out17 <= big6(17);
					d_out18 <= big6(18);
					d_out19 <= big6(19);
					d_out20 <= big6(20);
					d_out21 <= big6(21);
					d_out22 <= big6(22);
					d_out23 <= big6(23);
					d_out24 <= big6(24);
					d_out25 <= big6(25);
					d_out26 <= big6(26);
					d_out27 <= big6(27);
					d_out28 <= big6(28);
					d_out29 <= big6(29);
					d_out30 <= big6(30);
					d_out31 <= big6(31);
					
					for i in 0 to 31 loop 
						if(sum6(i) > temp) then
							temp := sum6(i);
						end if;
					end loop;
					
					biggest_sum <= temp;
					cycle <= cycle + 1;
					
				when "111" =>
					d_out0 <= "X";
					d_out1 <= "X";
					d_out2 <= "X";
					d_out3 <= "X";
					d_out4 <= "X";
					d_out5 <= "X";
					d_out6 <= "X";
					d_out7 <= "X";
					d_out8 <= "X";
					d_out9 <= "X";
					d_out10 <= "X";
					d_out11 <= "X";
					d_out12 <= "X";
					d_out13 <= "X";
					d_out14 <= "X";
					d_out15 <= "X";
					d_out16 <= "X";
					d_out17 <= "X";
					d_out18 <= "X";
					d_out19 <= "X";
					d_out20 <= "X";
					d_out21 <= "X";
					d_out22 <= "X";
					d_out23 <= "X";
					d_out24 <= "X";
					d_out25 <= "X";
					d_out26 <= "X";
					d_out27 <= "X";
					d_out28 <= "X";
					d_out29 <= "X";
					d_out30 <= "X";
					d_out31 <= "X";
				
				when others =>
				
					if(gt_inp0 > big6(0)) then big6(0) <= gt_inp0; end if;      sum6(0) <= sum6(0) + ('0' & '0' & '0' & gt_inp0);
					if(gt_inp1 > big6(1)) then big6(1) <= gt_inp1; end if;      sum6(1) <= sum6(1) + ('0' & '0' & '0' & gt_inp1);
					if(gt_inp2 > big6(2)) then big6(2) <= gt_inp2; end if;      sum6(2) <= sum6(2) + ('0' & '0' & '0' & gt_inp2);
					if(gt_inp3 > big6(3)) then big6(3) <= gt_inp3; end if;      sum6(3) <= sum6(3) + ('0' & '0' & '0' & gt_inp3);
					if(gt_inp4 > big6(4)) then big6(4) <= gt_inp4; end if;      sum6(4) <= sum6(4) + ('0' & '0' & '0' & gt_inp4);
					if(gt_inp5 > big6(5)) then big6(5) <= gt_inp5; end if;      sum6(5) <= sum6(5) + ('0' & '0' & '0' & gt_inp5);
					if(gt_inp6 > big6(6)) then big6(6) <= gt_inp6; end if;      sum6(6) <= sum6(6) + ('0' & '0' & '0' & gt_inp6);
					if(gt_inp7 > big6(7)) then big6(7) <= gt_inp7; end if;      sum6(7) <= sum6(7) + ('0' & '0' & '0' & gt_inp7);
					if(gt_inp8 > big6(8)) then big6(8) <= gt_inp8; end if;      sum6(8) <= sum6(8) + ('0' & '0' & '0' & gt_inp8);
					if(gt_inp9 > big6(9)) then big6(9) <= gt_inp9; end if;      sum6(9) <= sum6(9) + ('0' & '0' & '0' & gt_inp9);
					if(gt_inp10 > big6(10)) then big6(10) <= gt_inp10; end if;      sum6(10) <= sum6(10) + ('0' & '0' & '0' & gt_inp10);
					if(gt_inp11 > big6(11)) then big6(11) <= gt_inp11; end if;      sum6(11) <= sum6(11) + ('0' & '0' & '0' & gt_inp11);
					if(gt_inp12 > big6(12)) then big6(12) <= gt_inp12; end if;      sum6(12) <= sum6(12) + ('0' & '0' & '0' & gt_inp12);
					if(gt_inp13 > big6(13)) then big6(13) <= gt_inp13; end if;      sum6(13) <= sum6(13) + ('0' & '0' & '0' & gt_inp13);
					if(gt_inp14 > big6(14)) then big6(14) <= gt_inp14; end if;      sum6(14) <= sum6(14) + ('0' & '0' & '0' & gt_inp14);
					if(gt_inp15 > big6(15)) then big6(15) <= gt_inp15; end if;      sum6(15) <= sum6(15) + ('0' & '0' & '0' & gt_inp15);
					if(gt_inp16 > big6(16)) then big6(16) <= gt_inp16; end if;      sum6(16) <= sum6(16) + ('0' & '0' & '0' & gt_inp16);
					if(gt_inp17 > big6(17)) then big6(17) <= gt_inp17; end if;      sum6(17) <= sum6(17) + ('0' & '0' & '0' & gt_inp17);
					if(gt_inp18 > big6(18)) then big6(18) <= gt_inp18; end if;      sum6(18) <= sum6(18) + ('0' & '0' & '0' & gt_inp18);
					if(gt_inp19 > big6(19)) then big6(19) <= gt_inp19; end if;      sum6(19) <= sum6(19) + ('0' & '0' & '0' & gt_inp19);
					if(gt_inp20 > big6(20)) then big6(20) <= gt_inp20; end if;      sum6(20) <= sum6(20) + ('0' & '0' & '0' & gt_inp20);
					if(gt_inp21 > big6(21)) then big6(21) <= gt_inp21; end if;      sum6(21) <= sum6(21) + ('0' & '0' & '0' & gt_inp21);
					if(gt_inp22 > big6(22)) then big6(22) <= gt_inp22; end if;      sum6(22) <= sum6(22) + ('0' & '0' & '0' & gt_inp22);
					if(gt_inp23 > big6(23)) then big6(23) <= gt_inp23; end if;      sum6(23) <= sum6(23) + ('0' & '0' & '0' & gt_inp23);
					if(gt_inp24 > big6(24)) then big6(24) <= gt_inp24; end if;      sum6(24) <= sum6(24) + ('0' & '0' & '0' & gt_inp24);
					if(gt_inp25 > big6(25)) then big6(25) <= gt_inp25; end if;      sum6(25) <= sum6(25) + ('0' & '0' & '0' & gt_inp25);
					if(gt_inp26 > big6(26)) then big6(26) <= gt_inp26; end if;      sum6(26) <= sum6(26) + ('0' & '0' & '0' & gt_inp26);
					if(gt_inp27 > big6(27)) then big6(27) <= gt_inp27; end if;      sum6(27) <= sum6(27) + ('0' & '0' & '0' & gt_inp27);
					if(gt_inp28 > big6(28)) then big6(28) <= gt_inp28; end if;      sum6(28) <= sum6(28) + ('0' & '0' & '0' & gt_inp28);
					if(gt_inp29 > big6(29)) then big6(29) <= gt_inp29; end if;      sum6(29) <= sum6(29) + ('0' & '0' & '0' & gt_inp29);
					if(gt_inp30 > big6(30)) then big6(30) <= gt_inp30; end if;      sum6(30) <= sum6(30) + ('0' & '0' & '0' & gt_inp30);
					if(gt_inp31 > big6(31)) then big6(31) <= gt_inp31; end if;      sum6(31) <= sum6(31) + ('0' & '0' & '0' & gt_inp31);
					
					
			end case;
		end if;	
   end process;
end architecture;