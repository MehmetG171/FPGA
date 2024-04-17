-- Design a 4-bit up/down counter by using D flip-flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UpDownCounter is
    Port (
        M : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Q : OUT std_logic_vector(2 downto 0);
        Qn : OUT std_logic_vector(2 downto 0)
    );
end UpDownCounter;

architecture Behavioral of UpDownCounter is
    signal A, B, C, D, An, Bn, Cn, Dn, entryD2, entryD3: STD_LOGIC;

    component DFlipFlop is
        Port (
            D : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

begin
    D1 : DFlipFlop
    port map (
        D => not A,
        Reset => Reset,
        Clock => Clock,
        Q => A,
        Qn => Qn(0)
    );

    D2 : DFlipFlop
    port map (
        D => entryD2,
        Reset => Reset,
        Clock => Clock,
        Q => B,
        Qn => Qn(1)
    );

    D3 : DFlipFlop
    port map (
        D => entryD3,
        Reset => Reset,
        Clock => Clock,
        Q => C,
        Qn => Qn(2)
    );

    entryD2 <= B xor M xor A;
    entryD3 <= (not B and M and A) or (not B and C and A) or (B and M and C)
               or (not M and C and not A) or (not C and not M and A and B);

    Q(0) <= A;
    Q(1) <= B;
    Q(2) <= C;
    
end Behavioral;
