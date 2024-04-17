-- Design an 8-to1 MUX.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 8by1Mux is
    Port (
        D0, D1, D2, D3, D4, D5, D6, D7 : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR (2 downto 0);
        Y : out STD_LOGIC
    );
end 8by1Mux;

architecture Behavioral of 8by1Mux is
begin
    -- Output calculation based on the select inputs S
    Y <= (D0 and not S(2) and not S(1) and not S(0)) or
         (D1 and not S(2) and not S(1) and S(0)) or
         (D2 and not S(2) and S(1) and not S(0)) or
         (D3 and not S(2) and S(1) and S(0)) or
         (D4 and S(2) and not S(1) and not S(0)) or
         (D5 and S(2) and not S(1) and S(0)) or
         (D6 and S(2) and S(1) and not S(0)) or
         (D7 and S(2) and S(1) and S(0));
end Behavioral;
