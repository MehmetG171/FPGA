-- Design a sequence detector that catches "1011" sequence
-- with overlap by using Moore Model and JK flip-flops.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SequenceDetectorJK_tb is
end SequenceDetectorJK_tb;

architecture Behavioral of SequenceDetectorJK_tb is
    signal Input : STD_LOGIC;
    signal Reset : STD_LOGIC;
    signal Clock : STD_LOGIC := '0';
    signal Detected : STD_LOGIC;

    constant Clock_period : time := 10 ns;

begin

    uut : entity work.SequenceDetectorJK
        port map (
            Input => Input,
            Reset => Reset,
            Clock => Clock,
            Detected => Detected
        );

    Clock_process : process
    begin
        while not stop_time loop
            Clock <= '0';
            wait for Clock_period / 2;
            Clock <= '1';
            wait for Clock_period / 2;
        end loop;
        wait;
    end process;

    stim_proc : process
    begin
        Reset <= '1';
        Input <= '0';
        wait for 100 ns;
        Reset <= '0';

        -- Test case 1: Input sequence is "1011" (sequence should be detected)
        Input <= '1';
        wait for Clock_period;
        Input <= '0';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;

        -- Test case 2: Input sequence is "0101" (sequence should not be detected)
        Input <= '0';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;
        Input <= '0';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;

        -- Test case 3: Input sequence is "10110" (sequence should not be detected)
        Input <= '1';
        wait for Clock_period;
        Input <= '0';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;
        Input <= '1';
        wait for Clock_period;
        Input <= '0';
        wait for Clock_period;

        -- Stop simulation
        stop_time <= true;
        wait;
    end process;

end Behavioral;
