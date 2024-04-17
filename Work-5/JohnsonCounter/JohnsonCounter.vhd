-- Design a 4-bit Johnson Counter by using T flip-flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JohnsonCounter is
    Port (
        Clock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0)
    );
end JohnsonCounter;

architecture Behavioral of JohnsonCounter is
    signal A, B, C, D, An, Bn, Cn, Dn, EntryTa, EntryTb, EntryTc, EntryTd: STD_LOGIC;

    component TFlipFlop is
        Port (
            T : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

begin
    EntryTa <= A xor Dn;
    TA: TFlipFlop port map (
        T => EntryTa,
        Reset => Reset,
        Clock => Clock,
        Q => A,
        Qn => An
    );

    EntryTb <= A xor B;
    TB: TFlipFlop port map (
        T => EntryTb,
        Reset => Reset,
        Clock => Clock,
        Q => B,
        Qn => Bn
    );

    EntryTc <= C xor B;
    TC: TFlipFlop port map (
        T => EntryTc,
        Reset => Reset,
        Clock => Clock,
        Q => C,
        Qn => Cn
    );

    EntryTd <= C xor D;
    TD: TFlipFlop port map (
        T => EntryTd,
        Reset => Reset,
        Clock => Clock,
        Q => D,
        Qn => Dn
    );

    S(0) <= A;
    S(1) <= B;
    S(2) <= C;
    S(3) <= D;
end Behavioral;
