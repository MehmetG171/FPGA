-- Implement a 3-bit adder-subtractor by using only the full adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 3bitAddSub is
    Port (
        A : in STD_LOGIC_VECTOR (2 downto 0);
        B : in STD_LOGIC_VECTOR (2 downto 0);
        C : in STD_LOGIC;
        Sum : out STD_LOGIC_VECTOR (2 downto 0);
        Carry : out STD_LOGIC
    );
end 3bitAddSub;

architecture Behavioral of 3bitAddSub is
    signal carry1, carry2: STD_LOGIC;
    signal one, two, three: STD_LOGIC;

    component Full is
        port (
            A1 : in STD_LOGIC;
            B1 : in STD_LOGIC;
            C1 : in STD_LOGIC;
            S1 : out STD_LOGIC;
            C2 : out STD_LOGIC
        );
    end component;

begin
    -- Calculate XOR between C and each bit of A
    one <= C xor A(0);
    two <= C xor A(1);
    three <= C xor A(2);

    -- Instantiate Full components for each bit addition
    FullAdder0 : Full
    port map (
        A1 => one,
        B1 => B(0),
        C1 => C,
        C2 => carry1,
        S1 => Sum(0)
    );

    FullAdder1 : Full
    port map (
        A1 => two,
        B1 => B(1),
        C1 => carry1,
        C2 => carry2,
        S1 => Sum(1)
    );

    FullAdder2 : Full
    port map (
        A1 => three,
        B1 => B(2),
        C1 => carry2,
        C2 => Carry,
        S1 => Sum(2)
    );

end Behavioral;
