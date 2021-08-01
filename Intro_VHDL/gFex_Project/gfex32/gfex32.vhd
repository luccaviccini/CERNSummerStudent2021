library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- This module represents 32 jet engines of an FPGA on gFEX. Each jet engine receives information from gtowers in sequential temporal fashion.
-- during each cycle of inputs, each jet_engine will recieve 6 Tower Inputs;

entity gfex32  is
generic(DataWidth : integer := 16);
port( 
	-- Clock 
	signal clk 	    : in std_logic; --  frequency/period specified in testbench.
	
	-- Inputs (16 bits) - they reffer to each jet engine input 
	-- each jet engine receives 6 values in a sequential form 
    signal je_inp0  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp1  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp2  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp3  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp4  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp5  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp6  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp7  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp8  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp9  : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp10 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp11 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp12 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp13 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp14 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp15 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp16 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp17 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp18 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp19 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp20 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp21 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp22 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp23 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp24 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp25 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp26 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp27 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp28 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp29 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp30 : in std_logic_vector(DataWidth-1 downto 0);
    signal je_inp31 : in std_logic_vector(DataWidth-1 downto 0);

	-- eta indicator is common for all jet engines since all jet engines recieve the information in parallel.
	-- selector (3 bits because it has to count to 6)
	signal eta_ind  : in  std_ulogic_vector(2 downto 0);
	
	-- outputs for each jet engine (same size as inputs)
    signal je_out0  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out1  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out2  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out3  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out4  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out5  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out6  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out7  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out8  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out9  : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out10 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out11 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out12 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out13 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out14 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out15 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out16 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out17 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out18 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out19 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out20 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out21 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out22 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out23 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out24 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out25 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out26 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out27 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out28 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out29 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out30 : out std_logic_vector(DataWidth-1 downto 0);
    signal je_out31 : out std_logic_vector(DataWidth-1 downto 0); 

	-- (each jet engine receives 6 gTowers, and this signal outputs the biggest sum among all jet engines).
	-- this signal has to be 19 bits once it stores the sum of six 16 bit signals.
	signal biggest_sum : out std_logic_vector(DataWidth + 2 downto 0));
	
end entity;

architecture rtl of gfex32 is
-- type reg_comp (register for comparison) is an array to store the biggest value received during each cycle.
type reg_comp is array (natural range <>) of std_logic_vector(DataWidth-1 downto 0);

-- type reg_sum (register for sum) is an array that stores the sum all values sequentially recieved during a cycle for each jet engine.
-- the size of the data of the array has to be 19 once it stores the sum of six, 16 bit signals.
type reg_sum is array (natural range <>) of std_logic_vector(DataWidth + 2 downto 0);

-- a cycle consists of 7 sequential values received, the 7th value should not be used.
signal cycle : integer := 0;

-- actually creating a signals of types mentioned above.
-- both of them have size 2 (2 jet engines) and all positions of array are set to 0 initially.
-- each position in the array corresponds to one jet engine.
signal big6 : reg_comp(0 to 31) := (others=>(others=>'0'));
signal sum6 : reg_sum(0 to 31) := (others=>(others=>'0'));




