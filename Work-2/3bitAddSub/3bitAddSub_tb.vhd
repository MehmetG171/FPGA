-- Implement a 3-bit adder-subtractor by using only the full adder.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY 3bitAddSub_tb IS
END 3bitAddSub_tb;

ARCHITECTURE behavior OF 3bitAddSub_tb IS
    -- Component declaration for 3bitAddSub
    COMPONENT 3bitAddSub
        PORT (
            A : IN std_logic_vector(2 downto 0);
            B : IN std_logic_vector(2 downto 0);
            C : IN std_logic;
            Sum : OUT std_logic_vector(2 downto 0);
            Carry : OUT std_logic
        );
    END COMPONENT;

    -- Signals for the test bench
    signal A : std_logic_vector(2 downto 0) := (others => '0');
    signal B : std_logic_vector(2 downto 0) := (others => '0');
    signal C : std_logic := '0';
    signal Sum : std_logic_vector(2 downto 0);
    signal Carry : std_logic;

BEGIN
    -- Instantiate the 3bitAddSub component
    uut: 3bitAddSub PORT MAP (
        A => A,
        B => B,
        C => C,
        Sum => Sum,
        Carry => Carry
    );

    -- Stimulus process for testing
    stim_proc: process
    begin
        A <= "011";
        B <= "001";
        C <= '0';
        wait for 100 ns;

        A <= "010";
        B <= "110";
        C <= '0';
        wait for 100 ns;

        A <= "001";
        B <= "001";
        C <= '0';
        wait for 100 ns;

        A <= "110";
        B <= "010";
        C <= '0';
        wait for 100 ns;

        A <= "111";
        B <= "011";
        C <= '0';
        wait for 100 ns;

        wait; -- Wait indefinitely after stimulus generation
    end process;

END behavior;
