-- Design a 4-to-1 multiplexer (mux). 
-- Then mux implement the f(x,y,z) = xy + y'z' + x'z 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Pre3Q2 is
    Port (
        D0 : in STD_LOGIC;
        D1 : in STD_LOGIC;
        D2 : in STD_LOGIC;
        D3 : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR (1 downto 0);
        O : out STD_LOGIC
    );
end Pre3Q2;

architecture Behavioral of Pre3Q2 is
begin
    O <= (not S(0) and not S(1) and D0) or
         (S(0) and not S(1) and D1) or
         (not S(0) and S(1) and D2) or
         (S(0) and S(1) and D3);
end Behavioral;
