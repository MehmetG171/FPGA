-- There is a digital device, that contains a combinational logic circuit. 
-- This system has 3 binary inputs (x, y, z) and 3 binary outputs (A, B, C).
-- If the binary inputs are 0,1,2 or 3 (in decimal), output is one greater than the input.
-- If the inputs are applied as 4, 5, 6 or 7 output is one less than the input.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DigitalDevice is
    Port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        z : in STD_LOGIC;
        A : out STD_LOGIC;
        B : out STD_LOGIC;
        C : out STD_LOGIC
    );
end DigitalDevice;

architecture Behavioral of DigitalDevice is
begin
    A <= x xor y xor z;
    B <= (y and z) or (y and x) or (x and z);
    C <= not z;
end Behavioral;
