-- Design a 3x8 Decoder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 3to8Decoder is
    Port (
        S : in STD_LOGIC_VECTOR (2 downto 0);
        D0, D1, D2, D3, D4, D5, D6, D7 : out STD_LOGIC
    );
end 3to8Decoder;

architecture Behavioral of 3to8Decoder is
begin
    -- D0 output
    D0 <= '1' when (S = "000") else '0';
    
    -- D1 output
    D1 <= '1' when (S = "001") else '0';
    
    -- D2 output
    D2 <= '1' when (S = "010") else '0';
    
    -- D3 output
    D3 <= '1' when (S = "011") else '0';
    
    -- D4 output
    D4 <= '1' when (S = "100") else '0';
    
    -- D5 output
    D5 <= '1' when (S = "101") else '0';
    
    -- D6 output
    D6 <= '1' when (S = "110") else '0';
    
    -- D7 output
    D7 <= '1' when (S = "111") else '0';
end Behavioral;
