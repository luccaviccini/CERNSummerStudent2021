library ieee;
use ieee.std_logic_1164.all;

use std.textio.all;

entity init_ram_legacy_tb is
end init_ram_legacy_tb;

architecture sim of init_ram_legacy_tb is

  constant ram_depth : natural := 256;
  constant ram_width : natural := 32;

  type ram_type is array (0 to ram_depth - 1) of std_logic_vector(ram_width - 1 downto 0);

  impure function init_ram_hex return ram_type is
    file text_file : text open read_mode is "ram_content_hex.txt";
    variable text_line : line;
    variable ram_content : ram_type;
    variable c : character;
    variable offset : integer;
    variable hex_val : std_logic_vector(3 downto 0);
  begin
    for i in 0 to ram_depth - 1 loop
      readline(text_file, text_line);

      offset := 0;

      while offset < ram_content(i)'high loop
        read(text_line, c);

        case c is
          when '0' => hex_val := "0000";
          when '1' => hex_val := "0001";
          when '2' => hex_val := "0010";
          when '3' => hex_val := "0011";
          when '4' => hex_val := "0100";
          when '5' => hex_val := "0101";
          when '6' => hex_val := "0110";
          when '7' => hex_val := "0111";
          when '8' => hex_val := "1000";
          when '9' => hex_val := "1001";
          when 'A' | 'a' => hex_val := "1010";
          when 'B' | 'b' => hex_val := "1011";
          when 'C' | 'c' => hex_val := "1100";
          when 'D' | 'd' => hex_val := "1101";
          when 'E' | 'e' => hex_val := "1110";
          when 'F' | 'f' => hex_val := "1111";

          when others =>
            hex_val := "XXXX";
            assert false report "Found non-hex character '" & c & "'";
        end case;

        ram_content(i)(ram_content(i)'high - offset
          downto ram_content(i)'high - offset - 3) := hex_val;
        offset := offset + 4;

      end loop;
    end loop;

    return ram_content;
  end function;

  impure function init_ram_bin return ram_type is
    file text_file : text open read_mode is "ram_content_bin.txt";
    variable text_line : line;
    variable ram_content : ram_type;
    variable bv : bit_vector(ram_content(0)'range);
  begin
    for i in 0 to ram_depth - 1 loop
      readline(text_file, text_line);
      read(text_line, bv);
      ram_content(i) := To_StdLogicVector(bv);
    end loop;

    return ram_content;
  end function;

  -- Initialize RAM from hex values in ASCII file
  signal ram_hex : ram_type := init_ram_hex;

  -- Initialize RAM from binary values in ASCII file
  signal ram_bin : ram_type := init_ram_bin;

begin
end architecture;