-- Design a negative edge triggered T flip-flop by using JK flip-flop

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity T is
    Port (
        Tin : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end T;

architecture Behavioral of T is
    signal tempQ, J, K : STD_LOGIC;
begin
    process (Reset, Clock)
    begin
        J <= Tin;
        K <= Tin;

        if Clock'event and Clock = '0' then
            if Reset = '1' then
                tempQ <= '0';
            elsif (J = '0' and K = '0') then
                tempQ <= tempQ;
            elsif (J = '0' and K = '1') then
                tempQ <= '0';
            elsif (J = '1' and K = '0') then
                tempQ <= '1';
            elsif (J = '1' and K = '1') then
                tempQ <= not tempQ;
            end if;
        end if;
    end process;

    Q <= tempQ;
    Qn <= not tempQ;
end Behavioral;
