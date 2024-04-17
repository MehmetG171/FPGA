-- Design a 4-bit asynchronous binary ripple counter by using JK Flip-Flops.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RippleCounter_tb IS
END RippleCounter_tb;

ARCHITECTURE behavior OF RippleCounter_tb IS
    COMPONENT RippleCounter
        PORT(
            Count : IN std_logic;
            Reset : IN std_logic;
            S : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    signal Count : std_logic := '0';
    signal Reset : std_logic := '0';
    signal S : std_logic_vector(3 downto 0);

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: RippleCounter PORT MAP (
        Count => Count,
        Reset => Reset,
        S => S
    );

    stim_proc: process
    begin
        Reset <= '1';
        wait for 50 ns;
        Reset <= '0';

        -- Counting sequence
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
        wait for 50 ns;
        Count <= '1';
        wait for 50 ns;
        Count <= '0';
    end process;
    
END behavior;
