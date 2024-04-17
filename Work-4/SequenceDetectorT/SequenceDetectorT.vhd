-- Design a sequence detector that catches "1101" sequence 
-- with overlap using Mealy Model and T flip-flops

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SequenceDetectorT is
    Port (
        x : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Qa : out STD_LOGIC;
        Qan : out STD_LOGIC;
        Qbn : out STD_LOGIC;
        y : out STD_LOGIC;
        Qb : out STD_LOGIC
    );
end SequenceDetectorT;

architecture Behavioral of SequenceDetectorT is
    signal a, b, EntryTa, EntryTb : STD_LOGIC;

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
    EntryTa <= (a and b) or (b and x);
    EntryTb <= (NOT a and x) or (a and not x) or (b and not x);

    Qa <= a;
    Qb <= b;

    Ta : TFlipFlop
    port map (
        T => EntryTa,
        Reset => Reset,
        Clock => Clock,
        Q => a,
        Qn => Qan
    );

    TB : TFlipFlop
    port map (
        T => EntryTb,
        Reset => Reset,
        Clock => Clock,
        Q => b,
        Qn => Qbn
    );

    y <= a and b and x;
end Behavioral;
