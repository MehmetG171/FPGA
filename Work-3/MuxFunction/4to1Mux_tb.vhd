-- Design a 4-to-1 multiplexer (mux). 
-- Then mux implement the f(x,y,z) = xy + y'z' + x'z 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY 4to1Mux_tb IS
END 4to1Mux_tb;

ARCHITECTURE behavior OF 4to1Mux_tb IS
    COMPONENT 4to1Mux
        PORT (
            D0 : IN std_logic;
            D1 : IN std_logic;
            D2 : IN std_logic;
            D3 : IN std_logic;
            S : IN std_logic_vector(1 downto 0);
            O : OUT std_logic
        );
    END COMPONENT;

    signal D0 : std_logic := '0';
    signal D1 : std_logic := '0';
    signal D2 : std_logic := '0';
    signal D3 : std_logic := '0';
    signal S : std_logic_vector(1 downto 0) := (others => '0');
    signal O : std_logic;

BEGIN
    uut: 4to1Mux PORT MAP (
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        S => S,
        O => O
    );

    stim_proc: process
    begin
        D0 <= '0';
        D1 <= '1';
        D2 <= '1';
        D3 <= '0';
        S <= "00";
        wait for 100 ns;
        S <= "01";
        wait for 100 ns;
        S <= "10";
        wait for 100 ns;
        S <= "11";
        wait for 100 ns;
    end process;
    
END behavior;
