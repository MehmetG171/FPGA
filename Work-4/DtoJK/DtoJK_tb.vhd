-- Design a circuit that converts a D flip-flop to a JK flip-flop.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY DtoJKtb IS
END DtoJKtb;

ARCHITECTURE behavior OF DtoJKtb IS
    COMPONENT DtoJK
    PORT (
        J : IN std_logic;
        Reset : IN std_logic;
        K : IN std_logic;
        Clk : IN std_logic;
        Q : OUT std_logic;
        Qn : OUT std_logic
    );
    END COMPONENT;

    signal J : std_logic := '0';
    signal Reset : std_logic := '0';
    signal K : std_logic := '0';
    signal Clk : std_logic := '0';
    signal Q : std_logic;
    signal Qn : std_logic;
    constant Clk_period : time := 75 ns;

BEGIN
    uut: DtoJK PORT MAP (
        J => J,
        Reset => Reset,
        K => K,
        Clk => Clk,
        Q => Q,
        Qn => Qn
    );

    Clk_process : process
    begin
        Clk <= '0';
        wait for Clk_period/2;
        Clk <= '1';
        wait for Clk_period/2;
    end process;

    stim_proc: process
    begin
        Reset <= '1';
        wait for 50 ns;
        Reset <= '0';
        J <= '0';
        K <= '1';
        wait for 100 ns;
        Reset <= '0';
        J <= '1';
        K <= '0';
        wait for 100 ns;
        Reset <= '0';
        J <= '1';
        K <= '1';
        wait for 100 ns;
        Reset <= '0';
        J <= '0';
        K <= '0';
        wait for 100 ns;
    end process;

END behavior;
