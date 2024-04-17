-- Design a 4-bit Johnson Counter by using T flip-flops.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY JohnsonCounter_tb IS
END JohnsonCounter_tb;

ARCHITECTURE behavior OF JohnsonCounter_tb IS
    COMPONENT JohnsonCounter
        PORT (
            Clock : IN std_logic;
            Reset : IN std_logic;
            S : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    -- Inputs
    signal Clock : std_logic := '0';
    signal Reset : std_logic := '0';

    -- Outputs
    signal S : std_logic_vector(3 downto 0);

    -- Clock period definitions
    constant Clock_period : time := 50 ns;
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: JohnsonCounter PORT MAP (
        Clock => Clock,
        Reset => Reset,
        S => S
    );

    -- Clock process definitions
    Clock_process : process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        Reset <= '1';  -- Assert Reset
        wait for 50 ns;
        Reset <= '0';  -- De-assert Reset
        wait for 950 ns;  -- Stimulus duration
    end process;
END;
