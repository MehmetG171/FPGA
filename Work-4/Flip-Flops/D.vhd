-- Design a D-latch using the SR-latch

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D is
    Port (
        D : in STD_LOGIC;
        C : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qnot : out STD_LOGIC
    );
end D;

architecture Behavioral of D is
    signal x, y: STD_LOGIC;

    component SR is
        Port (
            S : in STD_LOGIC;
            R : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

begin
    x <= ((not D) and C);
    y <= (D and C);

    Dff : SR
    port map (
        R => x,
        S => y,
        Q => Q,
        Qn => Qnot
    );
end Behavioral;
