-- Design a SR Latch.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SRLatch is
    Port (
        S : in STD_LOGIC;
        R : in STD_LOGIC;
        En : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end SRLatch;

architecture Behavioral of SRLatch is
    signal Q_reg, Qn_reg : std_logic;
begin
    process (S, R, En)
    begin
        if En = '1' then
            if (S = '1' and R = '0') then
                Q_reg <= '1';
                Qn_reg <= '0';
            elsif (S = '0' and R = '1') then
                Q_reg <= '0';
                Qn_reg <= '1';
            else
                Q_reg <= Q_reg;
                Qn_reg <= Qn_reg;
            end if;
        end if;
    end process;

    Q <= Q_reg;
    Qn <= Qn_reg;

end Behavioral;
