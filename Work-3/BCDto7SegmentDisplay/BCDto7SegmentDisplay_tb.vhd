-- Design a BCD-to-Seven Segment Decoder. 
-- ABCD is the 4-bit input, abcdefg is the seven-bit output

library ieee;
use ieee.std_logic_1164.ALL;

ENTITY BCDto7SegmentDisplay_tb IS
END BCDto7SegmentDisplay_tb;

ARCHITECTURE behavior OF BCDto7SegmentDisplay_tb IS
    COMPONENT BCDto7SegmentDisplay
        PORT (
            X : IN std_logic_vector(3 downto 0);
            a : OUT std_logic;
            b : OUT std_logic;
            c : OUT std_logic;
            d : OUT std_logic;
            e : OUT std_logic;
            f : OUT std_logic;
            g : OUT std_logic
        );
    END COMPONENT;

    signal X : std_logic_vector(3 downto 0) := (others => '0');
    signal a : std_logic;
    signal b : std_logic;
    signal c : std_logic;
    signal d : std_logic;
    signal e : std_logic;
    signal f : std_logic;
    signal g : std_logic;

BEGIN
    uut: BCDto7SegmentDisplay PORT MAP (
        X => X,
        a => a,
        b => b,
        c => c,
        d => d,
        e => e,
        f => f,
        g => g
    );

    stim_proc: process
    begin
        X <= "0000"; wait for 100 ns;
        X <= "0001"; wait for 100 ns;
        X <= "0010"; wait for 100 ns;
        X <= "0011"; wait for 100 ns;
        X <= "0100"; wait for 100 ns;
        X <= "0101"; wait for 100 ns;
        X <= "0110"; wait for 100 ns;
        X <= "0111"; wait for 100 ns;
        X <= "1000"; wait for 100 ns;
        X <= "1001"; wait for 100 ns;
    end process;
END behavior;
