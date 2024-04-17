-- Half-Adder by using only basic logic functions

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half is
    Port (
        A, B : in STD_LOGIC;
        S, C : out STD_LOGIC
    );
end Half;

architecture Behavioral of Half is
begin
    -- S is the XOR of A and B
    S <= A xor B;

    -- C is the AND of A and B
    C <= A and B;
end Behavioral;