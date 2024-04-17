-- Design a 3-to-8 decoder with active-high outputs.
-- Then using the 3-to-8 decoder, design a full adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 3to8Decoder is
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        S : out STD_LOGIC;
        C : out STD_LOGIC
    );
end 3to8Decoder;

architecture Behavioral of 3to8Decoder is
    signal s1, s2, s3, s4, s5, s6, s7 : STD_LOGIC;
begin
    s1 <= (not A(2)) and (not A(1)) and A(0);
    s2 <= (not A(2)) and A(1) and (not A(0));
    s3 <= (not A(2)) and A(1) and A(0);
    s4 <= A(2) and (not A(1)) and (not A(0));
    s5 <= A(2) and (not A(1)) and A(0);
    s6 <= A(2) and A(1) and (not A(0));
    s7 <= A(2) and A(1) and A(0);

    S <= s1 or s2 or s4 or s7;
    C <= s3 or s5 or s6 or s7;
end Behavioral;
