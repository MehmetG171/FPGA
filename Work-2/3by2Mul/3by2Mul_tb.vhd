-- Implement a multiplier that can multiply a 3-bit number with a 2-bit number by using the full adder

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY 3by2Mul_tb IS
END 3by2Mul_tb;

ARCHITECTURE behavior OF 3by2Mul_tb IS
    -- Component declaration for 3by2Mul
    COMPONENT 3by2Mul
        PORT (
            A : IN std_logic_vector(2 downto 0);
            B : IN std_logic_vector(1 downto 0);
            C : OUT std_logic_vector(4 downto 0)
        );
    END COMPONENT;

    -- Signals for the test bench
    signal A : std_logic_vector(2 downto 0) := (others => '0');
    signal B : std_logic_vector(1 downto 0) := (others => '0');
    signal C : std_logic_vector(4 downto 0);

BEGIN
    -- Instantiate the 3by2Mul component
    uut: 3by2Mul PORT MAP (
        A => A,
        B => B,
        C => C
    );

    -- Stimulus process for testing
    stim_proc: process
    begin
        A <= "100";
        B <= "10";
        wait for 100 ns;

        A <= "101";
        B <= "11";
        wait for 100 ns;

        A <= "011";
        B <= "01";
        wait for 100 ns;

        A <= "010";
        B <= "10";
        wait for 100 ns;

        A <= "111";
        B <= "01";
        wait for 100 ns;

        wait; -- Wait indefinitely after stimulus generation
    end process;

END behavior;
