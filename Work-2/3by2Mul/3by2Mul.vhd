-- Implement a multiplier that can multiply a 3-bit number with a 2-bit number by using the full adder

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 3by2Mul is
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (1 downto 0);
        C : out STD_LOGIC_VECTOR (4 downto 0)
    );
end 3by2Mul;

architecture Behavioral of 3by2Mul is
    component Full is
        port (
            A1 : in STD_LOGIC;
            B1 : in STD_LOGIC;
            C1 : in STD_LOGIC;
            S1 : out STD_LOGIC;
            C2 : out STD_LOGIC
        );
    end component;

    component Half is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC
        );
    end component;

    signal augend2, augend3, s1, s2, s3, s4, s5 : STD_LOGIC;

begin
    -- Intermediate signals calculation
    s1 <= A(0) and B(1);
    s2 <= A(1) and B(0);
    s3 <= A(1) and B(1);
    s4 <= A(2) and B(0);
    s5 <= A(2) and B(1);

    -- First half adder
    C(0) <= A(0) and B(0);
    HalfAdder1 : Half
    port map (
        A => s2,
        B => s1,
        S => C(1),
        C => augend2
    );

    -- First full adder
    FullAdder1 : Full
    port map (
        A1 => augend2,
        B1 => s4,
        C1 => s3,
        C2 => augend3,
        S1 => C(2)
    );

    -- Second half adder
    HalfAdder2 : Half
    port map (
        A => augend3,
        B => s5,
        S => C(3),
        C => C(4)
    );

end Behavioral;
