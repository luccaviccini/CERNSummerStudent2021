library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity mux_4 is
port(
    -- Data in
    din_0 : in unsigned(7 downto 0);
    din_1 : in unsigned(7 downto 0);
    din_2 : in unsigned(7 downto 0);
    din_3 : in unsigned(7 downto 0);

    -- Selector
    sel  : in unsigned(1 downto 0);

    -- Data out
    dout : out unsigned(7 downto 0));
end entity;
 
architecture rtl of mux_4 is
begin
 
    process(sel, din_0, din_1, din_2, din_3) is
    begin
 
        case sel is
            when "00" =>
                dout <= din_0;
            when "01" =>
                dout <= din_1;
            when "10" =>
                dout <= din_2;
            when "11" =>
                dout <= din_3;
            when others => -- 'U', 'X', '-', etc.
                dout <= (others => 'X');
        end case;
 
    end process;
 
end architecture;