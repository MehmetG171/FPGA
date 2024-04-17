-- Design a 4-bit universal shift register by using T flip-flops.

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ShiftRegister_tb IS
END ShiftRegister_tb;

ARCHITECTURE behavior OF ShiftRegister_tb IS
    COMPONENT ShiftRegister
        PORT (
            Reset : IN std_logic;
            Clock : IN std_logic;
            SR : IN std_logic;
            SL : IN std_logic;
            S : IN std_logic_vector(1 downto 0);
            I : IN std_logic_vector(3 downto 0);
            A : OUT std_logic_vector(3 downto 0)
        );
    END COMPONENT;

    -- Signals declaration
    signal Reset : std_logic := '0';
    signal Clock : std_logic := '0';
    signal SR : std_logic := '0';
    signal SL : std_logic := '0';
    signal S : std_logic_vector(1 downto 0) := (others => '0');
    signal I : std_logic_vector(3 downto 0) := (others => '0');
    signal A : std_logic_vector(3 downto 0);

    -- Clock period definition
    constant Clock_period : time := 50 ns;
BEGIN
    -- Instantiate ShiftRegister component
    uut: ShiftRegister PORT MAP (
        Reset => Reset,
        Clock => Clock,
        SR => SR,
        SL => SL,
        S => S,
        I => I,
        A => A
    );

    -- Clock generation process
    Clock_process : process
    begin
        Clock <= '0';
        wait for Clock_period/2;
        Clock <= '1';
        wait for Clock_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        Reset <= '1';  -- Assert Reset
        wait for 20 ns;
        Reset <= '0';  -- De-assert Reset
        SR <= '1';     -- Set SR input to '1'
        S <= "11";     -- Set S input to "11"
        SL <= '1';     -- Set SL input to '1'
        I <= "1001";   -- Set I input to "1001"
        wait for 85 ns;

        -- Similar stimulus generation for other test cases
        Reset <= '0';
        SR <= '0';
        S <= "00";
        SL <= '0';
        I <= "1111";
        wait for 85 ns;

        Reset <= '0';
        SR <= '0';
        S <= "01";
        SL <= '0';
        I <= "1001";
        wait for 85 ns;

        Reset <= '0';
        SR <= '0';
        S <= "10";
        SL <= '1';
        I <= "0011";
        wait for 85 ns;

        Reset <= '0';
        SR <= '0';
        S <= "11";
        SL <= '1';
        I <= "1001";
        wait for 85 ns;
    end process;
END;
