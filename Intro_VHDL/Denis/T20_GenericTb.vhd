library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

use work.T20_Generic;

entity T20_GenericTb is
end entity;

architecture sim of T20_GenericTb is

    constant DataWidth16 : integer := 16;
    signal TbSig1 : std_logic_vector(DataWidth16-1 downto 0);
    signal TbSig2 : std_logic_vector(DataWidth16-1 downto 0);
    signal TbSig3 : std_logic_vector(DataWidth16-1 downto 0);
    signal TbSig4 : std_logic_vector(DataWidth16-1 downto 0);
    signal TbSel  : std_logic_vector(1 downto 0);

    signal TbOutput : std_logic_vector(DataWidth16-1 downto 0);


begin
    DUT : entity work.T20_Generic(rtl)
    generic map(DataWidth => DataWidth16)
    port map(
        din_0   => TbSig1,
        din_1   => TbSig2,
        din_2   => TbSig3,
        din_3   => TbSig4,
        sel     => TbSel,
        dout    => TbOutput);



  PROC_SEQUENCER : process
  file text_file     : text open read_mode is "C:/Users/Lucca/Documents/GitHub/CERNSummerStudent2021/Intro_VHDL/Denis/stimulus.txt";
  variable text_line : line;
  variable ok        : boolean;
  variable char      : character;
  variable wait_time : time;
  variable selector  : std_logic_vector(1 downto 0);
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
    TbSig1 <= data;
 
    hread(text_line, data, ok);
    assert ok
      report "Read 'din_1' failed for line: " & text_line.all severity failure;
    TbSig2 <= data;
 
    hread(text_line, data, ok);
    assert ok
      report "Read 'din_2' failed for line: " & text_line.all severity failure;
    TbSig3 <= data;
 
    hread(text_line, data, ok);
    assert ok
       report "Read 'din_3' failed for line: " & text_line.all
       severity failure;
    TbSig4 <= data;

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


