-- There is a digital device, that contains a combinational logic circuit. 
-- This system has 3 binary inputs (x, y, z) and 3 binary outputs (A, B, C).
-- If the binary inputs are 0,1,2 or 3 (in decimal), output is one greater than the input.
-- If the inputs are applied as 4, 5, 6 or 7 output is one less than the input.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DigitalDevice_tb IS
END DigitalDevice_tb;

ARCHITECTURE behavior OF DigitalDevice_tb IS
    COMPONENT DigitalDevice
    PORT (
        x : IN std_logic;
        y : IN std_logic;
        z : IN std_logic;
        A : OUT std_logic;
        B : OUT std_logic;
        C : OUT std_logic
    );
    END COMPONENT;

    -- Inputs
    SIGNAL x : std_logic := '0';
    SIGNAL y : std_logic := '0';
    SIGNAL z : std_logic := '0';

    -- Outputs
    SIGNAL A : std_logic;
    SIGNAL B : std_logic;
    SIGNAL C : std_logic;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: DigitalDevice PORT MAP (
        x => x,
        y => y,
        z => z,
        A => A,
        B => B,
        C => C
    );

    -- Clock process definitions
    -- <clock>_process :PROCESS
    -- BEGIN
    -- <clock> <= '0';
    -- WAIT FOR <clock>_period/2;
    -- <clock> <= '1';
    -- WAIT FOR <clock>_period/2;
    -- END PROCESS;

    -- Stimulus process
    stim_proc: PROCESS
    BEGIN
        -- Hold reset state for 100 ns
        x <= '0';
        y <= '0';
        z <= '0';
        WAIT FOR 100 ns;

        x <= '1';
        y <= '0';
        z <= '1';
        WAIT FOR 100 ns;

        x <= '0';
        y <= '1';
        z <= '0';
        WAIT FOR 100 ns;

        x <= '1';
        y <= '1';
        z <= '1';
        WAIT FOR 100 ns;

        -- WAIT FOR <clock>_period*10;
        -- Insert stimulus here
    END PROCESS;
END;
