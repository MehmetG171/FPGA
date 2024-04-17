-- Design an 8-to1 MUX.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY 8by1Mux_tb IS
END 8by1Mux_tb;

ARCHITECTURE behavior OF 8by1Mux_tb IS
    COMPONENT 8by1Mux
        PORT (
            D0, D1, D2, D3, D4, D5, D6, D7 : IN std_logic;
            S : IN std_logic_vector(2 downto 0);
            Y : OUT std_logic
        );
    END COMPONENT;

    -- Inputs
    signal D0, D1, D2, D3, D4, D5, D6, D7 : std_logic := '0';
    signal S : std_logic_vector(2 downto 0) := "000"; -- Initializing S with all '0's
    -- Output
    signal Y : std_logic;

BEGIN
    -- Instantiate the 8by1Mux component
    uut: 8by1Mux PORT MAP (
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7,
        S => S,
        Y => Y
    );

    -- Stimulus process for testing
    stim_proc: process
    begin
        -- Assigning values to D inputs
        D0 <= '0';
        D1 <= '1';
        D2 <= '0';
        D3 <= '1';
        D4 <= '0';
        D5 <= '1';
        D6 <= '0';
        D7 <= '1';

        -- Test cases for S inputs
        S <= "101";
        wait for 100 ns;

        S <= "100";
        wait for 100 ns;

        S <= "110";
        wait for 100 ns;

        S <= "001";
        wait for 100 ns;

        S <= "010";
        wait for 100 ns;

        wait; -- Wait indefinitely after stimulus generation
    end process;

END behavior;
