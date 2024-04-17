-- Design an odd parity generator circuit for a 4-bit binary number.

library IEEE;
use IEEE.std_logic_1164.ALL;

entity ParityChecker_tb is
END ParityChecker_tb;

architecture behavior of ParityChecker_tb is
    component ParityChecker
        port (
            A : in std_logic_vector(3 downto 0);
            P : out std_logic
        );
    end component;

    signal A : std_logic_vector(3 downto 0) := (others => '0');
    signal P : std_logic;

begin
    uut: ParityChecker port map (
        A => A,
        P => P
    );

    stim_proc: process
    begin
        A <= "0110";
        wait for 100 ns;
        
        A <= "1011";
        wait for 100 ns;
        
        A <= "0111";
        wait for 100 ns;
        
        A <= "0001";
        wait for 100 ns;
        
        A <= "1111";
        wait for 100 ns;
        
        wait;
    end process;
    
end behavior;
