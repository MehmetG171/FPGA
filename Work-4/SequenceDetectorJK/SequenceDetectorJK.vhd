-- Design a sequence detector that catches "1011" sequence
-- with overlap by using Moore Model and JK flip-flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SequenceDetectorJK is
    Port (
        Input : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Clock : in STD_LOGIC;
        Detected : out STD_LOGIC
    );
end SequenceDetectorJK;

architecture Behavioral of SequenceDetectorJK is
    component JK is
        Port (
            J : in STD_LOGIC;
            K : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal Q1, Q2, Q3 : STD_LOGIC;

begin
    JK1 : JK
    port map (
        J => Input,
        K => '0',
        Reset => Reset,
        Clock => Clock,
        Q => Q1,
        Qn => open
    );

    JK2 : JK
    port map (
        J => Q1,
        K => Input,
        Reset => Reset,
        Clock => Clock,
        Q => Q2,
        Qn => open
    );

    JK3 : JK
    port map (
        J => Q2,
        K => Input,
        Reset => Reset,
        Clock => Clock,
        Q => Q3,
        Qn => open
    );

    process (Clock, Reset)
    begin
        if Reset = '1' then
            Detected <= '0';
        elsif rising_edge(Clock) then
            if Q1 = '1' and Q2 = '0' and Q3 = '1' then
                Detected <= '1';
            else
                Detected <= '0';
            end if;
        end if;
    end process;

end Behavioral;

