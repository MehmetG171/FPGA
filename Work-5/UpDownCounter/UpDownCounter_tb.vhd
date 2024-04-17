-- Design a 4-bit up/down counter by using D flip-flops.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY UpDownCounter_tb IS
END UpDownCounter_tb;

ARCHITECTURE behavior OF UpDownCounter_tb IS
    COMPONENT UpDownCounter
        PORT (
            M : IN std_logic;
            Clock : IN std_logic;
            Reset : IN std_logic;
            Q : OUT std_logic_vector(2 downto 0);
            Qn : OUT std_logic_vector(2 downto 0)
        );
    END COMPONENT;

    -- Signals declaration
    signal M : std_logic := '0';
    signal Clock : std_logic := '0';
    signal Reset : std_logic := '0';
    signal Q : std_logic_vector(2 downto 0);
    signal Qn : std_logic_vector(2 downto 0);

    -- Clock period definition
    constant Clock_period : time := 50 ns;
BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: UpDownCounter PORT MAP (
        M => M,
        Clock => Clock,
        Reset => Reset,
        Q => Q,
        Qn => Qn
    );

    -- Clock process definition
    Clock_process : process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    -- Stimulus process definition
    stim_proc: process
    begin
        Reset <= '1';  -- Assert Reset
        wait for 50 ns;
        Reset <= '0';  -- De-assert Reset
        wait for 950 ns;  -- Stimulus duration
    end process;
END;
