-- Design a 4-bit universal shift register by using T flip-flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister is
    Port (
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        SR : in STD_LOGIC;
        SL : in STD_LOGIC;
        S : in STD_LOGIC_VECTOR (1 downto 0);
        I : in STD_LOGIC_VECTOR (3 downto 0);
        A : out STD_LOGIC_VECTOR (3 downto 0)
    );
end ShiftRegister;

architecture Behavioral of ShiftRegister is
    signal M3, M2, M1, M0, T3, T2, T1, T0, T3n, T2n, T1n, T0n, EntryT3, EntryT2, EntryT1, EntryT0: STD_LOGIC;

    -- Component declaration for 4x1 MUX
    component 4to1Mux is
        Port (
            D0 : in STD_LOGIC;
            D1 : in STD_LOGIC;
            D2 : in STD_LOGIC;
            D3 : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR (1 downto 0);
            Y : out STD_LOGIC
        );
    end component;

    -- Component declaration for T flip-flop
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
    -- 4x1 MUX instances
    Mux0: 4to1Mux
    port map (
        D0 => T0,
        D1 => T1,
        D2 => SL,
        D3 => I(0),
        Y => M0,
        S(0) => S(0),
        S(1) => S(1)
    );

    Mux1: 4to1Mux
    port map (
        D0 => T1,
        D1 => T2,
        D2 => T0,
        D3 => I(1),
        Y => M1,
        S(0) => S(0),
        S(1) => S(1)
    );

    Mux3: 4to1Mux
    port map (
        D0 => T2,
        D1 => T3,
        D2 => T1,
        D3 => I(2),
        Y => M2,
        S(0) => S(0),
        S(1) => S(1)
    );

    Mux4: 4to1Mux
    port map (
        D0 => T3,
        D1 => SR,
        D2 => T2,
        D3 => I(3),
        Y => M3,
        S(0) => S(0),
        S(1) => S(1)
    );

    -- Entry signals for T flip-flops
    EntryT0 <= T0 xor M0;
    EntryT1 <= T1 xor M1;
    EntryT2 <= T2 xor M2;
    EntryT3 <= T3 xor M3;

    -- T flip-flop instances
    TFF0 : TFlipFlop
    port map (
        T => EntryT0,
        Reset => Reset,
        Clock => not Clock,
        Q => T0,
        Qn => T0n
    );

    TFF1 : TFlipFlop
    port map (
        T => EntryT1,
        Reset => Reset,
        Clock => not Clock,
        Q => T1,
        Qn => T1n
    );

    TFF2 : TFlipFlop
    port map (
        T => EntryT2,
        Reset => Reset,
        Clock => not Clock,
        Q => T2,
        Qn => T2n
    );

    TFF3 : TFlipFlop
    port map (
        T => EntryT3,
        Reset => Reset,
        Clock => not Clock,
        Q => T3,
        Qn => T3n
    );

    -- Output assignments
    A(0) <= T0;
    A(1) <= T1;
    A(2) <= T2;
    A(3) <= T3;
    
end Behavioral;
