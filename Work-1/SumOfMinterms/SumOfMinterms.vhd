-- Implement the function given in sum-of-minterms form,
-- F(A, B, C) = Sum(1, 2, 3, 4, 6)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SumOfMinterms is
    Port (
        A, B, C : in STD_LOGIC;
        F : out STD_LOGIC
    );
end SumOfMinterms;

architecture Behavioral of SumOfMinterms is
begin
    F <= ((not A) and (not B) and (C)) or
         ((not A) and (B) and (not C)) or
         ((not A) and (B) and (C)) or
         ((A) and (not B) and (not C)) or
         ((A) and (B) and (not C));
end Behavioral;
