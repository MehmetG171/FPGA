-- Full-Adder by using only basic logic functions

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Full_tb IS
END Full_tb;

ARCHITECTURE behavior OF Full_tb IS
    -- Component declaration for the Full entity
    COMPONENT Full
        PORT (
            A1 : IN std_logic;
            B1 : IN std_logic;
            C1 : IN std_logic;
            S1 : OUT std_logic;
            C2 : OUT std_logic
        );
    END COMPONENT;

    -- Signals for the test bench
    signal A1 : std_logic := '0';
    signal B1 : std_logic := '0';
    signal C1 : std_logic := '0';
    signal S1 : std_logic;
    signal C2 : std_logic;

BEGIN
    -- Instantiate the Full component
    uut: Full PORT MAP (
        A1 => A1,
        B1 => B1,
        C1 => C1,
        S1 => S1,
        C2 => C2
    );

    -- Stimulus process for testing
    stim_proc: process
    begin
        A1 <= '0';
        B1 <= '0';
        C1 <= '0';
        wait for 100 ns;

        A1 <= '0';
        B1 <= '0';
        C1 <= '1';
        wait for 100 ns;

        A1 <= '0';
        B1 <= '1';
        C1 <= '0';
        wait for 100 ns;

        A1 <= '0';
        B1 <= '1';
        C1 <= '1';
        wait for 100 ns;

        A1 <= '1';
        B1 <= '0';
        C1 <= '0';
        wait for 100 ns;

        A1 <= '1';
        B1 <= '0';
        C1 <= '1';
        wait for 100 ns;

        A1 <= '1';
        B1 <= '1';
        C1 <= '0';
        wait for 100 ns;

        A1 <= '1';
        B1 <= '1';
        C1 <= '1';
        wait for 100 ns;

        wait; -- Wait indefinitely after stimulus generation
    end process;

END behavior;
