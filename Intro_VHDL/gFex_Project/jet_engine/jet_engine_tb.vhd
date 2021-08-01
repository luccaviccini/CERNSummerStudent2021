library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.jet_engine;

-- This module corresponds to the test bench for gfex with 2  jet_engine inputs module gfex2
entity jet_engine_tb is
end entity;

architecture sim of jet_engine_tb is 
	----------------- Clock Settings -------------------------
	-- You can either declare the clock in terms of the frequency of in terms of the clock period. 
	-- The commented section reffers to declaration of clock in terms of the frequency.
	--constant ClockFrequency : integer := 1000e6; 
    --constant ClockPeriod    : time    := 1000 ms / ClockFrequency; 	
	constant ClockPeriod    : time   := 1 ns; 	
	signal clk : std_logic := '1'; -- starting the clock high.
    constant DataWidth : integer := 16; --  size in bits of hex word read from stimulus file
	
	--------------Declaring the Jet_Engine Inputs for TB ( in this example there are 2 Jet engines)
	signal Tb_je_in : std_logic_vector(DataWidth-1 downto 0); 	
	-- The selector corresponds to eta indicator in each jet engine (also an input from stimulus file)	
    signal Tb_eta_ind  : std_logic_vector(2 downto 0);
	-- Declaring TB output signals
    signal Tb_biggest_gt : std_logic_vector(DataWidth-1 downto 0);
	signal Tb_eta_ind_out : std_logic_vector(2 downto 0);
	
begin
    jet_engine0 : entity work.jet_engine(rtl) -- importing the module created for 2 jet engines
    generic map(DataWidth => DataWidth)
    port map(
		clk 	    => clk,
        je_in 	=> Tb_je_in,		
        eta_ind   	=> Tb_eta_ind,
        biggest_gt  => Tb_biggest_gt,
		eta_ind_out => Tb_eta_ind_out);

	-- Process for generating the clock
	clk <= not clk after ClockPeriod/2;
	
	PROC_SEQUENCER : process
	-- the variables declared here correspond to the variables present in the stimulus file
	file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/gfex_project/jet_engine/stimulus.txt";
	variable text_line : line;
	variable ok        : boolean;
	variable char      : character;
	variable wait_time : time; -- (time to wait between each sequential gTower)
	
	variable selector  : std_logic_vector(2 downto 0); -- (this is the eta Value)
	variable data      : std_logic_vector(DataWidth-1 downto 0); -- actual 16 bit signal read from stimulus file.

	begin

	while not endfile(text_file) loop
		readline(text_file, text_line);
	 
		-- Skip empty lines and single-line comments
		if (text_line.all'length = 0 or text_line.all(1) = '#') then
		next;
		end if;
		read(text_line, wait_time, ok);
		assert ok
		  report "Read 'wait_time' failed for line: " & text_line.all severity failure;
		  
		
		read(text_line, selector, ok);
		assert ok
		  report "Read 'sel' failed for line: " & text_line.all severity failure;
		Tb_eta_ind <= selector;
		-- each line from here containing TbSigX <= data corresponds to each column, after the first 2, on the stimulus file(and each column corresponds to one jet engine input)
        hread(text_line, data, ok);
        assert ok
            report "Read 'din_0' failed for line: " & text_line.all severity failure;
        Tb_je_in <= data;
		

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


