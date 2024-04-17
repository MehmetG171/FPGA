-- Half-Adder by using only basic logic functions

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Half_tb IS
END Half_tb;

ARCHITECTURE behavior OF Half_tb IS
    COMPONENT Half
        PORT (
            A : IN std_logic;
            B : IN std_logic;
            S : OUT std_logic;
            C : OUT std_logic
        );
    END COMPONENT;

    -- Signals for the test bench
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal S : std_logic;
    signal C : std_logic;

BEGIN
    -- Instantiate the Half component
    uut: Half PORT MAP (
        A => A,
        B => B,
        S => S,
        C => C
    );

    -- Stimulus process for testing
    stim_proc: process
    begin
        A <= '0';
        B <= '0';
        wait for 100 ns;

        A <= '0';
        B <= '1';
        wait for 100 ns;

        A <= '1';
        B <= '0';
        wait for 100 ns;

        A <= '1';
        B <= '1';
        wait for 100 ns;

        wait; -- Wait indefinitely after stimulus generation
    end process;

END behavior;
