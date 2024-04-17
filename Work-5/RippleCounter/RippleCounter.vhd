-- Design a 4-bit asynchronous binary ripple counter by using JK Flip-Flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleCounter is
    Port (
        Count : in STD_LOGIC;
        Reset : in STD_LOGIC;
        S : out STD_LOGIC_VECTOR (3 downto 0)
    );
end RippleCounter;

architecture Behavioral of RippleCounter is
    signal A, B, C, D, An, Bn, Cn, Dn : STD_LOGIC;

    component JKFlipFlop is
        Port (
            J : in STD_LOGIC;
            K : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

begin
    JK0 : JKFlipFlop
    port map (
        J => '1',
        K => '1',
        Reset => Reset,
        Clock => not Count,
        Q => A,
        Qn => An
    );

    JK1 : JKFlipFlop
    port map (
        J => '1',
        K => '1',
        Reset => Reset,
        Clock => not A,
        Q => B,
        Qn => Bn
    );

    JK2 : JKFlipFlop
    port map (
        J => '1',
        K => '1',
        Reset => Reset,
        Clock => not B,
        Q => C,
        Qn => Cn
    );

    JK3 : JKFlipFlop
    port map (
        J => '1',
        K => '1',
        Reset => Reset,
        Clock => not C,
        Q => D,
        Qn => Dn
    );

    S(0) <= A;
    S(1) <= B;
    S(2) <= C;
    S(3) <= D;
end Behavioral;
