-- Full-Adder by using only basic logic functions

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full is
    Port (
        A1, B1, C1 : in STD_LOGIC;
        S1 : out STD_LOGIC;
        C2 : out STD_LOGIC
    );
end Full;

architecture Behavioral of Full is
    signal sumFirst, sumSecond, carryFirst, carrySecond : STD_LOGIC;

    -- Component declaration for the Half half adder
    component Half is
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            S : out STD_LOGIC;
            C : out STD_LOGIC
        );
    end component;

begin
    -- Instantiate the first half adder (HalfAdder1)
    HalfAdder1 : Half
    port map (
        A => A1,
        B => B1,
        S => sumFirst,
        C => carryFirst
    );

    -- Instantiate the second half adder (HalfAdder2)
    HalfAdder2 : Half
    port map (
        A => C1,
        B => sumFirst,
        S => sumSecond,
        C => carrySecond
    );

    -- Output assignments
    S1 <= sumSecond;
    C2 <= carryFirst or carrySecond; -- Carry out is the OR of carryFirst and carrySecond
end Behavioral;
