-- Design a 2x4 Decoder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity 2to4Decoder is
    Port (
        S : in STD_LOGIC_VECTOR (1 downto 0);
        En : in STD_LOGIC;
        D0 : out STD_LOGIC;
        D1 : out STD_LOGIC;
        D2 : out STD_LOGIC;
        D3 : out STD_LOGIC
    );
end 2to4Decoder;

architecture Behavioral of 2to4Decoder is
begin
    D0 <= En and not S(1) and not S(0);
    D1 <= En and not S(1) and S(0);
    D2 <= En and S(1) and not S(0);
    D3 <= En and S(1) and S(0);
end Behavioral;
