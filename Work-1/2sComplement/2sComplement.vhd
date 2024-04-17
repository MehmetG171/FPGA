-- Design a digital system that converts a 4-bit decimal number from 0 to 7 into its negative in 2's complement format.
-- Input is binary number ABCD and the output is binary number KLMN

-- VHDL MODULE
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 2sComplement is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        C : in  STD_LOGIC;
        D : in  STD_LOGIC;
        K : out  STD_LOGIC;
        L : out  STD_LOGIC;
        M : out  STD_LOGIC;
        N : out  STD_LOGIC
    );
end 2sComplement;

architecture Behavioral of 2sComplement is
begin
    -- Logic for K output
    K <= A or B or C or D;

    -- Logic for L output
    L <= (not A and B and not C and not D) or
         (not A and not B and D) or
         (not A and not B and C);

    -- Logic for M output
    M <= (not A and D and not C) or
         (not A and C and not D);

    -- Logic for N output
    N <= not A and D;
end Behavioral;
