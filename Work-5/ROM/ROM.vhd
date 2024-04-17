-- Design a combinational circuit using a ROM. 
-- The circuit accepts a three-bit number and 
-- outputs a six-bit binary number equal to the square of the input number.
-- Implement this ROM only using a 3-to-8 decoder and minimum number of basic logic gates.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM is
    Port (
        S : in STD_LOGIC_VECTOR (2 downto 0);
        Q : out STD_LOGIC_VECTOR (5 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
    signal E3, E2, E1, E0, E4, E5, E6, E7 : STD_LOGIC;

    component 3to8Decoder is
        Port (
            S : in STD_LOGIC_VECTOR (2 downto 0);
            D0, D1, D2, D3, D4, D5, D6, D7 : out STD_LOGIC
        );
    end component;

begin
    Decoder1 : 3to8Decoder
    port map (
        D0 => E0,
        D1 => E1,
        D2 => E2,
        D3 => E3,
        D4 => E4,
        D5 => E5,
        D6 => E6,
        D7 => E7,
        S => S
    );

    Q(5) <= E6 or E7;
    Q(4) <= E4 or E5 or E7;
    Q(3) <= E3 or E5;
    Q(2) <= E2 or E6;
    Q(1) <= '0'; -- Constant value '0'
    Q(0) <= E1 or E3 or E5 or E7;
end Behavioral;
