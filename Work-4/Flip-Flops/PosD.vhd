-- Design a positive edge triggered D flip-flop by using the D-latch.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PosD is
    Port (
        Dp : in STD_LOGIC;
        C : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end PosD;

architecture Behavioral of PosD is
    signal x, y: STD_LOGIC;

    component D is
        Port (
            D : in STD_LOGIC;
            C : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qnot : out STD_LOGIC
        );
    end component;

begin
    Dff1 : D
    port map (
        D => Dp,
        C => not C,
        Q => x,
        Qnot => y
    );

    Dff2 : D
    port map (
        D => x,
        C => C,
        Q => Q,
        Qnot => Qn
    );
    
end Behavioral;
