library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.gfex1;

entity gfex1_tb is
end entity;

architecture sim of gfex1_tb is

	constant ClockFrequency : integer := 1000e6; -- 1 GHz
    constant ClockPeriod    : time    := 1000 ms / ClockFrequency; -- 10 ns
	
	signal clk : std_logic := '1';
    constant DataWidth16 : integer := 16;
	signal TbSig0 : std_logic_vector(DataWidth16-1 downto 0);	
    signal TbSel  : std_ulogic_vector(2 downto 0);
    signal TbOutput : std_logic_vector(DataWidth16-1 downto 0) :=  x"AAAA";


begin
    DUT : entity work.gfex1(rtl)
    generic map(DataWidth => DataWidth16)
    port map(
		clk 	  => clk,
        gt_inp1   => TbSig0, 
        eta_ind   => TbSel,
        d_out     => TbOutput);

	-- Process for generating the clock
	clk <= not clk after ClockPeriod/2;
	
	PROC_SEQUENCER : process
	file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/gFex_Project/gfex1/stimulus.txt";
	variable text_line : line;
	variable ok        : boolean;
	variable char      : character;
	variable wait_time : time;
	variable selector  : std_ulogic_vector(2 downto 0);
	variable data      : std_logic_vector(DataWidth16-1 downto 0);

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
	 
        hread(text_line, data, ok);
        assert ok
            report "Read 'din_0' failed for line: " & text_line.all severity failure;
        TbSig0 <= data;

		wait for wait_time;
		-- Print trailing comment to console, if any
		read(text_line, char, ok); -- Skip expected newline
		read(text_line, char, ok);
		if char = '#' then
		  read(text_line, char, ok); -- Skip expected newline
		  report text_line.all;
		end if;
 
	end loop;
 
  wait;
 
end process;

end architecture;


