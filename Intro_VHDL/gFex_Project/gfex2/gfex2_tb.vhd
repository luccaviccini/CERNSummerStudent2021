library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.gfex2;

-- This module corresponds to the test bench for gfex with 2 inputs module gfex2
entity gfex2_tb is
end entity;

architecture sim of gfex2_tb is 
	----------------- Clock Settings -------------------------
	-- You can either declare the clock in terms of the frequency of in terms of the clock period. 
	-- The commented section reffers to declaration of clock in terms of the frequency.
	--constant ClockFrequency : integer := 1000e6; 
    --constant ClockPeriod    : time    := 1000 ms / ClockFrequency; 
	
	constant ClockPeriod    : time   := 1 ns; 	
	signal clk : std_logic := '1'; -- starting the clock high.
    constant DataWidth16 : integer := 16; --  size in bits of hex word read from stimulus file
	
	--------------Declaring the Jet_Engine Inputs for TB ( in this example there are 2 Jet engines)
	signal TbSig0 : std_logic_vector(DataWidth16-1 downto 0); 
	signal TbSig1 : std_logic_vector(DataWidth16-1 downto 0);	
	
	-- The selector corresponds to eta indicator in each jet engine (also an input from stimulus file)	
    signal TbSel  : std_ulogic_vector(2 downto 0);
	-- Declaring TB output signals
    signal TbOutput0 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOutput1 : std_logic_vector(DataWidth16-1 downto 0);
	 
	signal TbOutBigSum : std_logic_vector(DataWidth16 + 2 downto 0);
	


begin
    DUT : entity work.gfex2(rtl) -- importing the module created for 2 jet engines
    generic map(DataWidth => DataWidth16)
    port map(
		clk 	  => clk,
        je_inp0   => TbSig0,
		je_inp1   => TbSig1,		
        eta_ind   => TbSel,
        je_out0     => TbOutput0,
		je_out1     => TbOutput1,
		biggest_sum => TbOutBigSum);

	-- Process for generating the clock
	clk <= not clk after ClockPeriod/2;
	
	PROC_SEQUENCER : process
	-- the variables declared here correspond to the variables present in the stimulus file
	file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/gfex_project/gfex2/stimulus.txt";
	variable text_line : line;
	variable ok        : boolean;
	variable char      : character;
	variable wait_time : time; -- (time to wait between each sequential gTower)
	
	variable selector  : std_ulogic_vector(2 downto 0); -- (this is the eta Value)
	variable data      : std_logic_vector(DataWidth16-1 downto 0); -- actual 16 bit signal read from stimulus file.

	begin

	while not endfile(text_file) loop
		readline(text_file, text_line);
	 
		-- Skip empty lines and single-line comments
		if text_line.all'length = 0 or text_line.all(1) = '#' then
		next;
		end if;
		read(text_line, wait_time, ok);
		assert ok
		  report "Read 'wait_time' failed for line: " & text_line.all severity failure;
		  
		
		read(text_line, selector, ok);
		assert ok
		  report "Read 'sel' failed for line: " & text_line.all severity failure;
		TbSel <= selector;
		-- each line from here containing TbSigX <= data corresponds to each column, after the first 2, on the stimulus file(and each column corresponds to one jet engine input)
        hread(text_line, data, ok);
        assert ok
            report "Read 'din_0' failed for line: " & text_line.all severity failure;
        TbSig0 <= data;
		
		hread(text_line, data, ok);
        assert ok
            report "Read 'din_0' failed for line: " & text_line.all severity failure;
        TbSig1 <= data;

		wait for wait_time;
		-- Print trailing comment to console, if any
		read(text_line, char, ok); -- Skip expected newline
		read(text_line, char, ok);
		if char = '#' then -- if line constains ## means comment and is supposed to skip.
		  read(text_line, char, ok); -- Skip expected newline
		  report text_line.all;
		end if;
 
	end loop;
  wait; 
end process;

end architecture;


