-- Design a sequential odd parity calculating and odd parity checking device
-- The input data is given to system with each clock rising edge. 
-- The parity that should be compared with calculated value is on "parityin" input.
-- This system calculates the odd parity bit and outputs the result on "parityout" output. 
-- This value is compared with the value given to the system originally
-- and if the parityin and parityout are equal (i.e. parity checks out) then the paritychk is '1'.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ParityDetector_tb IS
END ParityDetector_tb;

ARCHITECTURE behavior OF ParityDetector_tb IS
    COMPONENT ParityDetector
        PORT (
            Data : IN std_logic;
            Pin : IN std_logic;
            Clk : IN std_logic;
            Reset : IN std_logic;
            Pout : OUT std_logic;
            Poutn : OUT std_logic;
            Pc : OUT std_logic
        );
    END COMPONENT;

    signal Data : std_logic := '0';
    signal Pin : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Reset : std_logic := '0';
    signal Pout : std_logic;
    signal Poutn : std_logic;
    signal Pc : std_logic;
    constant Clk_period : time := 20 ns;
BEGIN
    uut: ParityDetector PORT MAP (
        Data => Data,
        Pin => Pin,
        Clk => Clk,
        Reset => Reset,
        Pout => Pout,
        Poutn => Poutn,
        Pc => Pc
    );

    Clk_process : process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    stim_proc: process
    begin
        Reset <= '1';
        wait for 20 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '0';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '0';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '0';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '0';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '1';
        Pin <= '1';
        wait for 40 ns;
        Reset <= '0';
        Data <= '0';
        Pin <= '1';
        wait for 40 ns;
    end process;
END;

-- Same test bench for cases below:
-- Data2: 111100101101 Parityin2:1
-- Data3: 000000001010 Parityin3:0
-- Data4: 111111111111 Parityin4:0
