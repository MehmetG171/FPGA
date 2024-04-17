-- Design an odd parity generator circuit for a 4-bit binary number.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParityChecker is
    Port (
        A : in STD_LOGIC_VECTOR(3 downto 0);
        P : out STD_LOGIC
    );
end ParityChecker;

architecture Behavioral of ParityChecker is
begin
    P <= not (A(0) xor A(1) xor A(2) xor A(3));
end Behavioral;
