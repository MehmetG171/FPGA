-- Design a combinational circuit that compares two 2-bit numbers.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MagnitudeComparator is
    Port (
        A : in STD_LOGIC_VECTOR (1 downto 0);
        B : in STD_LOGIC_VECTOR (1 downto 0);
        E : out STD_LOGIC;
        G : out STD_LOGIC;
        L : out STD_LOGIC
    );
end MagnitudeComparator;

architecture Behavioral of MagnitudeComparator is
    signal y0, y1, y2, y3 : STD_LOGIC;
    signal x0, x1, x2, x3 : STD_LOGIC;
begin
    y0 <= not B(1) and not B(0);
    y1 <= not B(1) and B(0);
    y2 <= B(1) and not B(0);
    y3 <= B(1) and B(0);
    x0 <= not A(1) and not A(0);
    x1 <= not A(1) and A(0);
    x2 <= A(1) and not A(0);
    x3 <= A(1) and A(0);

    E <= (x1 and y1) or (x2 and y2) or (x3 and y3) or (x0 and y0);
    L <= (x0 and y1) or (x0 and y2) or (x0 and y3) or (x1 and y2) or (x1 and y3) or (x2 and y3);
    G <= (x1 and y0) or (x2 and y0) or (x2 and y1) or (x3 and y0) or (x3 and y1) or (x3 and y2);

end Behavioral;
