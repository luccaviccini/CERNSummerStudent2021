library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;
use work.gfex32;

entity gfex32_tb is
end entity;

architecture sim of gfex32_tb is
	-- Properties of the clockclock -- 
  	--constant ClockFrequency : integer := 1000e6; -- 1 GHz
    constant ClockPeriod    : time    := 1 ns; 
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
	
	signal TbOut0 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut1 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut2 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut3 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut4 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut5 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut6 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut7 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut8 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut9 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut10 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut11 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut12 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut13 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut14 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut15 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut16 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut17 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut18 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut19 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut20 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut21 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut22 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut23 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut24 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut25 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut26 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut27 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut28 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut29 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut30 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOut31 : std_logic_vector(DataWidth16-1 downto 0);
	signal TbOutBigSum : std_logic_vector(DataWidth16 + 2 downto 0);
	


begin
    DUT : entity work.gfex32(rtl)
    generic map(DataWidth => DataWidth16)
    port map(
		-- Associating Module signals with TB signals 
		clk 	  => clk,
        je_inp0   => TbSig0,
        je_inp1   => TbSig1,
        je_inp2   => TbSig2,
        je_inp3   => TbSig3,
        je_inp4   => TbSig4,
        je_inp5   => TbSig5,
        je_inp6   => TbSig6,
        je_inp7   => TbSig7,
        je_inp8   => TbSig8,
        je_inp9   => TbSig9,
        je_inp10   => TbSig10,
        je_inp11   => TbSig11,
        je_inp12   => TbSig12,
        je_inp13   => TbSig13,
        je_inp14   => TbSig14,
        je_inp15   => TbSig15,
        je_inp16   => TbSig16,
        je_inp17   => TbSig17,
        je_inp18   => TbSig18,
        je_inp19   => TbSig19,
        je_inp20   => TbSig20,
        je_inp21   => TbSig21,
        je_inp22   => TbSig22,
        je_inp23   => TbSig23,
        je_inp24   => TbSig24,
        je_inp25   => TbSig25,
        je_inp26   => TbSig26,
        je_inp27   => TbSig27,
        je_inp28   => TbSig28,
        je_inp29   => TbSig29,
        je_inp30   => TbSig30,
        je_inp31   => TbSig31,
		
        eta_ind   => TbSel,	
		
        je_out0   => TbOut0,
        je_out1   => TbOut1,
        je_out2   => TbOut2,
        je_out3   => TbOut3,
        je_out4   => TbOut4,
        je_out5   => TbOut5,
        je_out6   => TbOut6,
        je_out7   => TbOut7,
        je_out8   => TbOut8,
        je_out9   => TbOut9,
        je_out10   => TbOut10,
        je_out11   => TbOut11,
        je_out12   => TbOut12,
        je_out13   => TbOut13,
        je_out14   => TbOut14,
        je_out15   => TbOut15,
        je_out16   => TbOut16,
        je_out17   => TbOut17,
        je_out18   => TbOut18,
        je_out19   => TbOut19,
        je_out20   => TbOut20,
        je_out21   => TbOut21,
        je_out22   => TbOut22,
        je_out23   => TbOut23,
        je_out24   => TbOut24,
        je_out25   => TbOut25,
        je_out26   => TbOut26,
        je_out27   => TbOut27,
        je_out28   => TbOut28,
        je_out29   => TbOut29,
        je_out30   => TbOut30,
        je_out31   => TbOut31,		


		biggest_sum => TbOutBigSum);

	-- Process for generating the clock
	clk <= not clk after ClockPeriod/2;
	
	PROC_SEQUENCER : process
	file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/gfex_project/gfex32/stimulus32.txt";
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


