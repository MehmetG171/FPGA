-- Design a combinational circuit using a ROM. 
-- The circuit accepts a three-bit number and 
-- outputs a six-bit binary number equal to the square of the input number.
-- Implement this ROM only using a 3-to-8 decoder and minimum number of basic logic gates.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ROM_tb IS
END ROM_tb;

ARCHITECTURE behavior OF ROM_tb IS
    COMPONENT ROM
        PORT(
            S : IN std_logic_vector(2 downto 0);
            Q : OUT std_logic_vector(5 downto 0)
        );
    END COMPONENT;

    signal S : std_logic_vector(2 downto 0) := (others => '0');
    signal Q : std_logic_vector(5 downto 0);

BEGIN
    uut: ROM PORT MAP (
        S => S,
        Q => Q
    );

    stim_proc: process
    begin
        S <= "000";
        wait for 100 ns;
        
        S <= "001";
        wait for 100 ns;
        
        S <= "010";
        wait for 100 ns;
        
        S <= "011";
        wait for 100 ns;
        
        S <= "100";
        wait for 100 ns;
        
        S <= "101";
        wait for 100 ns;
        
        S <= "110";
        wait for 100 ns;
        
        S <= "111";
        wait for 100 ns;
    end process;
END behavior;
