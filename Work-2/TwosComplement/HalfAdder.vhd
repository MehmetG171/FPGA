-- Design a half adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity HalfAdder is
    Port (
        A, B : in STD_LOGIC;
        C, S : out STD_LOGIC
    );
end HalfAdder;

architecture Behavioral of HalfAdder is
begin
    -- Sum (S) is the XOR of A and B
    S <= A xor B;
    
    -- Carry (C) is the AND of A and B
    C <= A and B;
end Behavioral;