-- Design a four bit combinational circuit 2's complementer using the full-adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwosComplementFullAdder_tb is
end TwosComplementFullAdder_tb;

architecture Behavioral of TwosComplementFullAdder_tb is
    -- Constants for simulation parameters
    constant CLK_PERIOD : time := 10 ns;

    -- Signals for test bench
    signal A : std_logic_vector(3 downto 0);
    signal TwosComp : std_logic_vector(3 downto 0);
    signal Clock : std_logic := '0';

    -- Instantiate the component to be tested
    component TwosComplementFullAdder is
        Port (
            A : in std_logic_vector (3 downto 0);
            TwosComp : out std_logic_vector (3 downto 0)
        );
    end component;

begin
    -- DUT (Device Under Test) instantiation
    DUT : TwosComplementFullAdder port map (A => A, TwosComp => TwosComp);

    -- Clock process
    process
    begin
        while not (now = 1000 ns) loop -- Run simulation for 1000 ns
            Clock <= not Clock;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    -- Stimulus process
    Stimulus : process
    begin
        -- Test the specified inputs
        A <= "0000"; -- 0
        wait for CLK_PERIOD;
        
        A <= "0001"; -- 1
        wait for CLK_PERIOD;
        
        A <= "0010"; -- 2
        wait for CLK_PERIOD;
        
        A <= "0011"; -- 3
        wait for CLK_PERIOD;
        
        A <= "0101"; -- 5
        wait for CLK_PERIOD;
        
        A <= "1000"; -- 8
        wait for CLK_PERIOD;
        
        A <= "1001"; -- 9
        wait for CLK_PERIOD;
        
        A <= "1010"; -- 10
        wait for CLK_PERIOD;
        
        A <= "1100"; -- 12
        wait for CLK_PERIOD;
        
        A <= "1111"; -- 15
        wait for CLK_PERIOD;
        
        wait;
    end process;

end Behavioral;
