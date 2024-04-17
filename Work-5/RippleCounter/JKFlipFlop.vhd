-- Design a JK flip-flop.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKFlipFlop is
    Port (
        J : in STD_LOGIC;
        K : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end JKFlipFlop;

architecture Behavioral of JKFlipFlop is
    signal Q_internal : std_logic;
begin
    process (Clock, Reset)
    begin
        if Reset = '1' then
            Q_internal <= '0';
        elsif rising_edge(Clock) then
            if J = '1' and K = '1' then
                Q_internal <= not Q_internal; -- Toggle Q
            elsif J = '1' and K = '0' then
                Q_internal <= '1'; -- Set Q
            elsif J = '0' and K = '1' then
                Q_internal <= '0'; -- Reset Q
            end if;
        end if;
    end process;

    Q <= Q_internal;
    Qn <= not Q_internal;
end Behavioral;
