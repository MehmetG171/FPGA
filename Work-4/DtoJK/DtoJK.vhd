-- Design a circuit that converts a D flip-flop to a JK flip-flop.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DtoJK is
    Port (
        J : in STD_LOGIC;
        Reset : in STD_LOGIC;
        K : in STD_LOGIC;
        Clk : in STD_LOGIC;
        Q : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end DtoJK;

architecture Behavioral of DtoJK is
    signal a, b, f : std_logic;
    
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
    Q <= a;
    Qn <= b;
    f <= (J and not b) or (K and a);
    
    JK : DFlipFlop
    port map (
        D => f,
        Reset => Reset,
        Clock => Clk,
        Q => a,
        Qn => b
    );

end Behavioral;