begin
	process(clk) is
	-- temporary variable created inside process to check for biggest sum of jet_engines.
	variable temp : std_logic_vector(DataWidth + 2 downto 0) := "0000000000000000000";
	
    begin
		if rising_edge(clk) then
			case eta_ind is 			
				when "000" => -- beginning of the cycle
					big6(0) <= je_inp0;					sum6(0) <= ('0' & '0' & '0' & je_inp0);
					big6(1) <= je_inp1;					sum6(1) <= ('0' & '0' & '0' & je_inp1);
					big6(2) <= je_inp2;					sum6(2) <= ('0' & '0' & '0' & je_inp2);
					big6(3) <= je_inp3;					sum6(3) <= ('0' & '0' & '0' & je_inp3);
					big6(4) <= je_inp4;					sum6(4) <= ('0' & '0' & '0' & je_inp4);
					big6(5) <= je_inp5;					sum6(5) <= ('0' & '0' & '0' & je_inp5);
					big6(6) <= je_inp6;					sum6(6) <= ('0' & '0' & '0' & je_inp6);
					big6(7) <= je_inp7;					sum6(7) <= ('0' & '0' & '0' & je_inp7);
					big6(8) <= je_inp8;					sum6(8) <= ('0' & '0' & '0' & je_inp8);
					big6(9) <= je_inp9;					sum6(9) <= ('0' & '0' & '0' & je_inp9);
					big6(10) <= je_inp10;				sum6(10) <= ('0' & '0' & '0' & je_inp10);
					big6(11) <= je_inp11;				sum6(11) <= ('0' & '0' & '0' & je_inp11);
					big6(12) <= je_inp12;				sum6(12) <= ('0' & '0' & '0' & je_inp12);
					big6(13) <= je_inp13;				sum6(13) <= ('0' & '0' & '0' & je_inp13);
					big6(14) <= je_inp14;				sum6(14) <= ('0' & '0' & '0' & je_inp14);
					big6(15) <= je_inp15;				sum6(15) <= ('0' & '0' & '0' & je_inp15);
					big6(16) <= je_inp16;				sum6(16) <= ('0' & '0' & '0' & je_inp16);
					big6(17) <= je_inp17;				sum6(17) <= ('0' & '0' & '0' & je_inp17);
					big6(18) <= je_inp18;				sum6(18) <= ('0' & '0' & '0' & je_inp18);
					big6(19) <= je_inp19;				sum6(19) <= ('0' & '0' & '0' & je_inp19);
					big6(20) <= je_inp20;				sum6(20) <= ('0' & '0' & '0' & je_inp20);
					big6(21) <= je_inp21;				sum6(21) <= ('0' & '0' & '0' & je_inp21);
					big6(22) <= je_inp22;				sum6(22) <= ('0' & '0' & '0' & je_inp22);
					big6(23) <= je_inp23;				sum6(23) <= ('0' & '0' & '0' & je_inp23);
					big6(24) <= je_inp24;				sum6(24) <= ('0' & '0' & '0' & je_inp24);
					big6(25) <= je_inp25;				sum6(25) <= ('0' & '0' & '0' & je_inp25);
					big6(26) <= je_inp26;				sum6(26) <= ('0' & '0' & '0' & je_inp26);
					big6(27) <= je_inp27;				sum6(27) <= ('0' & '0' & '0' & je_inp27);
					big6(28) <= je_inp28;				sum6(28) <= ('0' & '0' & '0' & je_inp28);
					big6(29) <= je_inp29;				sum6(29) <= ('0' & '0' & '0' & je_inp29);
					big6(30) <= je_inp30;				sum6(30) <= ('0' & '0' & '0' & je_inp30);
					big6(31) <= je_inp31;				sum6(31) <= ('0' & '0' & '0' & je_inp31);	
					
				when "110" =>    -- 7th value of the cycle => eta = 6 -> do nothing and only output values 
					je_out0 <= big6(0);
					je_out1 <= big6(1);
					je_out2 <= big6(2);
					je_out3 <= big6(3);
					je_out4 <= big6(4);
					je_out5 <= big6(5);
					je_out6 <= big6(6);
					je_out7 <= big6(7);
					je_out8 <= big6(8);
					je_out9 <= big6(9);
					je_out10 <= big6(10);
					je_out11 <= big6(11);
					je_out12 <= big6(12);
					je_out13 <= big6(13);
					je_out14 <= big6(14);
					je_out15 <= big6(15);
					je_out16 <= big6(16);
					je_out17 <= big6(17);
					je_out18 <= big6(18);
					je_out19 <= big6(19);
					je_out20 <= big6(20);
					je_out21 <= big6(21);
					je_out22 <= big6(22);
					je_out23 <= big6(23);
					je_out24 <= big6(24);
					je_out25 <= big6(25);
					je_out26 <= big6(26);
					je_out27 <= big6(27);
					je_out28 <= big6(28);
					je_out29 <= big6(29);
					je_out30 <= big6(30);
					je_out31 <= big6(31);
					
					--- at the end of the cycle (eta=6) this for loop goes through the sum vector to find the biggest sum among all jet engines.
					for i in 0 to 31 loop 
						if(sum6(i) > temp) then
							temp := sum6(i);
						end if;
					end loop;
					
					biggest_sum <= temp; -- output for biggest sum found on previous for loop.
					cycle <= cycle + 1;
					
				when "111" => --  never going to have this eta value.
					je_out0 <= "X";
					je_out1 <= "X";
					je_out2 <= "X";
					je_out3 <= "X";
					je_out4 <= "X";
					je_out5 <= "X";
					je_out6 <= "X";
					je_out7 <= "X";
					je_out8 <= "X";
					je_out9 <= "X";
					je_out10 <= "X";
					je_out11 <= "X";
					je_out12 <= "X";
					je_out13 <= "X";
					je_out14 <= "X";
					je_out15 <= "X";
					je_out16 <= "X";
					je_out17 <= "X";
					je_out18 <= "X";
					je_out19 <= "X";
					je_out20 <= "X";
					je_out21 <= "X";
					je_out22 <= "X";
					je_out23 <= "X";
					je_out24 <= "X";
					je_out25 <= "X";
					je_out26 <= "X";
					je_out27 <= "X";
					je_out28 <= "X";
					je_out29 <= "X";
					je_out30 <= "X";
					je_out31 <= "X";
				
				when others => -- this is the case for etas from 1 to 5 including.
					-- if value in input is bigger than the value stored in 	-- adding inputs for each jet_engine
					-- the array -> substitute the value in the array 
					--(array of time reg_comp)
				
					if(je_inp0 > big6(0)) then big6(0) <= je_inp0; end if;      sum6(0) <= sum6(0) + ('0' & '0' & '0' & je_inp0);
					if(je_inp1 > big6(1)) then big6(1) <= je_inp1; end if;      sum6(1) <= sum6(1) + ('0' & '0' & '0' & je_inp1);
					if(je_inp2 > big6(2)) then big6(2) <= je_inp2; end if;      sum6(2) <= sum6(2) + ('0' & '0' & '0' & je_inp2);
					if(je_inp3 > big6(3)) then big6(3) <= je_inp3; end if;      sum6(3) <= sum6(3) + ('0' & '0' & '0' & je_inp3);
					if(je_inp4 > big6(4)) then big6(4) <= je_inp4; end if;      sum6(4) <= sum6(4) + ('0' & '0' & '0' & je_inp4);
					if(je_inp5 > big6(5)) then big6(5) <= je_inp5; end if;      sum6(5) <= sum6(5) + ('0' & '0' & '0' & je_inp5);
					if(je_inp6 > big6(6)) then big6(6) <= je_inp6; end if;      sum6(6) <= sum6(6) + ('0' & '0' & '0' & je_inp6);
					if(je_inp7 > big6(7)) then big6(7) <= je_inp7; end if;      sum6(7) <= sum6(7) + ('0' & '0' & '0' & je_inp7);
					if(je_inp8 > big6(8)) then big6(8) <= je_inp8; end if;      sum6(8) <= sum6(8) + ('0' & '0' & '0' & je_inp8);
					if(je_inp9 > big6(9)) then big6(9) <= je_inp9; end if;      sum6(9) <= sum6(9) + ('0' & '0' & '0' & je_inp9);
					if(je_inp10 > big6(10)) then big6(10) <= je_inp10; end if;      sum6(10) <= sum6(10) + ('0' & '0' & '0' & je_inp10);
					if(je_inp11 > big6(11)) then big6(11) <= je_inp11; end if;      sum6(11) <= sum6(11) + ('0' & '0' & '0' & je_inp11);
					if(je_inp12 > big6(12)) then big6(12) <= je_inp12; end if;      sum6(12) <= sum6(12) + ('0' & '0' & '0' & je_inp12);
					if(je_inp13 > big6(13)) then big6(13) <= je_inp13; end if;      sum6(13) <= sum6(13) + ('0' & '0' & '0' & je_inp13);
					if(je_inp14 > big6(14)) then big6(14) <= je_inp14; end if;      sum6(14) <= sum6(14) + ('0' & '0' & '0' & je_inp14);
					if(je_inp15 > big6(15)) then big6(15) <= je_inp15; end if;      sum6(15) <= sum6(15) + ('0' & '0' & '0' & je_inp15);
					if(je_inp16 > big6(16)) then big6(16) <= je_inp16; end if;      sum6(16) <= sum6(16) + ('0' & '0' & '0' & je_inp16);
					if(je_inp17 > big6(17)) then big6(17) <= je_inp17; end if;      sum6(17) <= sum6(17) + ('0' & '0' & '0' & je_inp17);
					if(je_inp18 > big6(18)) then big6(18) <= je_inp18; end if;      sum6(18) <= sum6(18) + ('0' & '0' & '0' & je_inp18);
					if(je_inp19 > big6(19)) then big6(19) <= je_inp19; end if;      sum6(19) <= sum6(19) + ('0' & '0' & '0' & je_inp19);
					if(je_inp20 > big6(20)) then big6(20) <= je_inp20; end if;      sum6(20) <= sum6(20) + ('0' & '0' & '0' & je_inp20);
					if(je_inp21 > big6(21)) then big6(21) <= je_inp21; end if;      sum6(21) <= sum6(21) + ('0' & '0' & '0' & je_inp21);
					if(je_inp22 > big6(22)) then big6(22) <= je_inp22; end if;      sum6(22) <= sum6(22) + ('0' & '0' & '0' & je_inp22);
					if(je_inp23 > big6(23)) then big6(23) <= je_inp23; end if;      sum6(23) <= sum6(23) + ('0' & '0' & '0' & je_inp23);
					if(je_inp24 > big6(24)) then big6(24) <= je_inp24; end if;      sum6(24) <= sum6(24) + ('0' & '0' & '0' & je_inp24);
					if(je_inp25 > big6(25)) then big6(25) <= je_inp25; end if;      sum6(25) <= sum6(25) + ('0' & '0' & '0' & je_inp25);
					if(je_inp26 > big6(26)) then big6(26) <= je_inp26; end if;      sum6(26) <= sum6(26) + ('0' & '0' & '0' & je_inp26);
					if(je_inp27 > big6(27)) then big6(27) <= je_inp27; end if;      sum6(27) <= sum6(27) + ('0' & '0' & '0' & je_inp27);
					if(je_inp28 > big6(28)) then big6(28) <= je_inp28; end if;      sum6(28) <= sum6(28) + ('0' & '0' & '0' & je_inp28);
					if(je_inp29 > big6(29)) then big6(29) <= je_inp29; end if;      sum6(29) <= sum6(29) + ('0' & '0' & '0' & je_inp29);
					if(je_inp30 > big6(30)) then big6(30) <= je_inp30; end if;      sum6(30) <= sum6(30) + ('0' & '0' & '0' & je_inp30);
					if(je_inp31 > big6(31)) then big6(31) <= je_inp31; end if;      sum6(31) <= sum6(31) + ('0' & '0' & '0' & je_inp31);
					
					
			end case;
		end if;	
   end process;
end architecture;