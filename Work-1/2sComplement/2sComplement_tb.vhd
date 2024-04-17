-- Design a digital system that converts a 4-bit decimal number from 0 to 7 into its negative in 2's complement format.
-- Input is binary number ABCD and the output is binary number KLMN

-- Library and package inclusion
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Entity declaration for the testbench
ENTITY 2sComplement_tb IS
END 2sComplement_tb;

-- Architecture definition for the testbench
ARCHITECTURE behavior OF 2sComplement_tb IS
    -- Component declaration for the main design
    COMPONENT 2sComplement
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         D : IN  std_logic;
         K : OUT  std_logic;
         L : OUT  std_logic;
         M : OUT  std_logic;
         N : OUT  std_logic
        );
    END COMPONENT;

    -- Signals declaration for the testbench
    signal A : std_logic := '0';
    signal B : std_logic := '0';
    signal C : std_logic := '0';
    signal D : std_logic := '0';
    signal K : std_logic;
    signal L : std_logic;
    signal M : std_logic;
    signal N : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Exp1 PORT MAP (
          A => A,
          B => B,
          C => C,
          D => D,
          K => K,
          L => L,
          M => M,
          N => N
        );

    -- Stimulus process
    stim_proc: process
    begin		
        -- Stimulate inputs
        A <= '0';
        B <= '0';
        C <= '0';
		D <= '0';
        wait for 100 ns;	
		A <= '1';
        B <= '0';
        C <= '1';
		D <= '0';
        wait for 100 ns;	
        A <= '0';
        B <= '1';
        C <= '0';
        D <= '1';      
        wait for 100 ns;
		A <= '1';
        B <= '1';
        C <= '1';
        D <= '1';		
		wait for 100 ns;
   end process;

END behavior;
