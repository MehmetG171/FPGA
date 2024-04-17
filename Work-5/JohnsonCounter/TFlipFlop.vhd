-- Design a positive edge triggered T flip-flop.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TFlipFlop is
    Port (
        T : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end TFlipFlop;

architecture Behavioral of TFlipFlop is
    signal tempQ : STD_LOGIC;
begin
    process (Reset, Clock)
    begin
        if Reset = '1' then
            tempQ <= '0';
        elsif rising_edge(Clock) then
            if T = '1' then
                tempQ <= not tempQ;
            end if;
        end if;
    end process;

    Q <= tempQ;
    Qn <= not tempQ;
end Behavioral;