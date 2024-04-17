-- Design a 4-to-1 multiplexer (mux). 
-- Then using mux implement the f(x,y,z) = xy + y'z' + x'z 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxFunction is
    Port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        z : in STD_LOGIC;
        O : out STD_LOGIC
    );
end MuxFunction;

architecture Behavioral of MuxFunction is
    component 4to1Mux
        Port (
            D0 : in STD_LOGIC;
            D1 : in STD_LOGIC;
            D2 : in STD_LOGIC;
            D3 : in STD_LOGIC;
            S : in STD_LOGIC_VECTOR (1 downto 0);
            O : out STD_LOGIC
        );
    end component;

begin
    Mux: 4to1Mux port map (
        D0 => '1',
        D1 => z,
        D2 => not z,
        D3 => '1',
        S(0) => y,
        S(1) => x,
        O => O
    );

end Behavioral;
