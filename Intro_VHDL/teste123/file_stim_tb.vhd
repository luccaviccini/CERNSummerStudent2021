library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;
use std.env.finish;

entity file_stim_tb is
end file_stim_tb;

architecture sim of file_stim_tb is

  signal din_0 : unsigned(7 downto 0);
  signal din_1 : unsigned(7 downto 0);
  signal din_2 : unsigned(7 downto 0);
  signal din_3 : unsigned(7 downto 0);
  signal sel  : unsigned(1 downto 0);
  signal dout : unsigned(7 downto 0);

begin

  DUT: entity work.mux_4(rtl)
  port map (
      din_0 => din_0,
      din_1 => din_1,
      din_2 => din_2,
      din_3 => din_3,
      sel  => sel,
      dout => dout
  );

  PROC_SEQUENCER : process
    file text_file : text open read_mode is "stimulus.txt";
    variable text_line : line;
    variable ok : boolean;
    variable char : character;
    variable wait_time : time;
    variable selector : sel'subtype;
    variable data : dout'subtype;
  begin

    while not endfile(text_file) loop

      readline(text_file, text_line);

      -- Skip empty lines and single-line comments
      if text_line.all'length = 0 or text_line.all(1) = '#' then
        next;
      end if;

      read(text_line, wait_time, ok);
      assert ok
        report "Read 'wait_time' failed for line: " & text_line.all
        severity failure;

      hread(text_line, selector, ok);
      assert ok
        report "Read 'sel' failed for line: " & text_line.all
        severity failure;
      sel <= selector;
      
      hread(text_line, data, ok);
      assert ok
        report "Read 'din_0' failed for line: " & text_line.all
        severity failure;
      din_0 <= data;

      hread(text_line, data, ok);
      assert ok
        report "Read 'din_1' failed for line: " & text_line.all
        severity failure;
      din_1 <= data;

      hread(text_line, data, ok);
      assert ok
        report "Read 'din_2' failed for line: " & text_line.all
        severity failure;
      din_2 <= data;

      hread(text_line, data, ok);
      assert ok
        report "Read 'din_3' failed for line: " & text_line.all
        severity failure;
      din_3 <= data;
      
      wait for wait_time;

      -- Print trailing comment to console, if any
      read(text_line, char, ok); -- Skip expected newline
      read(text_line, char, ok);
      if char = '#' then
        read(text_line, char, ok); -- Skip expected newline
        report text_line.all;
      end if;

    end loop;

    finish;

  end process;

end architecture;