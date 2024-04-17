-- Design a BCD-to-Seven Segment Decoder. 
-- ABCD is the 4-bit input, abcdefg is the seven-bit output

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BCDto7SegmentDisplay is
    Port (
        X : in STD_LOGIC_VECTOR (3 downto 0);
        a : out STD_LOGIC;
        b : out STD_LOGIC;
        c : out STD_LOGIC;
        d : out STD_LOGIC;
        e : out STD_LOGIC;
        f : out STD_LOGIC;
        g : out STD_LOGIC
    );
end BCDto7SegmentDisplay;

architecture Behavioral of BCDto7SegmentDisplay is
begin
    a <= X(3) or X(1) or (X(2) and X(0)) or (not X(2) and not X(0));
    b <= (X(1) and X(0)) or (not X(1) and not X(0)) or not X(2);
    c <= X(2) or X(0) or not X(1);
    d <= (not X(2) and not X(0)) or (not X(0) and X(1)) or X(3) or (not X(2) and X(1)) or (X(2) and X(0) and not X(1));
    e <= (X(1) and not X(0)) or (not X(2) and not X(0));
    f <= (not X(1) and not X(0)) or (X(2) and not X(1)) or (X(2) and not X(0)) or X(3);
    g <= X(3) or (X(2) and not X(1)) or (not X(2) and X(1)) or (X(2) and not X(0));
end Behavioral;
