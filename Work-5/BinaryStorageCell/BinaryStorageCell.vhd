-- Design a Binary Storage Cell.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BinaryStorageCell is
    Port (
        input : in STD_LOGIC;
        S : in STD_LOGIC;
        RW : in STD_LOGIC;
        En : in STD_LOGIC;
        output : out STD_LOGIC
    );
end BinaryStorageCell;

architecture Behavioral of BinaryStorageCell is
    component SRLatch
        Port (
            S : in STD_LOGIC;
            R : in STD_LOGIC;
            En : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal A, B, Qout, Qnout: STD_LOGIC;
begin
    A <= input and S and not RW;
    B <= not input and not RW and S;

    SR1: SRLatch
    port map (
        S => A,
        R => B,
        En => En,
        Q => Qout,
        Qn => QNout
    );

    output <= RW and S and Qout;
end Behavioral;
