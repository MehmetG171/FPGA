-- Design a sequence detector that catches "1101" sequence 
-- with overlap using Mealy Model and T flip-flops

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY SequenceDetectorT_tb IS
END SequenceDetectorT_tb;

ARCHITECTURE behavior OF SequenceDetectorT_tb IS
    COMPONENT SequenceDetectorT
    PORT (
        x : IN std_logic;
        Reset : IN std_logic;
        Clock : IN std_logic;
        Qa : OUT std_logic;
        Qan : OUT std_logic;
        Qbn : OUT std_logic;
        y : OUT std_logic;
        Qb : OUT std_logic
    );
    END COMPONENT;

    signal x : std_logic := '0';
    signal Reset : std_logic := '0';
    signal Clock : std_logic := '0';
    signal Qa : std_logic;
    signal Qan : std_logic;
    signal Qbn : std_logic;
    signal y : std_logic;
    signal Qb : std_logic;

    constant Clock_period : time := 50 ns;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: SequenceDetectorT PORT MAP (
        x => x,
        Reset => Reset,
        Clock => Clock,
        Qa => Qa,
        Qan => Qan,
        Qbn => Qbn,
        y => y,
        Qb => Qb
    );

    -- Clock process definitions
    Clock_process: process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    stim_proc: process
    begin
        Reset <= '1';
        wait for 50 ns;
        Reset <= '0';
        x <= '0';
        wait for 75 ns;
        Reset <= '0';
        x <= '1';
        wait for 75 ns;
        Reset <= '0';
        x <= '1';
        wait for 75 ns;
        Reset <= '0';
        x <= '0';
        wait for 75 ns;
        Reset <= '0';
        x <= '1';
        wait for 75 ns;
        Reset <= '0';
        x <= '0';
        wait for 75 ns;
    end process;
    
END behavior;
