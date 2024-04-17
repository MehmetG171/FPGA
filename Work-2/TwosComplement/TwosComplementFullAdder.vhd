-- Design a four bit combinational circuit 2's complementer using the full-adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwosComplementFullAdder is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0); -- Input number
        TwosComp : out STD_LOGIC_VECTOR (3 downto 0) -- 2's complement output
    );
end TwosComplementFullAdder;

architecture Behavioral of TwosComplementFullAdder is
    signal Sum1, Sum2, Sum3, Carry1, Carry2, Carry3 : STD_LOGIC;

    component FullAdder is
        Port (
            A, B, C : in STD_LOGIC;
            S, C1 : out STD_LOGIC
        );
    end component;

begin
    -- Calculate 1's complement by inverting the bits
    TwosComp(0) <= not A(0);
    TwosComp(1) <= not A(1);
    TwosComp(2) <= not A(2);
    TwosComp(3) <= not A(3);

    -- Initialize carry-in for the first full adder
    Carry1 <= '1';

    -- Instantiate full adders for 2's complement calculation
    FA1 : FullAdder port map (A => TwosComp(0), B => '1', C => Carry1, S => Sum1, C1 => Carry2);
    FA2 : FullAdder port map (A => TwosComp(1), B => '1', C => Carry2, S => Sum2, C1 => Carry3);
    FA3 : FullAdder port map (A => TwosComp(2), B => '1', C => Carry3, S => Sum3, C1 => open);

    -- Output the 2's complement
    TwosComp(0) <= Sum1;
    TwosComp(1) <= Sum2;
    TwosComp(2) <= Sum3;
    TwosComp(3) <= Carry3; -- Carry out is the MSB of the 2's complement

end Behavioral;

