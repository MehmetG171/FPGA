-- Design a combinational circuit that compares two 2-bit numbers.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MagnitudeComparator_tb IS
END MagnitudeComparator_tb;

ARCHITECTURE behavior OF MagnitudeComparator_tb IS
    COMPONENT MagnitudeComparator
        PORT (
            A : IN std_logic_vector(1 downto 0);
            B : IN std_logic_vector(1 downto 0);
            E : OUT std_logic;
            G : OUT std_logic;
            L : OUT std_logic
        );
    END COMPONENT;

    signal A : std_logic_vector(1 downto 0) := (others => '0');
    signal B : std_logic_vector(1 downto 0) := (others => '0');
    signal E : std_logic;
    signal G : std_logic;
    signal L : std_logic;

BEGIN
    uut: MagnitudeComparator PORT MAP (
        A => A,
        B => B,
        E => E,
        G => G,
        L => L
    );

    stim_proc: process
    begin
        A <= "00";
        B <= "10";
        wait for 100 ns;
        A <= "01";
        B <= "11";
        wait for 100 ns;
        A <= "11";
        B <= "11";
        wait for 100 ns;
        A <= "11";
        B <= "10";
        wait for 100 ns;
        A <= "10";
        B <= "01";
        wait for 100 ns;
    end process;

END behavior;
