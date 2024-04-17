-- Implement the function given in sum-of-minterms form,
-- F(A, B, C) = Sum(1, 2, 3, 4, 6)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SumOfMinterms_tb IS
END SumOfMinterms_tb;

ARCHITECTURE behavior OF SumOfMinterms_tb IS
    COMPONENT SumOfMinterms
    PORT (
        A : IN std_logic;
        B : IN std_logic;
        C : IN std_logic;
        F : OUT std_logic
    );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL C : std_logic := '0';
    SIGNAL F : std_logic;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: SumOfMinterms PORT MAP (
        A => A,
        B => B,
        C => C,
        F => F
    );

    -- Clock process definitions
    --<clock>_process :PROCESS
    --BEGIN
    --<clock> <= '0';
    --WAIT FOR <clock>_period/2;
    --<clock> <= '1';
    --WAIT FOR <clock>_period/2;
    --END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Hold reset state for 100 ns
        A <= '0';
        B <= '0';
        C <= '0';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '0';
        C <= '1';
        WAIT FOR 100 ns;

        A <= '0';
        B <= '1';
        C <= '0';
        WAIT FOR 100 ns;

        -- WAIT FOR <clock>_period*10;
        -- Insert stimulus here
    END PROCESS;
END;
