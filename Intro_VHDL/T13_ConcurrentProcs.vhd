library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
---- (1), (2) and (3) are exactly the same thing. Just different sintax 
entity T13_ConcurrentProcs is
end entity;
 
architecture sim of T13_ConcurrentProcs is

    signal Uns : unsigned(5 downto 0) := (others => '0');
    signal Mul1 : unsigned(7 downto 0);
    signal Mul2 : unsigned(7 downto 0);
    signal Mul3 : unsigned(7 downto 0);

 
begin
 
    process is
    begin
        
        Uns <= Uns + 1;
        wait for 10 ns;
    end process;


    --   (1) Process that multiplies Uns x 4 onto Mul1
    process is 
    begin
        Mul1 <= Uns & "00";

        wait on Uns;

    end process;  
    --- (2)
    process(Uns) is 
    begin
        Mul2 <= Uns & "00";
    end process;     
    -- signal assignment outside of a process is a process of its own
    -- therefore the compiler treats the Mul3 signal as a process sensitive to all signals on the right of the assignment

    ---- (3)
    Mul3 <= Uns & "00";

end architecture;