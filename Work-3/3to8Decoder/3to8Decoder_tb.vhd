-- Design a 3-to-8 decoder with active-high outputs.
-- Then using the 3-to-8 decoder, design a full adder.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY 3to8Decoder_tb IS
END 3to8Decoder_tb;

ARCHITECTURE behavior OF 3to8Decoder_tb IS
    COMPONENT 3to8Decoder
        PORT(
            A : IN std_logic_vector(2 downto 0);
            S : OUT std_logic;
            C : OUT std_logic
        );
    END COMPONENT;

    signal A : std_logic_vector(2 downto 0) := (others => '0');
    signal S : std_logic;
    signal C : std_logic;

BEGIN
    uut: 3to8Decoder PORT MAP (
        A => A,
        S => S,
        C => C
    );

    stim_proc: process
    begin
        A <= "000"; wait for 100 ns;
        A <= "001"; wait for 100 ns;
        A <= "010"; wait for 100 ns;
        A <= "011"; wait for 100 ns;
        A <= "100"; wait for 100 ns;
        A <= "101"; wait for 100 ns;
        A <= "110"; wait for 100 ns;
        A <= "111"; wait for 100 ns;
    end process;

END behavior;