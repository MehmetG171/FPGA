-- Design a 4-to-1 multiplexer (mux). 
-- Then using mux implement the f(x,y,z) = xy + y'z' + x'z 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MuxFunction_tb IS
END MuxFunction_tb;

ARCHITECTURE behavior OF MuxFunction_tb IS
    COMPONENT MuxFunction
        PORT (
            x : IN std_logic;
            y : IN std_logic;
            z : IN std_logic;
            O : OUT std_logic
        );
    END COMPONENT;

    signal x : std_logic := '0';
    signal y : std_logic := '0';
    signal z : std_logic := '0';
    signal O : std_logic;

BEGIN
    uut: MuxFunction PORT MAP (
        x => x,
        y => y,
        z => z,
        O => O
    );

    stim_proc: process
    begin
        x <= '1';
        y <= '0';
        z <= '1';
        wait for 100 ns;
        x <= '0';
        y <= '0';
        z <= '1';
        wait for 100 ns;
        x <= '1';
        y <= '1';
        z <= '1';
        wait for 100 ns;
        x <= '0';
        y <= '1';
        z <= '1';
        wait for 100 ns;
        x <= '0';
        y <= '1';
        z <= '0';
        wait for 100 ns;
    end process;

END behavior;
