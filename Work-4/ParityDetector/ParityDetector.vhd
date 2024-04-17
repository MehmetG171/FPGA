-- Design a sequential odd parity calculating and odd parity checking device
-- The input data is given to system with each clock rising edge. 
-- The parity that should be compared with calculated value is on "parityin" input.
-- This system calculates the odd parity bit and outputs the result on "parityout" output. 
-- This value is compared with the value given to the system originally
-- and if the parityin and parityout are equal (i.e. parity checks out) then the paritychk is '1'.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ParityDetector is
    Port (
        Data : in STD_LOGIC;
        Pin : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Reset : in STD_LOGIC;
        Pout : out STD_LOGIC;
        Poutn : out STD_LOGIC;
        Pc : out STD_LOGIC
    );
end ParityDetector;

architecture Behavioral of ParityDetector is
    signal Q, entry : STD_LOGIC;

    -- Component declaration for D flip-flop
    component DFlipFlop is
        Port (
            D : in STD_LOGIC;
            Reset : in STD_LOGIC;
            Clock : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

begin
    -- XOR operation to compute parity
    entry <= Q xor Data;

    -- Instantiate D flip-flop component
    Device : DFlipFlop
        port map (
            D => entry,
            Reset => Reset,
            Clock => Clk,
            Q => Q,
            Qn => Poutn
        );

    -- Output parity and parity check
    Pout <= Q;
    Pc <= Pin xnor Q;
end Behavioral;
