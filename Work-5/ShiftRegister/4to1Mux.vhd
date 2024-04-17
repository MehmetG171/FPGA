-- Design a 4 to 1 multiplexer.

library ieee;
use ieee.std_logic_1164.all;

entity MUX4x1 is
    port (
        D0 : in std_logic;
        D1 : in std_logic;
        D2 : in std_logic;
        D3 : in std_logic;
        S : in std_logic_vector(1 downto 0);
        Y : out std_logic
    );
end entity MUX4x1;

architecture Behavioral of MUX4x1 is
begin
    process (S, D0, D1, D2, D3)
    begin
        case S is
            when "00" =>
                Y <= D0;
            when "01" =>
                Y <= D1;
            when "10" =>
                Y <= D2;
            when "11" =>
                Y <= D3;
            when others =>
                Y <= '0'; -- Default output (can be '0', '1', or anything else based on design requirements)
        end case;
    end process;
end architecture Behavioral;