-- Design a Binary Storage Cell.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY BinaryStorageCell_tb IS
END BinaryStorageCell_tb;

ARCHITECTURE behavior OF BinaryStorageCell_tb IS
    COMPONENT BinaryStorageCell
        PORT (
            input : IN std_logic;
            S : IN std_logic;
            RW : IN std_logic;
            En : IN std_logic;
            output : OUT std_logic
        );
    END COMPONENT;

    signal input : std_logic := '0';
    signal S : std_logic := '0';
    signal RW : std_logic := '0';
    signal En : std_logic := '0';
    signal output : std_logic;

BEGIN
    uut: BinaryStorageCell PORT MAP (
        input => input,
        S => S,
        RW => RW,
        En => En,
        output => output
    );

    -- Stimulus process
    stim_proc: process
    begin
        input <= '0';
        En <= '1';
        S <= '1';
        RW <= '0';
        wait for 50 ns;
        
        input <= '1';
        En <= '1';
        S <= '0';
        RW <= '0';
        wait for 50 ns;
        
        input <= '1';
        En <= '1';
        S <= '1';
        RW <= '0';
        wait for 50 ns;
        
        input <= '1';
        En <= '1';
        S <= '1';
        RW <= '1';
        wait for 50 ns;
        
        input <= '0';
        En <= '1';
        S <= '0';
        RW <= '0';
        wait for 50 ns;
        
        input <= '1';
        En <= '1';
        S <= '1';
        RW <= '1';
        wait for 50 ns;
    end process;
END;
