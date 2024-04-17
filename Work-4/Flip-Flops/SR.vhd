-- Design a SR-latch by using only basic logic gates/functions.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SR is
    Port (
        S : in STD_LOGIC;
        R : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end SR;

architecture Behavioral of SR is
    signal x, y: STD_LOGIC;
begin
    x <= y nor R;
    y <= x nor S;
    Q <= x;
    Qn <= y;
end Behavioral;
