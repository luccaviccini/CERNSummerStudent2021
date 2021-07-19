library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.gfex_generic;

entity gfex_generic_tb is
end entity;

architecture sim of gfex_generic_tb is

	constant ClockFrequency : integer := 1000e6; -- 1 GHz
    constant ClockPeriod    : time    := 1000 ms / ClockFrequency; -- 10 ns
	
	signal clk : std_logic := '1';

    constant DataWidth16 : integer := 16;
	signal TbSig0 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig1 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig2 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig3 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig4 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig5 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig6 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig7 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig8 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig9 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig10 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig11 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig12 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig13 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig14 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig15 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig16 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig17 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig18 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig19 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig20 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig21 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig22 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig23 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig24 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig25 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig26 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig27 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig28 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig29 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig30 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbSig31 : std_logic_vector(DataWidth16-1 downto 0);
	
    signal TbSel  : std_ulogic_vector(2 downto 0);

    signal TbOutput : std_logic_vector(DataWidth16-1 downto 0);


begin
    DUT : entity work.gfex_generic(rtl)
    generic map(DataWidth => DataWidth16)
    port map(
		clk 	=> clk,
        din_0   => TbSig0,
        din_1   => TbSig1,
        din_2   => TbSig2,
        din_3   => TbSig3,
        din_4   => TbSig4,
        din_5   => TbSig5,
        din_6   => TbSig6,
        din_7   => TbSig7,
        din_8   => TbSig8,
        din_9   => TbSig9,
        din_10   => TbSig10,
        din_11   => TbSig11,
        din_12   => TbSig12,
        din_13   => TbSig13,
        din_14   => TbSig14,
        din_15   => TbSig15,
        din_16   => TbSig16,
        din_17   => TbSig17,
        din_18   => TbSig18,
        din_19   => TbSig19,
        din_20   => TbSig20,
        din_21   => TbSig21,
        din_22   => TbSig22,
        din_23   => TbSig23,
        din_24   => TbSig24,
        din_25   => TbSig25,
        din_26   => TbSig26,
        din_27   => TbSig27,
        din_28   => TbSig28,
        din_29   => TbSig29,
        din_30   => TbSig30,
        din_31   => TbSig31,
        sel     => TbSel,
        dout    => TbOutput);

	-- Process for generating the clock
	clk <= not clk after ClockPeriod/2;
	
	PROC_SEQUENCER : process
	file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/gFex_Project/stimulus2.txt";
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

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_1' failed for line: " & text_line.all severity failure;
        TbSig1 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_2' failed for line: " & text_line.all severity failure;
        TbSig2 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_3' failed for line: " & text_line.all severity failure;
        TbSig3 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_4' failed for line: " & text_line.all severity failure;
        TbSig4 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_5' failed for line: " & text_line.all severity failure;
        TbSig5 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_6' failed for line: " & text_line.all severity failure;
        TbSig6 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_7' failed for line: " & text_line.all severity failure;
        TbSig7 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_8' failed for line: " & text_line.all severity failure;
        TbSig8 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_9' failed for line: " & text_line.all severity failure;
        TbSig9 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_10' failed for line: " & text_line.all severity failure;
        TbSig10 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_11' failed for line: " & text_line.all severity failure;
        TbSig11 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_12' failed for line: " & text_line.all severity failure;
        TbSig12 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_13' failed for line: " & text_line.all severity failure;
        TbSig13 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_14' failed for line: " & text_line.all severity failure;
        TbSig14 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_15' failed for line: " & text_line.all severity failure;
        TbSig15 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_16' failed for line: " & text_line.all severity failure;
        TbSig16 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_17' failed for line: " & text_line.all severity failure;
        TbSig17 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_18' failed for line: " & text_line.all severity failure;
        TbSig18 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_19' failed for line: " & text_line.all severity failure;
        TbSig19 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_20' failed for line: " & text_line.all severity failure;
        TbSig20 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_21' failed for line: " & text_line.all severity failure;
        TbSig21 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_22' failed for line: " & text_line.all severity failure;
        TbSig22 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_23' failed for line: " & text_line.all severity failure;
        TbSig23 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_24' failed for line: " & text_line.all severity failure;
        TbSig24 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_25' failed for line: " & text_line.all severity failure;
        TbSig25 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_26' failed for line: " & text_line.all severity failure;
        TbSig26 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_27' failed for line: " & text_line.all severity failure;
        TbSig27 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_28' failed for line: " & text_line.all severity failure;
        TbSig28 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_29' failed for line: " & text_line.all severity failure;
        TbSig29 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_30' failed for line: " & text_line.all severity failure;
        TbSig30 <= data;

        hread(text_line, data, ok);
        assert ok
            report "Read 'din_31' failed for line: " & text_line.all severity failure;
        TbSig31 <= data;

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


