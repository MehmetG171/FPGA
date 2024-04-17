-- Design a full adder by using half adders.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdder is
    Port (
        A, B, C : in STD_LOGIC;
        S, C1 : out STD_LOGIC
    );
end FullAdder;

architecture Behavioral of FullAdder is
    signal Sum1, Sum2, Carry1, Carry2 : STD_LOGIC;

    component HalfAdder is
        Port (
            A, B : in STD_LOGIC;
            S, C : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the first half adder
    HalfAdder1 : HalfAdder
    port map (
        A => A,
        B => B,
        S => Sum1,
        C => Carry1
    );

    -- Instantiate the second half adder
    HalfAdder2 : HalfAdder
    port map (
        A => C,
        B => Sum1,
        S => Sum2,
        C => Carry2
    );

    -- Output Sum is the Sum of the second half adder
    S <= Sum2;
    
    -- Output Carry is the OR of Carry1 and Carry2
    C1 <= Carry1 or Carry2;
end Behavioral;
