library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;

entity init_ram_2008_tb is
end init_ram_2008_tb;

architecture sim of init_ram_2008_tb is

  constant ram_depth : natural := 256;
  constant ram_width : natural := 32;

  type ram_type is array (0 to ram_depth - 1) of std_logic_vector(ram_width - 1 downto 0);

  impure function init_ram_hex return ram_type is
    file text_file : text open read_mode is "ram_content_hex.txt";
    variable text_line : line;
    variable ram_content : ram_type;
  begin
    for i in 0 to ram_depth - 1 loop
      readline(text_file, text_line);
      hread(text_line, ram_content(i));
    end loop;

    return ram_content;
  end function;

  impure function init_ram_bin return ram_type is
    file text_file : text open read_mode is "ram_content_bin.txt";
    variable text_line : line;
    variable ram_content : ram_type;
  begin
    for i in 0 to ram_depth - 1 loop
      readline(text_file, text_line);
      bread(text_line, ram_content(i));
    end loop;

    return ram_content;
  end function;

  -- Initialize RAM from hex values in ASCII file
  signal ram_hex : ram_type := init_ram_hex;

  -- Initialize RAM from binary values in ASCII file
  signal ram_bin : ram_type := init_ram_bin;

begin
end architecture;