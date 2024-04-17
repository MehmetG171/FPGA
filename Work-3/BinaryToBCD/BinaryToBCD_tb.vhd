-- Design a combinational circuit that converts a 6-bit binary number into a 2-digit decimal number.
-- The number is represented in the BCD form.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinaryToBCD_tb is
end BinaryToBCD_tb;

architecture Behavioral of BinaryToBCD_tb is
    signal binary_input_tb : std_logic_vector(5 downto 0);
    signal bcd_output_tb : std_logic_vector(7 downto 0);

    component BinaryToBCD
        Port (
            binary_input : in  std_logic_vector(5 downto 0);
            bcd_output : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    UUT : BinaryToBCD
    port map (
        binary_input => binary_input_tb,
        bcd_output => bcd_output_tb
    );

    process
    begin
        -- Test case 1: Binary input = 001010 (decimal 10)
        binary_input_tb <= "001010";
        wait for 10 ns; -- Allow some time for the process to execute
        report "Binary input: " & to_string(binary_input_tb);
        report "BCD output: " & to_string(bcd_output_tb);

        -- Test case 2: Binary input = 100100 (decimal 36)
        binary_input_tb <= "100100";
        wait for 10 ns;
        report "Binary input: " & to_string(binary_input_tb);
        report "BCD output: " & to_string(bcd_output_tb);

        -- Test case 3: Binary input = 111111 (decimal 63)
        binary_input_tb <= "111111";
        wait for 10 ns;
        report "Binary input: " & to_string(binary_input_tb);
        report "BCD output: " & to_string(bcd_output_tb);

        -- Additional test case: Binary input = 000000 (decimal 0)
        binary_input_tb <= "000000";
        wait for 10 ns;
        report "Binary input: " & to_string(binary_input_tb);
        report "BCD output: " & to_string(bcd_output_tb);

        wait;
    end process;
end Behavioral;
