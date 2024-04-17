-- Design a combinational circuit that converts a 6-bit binary number into a 2-digit decimal number.
-- The number is represented in the BCD form.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BinaryToBCD is
    Port (
        binary_input : in  STD_LOGIC_VECTOR(5 downto 0);
        bcd_output : out STD_LOGIC_VECTOR(7 downto 0)
    );
end BinaryToBCD;

architecture Behavioral of BinaryToBCD is
begin
    process(binary_input)
        variable temp : integer range 0 to 99;
    begin
        temp := conv_integer(unsigned(binary_input));
        
        case temp is
            when 0 to 9 =>
                bcd_output <= "0000" & std_logic_vector(to_unsigned(temp, 4));
            when 10 to 99 =>
                bcd_output <= std_logic_vector(to_unsigned(temp / 10, 4)) & std_logic_vector(to_unsigned(temp mod 10, 4));
            when others =>
                bcd_output <= (others => '0'); -- Invalid input
        end case;
    end process;
end Behavioral;